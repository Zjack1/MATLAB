clc;
clear;
close all;
I3=imread('D:\桌面\00.jpg');
B=rgb2gray(I3);           %转化为灰度图像
figure, imshow(B);
[m,n]=size(B);            %求出图像的列行数目
if m>=n
    L=imcrop(B,[0,0,n,n]);%裁剪为正方形图像
else
    L=imcrop(B,[0,0,m,m]);%裁剪为正方形图像
end
C0=fftshift(fft2(L));     %fftshift(平移到中心点）
D0=mat2gray(log(1+abs(C0)));%频谱图像
figure,imshow(D0);

C1=(fft2(L));     %不平移到中心点）
D1=mat2gray(log(1+abs(C1)));%频谱图像
figure,imshow(D1);

D2=mat2gray(log(1+abs(fft2(L))));%没有平移到中心点
C3=fftshift(fft2(D1));
D3=mat2gray(log(1+abs(C3)));%频谱图像
figure,imshow(D3);

G1=edge(D1, 'canny',0.59);
figure,imshow(G1);              %canny算子
G2=edge(D3, 'canny',0.449);
figure,imshow(G2);              %canny算子

[k,k]=size(G1);            %求出图像的列行数目
E1=imcrop(G1,[30,30,k-40,k-40]);%裁剪为正方形图像，减少干扰条纹
figure,imshow(E1);%第一次傅里叶变换图谱的canny算子边缘检测，减少中心低频信息的干扰裁剪图

[l,l]=size(G2);            %求出图像的列行数目
E2=imcrop(G2,[l*10/21,l*10/21,l/18,l/18]);%裁剪为正方形图像，减少干扰条纹
figure,imshow(E2);

theta=0:1:180;
[R0,xp]=radon(D0,theta);  %做Radon变换 提取角度
figure,surf(theta,xp,R0);
figure,plot(theta,R0);
imagesc(theta,xp,R0);     %画三维图
title('R_theta X'); 
xlabel('theta(degree)'); 
ylabel('X\prime');
colormap(hot); 
colorbar;
 a0=max(max(R0));
%  X=plot(theta,R2);
%  figure,imshow(X)
 [x0,y0]=find(R0==max(max(R0)));%找出最大值点，求出角度

 if y0>=180
     y0=y0-180
 else
     y0
 end
 
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
%  X=plot(theta,R2);
%  figure,imshow(X)
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
 y2=y2-90;
 if y2>=180
     y2=y2-180
 else
     y2
 end

