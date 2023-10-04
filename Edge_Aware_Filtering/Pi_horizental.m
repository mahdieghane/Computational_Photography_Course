function H_horizental = Pi_horizental (I,w)


[r,c,s1]=size(I);
H_horizental=zeros(r,c,2*w+1);

for i=1:r
    for j=1:c
        lim1=max(1,j-2*w-1);
        lim2=min(c,j+2*w+1);
        for k=lim1:lim2
            if j==k
                H_horizental(i,j,w+1)=1;      
            elseif(  abs(j-k) <= w ) 
                temp=1;
                for l=j:k
                    temp=temp*I(i,l);
                end                    
                H_horizental(i,j, w + (k-j) + 1 )=temp;
            end
        end
    end
end

H_horizental = H_horizental./sum(H_horizental,3);

end