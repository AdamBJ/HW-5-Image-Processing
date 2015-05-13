function fvec = projectface(faceimage, meanvec, basis, K)
%weight the eigenfaces in preparation for summation during
%reconstruction

%transform faceimage into a 6336x1 vector from which meanvec is subtracted
faceimage = reshape(faceimage, [], 1); %[] means the rows are automatically calculated. 1 column.
faceimage = faceimage - meanvec;

%calculate fvec by multiplying basis(:,K)' and the transformed face image
fvec = zeros (K, 1);
for i=1 : K
    fvec(i) = basis(:, i)' * faceimage;
end

end

