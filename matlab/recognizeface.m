function id = recognizeface(orl_test, fvecs, label_train, ...
meanvec, basis, numcomp)
face_test = orl_test.face_test;
percentageCorrect = zeros(1, length(numcomp));

for q = 1: length(numcomp)
    id = zeros(1, length(face_test'));

    %(i) Run the function projecttrain of Part 6 with face test. Then, you will get (100x40) fvecs test.
    fvecs_test = projecttrain(face_test, meanvec, basis);

    % (ii) Truncate the 100 dimensional feature vector to the numcomp length. (e.g. fvecs(1:numcop,:)
    %and fvecs_test(1:numcop,:))
    fvecs_loop = fvecs(1:numcomp(q),:);
    fvecs_test = fvecs_test(1:numcomp(q),:);

    %(iii) For each column of fvecs_test, find the closest
    %column of fvecs by using Euclidean distance. Then look up its label train, which is
    %going to be id. (e.g. If the closest column is 50 for the first test image, then 
    %id(1) = label train(50)).
    for j = 1 : size(fvecs_test ,2) %for each column in fvecs_test
    min = norm(fvecs_test(:,j) - fvecs_loop(:,1));
    faceID = 1;
        for i = 2 : size(fvecs_loop , 2) %compare it to each column in fvecs, find column in fvecs with smaller Euc. dist
            candidate = norm(fvecs_test(:,j) - fvecs_loop(:,i));
            if min > candidate
                min = candidate;
                faceID = i;
            end
        end
    id(j) = label_train(faceID);
    end

    %compare the accuracy as numcomp is varied

    answerKey = orl_test.label_test'; 
    answers = id; %answer for current value of numcomp
    graded = (answerKey == answers);
    percentageCorrect(q) = numel(find(graded))/40 * 100;
    
end

%plot the accuracy compared to the numcomps
x = numcomp;
y = percentageCorrect;

figure
plot(x,y);

title('Accuracy vs. numcomps')
xlabel('numcomps')
ylabel('percentageCorrect')


end

