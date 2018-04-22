clc;
clear;
close all;
I3=imread('D:\桌面\8.jpg');
L=rgb2gray(I3);%转化为灰度图像
figure, imshow(L);
% L=imcrop(I4,[0,0,733,733]);%裁剪为正方形图像
% figure,imshow(L);
THETA=178;
LEN=29;
PSF=fspecial('motion',LEN,THETA);%设置点扩散函数
% figure,imshow(PSF,[],'notruesize');
% B=imfilter(L,PSF,'symmetric','conv'); %模糊图像
% figure,imshow(B);
% C=deconvwnr(B,PSF);
C=deconvlucy(L,PSF,60);

figure,imshow(C);
 D=im2bw(C,0.21275);
figure,imshow(D);
% F1=medfilt2(D,[7,7]);   %中值滤波
% figure,imshow(F1);
% 


















% figure, imshow(B);
% %     rgb = rgb(:,:,1);                       % //读取红色
% dif = conv2(B,[-0.5 0.5]);       %//求水平轴方向上的一阶微分图像
% figure, imshow(dif);
% 
%     
% dif(:,1) = 0;                      %将第一列置0，防止边界影响
% dif(:,size(dif,2)) = 0;            %最后一列置0，防止边界影响
% % figure, imshow(dif);
% 
% for j = 1:size(dif,1)          %循环行数
%     s(j,:) = xcorr(dif(j,:));  %//对dif每行进行自相关运算
% end
% % [n1,n2] = find2min(s(j,:));    %//找到最小两个值的下标
% % d(i) = abs((n2 - n1) / 2);       %//模糊尺度等于共轭相关峰距离除以2 
% % d
% 
% % figure, imshow(s);
% b=sum(s,1);                   %每一列求和
% figure,plot(b);               %画图
% [c,i]=min(b);
% 
% [m,n]=find(b==c);
% m
% n
% l=(n(1,2)-n(1,1))/2             %求出模糊尺度
% %     N = tabulate(d);
% %     [max_N,I] = max(N(:,2));
% %     d = N(I,1);                                % //对每一行我们都算出了一个d，出现最多的那个元素为模糊尺度
