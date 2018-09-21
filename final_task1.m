function [] = final()
   
   
   for Group=1:33  
    eating = strcat("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/Group_data/Group",string(Group),"_Eating.csv");
    Noneating= strcat("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/Group_data/Group",string(Group),"_NonEating.csv");
    a=csvread(eating);
    b=csvread(Noneating);
    forpcamat = newtask(a,b);
    postpca = newpca(forpcamat);
    [t1]=DTree(postpca,Group);
    [t2]=NeuralNet(postpca,Group);
    [t3]=SVM(postpca,Group);
    tn(Group,:)=[t1 t2 t3];
     
   end
   save('resultmat.mat','tn');
end
