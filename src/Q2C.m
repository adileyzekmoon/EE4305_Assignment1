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
    net = fitnet(n, 'trainbr');
    net = train(net, input, output);
    test_results(n,:) = net(test); % predictions on training set
    resultsOfThree(n,:) = net(3);
    resultsOfNThree(n,:) = net(-3);
end

net = fitnet(20, 'trainbr');
net = train(net, input, output);
test_results(11,:) = net(test); % predictions on training set
resultsOfThree(11,:) = net(3);
resultsOfNThree(11,:) = net(-3);

net = fitnet(50, 'trainbr');
net = train(net, input, output);
test_results(12,:) = net(test); % predictions on training set
resultsOfThree(12,:) = net(3);
    resultsOfNThree(12,:) = net(-3);

    

