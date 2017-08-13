trainnum=200;
pi=3.1415926;
xs=0;
xe=2*pi;
noise_m=0;
noise_d=0.2;
mx=xs:0.1:xe;
sinx=sin(mx);

x = xs + (xe-xs).*rand(trainnum,1);
y=sin(x)+ noise_m + noise_d.*randn(trainnum,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
 p1=polyfit(x,y,1);
 f1 = polyval(p1,mx);
 p3=polyfit(x,y,3);
 f3 = polyval(p3,mx);
 p9=polyfit(x,y,9);
 f9 = polyval(p9,mx);
 
 plot(x,y,'bo',mx,sinx,'g-',mx,f1,'c-',mx,f3,'r-',mx,f9,'k-','LineWidth',3, 'MarkerSize',10);
 legend('train','sin(x)','poly1','poly3','poly9');
 axis([xs,xe,-2,2]);

figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 p1=polyfit(x(1:trainnum/2),y(1:trainnum/2),1);
 f1 = polyval(p1,mx);
 fval1 = polyval(p1,x);
 p3=polyfit(x(1:trainnum/2),y(1:trainnum/2),3);
  f3 = polyval(p3,mx);
 fval3 = polyval(p3,x);
 p9=polyfit(x(1:trainnum/2),y(1:trainnum/2),9);
  f9 = polyval(p9,mx);
 fval9 = polyval(p9,x);
 
 plot(x(1:trainnum/2),y(1:trainnum/2),'bo',x(trainnum/2+1:trainnum),y(trainnum/2+1:trainnum),'yo',mx,sinx,'g-',mx,f1,'c-',mx,f3,'r-',mx,f9,'k-','LineWidth',3, 'MarkerSize',10);
 legend('train','validation','sin(x)','poly1','poly3','poly9');
 axis([xs,xe,-2,2]);
 
 c1=(fval1-y).* (fval1-y);
 c3=(fval3-y).* (fval3-y);
 c9=(fval9-y).* (fval9-y);
 
 sumtrain1=mean(c1(1:trainnum/2))
 sumval1=mean(c1(trainnum/2+1:trainnum))
  
 sumtrain3=mean(c3(1:trainnum/2))
 sumval3=mean(c3(trainnum/2+1:trainnum))
 
 sumtrain9=mean(c9(1:trainnum/2))
 sumval9=meanc9(trainnum/2+1:trainnum))
 