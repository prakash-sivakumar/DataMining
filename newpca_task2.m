function[PostPca] = newpca_task2(forpca)
  %inputData=[EatingAction, NonEatingAction];
%   save('inputData.mat','inputData');
%   load("/Users/rohithreddyv/Desktop/Data Mining/Assignment3/shuffledPcaMatrix.mat")
%   save('forpca.mat','a');
  [ev,score,Evalue] = pca(forpca(:,1:90));
  PostPcaTraining = [score, forpca(:,91)];
  save('PostPcaTrainingFinal.mat','PostPcaTraining');

   
end