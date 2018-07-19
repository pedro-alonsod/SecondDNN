
function [p, pMax, kMax] = Softmax( q )
% Demo
if( nargin == 0 )
q = [1,2,3,4,1,2,3];
[p, pMax, kMax] = Softmax( q ) 
sum(p)
clear p
return
end
q = reshape(q,[],1);
n = length(q);
p = zeros(1,n);
den = sum(exp(q));
for k = 1:n
p(k) = exp(q(k))/den;
end
