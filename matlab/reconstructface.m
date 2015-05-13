function reconimage = reconstructface(fvec, meanvec, basis, imsize)
%reconstruct the input face as as weighted sum of eigenfaces

%(i) Multiply basis(:,K) and fvec where K is the length of fvec.
K = length(fvec');
reconimage = basis(:,1) * fvec(1);
for i=2 : K
    reconimage = reconimage + basis(:,i) * fvec(i);
end
%(ii) reconimage has meanvec added to it and is reshaped into the size of imsize by the matlab function reshape. The final result is the output
%reconimage.
reconimage = reconimage + meanvec;
reconimage = reshape(reconimage, imsize(1), imsize(2));

end

