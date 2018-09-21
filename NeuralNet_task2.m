function[total] = NeuralNet_task2(Testd,Group)
load("/Users/rohithreddyv/Desktop/Data Mining/Assignment4/PostPcaTrainingFinal.mat");
BaseData = PostPcaTraining;
[row,col] = size(BaseData);
trainRow = col;
TestClass = Testd(:,end:end);
[row1,col1] = size(Testd)
rowtest = col1-1
TrainData = BaseData(:,1:rowtest);
TrainClass = BaseData(:,end:end);
TestData = Testd(1:end,1:end-1);

testRow = row1;
%net = feedforwardnet(10);
%net = configure(net,TrainData);
%res = train(net,TrainData);
net =fitnet(10,'trainlm');
net.divideParam.trainRatio=.7;
net.divideParam.valRatio=.15;
net.divideParam.testRatio=.15;
[net,pr]= train(net,TrainData',TrainClass');
[predictedlabel]=net(TestData')';
count =0;
for j=1:testRow
    if( int16(predictedlabel(j)) == TestClass(j,1))
        count=count+1;
    end
end

tp =0;
for i=1:testRow
    if TestClass(i,1)==1
        if int16(predictedlabel(i)) ==1
            tp = tp+1;
        end
    end
end
fn=0;
for i=1:testRow
    if TestClass(i,1)==1
        if int16(predictedlabel(i)) ==0
            fn = fn+1;
        end
    end
end
fp=0;
for i=1:testRow
    if TestClass(i,1)==0
        if int16(predictedlabel(i)) ==1
            fp = fp+1;
        end
    end
end

% save('Testclass.mat','TestClass');
% save('predictedlabel.mat','predictedlabel');
predictpositive = sum(TestClass);
actualpositive = sum(int16(predictedlabel));

%Precision=tp/predictpositive;
Precision=tp/actualpositive;
Recall = tp/ (tp+fn);
f1score = 2*Recall*Precision/(Recall+Precision);
accuracy = (count/testRow)*100;
[X,Y,t, AUC] = perfcurve(int16(predictedlabel),TestClass,1);
total = [Precision Recall f1score, AUC];
% plot(X,Y);
% xlabel('False positive Rate');
% ylabel('True Positive Rate');
% title(strcat('ROC curve(Neural Network task 2) for ',' ','Group',num2str(Group)));
% saveto=strcat('ROC_curve_task2/','RocCurve_NeuralNetwork_task2_','Group',num2str(Group),'.png');
% saveas(gcf,saveto);

disp("End test");