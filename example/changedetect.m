function [ img_res,nChange] = changedetect( A,B,method,threshold)
% 变化检测函数
% 输入：变化前后图像A、B，以及检测方法名method,对应阈值threshold
% 输出：结果差异二值图像img_res，差异像素数nChange
img1=rgb2gray(A);
img2=rgb2gray(B);
[row,col] = size(img1);
img3=ones(row,col);
% 比值法
if strcmp(method,'ratio')
    nChange = 0;
    for i=1:row
        for j=1:col
           if(img1(i,j)==0&&img2(i,j)~=0)
               if(abs(img1(i,j)/img2(i,j)-1)>threshold)%阈值
                   img3(i,j)=0;
                   nChange = nChange+1;
               end
           elseif(img2(i,j)==0&&img1(i,j)~=0)
               if(abs(img2(i,j)/img1(i,j)-1)>threshold)%阈值
                   img3(i,j)=0;
                   nChange = nChange+1;
               end
           else
               if(abs(img1(i,j)/img2(i,j)-1)>threshold)%阈值
                   img3(i,j)=0;
                   nChange = nChange+1;
               end
           end  
        end
    end
end
% 归一化法
if strcmp(method,'norm')
    nChange = 0;
    img1=double(img1);
    img2=double(img2);
    img3=double(img3);
    max1=max(max(img1));
    max2=max(max(img2)); 
    min1=min(min(img1));
    min2=min(min(img2));
    for i=1:row
        for j=1:col
            img1(i,j)=(img1(i,j)-min1)/(max1-min1);
            img2(i,j)=(img2(i,j)-min2)/(max2-min2);
        end
    end 
    for i=1:row
        for j=1:col
            if(abs(img1(i,j)-img2(i,j))>threshold)
                img3(i,j)=0;
                nChange = nChange+1;
            end
        end
    end
end
% 相关系数法
if strcmp(method,'corrcoef')
    nChange = 0;
    temp1=zeros(3,3);
    temp2=zeros(3,3);
    img1=double(img1);
    img2=double(img2);
    img3=double(img3);
    % 计算5*5大小的窗口的相关系数
    for i=2:row-1
        for j=2:col-1
            temp1=[img1(i-1,j-1),img1(i-1,j),img1(i-1,j+1);img1(i,j-1),img1(i,j),img1(i,j+1);img1(i+1,j-1),img1(i+1,j),img1(i+1,j+1)];
            temp2=[img2(i-1,j-1),img2(i-1,j),img2(i-1,j+1);img2(i,j-1),img2(i,j),img2(i,j+1);img2(i+1,j-1),img2(i+1,j),img2(i+1,j+1)];
            corr=corrcoef(temp1,temp2);
           if(abs(corr(1,2))<threshold)
               img3(i,j)=0;
               nChange = nChange+1;
           end
        end
    end
end
img_res = img3;

