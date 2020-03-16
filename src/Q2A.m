
input = [];
output = [];
test = [];
test_output = [];

for i = -1: 0.05: 1
    input = [input, i];
    output_val = 1.2*sin(pi*i)-cos(2.4*pi*i);
    output = [output, output_val];
end

for j = -1: 0.01: 1
    test = [test, j];
    test_output_val = 1.2*sin(pi*j)-cos(2.4*pi*j);
    test_output = [test_output, test_output_val];
end

input_c = num2cell(input,1);
output_c = num2cell(output,1);




for n = 1: 10
    net = fitnet(n);
    [net,y,e,pf] = adapt(net, input_c, output_c);
    test_results(n,:) = net(test); % predictions on training set
    resultsOfThree(n,:) = net(3);
    resultsOfNThree(n,:) = net(-3);
end

net = fitnet(20);
[net,y,e,pf] = adapt(net, input_c, output_c);
test_results(11,:) = net(test); % predictions on training set
resultsOfThree(11,:) = net(3);
resultsOfNThree(11,:) = net(-3);

net = fitnet(50);
[net,y,e,pf] = adapt(net, input_c, output_c);
test_results(12,:) = net(test); % predictions on training set
resultsOfThree(12,:) = net(3);
resultsOfNThree(12,:) = net(-3);








