%% load image
addpath('./Filters');
raw = imread('Media/scraps/pipe3.jpg');
%imshow(raw);

%% convert to lab
converted = rgb2lab(raw);
%imshow(raw_HSV);

%% null background
[bg_waste, nb] = nullBackground(converted);
%imshow(focused_HSV);

%% get purple
purple_layer = filter_purple(nb);
%imshow(purple_layer);

%% get orange
orange_layer = filter_orange(nb);
%imshow(orange_layer);

%% printAll
figure;
subplot(3,3,1);
imshow(raw);
title('raw');

subplot(3,3,2);
imshow(converted);
title('converted tp lab');

subplot(3,3,3);
imshow(nb);
title('No back ground')

subplot(3, 3, 4);
imshow(purple_layer);
title('purple Layer');

subplot(3, 3, 5);
imshow(orange_layer);
title('Orange Layer');

