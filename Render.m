clear;
addpath('Filters\filterSet2\');

frameDivider = 1;

vr = VideoReader('Media\starwars\tech_demo_1\Raw_test_data1.MP4');

vw = VideoWriter('Media\starwars\tech_demo_1\wesley');
vw.FrameRate = vr.FrameRate / frameDivider;
open(vw);

vw_cv = VideoWriter('Media\starwars\tech_demo_1\wesley_cv');
vw_cv.FrameRate = vr.FrameRate / frameDivider;
open(vw_cv);

i = 0;
while hasFrame(vr)
% while i < 400
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
    
    cv_Frame = stage1(oldFrame);
    
    if(v)
        newFrame = insertText(oldFrame, [u1, u2], 'U');
        newFrame = insertText(newFrame, [L1, L2], 'L');
        newFrame = lightsaber(newFrame, floor(u1), floor(u2), floor(L1), floor(L2));
        
    end
%     imwrite(oldFrame, ['Media\debug\raw\Image' int2str(i), '.jpg']);
%     imwrite(newFrame, ['Media\debug\out\Image' int2str(i), '.jpg']);
%     imshow(newFrame);
    writeVideo(vw, newFrame);
    writeVideo(vw_cv, cv_Frame);
    

    i = i + 1
end

close(vw);
close(vw_cv);


