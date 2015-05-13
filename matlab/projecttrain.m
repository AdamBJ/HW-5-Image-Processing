function fvecs = projecttrain(face_train, meanvec, basis)
K = 100;
NUM_FACES = length(face_train)';
%compute PCA project for all 360 training images in face_train. output
%fvecs should be 100x360. K is the number of eigen faces to use. May need
%to adjust it.
fvecs = zeros(100, NUM_FACES);
for i=1 : NUM_FACES
    currFace = face_train{i};
    fvec = projectface(currFace, meanvec, basis, K);
    fvecs(:, i) = fvec;
end

end

