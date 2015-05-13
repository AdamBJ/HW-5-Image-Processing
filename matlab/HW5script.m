orl_train = load ('C:\Users\Adam\Documents\MATLAB\hw5\data\orl_train.mat');
orl_test = load ('C:\Users\Adam\Documents\MATLAB\hw5\data\orl_test.mat');
IM_SIZE = [88 72];
NUM_COMPS_RECONST = [5 10 50 100];
NUM_COMPS_RECOG = [1 3 5 10 25 50 100];

%part 1
%[meanvec, basis] = pcaface(orl_test);

%part 2
%ploteigface(meanvec, basis, 10, IM_SIZE);

meanvec = load ('C:\Users\Adam\Documents\MATLAB\orl_test_meanvec.mat');
%meanvec = load ('C:\Users\Adam\Documents\MATLAB\orl_train_meanvec.mat');
meanvec = meanvec.meanvec;
basis = load ('C:\Users\Adam\Documents\MATLAB\orl_test_basis.mat');
%basis = load ('C:\Users\Adam\Documents\MATLAB\orl_train_basis.mat');
basis = basis.basis;

%part 5
test_reconstruction(orl_test, NUM_COMPS_RECONST, meanvec, basis);

%part 6
fvecs = projecttrain(orl_train.face_train, meanvec, basis);

%part 7
id = recognizeface(orl_test, fvecs, orl_train.label_train, ...
meanvec, basis, NUM_COMPS_RECOG);
