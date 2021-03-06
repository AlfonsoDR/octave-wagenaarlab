function [s, data] = dtextread(ifn)
% DTEXTREAD - Read text files with headers
%    s = DTEXTREAD(ifn) reads text from IFN into a structure S.
%    Lines in the file are split at white space.
%    Lines starting with '#' are ignored, except at the head of the file.
%    The last '#' line before the first data line is taken to be a header.
%    The header is split as are data lines, and fields are used to name
%    the fields of the data.
%    [s, data] = DTEXTREAD(ifn) also returns the raw contents of the data
%    lines as a cell array of cell arrays.

ifd = fopen(ifn,'rb');
isheader = 1;
columnnames = {};
data = {};
while ~feof(ifd)
  txt = fgets(ifd);
  bits = strtoks(txt);
  iscomment = isempty(bits);
  if ~iscomment
    iscomment = bits{1}(1)=='#';
  end
  if iscomment
    % Comment line
    if isheader
      idx = find(txt>'#');
      columnnames = strtoks(txt(idx(1):end));
      isheader = 0;
    else
      ; % ignore in middle
    end
  else
    % Data line
    isheader = 0;
    data{end+1} = bits;
    if mod(length(data), 1000)==0
      fprintf(2, 'Read %i data lines\r', length(data));
    end
  end
end
fclose(ifd);
fprintf(2, 'Finished reading data lines\n');

Y = length(data);
X = 0;
for y=1:Y
  if length(data{y})>X
    X = length(data{y});
  end  
end
while length(columnnames)<X
  columnames{end+1} = sprintf('x%i',length(columnnames)+1);
end

for n=1:length(columnnames)
  s = columnnames{n};
  if ~isletter(s(1))
    s = [ 'x' s ];
  end
  s(~isalnum(s)) = '_';
  columnnames{n} = s;
end

numdat = zeros(Y,X)+nan;
for y=1:Y
  for x=1:length(data{y})
    numdat(y,x) = str2double(data{y}{x});
  end
end

if nargout<2
  clear data
end

s = struct(columnnames{1}, numdat(:,1));
for x=2:X
  s = setfield(s, columnnames{x}, numdat(:,x));
end

