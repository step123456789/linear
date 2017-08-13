trainnum=10000;
pi=3.1415926;
xs=0;
xe=20*pi;
noise_m=0;
noise_d=0.1;
mx=xs:0.1:xe;
sinx=sin(mx);
x = [xs + (xe-xs)/2.*rand(trainnum/2,1) ; xs+(xe-xs)/2 + (xe-xs)/2.*rand(trainnum/2,1) ]
y= [sin(x(1:trainnum/2))+ noise_m + noise_d.*randn(trainnum/2,1);   2* sin(x(trainnum/2+1:trainnum))+ noise_m + noise_d.*randn(trainnum/2,1) ];

figure;
 p1=polyfit(x,y,9);
 f1 = polyval(p1,mx);
 p3=polyfit(x,y,50);
 f3 = polyval(p3,mx);
 p9=polyfit(x,y,150);
 f9 = polyval(p9,mx);
 
 plot(x,y,'bo',mx,f1,'c-',mx,f3,'r-',mx,f9,'k-','LineWidth',3, 'MarkerSize',1);
 legend('train','poly9','poly50','poly150');
 axis([xs-10,xe+10,-3,3]);


