function y = filter_H(I,J,w,Lambda,H_horizon)


J_1=I;
[r,c,s1]=size(I);

for i=1:r
    for j=1:c
        temp=[0,0,0];
        for k=0:2*w
            if(j<=c-k+w && j>w-k)
                for s=1:3
                    temp(s)=temp(s)+J(i,j+k-w,s)*H_horizon(i,j,k+1);
                end
            end
        end
        for s=1:3
            J_1(i,j,s)=temp(s) + Lambda*H_horizon(i,j,w)*(I(i,j,s)-J(i,j,s));
        end

    end
end

y=J_1;
end