function reconimage = reconstructface(fvec, meanvec, basis, imsize)

%(i) Multiply basis(:,K) and fvec where K is the length of fvec. 
reconimage = basis(:,K) * fvec;

%(ii) reconimage has meanvec added to it and is reshaped into the size of imsize by the matlab function reshape. The final result is the output
%reconimage.
reconimage = reconimage + meanvec;
reconimage = reshape(reconimage, imsize(1), imsize(2));

end

