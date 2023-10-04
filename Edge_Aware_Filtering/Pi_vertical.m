function H_vertical = Pi_vertical (I,w)


[r,c,s1]=size(I);
H_vertical=zeros(r,c,2*w+1);

for j=1:c
    for i=1:r
        lim1=max(1,i-2*w-1);
        lim2=min(r,i+2*w+1);
        for k=lim1:lim2
            if i==k
                H_vertical(i,j,w+1)=1;      
            elseif(  abs(i-k) <= w ) 
                temp=1;
                for l=i:k
                    temp=temp*I(l,j);
                end                    
                H_vertical(i,j, w + (k-i) + 1 )=temp;
            end
        end
    end
end

H_vertical = H_vertical./sum(H_vertical,3);

end