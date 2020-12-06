# Final Project

This project contains the code for the final project for the Image and Video Processing Course. The UNET network was implemented. 

UNET is a Deep Convolutional Network that was invented for competing in the [ISBI challenge](http://2020.biomedicalimaging.org/challenges) for segmentation of neuronal structures in electron microscopic stacks. The network is novel due to its skip conections as well as its wighted loss function. The weighted loss function is required as there is a class imbalance between the black and white pixels. Due to this the binary cross entropy loss has to be wighted in such a way that the class imbalance does not prevent the model from learning. The network can be visualized below:
