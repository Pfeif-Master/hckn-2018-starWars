% Reads in video and saves each frame

clc; clear; close all;

vid = VideoReader('Test_vid.mp4');
% replace with the video file we want to use

numFrames = vid.NumberOfFrames;

n = numFrames;
% define number of frames

for i =1:2:(n/10);
% in final code, change to 1:1:n to get everyframe

    % save each frame at each time step
    frames = read(vid,i); 
    imwrite(frames, ['Image' int2str(i), '.jpg']);
    im(i)=image(frames);
end
