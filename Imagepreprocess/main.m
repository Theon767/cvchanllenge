file_path='C:\Users\m1380\Desktop\challenge\Dubai\';

result=imagepreprocess(file_path);

for i=1:length(result)
    figure;subplot(1,2,1);imshow(result{1,i});
    subplot(1,2,2);imshow(result{2,i});
end