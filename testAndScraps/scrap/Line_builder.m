%take in two different CMs and draw the line.. from the second CM to 4*d
%where d is the distance between the two CMs
clc; clear; close all;

img = imread('Image1.jpg');
%assume cm1 is (500,600)
x1 = img(500, 600);
x2 = img(550, 700);

p2x = 550;
p2y = 700;
p1x = 500;
p1y = 600;

dx = p2x -p1x;
dy = p2y - p1y;

slope = dy/dx

p2x = p2x -10;

% make line thicker
%assume cm2 is (550, 700)
for k = [1:1:20];
    p2x = p2x +1;
    % make line thicker
    for i = [1:1:4*dy]

        img(p2x+i, p2y+slope*i) = 255;

    end
end

imshow(img)
        
