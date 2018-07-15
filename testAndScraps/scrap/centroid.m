addpath('Filters\');

%% get centroids
% raw = imread('Media\green\Image226.jpg');
raw = oldFrame;
[o, p] = get_O_P(raw);
bw = o | p;
[v, u1, u2, L1, L2] = get_centroids(raw);

%% plot
figure;
imshow(raw);
hold on
text(u1, u2, 'T');
text(L1, L2, 'B');

figure;
imshow(bw);

