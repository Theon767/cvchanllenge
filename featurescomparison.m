function matched_points=featurescomparison(pics)
features={};
matched_points={};
temp={};
for i=1:length(pics)
    features{i}=detectSURFFeatures(pics{1});
end
A=detectSURFFeatures(pics{1});
[f1,vpts1]=extractFeatures(pics{1},A);

for i=2:length(pics)
B=detectSURFFeatures(pics{i});
[f2,vpts2]=extractFeatures(pics{i},B);
indexPairs = matchFeatures(f1,f2);
temp{1,i}=round(vpts1(indexPairs(:,1)).Location);
temp{2,i}=round(vpts2(indexPairs(:,2)).Location);
end
for i=1:length(temp)
    matched_points{i}=[temp{1,i} temp{2,i}];
end
end