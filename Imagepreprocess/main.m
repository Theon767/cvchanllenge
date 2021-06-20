file_path='C:\Users\m1380\Desktop\challenge\Dubai\';%file location,patste the location+\

pics=openpics(file_path);%open file

%pics=Luminormalization(pics,130,80);%lumination normalization

pics=logoremove(pics);%use gaussian blur to blur the 'google map'logo

corr_points=featurescomparison(pics);%extract corresponding points
num=[];
in={};
result={};
for i=2:length(corr_points)
[in{i},H]=Ransac(corr_points{i}',3000,40);%Ransac to find the best H
im1=pics{i-1};
im2=pics{i};
temp=warpH(im2, H,size(im1),0);
[result{1,i},result{2,i}]=imageFusion(im1,im2,H);
figure;subplot(1,2,1);imshow(result{1,i});
subplot(1,2,2);imshow(result{2,i});
end