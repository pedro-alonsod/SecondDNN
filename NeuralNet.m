function r = NeuralNet( d, t, ~) %% Neural net function
% Convolve the image
yCL   = ConvolutionLayer( t, d.cL );
yPool = Pool( yCL, d.pool.n, d.pool.type );
yFC   = FullyConnectedNN( yPool, d.fCNN );
[~,r] = Softmax( yFC );
if( nargin > 1 )
figure(5); 
subplot(3,1,1);
mesh(yCL); 
title('Convolution Layer') 
subplot(3,1,2);
mesh(yPool); 
title('Pool Layer')
subplot(3,1,3); 
mesh(yFC);
title('Fully Connected Layer')
end