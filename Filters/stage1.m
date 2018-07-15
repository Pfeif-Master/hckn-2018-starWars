function brightMarkers = stage1(raw)
%STAGE1 returns just the color markers
%% remove green screen
[gsWaste, rmGS] = rm_greenScreen2(raw);

%% blur
blur = imgaussfilt(rmGS, 10);

%% get color yCbCr
[bwWast, brightMarkers] = filter_color2(blur);
end

