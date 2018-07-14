clear;
addpath('Filters\');

frameDivider = 2;

vr = VideoReader('Media\Test_Footage_Lightsaber.MP4');
vw = VideoWriter('Media\output1.MP4');
vw.FrameRate = vr.FrameRate / frameDivider;
open(vw);

i = 0;
while hasFrame(vr)
% while(i < 10)
    %skip n frames
    for k = 1 : frameDivider
        q = false;
        if ~hasFrame(vr)
            q = true;
            break
        end
        readFrame(vr);%dump fram
    end
    if q
        break;
    end
    oldFrame = readFrame(vr);
    newFrame = oldFrame;
    [v, u1, u2, L1, L2] = get_centroids(oldFrame);
    if(v)
        newFrame = insertText(oldFrame, [u1, u2], 'U');
        newFrame = insertText(newFrame, [L1, L2], 'L');
    end
    %imshow(newFrame);
    writeVideo(vw, newFrame);
    

    i = i + 1;
end

close(vw);

