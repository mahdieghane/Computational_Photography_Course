clc;
clear all

iteration = 5;
image=imread('carpet_01_noflash.jpg');
image_noflash=im2double(image);
image_1=imread('carpet_00_flash.jpg');
image_flash=im2double(image_1);
image_2=imread('carpet_03_our_result.jpg');
image_original=im2double(image_2);

W=45;
Lambda=45;
[Per1,Per2]=Permibility (image_flash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out1=edge_aware_filter(image_noflash,W,Lambda,h_horizon,h_vertical,iteration);

figure,imshow(out1);
title("Filtered No-Flashed Image By Filter From Flashed Image")
[Per1,Per2]=Permibility (image_noflash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out2=edge_aware_filter(image_flash,W,Lambda,h_horizon,h_vertical,5);

figure,imshow(out2);
title("Filtered Flashed image By Filter From No-Flashed Image")

figure,imshow(image_original)
title("Their Result")
%% 2
%%%%%%%%%

iteration = 5;


image=imread('cave01_01_noflash.jpg');
image_noflash=im2double(image);
image_1=imread('cave01_00_flash.jpg');
image_flash=im2double(image_1);
image_2=imread('cave01_03_our_result.jpg');
image_original=im2double(image_2);

W=8;
Lambda=1;
[Per1,Per2]=Permibility (image_flash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out1=edge_aware_filter(image_noflash,W,Lambda,h_horizon,h_vertical,iteration);

figure,imshow(out1);
title("Filtered No-Flashed Image By Filter From Flashed Image")
[Per1,Per2]=Permibility (image_noflash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out2=edge_aware_filter(image_flash,W,Lambda,h_horizon,h_vertical,5);

figure,imshow(out2);
title("Filtered Flashed image By Filter From No-Flashed Image")

figure,imshow(image_original)
title("Their Result")

%%%%%%%%%%
%% 3
iteration = 5;


image=imread('lamp_01_noflash.jpg');
image_noflash=im2double(image);
image_1=imread('lamp_00_flash.jpg');
image_flash=im2double(image_1);
image_2=imread('lamp_03_our_result.jpg');
image_original=im2double(image_2);

W=2;
Lambda=1;
[Per1,Per2]=Permibility (image_flash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out1=edge_aware_filter(image_noflash,W,Lambda,h_horizon,h_vertical,iteration);

figure,imshow(out1);
title("Filtered No-Flashed Image By Filter From Flashed Image")
[Per1,Per2]=Permibility (image_noflash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out2=edge_aware_filter(image_flash,W,Lambda,h_horizon,h_vertical,5);

figure,imshow(out2);
title("Filtered Flashed image By Filter From No-Flashed Image")

figure,imshow(image_original)
title("Their Result")
%%%%%%%%%%


%%%%%%%%%%



%% 4
%%%%%%%%%
iteration = 5;


image=imread('potsdetail_01_noflash.jpg');
image_noflash=im2double(image);
image_1=imread('potsdetail_00_flash.jpg');
image_flash=im2double(image_1);
image_2=imread('potsdetail_03_our_result.jpg');
image_original=im2double(image_2);

W=20;
Lambda=0.9;
[Per1,Per2]=Permibility (image_flash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out1=edge_aware_filter(image_noflash,W,Lambda,h_horizon,h_vertical,iteration);

figure,imshow(out1);
title("Filtered No-Flashed Image By Filter From Flashed Image")
[Per1,Per2]=Permibility (image_noflash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out2=edge_aware_filter(image_flash,W,Lambda,h_horizon,h_vertical,5);

figure,imshow(out2);
title("Filtered Flashed image By Filter From No-Flashed Image")

figure,imshow(image_original)
title("Their Result")
%% 5
iteration = 5;
image=imread('puppets_01_noflash.jpg');
image_noflash=im2double(image);
image_1=imread('puppets_00_flash.jpg');
image_flash=im2double(image_1);
image_2=imread('puppets_03_our_result.jpg');
image_original=im2double(image_2);

W=10;
Lambda=1;

[Per1,Per2]=Permibility (image_flash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out1=edge_aware_filter(image_noflash,W,Lambda,h_horizon,h_vertical,iteration);

figure,imshow(out1);
title("Filtered No-Flashed Image By Filter From Flashed Image")
[Per1,Per2]=Permibility (image_noflash);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out2=edge_aware_filter(image_flash,W,Lambda,h_horizon,h_vertical,5);

figure,imshow(out2);
title("Filtered Flashed image By Filter From No-Flashed Image")

figure,imshow(image_original)
title("Their Result")
%%
iteration = 5;



lowfimg = im2double(imread('skin-original.jpg'));
highfimg = im2double(imread('high_frequency_2.jpg'));
%Make_size_equal
highf_1=highfimg(1:size(lowfimg,1),1:size(lowfimg,2),:);
W=5;
Lambda=1;

[Per1,Per2]=Permibility (highf_1);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out1=edge_aware_filter(lowfimg,W,Lambda,h_horizon,h_vertical,iteration);

%subplot(1,2,1)
figure,imshow(out1);
title("lowfrequency image filtered by highfrequency image")

[Per1,Per2]=Permibility (lowfimg);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
out2=edge_aware_filter(highf_1,W,Lambda,h_horizon,h_vertical,5);
%subplot(1,2,2)
figure,imshow(out2);
title("highfrequency image filtered by lowfrequency image")