function [orange_layer,purple_layer] = get_O_P(raw_RGB)
%GET_O_P returns two binary images, one for orange, one for purple

%% null background
[bg_waste, nb] = rm_greenScreen(raw_RGB);

%% get purple
p = filter_purple(nb);
purple_layer = bwareafilt(p, 1, 'Largest');

%% get orange
o = filter_orange(nb);
orange_layer = bwareafilt(o, 1, 'Largest');
end

