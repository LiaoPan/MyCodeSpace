%产生2个二维正态数据
MU1    = [1 2];
SIGMA1 = [1 0; 0 0.5];
MU2    = [-1 -1];
SIGMA2 = [1 0; 0 1];
X      = [mvnrnd(MU1, SIGMA1, 1000);mvnrnd(MU2, SIGMA2, 1000)];

%显示
scatter(X(:,1),X(:,2),10,'.');

%GMMs 学习,请自己设计代码, 替代以下Matlab自带的学习函数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
options = statset('Display','final');
obj = gmdistribution.fit(X,2,'Options',options);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%显示学习到模型
figure,h = ezmesh(@(x,y)pdf(obj,[x,y]),[-8 6], [-8 6]);

%显示学习参数
mu = obj.mu
sigma = obj.Sigma

