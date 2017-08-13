


trainnum1=10;
trainnum2=10;
m1=0;
d1=1;
m2=5;
d2=1;
xs=m1-4*d1;
xe=m2+4*d2;
% 
x1=m1 +d1.*randn(trainnum1,2);
x2=m2 +d2.*randn(trainnum2,2);

%different distribution
%  x1=m1 +d1.*randn(trainnum1,2);
%  x2=m2-3*d2 +9*d2.*rand(trainnum2,2);


y=[zeros(trainnum1,1);ones(trainnum2,1)];
x=[x1;x2];


% y2=[ones(trainnum1,1);zeros(trainnum2,1)];
% Factor = mnrfit(x, [y y2]);
% Scores = mnrval(Factor, x);

b=glmfit(x,y,'binomial','link','logit');
bl=glmfit(x,y);
figure;

[ax1,ax2]=meshgrid(xs:0.1:xe);
ax1=reshape(ax1,size(ax1,1)*size(ax1,2),1);
ax2=reshape(ax2,size(ax2,1)*size(ax2,2),1);

yfit = glmval(b, [ax1 ax2],'logit');
yfit=yfit>0.5;
scatter(ax1,ax2,[],yfit,'filled');
hold on
plot(x1(:,1),x1(:,2),'b+',x2(:,1),x2(:,2),'ro');


figure
net = newp(x',y');
net.trainParam.epochs = 10;
net = train(net,x',y');

a = sim(net,[ax1 ax2]');

scatter(ax1,ax2,[],a,'filled');
hold on
plot(x1(:,1),x1(:,2),'b+',x2(:,1),x2(:,2),'ro');






figure
net = newp(x',y');
net.trainParam.epochs = 100;
net = train(net,x',y');

a = sim(net,[ax1 ax2]');

scatter(ax1,ax2,[],a,'filled');
hold on
plot(x1(:,1),x1(:,2),'b+',x2(:,1),x2(:,2),'ro');



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



%plot(x, y,'o',x,yfit./n,'-','LineWidth',2)
