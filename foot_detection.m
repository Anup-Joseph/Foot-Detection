clear all;
close all;
clc;
a=input('Enter the location of your image :');
i=imread(a);
gray_im=rgb2gray(i);
edge_im=edge(gray_im,'canny');
filter_im=wiener2(edge_im,[5 5]);
p_im=fliplr(filter_im);
process_im = imrotate(p_im,-270);
left_im=process_im(:,1:1170);
right_im=process_im(:,1171:2340);
l_sum=sum(sum(left_im));
r_sum=sum(sum(right_im));
t_sum=l_sum+r_sum;
imshow(process_im);
if l_sum>r_sum
    disp('This is your left foot');
else
    disp('This is your right foot');
end

