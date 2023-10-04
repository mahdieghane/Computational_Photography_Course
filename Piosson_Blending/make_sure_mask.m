function m=make_sure_mask(Mask)
m=zeros(size(Mask,1),size(Mask,2),3);
for i=1:size(Mask,1)
    for j=1:size(Mask,2)
        if Mask(i,j,1)>125
            m(i,j,:)=1;

        end
    end
end

end