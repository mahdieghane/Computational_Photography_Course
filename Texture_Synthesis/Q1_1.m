clc
clear

apple=im2double(imread('./p3data/textures/apples.png'));
brick=im2double(imread('./p3data/textures/brick.jpg'));
grass=im2double(imread('./p3data/textures/grass.png'));
radish=im2double(imread('./p3data/textures/radishes.jpg'));
random=im2double(imread('./p3data/textures/random.png'));
random3=im2double(imread('./p3data/textures/random3.png'));
rice=im2double(imread('./p3data/textures/rice.bmp'));
text=im2double(imread('./p3data/textures/text.jpg')); 
toast=im2double(imread('./p3data/textures/toast.png')); 
weave=im2double(imread('./p3data/textures/weave.jpg')); 

I=apple;

% for i=1:200
%     p=i;

p=80;

R=Method1(I,p);

%end
% figure();imshow(Image);title("Original_Image");
figure,imshow(R),title("Method 1, Patch size="+psize);  