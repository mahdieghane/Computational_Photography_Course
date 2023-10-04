clc;
clear all;


Mask=imread("me_mask.png");
source_1=imread("me.png");
source_1=rgb2gray(source_1);
source=zeros(size(source_1,1),size(source_1,2),3);
source(:,:,1)=source_1;
source(:,:,2)=source_1;
source(:,:,3)=source_1;

target=imread("queenimage.jpg");

Mask=double(Mask);
S=double(source)./255;
T=double(target)./255;
m=ones(size(Mask,1),size(Mask,2),3);
for i=1:size(Mask,1)
    for j=1:size(Mask,2)
        if Mask(i,j,1)>125
            m(i,j,:)=0;

        end
    end
end
offset=[40 45];
 [source1, mask1, target1] = fiximages(S, m, T, offset);
    
  output = imblend(source1, mask1, target1,1);
    
  figure()
  imshow(output)
  imwrite(output,'me_in_qdress.jpg','jpg','Quality',100);
  %% Case2

 Mask=imread("mask-1-1.png");
source_1=imread("unicorn-1-1.jpg");
target=imread("nature.jpg");
S=double(source_1)./255;
Mask=double(Mask);
m=make_sure_mask(Mask);
T=double(target)./255;

offset=[600 600];
 [source1, mask1, target1] = fiximages(S, m, T, offset);
    
  output = imblend(source1, mask1, target1,1);
    
  figure()
  imshow(output)
   imwrite(output,'bring_unicorn_to_the_nature_HighQuality.jpg','jpg','Quality',100);
  %% case 3

 Mask=imread("moon_mask.png");
source_1=imread("moon.png");
target=imread("sky_night.jpg");
S=double(source_1)./255;
Mask=double(Mask);
m=make_sure_mask(Mask);
T=double(target)./255;

offset=[-300 450];
 [source1, mask1, target1] = fiximages(S, m, T, offset);
    
  output = imblend(source1, mask1, target1,1);
    
  figure()
  imshow(output)
   imwrite(output,'Add_Moon_to_night_sky.jpg','jpg','Quality',100);  