


trainnum1=100;
trainnum2=100;
trainnum3=100;
m1=1;
d1=1;
m2=5;
d2=1;

m3=[0,3];
d3=[1,1];
xs=m1-4*d1;
xe=m2+4*d2;
% 
x1=m1 +d1.*randn(trainnum1,2);
x2=m2 +d2.*randn(trainnum2,2);
x3=m3(1)+d3(1).*randn(trainnum3,1);
x4=m3(2)+d3(2).*randn(trainnum3,1);
x3=[x3  x4];


y1=[ones(trainnum1,1);zeros(trainnum2+trainnum3,1)];
y2=[zeros(trainnum1,1);ones(trainnum2,1);zeros(trainnum3,1)];
y3=[zeros(trainnum1+trainnum2,1);ones(trainnum3,1)];
x=[x1;x2;x3];
y=[y1 y2 y3];


 Factor = mnrfit(x, y);
% Scores = mnrval(Factor, x);
figure;
[ax1,ax2]=meshgrid(xs:0.1:xe);
ax1=reshape(ax1,size(ax1,1)*size(ax1,2),1);
ax2=reshape(ax2,size(ax2,1)*size(ax2,2),1);

yfit = mnrval(Factor, [ax1 ax2]);
[cv,ci]=max(yfit,[],2);
%yfit=yfit>0.5;
scatter(ax1,ax2,[],ci,'filled');
hold on
plot(x1(:,1),x1(:,2),'b+',x2(:,1),x2(:,2),'ro',x3(:,1),x3(:,2),'g*');


figure
net = newp(x',y');
net.trainParam.epochs = 1000;
net = train(net,x',y');

a = sim(net,[ax1 ax2]');
scatter(ax1,ax2,[],a','filled');
hold on
plot(x1(:,1),x1(:,2),'b+',x2(:,1),x2(:,2),'ro',x3(:,1),x3(:,2),'g*');



