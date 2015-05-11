function ploteigface(meanvec, basis, K, imsize)

%get the mean image
meanvec = fn_double2img(meanvec);
meanvec = reshape(meanvec, imsize(1), imsize(2));
imwrite (meanvec, 'C:\Users\TEMP.CSE.010\Documents\MATLAB\hw5\result\eigface00.png')

%get the 10 eigenfaces with largest eigenvalues
for i=1 : 10
eig_i = basis(:,i);
eig_i = fn_double2img(eig_i);
eig_i = reshape(eig_i, imsize(1), imsize(2));
imwrite (eig_i, strcat('C:\Users\TEMP.CSE.010\Documents\MATLAB\hw5\result\eigface',i,'.png'));
end

end

