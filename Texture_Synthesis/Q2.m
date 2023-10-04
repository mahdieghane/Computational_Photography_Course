clc
clear


merl=im2double(imread('ml.jpg')); %
linc=im2double(imread('al.jpg')); %

source_image=toast;
target_image=merl;

Size=size(source_image);
in_height=Size(1);
in_width=Size(2);

Size=size(target_image);
out_height=Size(1);
out_width=Size(2);
t_size=size(Size);

if(t_size(2)==2)
    Result=ones(out_height,out_width,1);
else
    Result=ones(out_height,out_width,3);
end

psize=18;%patch size
ovlpsize=floor(psize/6);
tol=0.25;
alpha=0.18;


for orow=1:psize-ovlpsize:out_height-(psize-1)
    for ocol=1:psize-ovlpsize:out_width-(psize-1)
        
        if ( orow==1 && ocol==1)%select an initial random batch
            i=randi(in_height - psize);
            j=randi(in_width - psize);
            patch=source_image(i:i+psize-1,j:j+psize-1,:); 
            Result(orow:orow+psize-1,ocol:ocol+psize-1,:)=patch;

        else
            [patch_x, patch_y] = ptransfer(in_height,in_width,psize,ovlpsize,target_image,source_image,orow,ocol,Result,tol,alpha); % we got a suitable patch
            patch=source_image(patch_x:patch_x+psize-1,patch_y:patch_y+psize-1,:);
            Result=pfinder(psize,ovlpsize,orow,ocol,Result,patch); 
        end
    end
end
        
figure,imshow(Result),title(" alpha= " +alpha+"patch=20 overlap"+ovlpsize);        
            
        