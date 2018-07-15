%% load image
addpath('./Filters/filterSet2//');
raw = imread('Media/debug/raw/Image0.jpg');
figure; imshow(raw); title('Raw image');

%% remove green screen
[gs, rmGS] = rm_greenScreen2(raw);
figure; imshow(rmGS); title('Remove green screen (yCbCr)');

%% blur
blur = imgaussfilt(rmGS, 10);
figure; imshow(blur); title('Blur (gauss: 10)');

%% get color yCbCr
[bwWast, cl] = filter_color2(blur);
figure; imshow(cl); title('bright markers (yCbCr)');

%% get orange HSV
orange_layer = filter_orange2(cl);
figure; imshow(orange_layer); title('orange layer (HSV)');

%% get purple HSV
purple_layer = filter_purple2(cl);
figure; imshow(purple_layer); title('purple layer (HSV)');



