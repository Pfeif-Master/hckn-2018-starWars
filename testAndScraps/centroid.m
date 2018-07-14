clear;
addpath('Filters\');
%% get layers
raw = imread('Media/scraps/pipe3.jpg');
[bw_orange, bw_purple] = get_O_P(raw);

%% 

figure;
subplot(1,2,1);
imshow(bw_orange);
title('Orange');
subplot(1,2,2);
imshow(bw_purple);
title('Purple');
hold on

%% get center of mass
cm_orange = regionprops(bw_orange, 'centroid');
cm_purple = regionprops(bw_purple, 'centroid');

p = cm_purple.Centroid;
text(p(1), p(2), 'purple');

hold off

