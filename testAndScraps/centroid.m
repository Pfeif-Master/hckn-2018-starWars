clear;
addpath('Filters\');

%% get centroids
raw = imread('Media\scraps\green.jpg');
[u1, u2, L1, L2] = get_centroids(raw);

%% plot
figure;
imshow(raw);
hold on
text(u1, u2, 'T');
text(L1, L2, 'B');

