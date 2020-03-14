input = [];
output = [];

for i = -1: 0.05: 1
    input = [input, i];
    output_val = 1.2*sin(pi*i)-cos(2.4*pi*i);
    output = [output, output_val];
end

input_c = num2cell(input,1);
output_c = num2cell(output,1);
input_delay = {1};


net = fitnet(50);
% net = train(net, input, output);

net = adapt(net, input_c, output_c);
pred_train = net(input); % predictions on training set
perf = perform(net,pred_train,output)

% accu_train = 1 - mean(abs(pred_train-output));

% pred_val = round(net(images(:,train_num+1:end))); % predictions on validation set
% accu_val(i) = 1 - mean(abs(pred_val-labels(train_num+1:end)));



