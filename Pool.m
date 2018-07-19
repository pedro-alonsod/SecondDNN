
%% Pool - pool values from a 2D array
%
%% Format
% b = Pool( a, n, type )
%
%% Description
% Creates an nxn matrix from a.
% a be a power of 2.
%
%% Inputs
%
%  a    (:,:) Matrix to convolve with b
%  n    (1,1) Number of pools
%  type (1,:) Pooling type
%
%% Outputs
%
%  b  (n,n)  Pool
%
function b = Pool( a, n, type )
% Demo
if( nargin < 1 )
a = rand(4,4)
b = Pool( a, 4, 'mean'); 
return
end
if( nargin <3 ) 
    type = 'mean';
end
n = n/2;
p = str2func(type);
nA = size(a,1); nPP = nA/n;
b = size(n,n); 
for j = 1:n
r = (j-1)*nPP +1:j*nPP; 
for k = 1:n
    c = (k-1)*nPP +1:k*nPP;
    b(j,k) = p(p(a(r,c)));
end
end
