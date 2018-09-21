function[shuffledPcaMatrix] = newtask(eatingAction,NoneatingAction)
    
    Eating =eatingAction(:,5:end);
    NonEating = NoneatingAction(:,5:end);
    
    % Non-Eating Matrix Calculation   
    NonEatingMatrixSize = size(NonEating)
    NonEatingmpleSize=NonEatingMatrixSize(1)/(18);
    k=1;
    for i=1:NonEatingmpleSize
        for j=1:18
            loopRow = NonEating(k,:);
            NonEatingMeanMatrix(i,j)= nanmean(loopRow);
            NonEatingVarianceMatrix(i,j)=nanvar(loopRow);
            NonEatingEntropyMatrix(i,j)=entropy(loopRow);
            NonEatingMaxMatrix(i,j)=max(loopRow);
            NonEatingstdMatrix(i,j)=nanstd(loopRow);
            k=k+1;
           % disp(k);
        end
%             save('NonEatingMeanMatrix.mat','NonEatingMeanMatrix');
%             save('NonEatingVarianceMatrix.mat','NonEatingVarianceMatrix');
%             save('NonEatingEntropyMatrix.mat','NonEatingEntropyMatrix');
%             save('NonEatingMaxMatrix.mat','NonEatingMaxMatrix');
%             save('NonEatingstdMatrix.mat','NonEatingstdMatrix');
    end
    s1 = size(NonEatingVarianceMatrix(:,1));
    pcaNonEatingMatrix =[NonEatingMeanMatrix NonEatingVarianceMatrix NonEatingEntropyMatrix NonEatingMaxMatrix NonEatingstdMatrix zeros(s1(1),1)];
    save('pcaNonEatingMatrix','pcaNonEatingMatrix');
 % Eating Matrix Calculation   
    EatingMatrixSize = size(Eating);
    EatingmpleSize=EatingMatrixSize(1)/(18);
    %disp(EatingmpleSize);

    k=1;
    for i=1:EatingmpleSize
        for j=1:18
            loopRow=Eating(k,:);
            EatingMeanMatrix(i,j)= nanmean(loopRow);
            EatingVarianceMatrix(i,j)=nanvar(loopRow);
            EatingEntropyMatrix(i,j)=entropy(loopRow);
            EatingMaxMatrix(i,j)=max(loopRow);
            EatingstdMatrix(i,j)=nanstd(loopRow);
            k=k+1; 

           % disp(k);
           % disp(i);
           % disp(j);
        end
    end
%             save('EatingMeanMatrix.mat','EatingMeanMatrix');
%             save('EatingVarianceMatrix.mat','EatingVarianceMatrix');
%             save('EatingEntropyMatrix.mat','EatingEntropyMatrix');
%             save('EatingMaxMatrix.mat','EatingMaxMatrix');
%             save('EatingstdMatrix.mat','EatingstdMatrix');
    s1 = size(EatingVarianceMatrix(:,1));
    
    pcaEatingMatrix =[EatingMeanMatrix EatingVarianceMatrix EatingEntropyMatrix EatingMaxMatrix EatingstdMatrix ones(s1(1),1)];
    pcaMatrix =[pcaEatingMatrix; pcaNonEatingMatrix];
   
    r=randperm(size(pcaMatrix,1));
    shuffledPcaMatrix=pcaMatrix(r,:);
%      save('pcaMatrix.mat','pcaMatrix');
%     save('pcaEatingMatrix.mat','pcaEatingMatrix');
    % plotting
    %for i=1:18
    %bar(EatingMeanMatrix(:,i)','FaceColor','g');
    %hold on
    %bar(NonEatingMeanMatrix(:,i)','FaceColor','b');
    %legend('Eating Mean','Non Eating Mean');
    %image = strcat('/Users/rohithreddyv/Desktop/Assignment3/Task2Plots/',num2str(i),'_Mean.png');
    %saveas(gcf,image);
    %end
end
   