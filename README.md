### VNN Comp 2021: Proposed Benchmarks

The benchmarks consist of two MNIST classifiers, one with a maxpooling layer and the other with an average pooling layer. 

For both the networks we suggest 25 images; 
  1. for the average pooling network with a perturbation radii of 0.02 and 0.04 and a timeout of 5 minutes.
  2. for the max pooling network with a perturbation radii of 0.004 and a timeout of 7 minutes.

The network expects the input image to be (28x28x1) and normalized between[0,1].
