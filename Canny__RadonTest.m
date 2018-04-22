clc;
clear;
close all;
I3=imread('D:\桌面\lena.jpg');
I4=rgb2gray(I3);%转化为灰度图像
% figure, imshow(I4);
L=imcrop(I4,[0,0,733,733]);%裁剪为正方形图像
% figure,imshow(L);
THETA=160;
LEN=50;
PSF=fspecial('motion',LEN,THETA);%设置点扩散函数
B=imfilter(L,PSF,'circular','conv'); %模糊图像
figure,imshow(B);

C1=fftshift(fft2(B));     %fftshift(平移到中心点）
D1=mat2gray(log(1+abs(C1)));%频谱图像
figure,imshow(D1);
D2=mat2gray(log(1+abs(fft2(B))));%没有平移到中心点
C3=fftshift(fft2(D1));

D3=mat2gray(log(1+abs(C3)));%频谱图像

figure,imshow(D3);
G1=edge(D2, 'canny',0.451);
figure,imshow(G1);              %canny算子
G2=edge(D3, 'canny',0.41);
figure,imshow(G2);              %canny算子
%
[k,k]=size(G1);            %求出图像的列行数目
E1=imcrop(G1,[30,30,k-40,k-40]);%裁剪为正方形图像，减少干扰条纹
figure,imshow(E1);%第一次傅里叶变换图谱的canny算子边缘检测，减少中心低频信息的干扰裁剪图
% 
[l,l]=size(G2);            %求出图像的列行数目
E2=imcrop(G2,[l*10/21,l*10/21,l/18,l/18]);%裁剪为正方形图像，减少干扰条纹
figure,imshow(E2);
% 

% 
% 
% % G1=edge(E, 'canny', 0.55);
% % figure,imshow(G1);              %canny算子


theta=0:1:180;
[R2,xp]=radon(D1,theta);  %做Radon变换 提取角度
figure,surf(theta,xp,R2);
figure,plot(theta,R2);
imagesc(theta,xp,R2);     %画三维图
title('R_theta X'); 
xlabel('theta(degree)'); 
ylabel('X\prime');
colormap(hot); 
colorbar;
 a=max(max(R2));
 [x1,y1]=find(R2==max(max(R2)));%找出最大值点，求出角度

 if y1>=180
     y1=y1-180
 else
     y1
 end

theta=0:1:180;
[R2,xp]=radon(G2,theta);  %做Radon变换 提取角度
figure,surf(theta,xp,R2);
figure,plot(theta,R2);
imagesc(theta,xp,R2);     %画三维图
title('R_theta X'); 
xlabel('theta(degree)'); 
ylabel('X\prime');
colormap(hot); 
colorbar;
 a=max(max(R2));
 [x2,y2]=find(R2==max(max(R2)));%找出最大值点，求出角度
 y2=y2+90;
 if y2>=180
     y2=y2-180
 else
     y2
 end




















% C=fftshift(fft2(B));
% D=mat2gray(log(abs(C)));%频谱图像
% figure,imshow(D);
% 
% %% 用canny算子将压缩居中后的频谱图进行边缘检测，二值化
% T = 0.55;
% bw=edge(D, 'canny', T);
% figure
% imshow(bw);
% 
% %% 对二值化后的频谱图进行radon变换
% theta=0:1:180;
% [R,xp]=radon(bw,theta);%做Radon变换
% figure,surf(theta,xp,R);
% figure,plot(theta,R);
% imagesc(theta,xp,R); %画三维图
% title('R_theta X'); 
% xlabel('theta(degree)'); 
% ylabel('X\prime');
% colormap(hot); 
% colorbar;
%  a=max(max(R));
% %  a
%  [x,y]=find(R==max(max(R)));%找出最大值点，求出角度
% %  x
%  y
