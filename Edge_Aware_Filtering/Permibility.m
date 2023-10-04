function [permibility_h, permibility_v] = Permibility (I)

% I_1=I(:,:,1);
% I_2=I(:,:,2);
% I_3=I(:,:,3);

[r,c,s1]=size(I);
sigma= 0.5;
alpha=2;
permibility_h=ones(r,c).*0.001;
permibility_v=ones(r,c).*0.001;


for i=1:r
    for j=1:c
       
        if (j~=c)
        permibility_h(i,j)= (1+(norm(reshape((I(i,j,:)-I(i,j+1,:)),[1,3])./sigma,2).^alpha)).^(-1);
        end
        if (i~=r)
        permibility_v(i,j)= (1+(norm(reshape((I(i,j,:)-I(i+1,j,:)),[1,3])./sigma,2).^alpha)).^(-1);
        end
        
    end
end




end

