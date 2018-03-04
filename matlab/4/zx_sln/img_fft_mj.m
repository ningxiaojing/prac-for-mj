close all;
clear,clc;
img = im2double(imread('D:\Project_des\matlab\practice_MJ\4-fft\easter.jpg'));

[m ,n, ~] = size(img);
img_fft = fft2(img);
sig = 20;
% 高通滤波
HP = hpfilter('gaussian', m, n ,sig);
img_hp_rev = real(ifft2(HP .* img_fft));
figure;imshow(img_hp_rev);
% 低通滤波
LP = lpfilter('gaussian', m, n ,sig);
img_lp_rev = real(ifft2(LP .* img_fft));
figure;imshow(img_lp_rev);

img_crop = imcrop();
img_gamma = imadjust(img_crop, [], [], 0.5);
img_resize = imresize(img_gamma, [128,128]);
imwrite(img_resize, 'res.jpg');
figure;imshow(img_resize);
