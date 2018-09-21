function [] = final_task2()
%      a = ("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/Eating.mat");
%      b = ("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/Noneating.mat");
    for Group=11:33
 %     Group=11;
     eating = strcat("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/Group_data/Group",string(Group),"_Eating.csv");
     Noneating = strcat("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/Group_data/Group",string(Group),"_NonEating.csv"); 
     a=csvread(eating);
     b=csvread(Noneating);
     forpcamat = newtask(a,b);
     postpca = newpca(forpcamat);
%      forpcamat = newtask_task2(a,b);
%      newpca_task2(forpcamat);
     
      [t1]=DTree(postpca,Group);
      [t2]=NeuralNet(postpca,Group);
      [t3]=SVM(postpca,Group);
      task2(Group,:)=[t1 t2 t3];
    end
     save('resultmat_task2.mat','task2');
end
