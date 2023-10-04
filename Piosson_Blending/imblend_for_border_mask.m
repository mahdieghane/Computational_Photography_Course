function out= imblend_for_border_mask(source, mask, target, transparent)

%Padding mask_target_source
source_N = padarray(source,[1 1],0,'both');
source = source_N;
target_N = padarray(target,[1 1],0,'both');
target = target_N;
mask_N = padarray(mask,[1 1],0,'both');
mask = mask_N;

% finding pixels under the mask
Size = size(target);
[jmaskind,imaskind] = find(mask(:,:,1) == 1);

%Indexing
all_row = ones((Size(1)*Size(2)),1);
all_row(:,1) = 1:(Size(1)*Size(2));
indexeup = sub2ind(Size,jmaskind-1,imaskind);
indexed = sub2ind(Size,jmaskind+1,imaskind);
indexer = sub2ind(Size,jmaskind,imaskind+1);
indexel = sub2ind(Size,jmaskind,imaskind-1);
indexe = sub2ind(Size(1:2),jmaskind,imaskind);
tindrow = cat(1,all_row,indexe,indexe,indexe,indexe,indexe);
tindcol = cat(1,all_row,indexeup,indexed,indexer,indexel,indexe);

%Poisson equation for each channel
v = ones(length(indexe)*5 , 1)*-1;
v((length(indexe)*4+1):length(indexe)*5 , 1) = v((length(indexe)*4+1):length(indexe)*5 , 1)*-3;
all_row = ones((Size(1)*Size(2)),1);
v = cat(1,all_row,v);
A= sparse(tindrow,tindcol,v,Size(1)*Size(2),Size(1)*Size(2));
sourcer = source(:,:,1);
sourcer = sourcer(:);
sourceg = source(:,:,2);
sourceg = sourceg(:);
sourceb = source(:,:,3);
sourceb = sourceb(:);
bred = target(:,:,1);
bred = resize(bred,[size(bred,1)*size(bred,2),1]);
bred(indexe) = 4*sourcer(indexe)-sourcer(indexeup)-sourcer(indexed)-sourcer(indexel)-sourcer(indexer);
bgreen = target(:,:,2);
bgreen = resize(bgreen,[size(bred,1)*size(bred,2),1]);
bgreen(indexe) = 4*sourceg(indexe)-sourceg(indexeup)-sourceg(indexed)-sourceg(indexel)-sourceg(indexer);
bblue = target(:,:,3);
bblue = resize(bblue,[size(bred,1)*size(bred,2),1]);
bblue(indexe) = 4*sourceb(indexe)-sourceb(indexeup)-sourceb(indexed)-sourceb(indexel)-sourceb(indexer);

%final step
outred = A\bred;
outgreen = A\bgreen;
outblue = A\bblue;
out1= reshape(outred,Size(1),Size(2));
out2= reshape(outgreen,Size(1),Size(2));
out3= reshape(outblue,Size(1),Size(2));

out = ones(Size(1)-2,Size(2)-2,3);
out(:,:,1)=out1(2:Size(1)-1,2:Size(2)-1,1);
out(:,:,2)=out2(2:Size(1)-1,2:Size(2)-1,1);
out(:,:,3)=out3(2:Size(1)-1,2:Size(2)-1,1);

out = (out * transparent + target*(1 - transparent));
end