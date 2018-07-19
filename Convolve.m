%% Convolve
%
%% Format
% c = Convolve( a, b )
%
%% Description
% Convolves a with b.
% a should be smaller than b.
%
% This is a a way to extract features.
%
% nC = nB - nA + 1;
% mC = mB - mA + 1;
%
%% Inputs
%
%  a  (nA,mA)  Matrix to convolve with b
%  b  (nB,mB)  Matrix to be convolved
%
%% Outputs
%
%  c  (nC,mB)  Convolution result with one feature result per element
%
function c = Convolve( a, b )
% Demo
if( nargin < 1 )
  a = [1 0 1;0 1 0;1 0 1]
  b = [1 1 1 0 0 0;0 1 1 1 0 1;0 0 1 1 1 0;0 0 1 1 0 1;0 1 1 0 0 1;0 1 1 0 0 1]
c = Convolve( a, b );
return
end
[nA,mA] = size(a); [nB,mB] = size(b);
nC = nB - nA + 1; mC = mB - mA + 1; c = zeros(nC,mC); 
for j = 1:mC
jR = j:j+nA-1; 
for k = 1:nC
    kR = k:k+mA-1;
    c(j,k) = sum(sum(a.*b(jR,kR)));
end
end
    