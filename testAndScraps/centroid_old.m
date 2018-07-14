clear;
addpath('Filters\');
%% get layers
raw = imread('Media/green/Image251.jpg');
[bw_orange, bw_purple] = get_O_P(raw);

%% 

figure;
subplot(1,3,1);
imshow(raw);
subplot(1,3,2);
imshow(bw_orange);
title('Orange');
subplot(1,3,3);
imshow(bw_purple);
title('Purple');


