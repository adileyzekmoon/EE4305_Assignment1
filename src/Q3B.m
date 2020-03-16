train_folder = dir('group_3/train');
val_folder = dir('group_3/val');
training_namelist = {train_folder.name}.';
training_namelist = training_namelist(3:503);
val_namelist = {val_folder.name}.';
val_namelist = val_namelist(3:169);
train_images = [];
val_images = [];

% Populate training images matrix
for i = 1: size(training_namelist)
    name = "group_3/train/" + training_namelist{i};
    name = convertStringsToChars(name);
    tmp = strsplit(name, {'_', '.'});
    training_labels(i)= str2num(tmp{3});
    I = imread(name);
    I = imresize(I, [64 64]);
    V=I(:);
    train_images = [train_images,V];
end

% Convert to double for matrix multiplication
train_images = double(train_images);
% initialise weights at all 0
w = zeros(1, (64*64));
learning_rate = .001;


%Iterate through 500 images
for j = 1:size(training_namelist)
    % Calculate output
    output = w*train_images(:,j);
    
    % Hard limiter
    if (output>0)
        output = 1;
    else
        output = 0;
    end
    
    % Update weights if wrong class
    if (output ~= training_labels(j))
        for k = 1:size(V)
            w(k) = w(k) + (learning_rate*(training_labels(j)-output)*train_images(k,j));
        end
    end
end

%   VALIDATION STAGE

% Populate validation images matrix
for i = 1: size(val_namelist)
    name = "group_3/val/" + val_namelist{i};
    name = convertStringsToChars(name);
    tmp = strsplit(name, {'_', '.'});
    validation_labels(i)= str2num(tmp{3});
    I = imread(name);
    I = imresize(I, [64 64]);
    V=I(:);
    val_images = [val_images,V];
end

% Convert to double for matrix multiplication
val_images = double(val_images);
predictions = [];
passes = 0;

for j=1:167
    predictions(j) = w*val_images(:,j);
    
    % Hard limiter
    if (predictions(j)>0)
        predictions(j) = 1;
    else
        predictions(j) = 0;
    end
    
    if predictions(j)==validation_labels(j)
        passes = passes + 1;
    end
end

accuracy = passes/167;



