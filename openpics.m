function pics=openpics(file_path)
jpgs = dir(strcat(file_path,'*.jpg'));
pics={};   %%refer to all the pictures
for i=1:length(jpgs)
pics{i}=imread(strcat(file_path,jpgs(i).name));
pics{i}=rgb2gray(pics{i});
end
end