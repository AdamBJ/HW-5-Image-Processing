function test_reconstruction(faceimages, numcomps, meanvec, basis)
%test the functions we've built so far using the 5 face images in
%faceimages.
for i=1 : 5
    currFace = faceimages{i}.face_test;
    currFace = cell2mat(currFace); %THIS MIGHT BE MESSING THINGS UP 
    for j=1 : 4
       fvec = projectface(currFace, meanvec, basis, numcomps(j));
       reconimage = reconstructface(fvec, meanvec, basis, numcomps(j));
       imwrite (reconimage, strcat('C:\Users\TEMP.CSE.010\Documents\MATLAB\hw5\result\face_',i,'_',j,'.png'));
    end
end

end

