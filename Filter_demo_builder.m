%% load image
addpath('./Filters/filterSet2//');
demo = VideoWriter('Media\starwars\filter_demo');
demo.FrameRate = 10;
open(demo);
raw = imread('Media/debug/raw_save1/Image53.jpg');
for i = 1 : 20
    writeVideo(demo, raw);
end

%% remove green screen
[gs, rmGS] = rm_greenScreen2(raw);
for i = 1 : 20
    writeVideo(demo, rmGS);
end

%% blur
blur = imgaussfilt(rmGS, 10);
for i = 1 : 20
    writeVideo(demo, blur);
end

%% get color yCbCr
[bwWast, cl] = filter_color2(blur);
for i = 1 : 20
    writeVideo(demo, cl);
end

%% get orange HSV
orange_layer = filter_orange2(cl);
RGB_Image = uint8( orange_layer(:,:,[1 1 1]) * 255 );
for i = 1 : 20
    writeVideo(demo, RGB_Image);
end

%% get purple HSV
purple_layer = filter_purple2(cl);
RGB_Image = uint8( purple_layer(:,:,[1 1 1]) * 255 );
for i = 1 : 20
    writeVideo(demo, RGB_Image);
end

%% get centroids
[v, u1, u2, L1, L2] = get_centroids(raw);
saber = lightsaber(raw, floor(u1), floor(u2), floor(L1), floor(L2));
for i = 1 : 20
    writeVideo(demo, saber);
end

close(demo);




