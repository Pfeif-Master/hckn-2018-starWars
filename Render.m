clear;
addpath('Filters\filterSet2\');

frameDivider = 1; %skip every Nth frame


%% set up video IO
%input
vr = VideoReader('Media\starwars\tech_demo_1\Raw_test_data1.MP4');

%output
vw = VideoWriter('Media\starwars\tech_demo_1\wesley');
vw.FrameRate = vr.FrameRate / frameDivider;
open(vw);

%output filter (no plasma)
vw_cv = VideoWriter('Media\starwars\tech_demo_1\wesley_cv');
vw_cv.FrameRate = vr.FrameRate / frameDivider;
open(vw_cv);

%% frame parsing
i = 0;
while hasFrame(vr) %use to parse all input video
% while i < 400 %use to parse only n frames

%% frame skipping
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
    
    %% read in target frame
    oldFrame = readFrame(vr);
    newFrame = oldFrame;
    
    %% if soild black frame; skip CV (Major speed up)
    if(nnz(oldFrame) == 0)
        disp('skip');
        writeVideo(vw, newFrame);
        i = i + 1
        continue;
    end
    
    %% get cords of markers
    [v, u1, u2, L1, L2] = get_centroids(oldFrame);
    
    cv_Frame = stage1(oldFrame); %redo cv to get filter demo
    
    %% if both markers are present draw plasma
    if(v)
        newFrame = insertText(oldFrame, [u1, u2], 'U');
        newFrame = insertText(newFrame, [L1, L2], 'L');
        newFrame = lightsaber(newFrame, floor(u1), floor(u2), floor(L1), floor(L2));
        
    end
    
    %% save frame as jpg for debugging (make sure folder exist)
%     imwrite(oldFrame, ['Media\debug\raw\Image' int2str(i), '.jpg']);
%     imwrite(newFrame, ['Media\debug\out\Image' int2str(i), '.jpg']);
%     imshow(newFrame);

    %% write frames to output
    writeVideo(vw, newFrame);
    writeVideo(vw_cv, cv_Frame);
    

    i = i + 1
end

%% close files
close(vw);
close(vw_cv);


