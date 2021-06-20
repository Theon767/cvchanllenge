function result=imagepreprocess(file_path)
%file location,patste the location+\

pics=openpics(file_path);%open file

%pics=Luminormalization(pics,100,80);%lumination normalization

pics=logoremove(pics);%use gaussian blur to blur the 'google map'logo

corr_points=featurescomparison(pics);%extract corresponding points

in={};

result={};

for i=2:length(corr_points)
[in{i},H]=Ransac(corr_points{i}',3000,40);%Ransac to find the best H
im1=pics{i-1};
im2=pics{i};
temp=warpH(im2, H,size(im1),0);
[result{1,i-1},result{2,i-1}]=imageFusion(im1,im2,H);
end

for i=1:length(result)
    [result{1,i},result{2,i}]=imagecut(result{1,i},result{2,i});%cut the pics
end

end