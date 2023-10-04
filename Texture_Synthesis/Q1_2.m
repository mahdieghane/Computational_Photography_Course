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


p=80;    
ovlpsize=16;
tol=0.3;

R=Method2(I,p,ovlpsize,tol);


% figure();imshow(Image);title("Original_Image");
 figure();imshow(R);title("Method 2, patch size="+p);
            
        