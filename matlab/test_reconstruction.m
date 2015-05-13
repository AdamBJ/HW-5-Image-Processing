function test_reconstruction(faceimages, numcomps, meanvec, basis)
faces_cell = faceimages.face_test;
IMG_SIZE = size(faces_cell{1});
MSE = zeros(1,20); % will store the error for each reconstruction we generate

%test the functions we've built so far using the 5 face images in
%faceimages.
overall_iterations = 1;
for i=1 : 5 %for each face
    currFace = faces_cell{i};
    %imshow(fn_double2img(currFace)); This part works, face are different
    %each time
    for j=1 : 4 %for each k value in numcomps
       fvec = projectface(currFace, meanvec, basis, numcomps(j));
       reconimage = reconstructface(fvec, meanvec, basis, IMG_SIZE);
       %get MSE
       D = abs(currFace-reconimage).^2;
       MSE(overall_iterations) = sum(D(:))/numel(reconimage);
       reconimage = fn_double2img(reconimage);
       imwrite (reconimage, strcat('C:\Users\Adam\Documents\MATLAB\hw5\result\face_',int2str(i),'_',int2str(numcomps(j)),'.png'));
       overall_iterations = overall_iterations + 1;
    end
end
end

