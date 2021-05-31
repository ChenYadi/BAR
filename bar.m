%% 岭回归(Ridge Regression)

%导入数据 
load X.mat;load y.mat;
%标准化
yMeans = mean(y);
for i = 1:m
    yMat(i,:) = Y(i,:)-yMeans;
end

xMeans = mean(X);
xVars = var(X);
for i = 1:m
    xMat(i,:) = (X(i,:) - xMeans)./xVars;
end

% 运算30次
testNum = 30;
weights = zeros(testNum, n-1);
for i = 1:testNum
    w = ridgeRegression(xMat, yMat, exp(i-10));
    weights(i,:) = w';
end

% 画出随着参数lam
hold on
axis([-9 20 -1.0 2.5]);
xlabel log(lam);
ylabel weights;
for i = 1:n-1
    x = -9:20;
    y(1,:) = weights(:,i)';
    plot(x,y);
end

    XTX = X'*X;
    [m,n] = size(XTX);
    lam=0.2;
    temp = XTX + eye(m,n)*lam;
    if det(temp) == 0
        disp('This matrix is singular, cannot do inverse');
    end
    betaridge= temp^(-1)*X'*y; 


 h=X'*y;
 g=X'*X;
betaols=g\h;% %OLS得到的系数

betaupdate = ((betaridge.^ 2) ./ ((betaridge .^2) + (0.0001 / 100).*ones(6,1))) .* betaols;
while (abs(betaupdate-betaridge)>=0.01 )
 betaupdate = ((betaupdate.^ 2) / ((betaupdate .^2) + (0.0001 / 100).*ones(6,1))) * betaols;
 end
 %%%%%%%calculate correlations
 r1=corr(X*betaols,y,'type','pearson');
 r2=corr(X*w,y,'type','pearson');
 r3=corr(X*betaupdate,y,'type','pearson'); 
