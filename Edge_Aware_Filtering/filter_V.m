function y = filter_V(I,J,w,Lambda,H_vertical)

J_1=zeros(size(I));
[r,c,s1]=size(I);

for j=1:c
    for i=1:r
        temp=[0,0,0];
        for k=-w:w
            if(i<r-k+1 && i+k>=1)
                for s=1:3
                    temp(s)=temp(s)+J(i+k,j,s)*H_vertical(i,j,k+w+1);
                end
            end

        end
        for s=1:3
            J_1(i,j,s)=temp(s) + Lambda*H_vertical(i,j,w)*(I(i,j,s)-J(i,j,s));
        end
    end
end
y=J_1;

end