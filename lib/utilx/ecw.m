function ecw(str)
% ECW(func) finds the function FUNC and opens it in emacs.
fn = which(str);
if isempty(fn)
  fprintf(1,'"%s" not found.\n',str);
else
  fprintf(1,'Opening "%s".\n',fn);
  ec(fn);
end
