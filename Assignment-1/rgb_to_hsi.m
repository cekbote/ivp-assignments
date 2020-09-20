% Function that converts an rgb image to hsi.

function [hue, sat, inten] = rgb_to_hsi(red, green, blue, img)
    hue = acos((1/2 * ((red - green)+(red - blue)))./((red - green).^2 + sqrt((red-blue).*(green - blue))+0.000001));
    hue(blue>green)= 360 - hue(blue>green);
    sat = 1 - 3./(sum(img, 3)) .* min(img,[],3);
    inten = sum(img, 3)./3;