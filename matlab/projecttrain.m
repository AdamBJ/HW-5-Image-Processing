function fvecs = projecttrain(face_train, meanvec, basis)
K = 100;

%compute PCA project for all 360 training images in face_train. output
%fvecs should be 100x360. K is the number of eigen faces to use. May need
%to adjust it.
fvecs = zeros(100, 360); %WILL THIS WORK?
for i=1 : 360
    currFace = face_train{i};
    currFace = cell2mat(currFace); %THIS MIGHT BE MESSING THINGS UP 
    fvec = projectface(currFace, meanvec, basis, K);
    fvecs(:, i) = fvec;
end

end

