function [meanvec, basis] = pcaface(face_data)
try
    NUM_FACES = length(face_data.face_train);
    faces_cell = face_data.face_train;% .. this is the cell array of data(360,1)
catch
    NUM_FACES = length(face_data.face_test);
    faces_cell = face_data.face_test;% .. this is the cell array of data(40,1)
end

%transform face_train into a 6336xNUM_FACES matrix. Credit to Stackoverflow
%user bendervader for the idea behind thid implementation.

faces = zeros(numel(faces_cell{1}), NUM_FACES); % preallocate the matrix . equiv to zeros(6336, 360)
for i = 1 : NUM_FACES
   faces(:, i) = reshape(faces_cell{i}, [], 1); %[] means the num rows are automatically calculated. 1 column.
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
cov_matrix = cov(faces'); %WHY IS THIS 360X360? SHOULD BE 6336X6336. Lucky guess dawg! Just take the transpose.

%Obtain the top 100 eigenvectors of the obtained covariance matrix. Output
%should be 6336 x 100
[basis D] = eigs(cov_matrix, 100);

%sort the eigenvectors by eigenvalue, larger the eigval further left it
%appears
[uselessVariable,permutation]=sort(diag(D),'descend');
D=D(permutation,permutation);
basis=basis(:,permutation);

end

