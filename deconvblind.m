clc;
clear;
close all;
THETA=25;
LEN=35;
PSF=fspecial('motion',LEN,THETA);%设置点扩散函数
figure,imshow(PSF,[],'InitialMagnification','fit'); 
% figure,imshow(PSF,[],'notruesize');
B=imread('D:\桌面\0.jpg');
figure,imshow(B);
% C=deconvwnr(B,PSF);
D=deconvlucy(B,PSF,70);
figure,imshow(D);
B=rgb2gray(D);   
figure,imshow(B);%灰度图像
figure,imshow(D,'border','tight','initialmagnification','fit');%
% set (gcf,'Position',[0,0,n,n]);%设置为规定大小的图像
axis normal;
imwrite(D,'D:\桌面\00.jpg');%保存A为该路径下的jjj.jpg文件
% J=histeq(B);
% figure,imshow(J);
% D1=im2bw(B,0.31275);
% figure,imshow(D1);%二值化图像
% F1=medfilt2(D1,[3,3]); %中值滤波
% figure,imshow(F1);
