function result = Method3 (Image,Patchsize,ovlpsize,tol)



Size=size(Image);
in_height=Size(1);
in_width=Size(2);
out_height=5*Size(1);
out_width=5*Size(2);
t_size=size(Size);
if(t_size(2)==2)
    Result=ones(out_height,out_width,1);
else
    Result=ones(out_height,out_width,3);
end




for orow=1:Patchsize-ovlpsize:out_height-(Patchsize-1)
    for ocol=1:Patchsize-ovlpsize:out_width-(Patchsize-1)
        %patchfinder, store error, i,j top left of patch
        if ( orow==1 && ocol==1)%select an initial random batch
            i=randi(in_height - Patchsize);
            j=randi(in_width - Patchsize);
            patch=Image(i:i+Patchsize-1,j:j+Patchsize-1,:); 
            Result(orow:orow+Patchsize-1,ocol:ocol+Patchsize-1,:)=patch;
        else
            [patch_x, patch_y] = Osampler(in_height,in_width,Patchsize,ovlpsize,Image,orow,ocol,Result,tol); % we got a suitable patch
            
            patch=Image(patch_x:patch_x+Patchsize-1,patch_y:patch_y+Patchsize-1,:);
            Result=pfinder(Patchsize,ovlpsize,orow,ocol,Result,patch); 
        end
    end
end

end