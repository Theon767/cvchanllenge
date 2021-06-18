file_path='C:\Users\m1380\Desktop\challenge\Dubai\';%file location

pics=openpics(file_path);%open file

[k,pics]=Luminormalization(pics);%lumination normalization

corr_points=featurescomparison(pics);%extract corresponding points

rndpairs=randperm(100,4);

H=epa(corr_points{2}(rndpairs,:)');

[U,V]=eig(H'*H);