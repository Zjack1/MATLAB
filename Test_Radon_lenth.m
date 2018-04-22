clc;
clear;
close all;
I3=imread('D:\桌面\0.jpg');
B=rgb2gray(I3);           %转化为灰度图像
figure, imshow(B);
[m,n]=size(B);            %求出图像的列行数目
if m>=n
    L=imcrop(B,[0,0,n,n]);%裁剪为正方形图像
else
    L=imcrop(B,[0,0,m,m]);%裁剪为正方形图像
end


C1=fftshift(fft2(L));     %fftshift(平移到中心点）
D1=mat2gray(log(1+abs(C1)));%频谱图像
figure,imshow(D1);

C3=fftshift(fft2(D1));

D3=mat2gray(log(1+abs(C3)));%频谱图像

figure,imshow(D3);
% G=edge(D2, 'canny', 0.31);
% figure,imshow(G);              %canny算子
G1=edge(D3, 'canny', 0.475);
figure,imshow(G1);              %canny算子

% 
[l,l]=size(G1);            %求出图像的列行数目
E=imcrop(G1,[l*10/21,l*10/21,l/18,l/18]);%裁剪为正方形图像，减少干扰条纹
figure,imshow(E);
% 

% 
% 
% % G1=edge(E, 'canny', 0.55);
% % figure,imshow(G1);              %canny算子


theta=0:1:180;
[R,xp]=radon(E,theta);  %做Radon变换 提取角度
figure,surf(theta,xp,R);
figure,plot(theta,R);
imagesc(theta,xp,R);     %画三维图
title('R_theta X'); 
xlabel('theta(degree)'); 
ylabel('X\prime');
colormap(hot); 
colorbar;
 a=max(max(R));
 [x,y]=find(R==max(max(R)));%找出最大值点，求出角度
 y=y-90;
 if y>=180
     y=y-180
 else
     y
 end

% C1=(fft2(L));     %fftshift(平移到中心点）
% D1=mat2gray(log(1+abs(C1)));%频谱图像
% figure,imshow(D1);
% C2=fftshift(fft2(D1));
% D2=mat2gray(log(1+abs(C2)));%频谱图像
% figure,imshow(D2);
% %  F=im2bw(D1,0.3951275);      %转化为二值图像
% %  figure,imshow(F);
% % T = graythresh(D);
% F=edge(D1, 'canny', 0.55);
% figure,imshow(F);            %备用的另一种算法canny算子
% 
% [m,n]=size(F);            %求出图像的列行数目
% E=imcrop(F,[30,30,m-40,n-40]);%裁剪为正方形图像，减少干扰条纹
% figure,imshow(E);
% theta=0:1:180;
% [R,xp]=radon(E,theta);  %做Radon变换 提取角度
% figure,surf(theta,xp,R);
% figure,plot(theta,R);
% imagesc(theta,xp,R);     %画三维图
% title('R_theta X'); 
% xlabel('theta(degree)'); 
% ylabel('X\prime');
% colormap(hot); 
% colorbar;
%  a=max(max(R));
%  [x,y]=find(R==max(max(R)));%找出最大值点，求出角度
%  if y>=180
%      y=y-180
%  else
%      y
%  end
 
  if y>=90                                     %显示专用
      I6=imrotate(L,180-y,'bilinear','crop');
 else
      I6=imrotate(L,-y,'bilinear','crop');
 end
 
 if y>=90                                       %计算专用
      I5=imrotate(L,180-y,'bilinear','loose');
 else
      I5=imrotate(L,-y,'bilinear','loose');
 end
% figure,imshow(I5);
A = conv2(I6,[-0.5 0.5]);       %//求水平轴方向上的一阶微分图像
A1 = conv2(I5,[-0.5 0.5]);       %//求水平轴方向上的一阶微分图像
% figure, imshow(A);
F=im2bw(A1,0.9575);      %转化为二值图像
figure,imshow(F);

F1=medfilt2(F,[5,5]);   %中值滤波
% figure,imshow(F1);
 if y>=90
      K=imrotate(F1,y-180,'bilinear','crop');
 else
      K=imrotate(F1,y,'bilinear','crop');
 end

figure,imshow(K);
% G=edge(K, 'canny', 0.55);
% figure,imshow(G);              %canny算子
A(:,1) = 0;                    %将第一列置0，防止边界影响
A(:,size(A,2)) = 0;            %最后一列置0，防止边界影响
% figure, imshow(dif);
for j = 1:size(A,1)          %循环行数
    s(j,:) = xcorr(A(j,:));  %//对dif每行进行自相关运算
end
% figure, imshow(s);
b=sum(s,1);                   %每一列求和
figure,plot(b);               %画图
[c,i]=min(b);                 %寻找最小值，把它赋值给c
[m,n]=find(b==c);             %寻找最小值的横坐标n，m为最小值
% m
% n
l=(n(1,2)-n(1,1))/2             %求出模糊尺度


















% clc;
% clear;
% close all;
% I3=imread('D:\桌面\121.jpg');
% I4=rgb2gray(I3);
% % figure, imshow(I4);
% L=imcrop(I4,[0,0,733,733]);
% % figure,imshow(L);
% THETA=0;
% l=20;
% H=fspecial('motion',l,THETA);
% % dif = filter2(L,H);       %//求水平轴方向上的一阶微分图像
% % figure, imshow(dif);
% f=imfilter(L,H,'circular','conv'); 
% figure,imshow(f);
% % C=fftshift(fft2(B));
% % D=mat2gray(log(abs(C)));
% % figure,imshow(D);
% [m,n]=size(L);
% h=zeros(l,l);
% for i=1:l
%     h(1,i)=1/l;
% end
% g=conv2(L,h);
% figure,imshow(g);
% % H=fft2(h);
% % L1=fft(L);
% % C=fftshift(fft2(h));
% % D=mat2gray(log(abs(C)));%频谱图像
% % figure,imshow(D);
% % G=L1.*D;
% % figure,imshow(G);
%  
%  
%  
%  
%  
%  
%  
%  
%  
%  
%  
