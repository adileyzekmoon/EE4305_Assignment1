
input = [];
output = [];
test_input = [];

for i = -1: 0.05: 1
    input = [input, i];
    output_val = 1.2*sin(pi*i)-cos(2.4*pi*i);
    output = [output, output_val];
end

for j = -1: 0.01: 1
    test_input = [test_input, j];
end

input_c = num2cell(input,1);
output_c = num2cell(output,1);




net = fitnet(5);
for i = 1:1
    [net,y,e] = adapt(net, input_c, output_c);
end

test_results = net(input); % predictions on training set
    








