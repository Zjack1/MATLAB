clc;
clear;
close all;
B=imread('D:\桌面\lena.jpg');
% B=rgb2gray(I3);%转化为灰度图像
[m,n]=size(B);            %求出图像的列行数目
if m>=n
    L=imcrop(B,[0,0,n,n]);%裁剪为正方形图像
else
    L=imcrop(B,[0,0,m,m]);%裁剪为正方形图像
end
THETA=66;
LEN=30;
PSF=fspecial('motion',LEN,THETA);%设置点扩散函数
A=imfilter(L,PSF,'circular','conv'); %模糊图像
figure,imshow(A);
% figure,imshow(PSF);
figure,imshow(A,'border','tight','initialmagnification','fit');%
% set (gcf,'Position',[0,0,n,n]);%设置为规定大小的图像
axis normal;

imwrite(A,'D:\桌面\00.jpg');%保存A为该路径下的jjj.jpg文件

% saveas(gcf,['C:\Users\dell\Desktop','yanbao',num2str(2),'.jpg']);


