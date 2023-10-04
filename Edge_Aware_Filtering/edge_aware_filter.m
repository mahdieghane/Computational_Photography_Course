function y =edge_aware_filter (I,w_1,Lambda,h_horizon,h_vertical,iterations)

I_1=I;
for i=1:iterations+1
    I_1=filter_H(I,I_1,w_1,Lambda,h_horizon);
    I_1=filter_V(I,I_1,w_1,Lambda,h_vertical);
end
y=I_1;
end