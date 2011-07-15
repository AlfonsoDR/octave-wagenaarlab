function ok = make(tgt, mk, deep)
% MAKE - Simple matlab version of make(1)
%    MAKE builds the first target in m.Makefile.
%    MAKE(target) builds a specific target.
%    MAKE(target, makefile) specifies an alternative makefile.
%
%    Makefile syntax is a much simplified version of GNU Makefiles:
%    Variables can be defined by the syntax:
%      VAR = VALUE
%    for instance:
%      FILELIST = foo.mat bar.mat
%    Target dependencies are written as:
%      TARGET: DEPENDENCIES
%              COMMAND
%    For instance:
%      foo.mat: bar.mat baz.m
%              baz('bar')
%    Generic rules can utilize the % syntax, for instance:
%      %-spk.mat: %-raw.mat
%              extract($^)
%    Note the use of the automatic variable $^, which expands to a comma-
%    separated list of single-quote enclosed dependencies.
%    The automatic variable $< expands to only the first dependency, and,
%    in an extension to GNU syntax, $> expands to all but the first dependency.
%    $@ expands to the name of the target, $% expands to the substitution
%    of '%' in the rule. All of these will be placed in quotes.
%    User-defined variables can be referenced as $VAR, which implies no
%    quotes, or $'VAR which does create quotes and comma separation. 
%    A new addition is $!VAR which expands multiple times much like a typical
%    use of $(foreach). For instance:
%       FOO=123
%       BASE=x y
%       BAR=foo-$!BASE.mat
%       # BAR is now foo-x.mat foo-y.mat
%       foo.mat: combine.m $BAR other.mat
%            combine($@, { $'BAR }, $FOO)
%        # That runs combine('foo.mat', { 'foo-x.mat', 'foo-y.mat' }, 123)
%    Empty lines are ignored. Pound sign (#) introduces comments.
%    Makefiles are parsed in one pass. That means that variables must be
%    defined before they are used.

if nargout>0
  ok = 0;
end

if nargin<3
  deep=0;
end
if nargin<2
  mk = 'm.Makefile';
end
if nargin<1
  tgt = [];
end

if ischar(mk)
  mk = make_readMakefile(mk);
end

if deep==0
  if isempty(mk.var.keys)
    fprintf(1,'(Makefile has no variables.)\n');
  else
    fprintf(1,'Makefile variables are:\n');
    for k=1:length(mk.var.keys)
      fprintf(1,'  %s: %s\n', mk.var.keys{k}, mk.var.values{k});
    end
  end
end

if isempty(mk.rule.targets)
  fprintf(1, 'Nothing to make\n');
  return;
end

if isempty(tgt)
  tgt = mk.rule.targets{1};
end

idx = strmatch(tgt, mk.rule.targets, 'exact');
mtch = '';
if isempty(idx)
  % No exactly matching rule for this target
  for n=1:length(mk.rule.targets)
    mtch = make_matches(tgt, mk.rule.targets{n});
    if ~isempty(mtch)
      % Pattern match
      idx = n;
      break;
    end
  end
end

if isempty(idx)
  if exist(tgt,'file')
    fprintf(1, '%s will be used as-is\n', tgt);
  else
    error(sprintf('No rule to make %s', tgt));
  end
else
  dps = make_outdated(tgt, mk.rule.deps{idx}, mtch);
  if isempty(dps)
    % Nothing to do
    fprintf(1, '%s is up-to-date\n', tgt);
  else
    % Need to make those dependencies first
    fprintf(1, 'Need to make %s\n', tgt);

    for k=1:length(dps)
      fprintf(1, '%s is outdated wrt %s\n', tgt, dps{k});
      if ~make(dps{k}, mk, 1)
	return
      end
    end
    
    fprintf(1,'Will make %s\n', tgt);
    % Now, let's make our target
    cmds = make_commands(mk.rule.cmds{idx}, tgt, mk.rule.deps{idx}, mtch);
    for k=1:length(cmds)
      if ~make_eval(cmds{k})
	return
      end
    end
    fprintf(1,'Done making %s\n', tgt);
  end
end

if nargout>0
  ok = 1;
end

if ~deep
  fprintf(1,'Make complet\n');
end
