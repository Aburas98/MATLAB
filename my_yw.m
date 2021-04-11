function [a, err] = my_yw(x, p)
Rxx = xcorr(x, 'biased');
Rxx = Rxx(length(x): end);

a = cell(p,1);
err = zeros(p, 1);

%when order is 1
a{1} = -Rxx(2) / Rxx(1);
err(1) = Rxx(1)*(1-a{1}^2);

%order from 2 to p
for i = 2:p
    f1 = zeros(1,i);
    f1(i) = - (Rxx(i+1)+ sum(a{i-1}.* Rxx(i:-1:2))) / err(i-1);
    f1(1:i-1) = a{i-1} + f1(i) * a{i-1}(i-1:-1:1);
    err(i) = (1- f1(i)^2)* err(i-1);
    a{i} = f1;
end

a = [1, a{p}];
err = err(p);