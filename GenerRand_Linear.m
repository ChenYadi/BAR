
% function  GenerRand_Linear( a,b,num )  
p=6;
beta= [1;2;3;4;5;6];

sigma1=3;eps=normrnd(0,1);

mu = [1 2 3 4 5 6];
sigma = [1 0.3 0.3 0.3 0.3 0.3 ; 
         0.3 1 0.3 0.3 0.3 0.3 ;
         0.3 0.3 1 0.3 0.3 0.3 ;
         0.3 0.3 0.3 1 0.3 0.3 ;
         0.3 0.3 0.3 0.3 1 0.3 ;
         0.3 0.3 0.3 0.3 0.3 1];
R = chol(sigma);
X = repmat(mu,100,1) + randn(100,6)*R;
y=X*beta+sigma1*eps;

plot(X,y,'.b');
A=corrcoef(X);





%y=ax+σε,生成num个随机数Xbuf=zeros(num,1);

% end
%X=[];Y=[];
% X=Xbuf;Y=Ybuf;
% % disp(X);disp(Y);
% end


% beta = [1 2]';
% 
% x = [0.7; 0.9];
% 
% 
% 
% X1 = [ones(length(x), 1), x];
% 
% % y = X1*beta + 0.01*randn(length(x), 1);
% 
% y = X1*beta;
% 
% 
% 
% X2 = [ones(length(x), 1), x, x.^2];
% 
% % y2 = X2*[beta; 0] + 0.01*randn(length(x), 1);
% 
% 
% 
% cond(X1'*X1)
% 
% cond(X2'*X2)
% 
% cond(X2'*X2 + 1e-8*eye(3))
% 
%  
% 
% bh1 = (X1'*X1) \ (X1' * y)
% 
% yh1 = X1 * bh1
% 
%  
% 
% bh2 = (X2'*X2) \ (X2'* y)
% 
% yh2 = X2 * bh2  % yh2 很接近y，但是bh2与beta差异很大
% 
%  
% 
% bh3 = regress(y, X2)
% 
% yh3 = X2 * bh3
% 
%  
% 
% % 岭回归，正则化
% 
% lambda = 1e-8;  % lambda 要比较小
% 
% bh4 = (X2'*X2 + lambda*eye(3)) \ (X2'* y)
% 
% yh4 = X2 * bh4
% 
%  
% 
%  
% 
% lambda = 0.1;
% 
% bh5 = (X2'*X2 + lambda*eye(3)) \ (X2'* y)
% 
% yh5 = X2 * bh5
% 
%  
% 
% % lasso, 结果都不太好，只有第二项不为0
% 
% bh6 = lasso(X2, y);
% 
% yh6 = X2 * bh6;
% 
%  
% 
% %%
% 
% xx = linspace(0.5, 1, 101)';
% 
% XX = [ones(length(xx), 1), xx, xx.^2];
% 
% 
% 
% plot(xx, XX*[bh1; 0]); hold on
% 
% plot(xx, XX*bh2);
% 
% plot(xx, XX*bh3); % 都过那两个点，但是差异很大
% 
% plot(xx, XX*bh4);
% 
% plot(xx, XX*bh5);
% 
% % plot(xx, XX*bh6);  % 多条线
% 
% hold off
% 
% legend('linear', 'quadratic', 'regression', 'lambda=1e-6', 'lambda=0.1')
% 
%  
