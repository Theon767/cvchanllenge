function normalized=Luminormalization(pics,contrast,lumi)
normalized={};
[m,n]=size(pics{1});
for i=1:length(pics)
    A=double(pics{i});
    A=(A-(sum(sum(A))/m/n).*ones(m,n))./std2(A);
    normalized{i}=uint8(round(A*contrast+lumi));
end