
clc
clear

lowfimg = im2double(imread('skin-original.jpg'));
highfimg = im2double(imread('high_frequency_2.jpg'));

image_filter=highfimg;
I=highfimg;

W=10;
Lambda=1;


%% i
[Per1,Per2]=Permibility (I);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
I_H=filter_H(I,I,W,Lambda,h_horizon);
figure();imshow(I_H);
title("First Iteration (Horizontal)")
I_V=filter_V(I,I,W,Lambda,h_vertical);
figure();imshow(I_V);
title("First Iteration (Vertical)")
I_second=edge_aware_filter(I,W,Lambda,h_horizon,h_vertical,2);
figure();imshow(I_second);
title("second Iterations")
figure();imshow(I);
title("Original Image")
   
%% ii

Lambda1=0.1;
Lambda2=1;
Lambda3=10;

[Per1,Per2]=Permibility (I);
h_horizon=Pi_horizental(Per1,W);
h_vertical=Pi_vertical(Per2,W);
I_lambda1=edge_aware_filter(I,W,Lambda1,h_horizon,h_vertical,5);
figure();imshow(I_lambda1); title("Lambda=0.1");
I_lambda2=edge_aware_filter(I,W,Lambda2,h_horizon,h_vertical,5);
figure();imshow(I_lambda2); title("Lambda=1");
I_lambda3=edge_aware_filter(I,W,Lambda3,h_horizon,h_vertical,5);
figure();imshow(I_lambda3); title("Lambda=10");

%% iii
W1=5;
W2=10;
W3=20;

[Per1,Per2]=Permibility (I);
h_horizon=Pi_horizental(Per1,W1);
h_vertical=Pi_vertical(Per2,W1);
I_lambda1=edge_aware_filter(I,W1,Lambda,h_horizon,h_vertical,5);
figure();imshow(I_lambda1); title("W=5");
h_horizon=Pi_horizental(Per1,W2);
h_vertical=Pi_vertical(Per2,W2);
I_lambda2=edge_aware_filter(I,W2,Lambda,h_horizon,h_vertical,5);
figure();imshow(I_lambda2); title("W=10");
h_horizon=Pi_horizental(Per1,W3);
h_vertical=Pi_vertical(Per2,W3);
I_lambda3=edge_aware_filter(I,W3,Lambda,h_horizon,h_vertical,5);
figure();imshow(I_lambda3); title("W=20");
    
  


