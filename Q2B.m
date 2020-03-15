close all;
clear all;
clc;

input = [];
output = [];
test = [];

for i = -1: 0.05: 1
    input = [input, i];
    output_val = 1.2*sin(pi*i)-cos(2.4*pi*i);
    output = [output, output_val];
end

for j = -1: 0.01: 1
    test = [test, j];
end

input_c = num2cell(input,1);
output_c = num2cell(output,1);




for n = 1: 10
    net = fitnet(n, 'trainlm');
    net = train(net, input, output);
    test_results(n,:) = net(test); % predictions on training set
end

net = fitnet(20, 'trainlm');
net = train(net, input, output);
test_results(11,:) = net(test); % predictions on training set

net = fitnet(50, 'trainlm');
net = train(net, input, output);
test_results(12,:) = net(test); % predictions on training set

    



% accu_train = 1 - mean(abs(pred_train-output));

% pred_val = round(net(images(:,train_num+1:end))); % predictions on validation set
% accu_val(i) = 1 - mean(abs(pred_val-labels(train_num+1:end)));



