function result = Method1(Image,patchsize)

oheight=5*size(Image,1);
owidth=5*size(Image,2);

if(size(size(Image))==2)
    result=zeros(oheight,owidth,1);
else
    result=zeros(oheight,owidth,3);
end


for row=1:patchsize:oheight-(-1)
    for col=1:patchsize:owidth-(-1)
        
            i=randi(floor(oheight/5) -patchsize);
            j=randi(floor(owidth/5) - patchsize);
            patch=Image(i:i+patchsize-1,j:j+patchsize-1,:);
            result(row:row+patchsize-1,col:col+patchsize-1,:)=patch;
    end
end
    
end