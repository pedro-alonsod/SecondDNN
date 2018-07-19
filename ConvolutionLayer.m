% CONVOLUTIONLAYER
%
%% Format
% y = ConvolutionLayer( x, d )
%
%% Description
% Implements a fully connected neural network
%
%% Inputs
%
%  x  (n,n) Input
%  d  (.)   Data structure
%           .mask (m,m) Mask values
%           .w    (m,m) Weights
%           .b    (m,m) Biases
%           .aFun (1,:) Activation Function
%
%% Outputs
%
%  y  (p,p) Outputs
%
function y = ConvolutionLayer( x, d )
% Demo
if( nargin < 1 )
if( nargout > 0 )
y = DefaultDataStructure;
else
Demo;
end
return  
end
a = d.mask;
aFun = str2func(d.aFun); [nA,mA] = size(a);
[nB,mB] = size(x);
nC = nB-nA+1;
mC = mB-mA+1;
y = zeros(nC,mC);
for j = 1:mC
jR = j:j+nA-1; 
for k = 1:nC
    kR = k:k+mA-1;
y(j,k) = sum(sum(a.*Neuron(x(jR,kR),d, aFun))); 
end
end

function y = Neuron( x, d, afun ) %% Neuron function
y = afun(x.*d.w + d.b);

function d = DefaultDataStructure %% Default Data Structure
d = struct('mask',ones(9,9),'w',rand(9,9),'b',rand(9,9),'aFun','tanh');

function Demo 
%% Demo
d       = DefaultDataStructure;
x = rand(16,16);
y       = ConvolutionLayer( x, d );
% NewFigure('Convolution Layer');
figure(4) 
subplot(2,1,1) 
surf(x) 
title('Input')
subplot(2,1,2)
surf(y) 
title('Output')