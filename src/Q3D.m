train_folder = dir('group_3/train');
val_folder = dir('group_3/val');
training_namelist = {train_folder.name}.';
training_namelist = training_namelist(3:503);
val_namelist = {val_folder.name}.';
val_namelist = val_namelist(3:169);
train_images = [];
val_images = [];
epoch = 1;

% Populate training images matrix
for i = 1: size(training_namelist)
    name = "group_3/train/" + training_namelist{i};
    name = convertStringsToChars(name);
    tmp = strsplit(name, {'_', '.'});
    training_labels(i)= str2num(tmp{3});
    I = imread(name);
    V=I(:);
    train_images = [train_images,V];
end

% Convert to double for matrix multiplication
train_images = double(train_images);

net = patternnet(64);
for i=1:epoch
    net = adapt(net, train_images, training_labels);
end



%   VALIDATION STAGE

% Populate validation images matrix
for i = 1: size(val_namelist)
    name = "group_3/val/" + val_namelist{i};
    name = convertStringsToChars(name);
    tmp = strsplit(name, {'_', '.'});
    validation_labels(i)= str2num(tmp{3});
    I = imread(name);
    V=I(:);
    val_images = [val_images,V];
end

% Convert to double for matrix multiplication
val_images = double(val_images);

pred_train = round(net(train_images));
acc_train = 1 - mean(abs(pred_train - training_labels));

pred_val = round(net(val_images));
acc_val = 1 - mean(abs(pred_val - validation_labels));



