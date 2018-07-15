function Image = lightsaber(img,Ux, Uy, Lx, Ly)


dx = abs(Ux - Lx);
if dx == 0
    dx = 1; %no neg infinty please
end
dy = abs(Uy - Ly);
d = pdist([Ux, Uy; Lx, Ly]);

slope = dy/dx;


%% get sign of slope
if Uy > Ly
    if Ux > Lx
        slope = slope;
    else
        slope = slope * -1;
    end
else
    if Ux > Lx
        slope = -slope;
    else
        slope = slope;        
    end
end
    
b = Uy - Ux * slope;

%% set sizes
s = size(img);
h = 20; % hight
w = 10; % width
mult = 3; %plasma scale factor

%% scale plasma legth
HorAng = atan2(dy, dx);
xstend = mult * d * cos(HorAng);

for i = 0:xstend
    %% x directions
    if Ux < Lx
        Nx = Ux - i;
    else
        Nx = Ux + i;
    end
    
    %% bound check
    if Nx - w <= 0
        break;
    end
    if s(2) <= Nx + w
        break;
    end
    
    Ny = b + floor(Nx * slope);
    Ny = floor(Ny);
    if s(1) < Ny + h
        break;
    end
    if Ny - h <= 0
        break;
    end
    
    %% draw line
    img([Ny - h : Ny + h],[Nx - w : Nx + w] , :) = 255; 
end

Image = img;
% imshow(Image);
% assignin('uint8', image, img)

end