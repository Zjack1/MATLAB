clc;
clear;
close all;
I3=imread('D:\桌面\11.jpg');
I4=rgb2gray(I3);%转化为灰度图像
figure, imshow(I4);
% L=imcrop(I4,[0,0,size(I4,2),size(I4,2)]);%裁剪为正方形图像
% figure,imshow(L);

I5=imrotate(I4,6,'bilinear','crop');
figure,imshow(I5);
A = conv2(I5,[-0.5 0.5]);       %//求水平轴方向上的一阶微分图像
figure, imshow(A);
F=1-A;    %转化为二值图像
figure,imshow(F);
% 
% L=imcrop(I5,[150,350,250,270]);%裁剪为正方形图像
% 
% A = conv2(L,[-0.5 0.5]);       %//求水平轴方向上的一阶微分图像
% figure, imshow(A);


    
A(:,1) = 0;                      %将第一列置0，防止边界影响
A(:,size(A,2)) = 0;            %最后一列置0，防止边界影响
% figure, imshow(dif);

for j = 1:size(A,1)          %循环行数
    s(j,:) = xcorr(A(j,:));  %//对dif每行进行自相关运算
end

% figure, imshow(s);
b=sum(s,1);                   %每一列求和
figure,plot(b);               %画图
[c,i]=min(b);

[m,n]=find(b==c);
% m
% n
l=(n(1,2)-n(1,1))/2             %求出模糊尺度
