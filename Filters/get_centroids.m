function [valid, cm_upper_1, cm_upper_2, cm_lower_1, cm_lower_2] = get_centroids(raw_RGB)

[bw_orange, bw_purple] = get_O_P(raw_RGB);

%% get center of mass
cm_orange = regionprops(bw_orange, 'centroid');
cm_purple = regionprops(bw_purple, 'centroid');

%% check if found blob
so = size(cm_orange);
sp = size(cm_purple);
foundO = so(1);
foundP = sp(1);

if(foundO)
    o = cm_orange.Centroid;
end
if(foundP)
    p = cm_purple.Centroid;
end

cm_upper_1 = 0;
cm_upper_2 = 0;
cm_lower_1 = 0;
cm_lower_2 = 0;
valid = 0;


% cm_upper_1 = floor(o(1));
% cm_upper_2 = floor(o(2));
% cm_lower_1 = floor(p(1));
% cm_lower_2 = floor(p(2));
if(foundO && foundP)
    valid = 1;
    cm_upper_1 = o(1);
    cm_upper_2 = o(2);
    cm_lower_1 = p(1);
    cm_lower_2 = p(2);
end

end

