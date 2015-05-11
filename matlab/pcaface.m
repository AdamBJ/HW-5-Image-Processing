function [meanvec, basis] = pcaface(face_data)
NUM_FACES = length(face_data.face_train);

%transform face_train into a 6336xNUM_FACES matrix. Credit to Stackoverflow
%user bendervader for the idea behind thid implementation.
faces_cell = face_data.face_train;% .. this is your cell array of data cell(360,1)
faces = zeros(numel(faces_cell{1}), NUM_FACES); % or zeros(6336, 360)
for i = 1 : NUM_FACES
   faces(:, i) = reshape(faces_cell{i}, [], 1); %[] means the rows are automatically calculated. 1 column.
end

%get the mean face
meanvec = faces(:,1);
for i=2 : NUM_FACES
    meanvec = meanvec + faces(:, i);
end
meanvec = meanvec./NUM_FACES;

%subtract the means from each data point of faces
for i=1 : NUM_FACES
    faces(:, i) = faces(:, i) - meanvec;
end

%compute the covariance matrix using the matlab function cov.
cov_matrix = cov(faces); %WHY IS THIS 360X360? SHOULD BE 6336X6336.

%Obtain the top 100 eigenvectors of the obtained covariance matrix
basis = eigs(cov_matrix, 100);

end

