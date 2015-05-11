function fvec = projectface(faceimage, meanvec, basis, K)
%create faceimage as a weighted sum of the K eigenfaces

%transform faceimage into a 6336x1 vector from which meanvec is subtracted
faceimage = reshape(faceimage, [], 1); %[] means the rows are automatically calculated. 1 column.
faceimage = faceimage - meanvec;

%calculate fvec by multiplying basis(:,K)` and the transformed face image
fvec = basis(:, K)' * faceimage;
end

