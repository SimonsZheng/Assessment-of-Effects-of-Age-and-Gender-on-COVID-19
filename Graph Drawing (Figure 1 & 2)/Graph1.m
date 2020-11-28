% This m file is used to generate the Figure 1 in the paper.
x = 0:0.1:13;
lambda = 0.2; alpha = 2;
[ y1 ] = Weibull_density( lambda,alpha, x);
[ y2 ] = Length_Biased_Weibull_density( lambda,alpha,x );
figure;
hold on;
y = y1;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=0;
plot(x,y,'-o','linewidth',1,'markersize',2)% The curve with p = 0;

y = 0.2*y1+0.8*y2;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=0.2;
plot(x,y,'-s','linewidth',1,'markersize',2)% The curve with p = 0.2;

y = 0.4*y1+0.6*y2;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=0.4;
plot(x,y,'-+','linewidth',1,'markersize',2)% The curve with p = 0.4;

y = 0.5*y1+0.5*y2;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=0.5;
plot(x,y,'-d','linewidth',1,'markersize',2)% The curve with p = 0.5;

y = 0.6*y1+0.4*y2;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=0.6;
plot(x,y,'-x','linewidth',1,'markersize',2)% The curve with p = 0.6;

y = 0.8*y1+0.2*y2;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=0.8;
plot(x,y,'-*','linewidth',1,'markersize',2)% The curve with p = 0.8;

y = y2;
%The mixture p*g_{lambda,alpha}(y)+(1-p)*g_{lambda,alpha}(y) with p=1.0;
plot(x,y,'-h','linewidth',1,'markersize',2)% The curve with p = 1.0;
legend({'p=0','p=0.2','p=0.4','p=0.5','p=0.6','p=0.8','p=1.0'})
xlabel('v');
ylabel('pf(v)+(1-p)g(v)');