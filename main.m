file_path='C:\Users\m1380\Desktop\challenge\Columbia Glacier\';%file location,patste the location+\

pics=openpics(file_path);%open file

%pics=Luminormalization(pics,130,80);%lumination normalization

pics=logoremove(pics);%use gaussian blur to blur the 'google map'logo

corr_points=featurescomparison(pics);%extract corresponding points
num=[];
in={};

for i=2:length(corr_points)
[in{i},H]=Ransac(corr_points{i}',4000,40);%Ransac to find the best H
im1=pics{i-1};
im2=pics{i};
tform = maketform( 'projective', double(H')); 
result =imtransform(im2,tform);
figure;subplot(1,2,1);imshow(pics{i-1});
subplot(1,2,2);imshow(result);
end
for i=1:length(in)
    num(i)=length(find(in{i}==1));
end