


trainnum1=100;
trainnum2=100;
%different distribution
 x1=0 +1.*rand(trainnum1,1);
 x2=[-rand(trainnum2/2,1);1+rand(trainnum2/2,1)];


y=[zeros(trainnum1,1);ones(trainnum2,1)];
x=[x1;x2];

x2=[x x.*x];

b=glmfit(x,y,'binomial','link','logit');
figure;
ex=-1:0.01:2;
ex=ex';
yfit = glmval(b,ex,'logit');
yfit=yfit>0.5;
scatter( ex,0.1*ones(size(ex,1),1),[],yfit,'filled');
 hold on
 plot(x(1:trainnum1,1),0,'b+',x(trainnum1+1:trainnum1+trainnum2,1),0,'ro');
 
 
 
b=glmfit(x2,y,'binomial','link','logit');

ex=-1:0.01:2;
ex=ex';
ex2=[ex ex.*ex];
yfit = glmval(b,ex2,'logit');
yfit=yfit>0.5;
 hold on
scatter( ex,0.2*ones(size(ex,1),1),[],yfit,'filled');
 hold on
 plot(x(1:trainnum1,1),0,'b+',x(trainnum1+1:trainnum1+trainnum2,1),0,'ro');
 
 
 
% % 
% 
% figure
% 
% yfitl = glmval(bl, [ax1 ax2],'identity');
% yfitl=yfitl>0.5;
% scatter(ax1,ax2,[],yfitl,'filled');
% hold on
% plot(x1(:,1),x1(:,2),'b+',x2(:,1),x2(:,2),'ro');
% 
% yfit = glmval(b, x,'logit');
% yfitl = glmval(bl, x,'identity');
% s=mean((yfit-y).*(yfit-y))
% sl=mean((yfitl-y).*(yfitl-y))
% 


%plot(x, y,'o',x,yfit./n,'-','LineWidth',2)
