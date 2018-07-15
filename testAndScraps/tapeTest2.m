%% load image
addpath('./Filters/old_filters/');
raw = imread('Media/scraps/green.jpg');
%imshow(raw);

%% remove green screen
[gs, rmGS] = rm_greenScreen(raw);

%% get purple
purple_layer = filter_purple(rmGS);
%imshow(purple_layer);

%% get orange
orange_layer = filter_orange(rmGS);
%imshow(orange_layer);

%% printAll
figure;
subplot(2,2,1);
imshow(raw);
title('raw');

subplot(2,2,2);
imshow(rmGS);
title('No back ground')

subplot(2,2,3);
imshow(purple_layer);
title('purple Layer');

subplot(2,2,4);
imshow(orange_layer);
title('Orange Layer');

