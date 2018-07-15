clear;
addpath('Filters\filterSet2\');

frameDivider = 4;

vr = VideoReader('Media\starwars\Edited_Lightsaber_Shots_raw.mp4');
vw = VideoWriter('Media\starwars\short.mp4');
vw.FrameRate = vr.FrameRate / frameDivider;
open(vw);

i = 0;
while hasFrame(vr)
%while i < 60
    q = false;
    for k = 1 : frameDivider - 1
        if ~hasFrame(vr)
            q = true;
            break
        end
        readFrame(vr);%dump fram
    end
    if q
        break;
    end
    if ~hasFrame(vr)
        break;
    end
    oldFrame = readFrame(vr);
    newFrame = oldFrame;
    
    if(nnz(oldFrame) == 0)
        disp('skip');
        writeVideo(vw, newFrame);
        i = i + 1
        continue;
    end
    
    [v, u1, u2, L1, L2] = get_centroids(oldFrame);
    if(v)
        newFrame = insertText(oldFrame, [u1, u2], 'U');
        newFrame = insertText(newFrame, [L1, L2], 'L');
        newFrame = lightsaber(newFrame, floor(u1), floor(u2), floor(L1), floor(L2));
    end
%     imwrite(oldFrame, ['Media\debug\raw\Image' int2str(i), '.jpg']);
%     imwrite(newFrame, ['Media\debug\out\Image' int2str(i), '.jpg']);
%     imshow(newFrame);
    writeVideo(vw, newFrame);
    

    i = i + 1
end

close(vw);


