file_path='C:\Users\m1380\Desktop\challenge\Kuwait\';%file location,patste the location+\

pics=openpics(file_path);%open file

[k,pics]=Luminormalization(pics);%lumination normalization

pics=logoremove(pics);%use gaussian blur to blur the 'google map'logo

corr_points=featurescomparison(pics);%extract corresponding points

for i=2:length(corr_points)
H=Ransac(corr_points{i}',2000,50);%Ransac to find the best H
im1=pics{1};
im2=pics{i};
tform = maketform( 'projective', double(H')); 
result =imtransform(im2,tform);
figure;subplot(1,2,1);imshow(pics{1});
subplot(1,2,2);imshow(result);
end