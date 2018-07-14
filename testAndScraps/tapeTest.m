%% load image
addpath('./Filters/1');
raw = imread('Media/scraps/Tape.jpg');
%imshow(raw);

%% convert to hsv
raw_HSV = rgb2hsv(raw);
%imshow(raw_HSV);

%% null background
[bw, focused_HSV] = nullBackground(raw_HSV);
%imshow(focused_HSV);

%% get purple
purple_layer = filter_purple(focused_HSV);
%imshow(purple_layer);

%% get orange
orange_layer = filter_orange(focused_HSV);
%imshow(orange_layer);

%% get yellow
yellow_layer = filter_yellow(focused_HSV);
%imshow(yellow_layer);

%% printAll
figure;
subplot(3,3,1);
imshow(raw);
title('raw');

subplot(3,3,2);
imshow(raw_HSV);
title('HSV');

subplot(3,3,3);
imshow(focused_HSV);
title('Nulled Background')

subplot(3, 3, 4);
imshow(purple_layer);
title('purple Layer');

subplot(3, 3, 5);
imshow(orange_layer);
title('Orange Layer');

subplot(3, 3, 6);
imshow(yellow_layer);
title('yellow Layer');

