function [cm_upper_1, cm_upper_2, cm_lower_1, cm_lower_2] = get_centroids(raw_RGB)

[bw_orange, bw_purple] = get_O_P(raw_RGB);

%% get center of mass
cm_orange = regionprops(bw_orange, 'centroid');
cm_purple = regionprops(bw_purple, 'centroid');

o = cm_orange.Centroid;
p = cm_purple.Centroid;

% cm_upper_1 = floor(o(1));
% cm_upper_2 = floor(o(2));
% cm_lower_1 = floor(p(1));
% cm_lower_2 = floor(p(2));
cm_upper_1 = o(1);
cm_upper_2 = o(2);
cm_lower_1 = p(1);
cm_lower_2 = p(2);

end

