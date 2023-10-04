function result = Method2 (Image,Patchsize,ovlpsize,tol)


iheight=size(Image,1);
iwidth=size(Image,2);
oheight=5*iheight;
owidth=5*iwidth;

if(size(size(Image))==2)
    result=zeros(oheight,owidth,1);
else
    result=zeros(oheight,owidth,3);
end


for out_row=1:Patchsize-ovlpsize:oheight-(ovlpsize-1)
    for out_col=1:Patchsize-ovlpsize:owidth-(ovlpsize-1)
        if ( out_row==1 && out_col==1)
            ri=randi(iheight - Patchsize);
            rj=randi(iwidth - Patchsize);
            patch=Image(ri:ri+Patchsize-1,rj:rj+Patchsize-1,:);   
        else
            [patch_x, patch_y] = Osampler(iheight,iwidth,Patchsize,ovlpsize,Image,out_row,out_col,Result,tol);
            patch=Image(patch_x:patch_x+Patchsize-1,patch_y:patch_y+Patchsize-1,:); 
        end
        Result(out_row:out_row+Patchsize-1,out_col:out_col+Patchsize-1,:)=patch;  
    end
end
end