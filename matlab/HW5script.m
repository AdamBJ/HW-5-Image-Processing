face_train = load ('C:\Users\TEMP.CSE.010\Documents\MATLAB\hw5\data\orl_train.mat');


[meanvec, basis] = pcaface(face_train);

imsize = [88 72];

ploteigface(meanvec, basis, 10, imsize)