function Image = lightsaber(img,p1x, p1y, p2x, p2y)

% p2x = 550;
% p2y = 700;
% p1x = 500;
% p1y = 600;

dx = p2x -p1x;
dy = p2y - p1y;

slope = dy/dx

p2x = p2x -10;

% make line thicker
%assume cm2 is (550, 700)
for k = [1:1:20];
    p2x = p2x +1;
    % make line thicker
    for i = [1:1:4*dx]

        img(p2x+i, p2y+slope*i) = 0;

    end
end
Image = img;
imshow(Image);
% assignin('uint8', image, img)

end