function Image = lightsaber(img,Ux, Uy, Lx, Ly)

% p2x = 550;
% p2y = 700;
% p1x = 500;
% p1y = 600;

dx = Ux - Lx;
if dx == 0
    dx = 1; %no neg infinty please
end
dy = Uy - Ly;
d = pdist([Ux, Uy; Lx, Ly]);

slope = dy/dx;
b = Uy - Ux * slope;
%p2x = p2x -10;

s = size(img);

w = 10; % width
for i = 0:d
    if slope > 0
        Nx = Ux - i;
    else
        Nx = Ux + i;
    end
    
    if Nx < 0
        break;
    end
    if s(2) < Nx
        break;
    end
    
    Ny = b + floor(Nx * slope);
    Ny = floor(Ny);
    if s(1) < Ny + w
        break;
    end
    if Ny - w <= 0
        break;
    end
    img([Ny - w : Ny + w],Nx , :) = 255; 
end

Image = img;
% imshow(Image);
% assignin('uint8', image, img)

end