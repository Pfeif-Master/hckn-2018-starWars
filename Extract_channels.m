% code for extracting and combining RGB channels in matlab

% use token image


% split the image into three channels
redchannel = Image(:,:,1);
greenchannel = Image(:,:,2);
bluechannel = Image(:,:,3);

% combine the image into one channel

rgbImage = cat(3, redchannel, greenchannel, bluechannel);

imshow(rgbImage);

