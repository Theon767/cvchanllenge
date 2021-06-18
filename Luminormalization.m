function [co,normalized]=Luminormalization(pics)
normalized={};
normalized{1}=pics{1};
for i=2:length(pics)
k=sum(sum(double(pics{i})))/sum(sum(double(pics{1})));
normalized{i}=uint8(round(k.*double(pics{i})));
co(i)=k;
end