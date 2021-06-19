function nlogo=logoremove(pics)
nlogo=cell(size(pics));
for i=1:length(pics)
A=double(pics{i});
w=fspecial('gaussian',[9 9],5);
A(1000:1030,1:180)=imfilter(A(1000:1030,1:180),w);
A(1050:end,1:180)=imfilter(A(1050:end,1:180),w);
A=uint8(round(A));
nlogo{i}=A;
end
end