% Copyright (C) 2023 Rakesh Sengupta
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.


function results = exp_analyze(file)


expLog = csvread(file,1,0);

num_std = 13;
num_trials = find(expLog(:,2) == 1);
expLog_num = expLog(num_trials,:);
size_std = 50;
size_trials = find(expLog(:,2) == 2);
expLog_size = expLog(size_trials,:);
numeros = unique(expLog(:,3));
sizes = unique(expLog(:,4));

%durations = unique(expLog(:,5));

for j = 1:numel(numeros)
    %a = find(expLog_num(:,5) == durations(i));
    b = find(expLog_num(:,3) == numeros(j));
    %c = intersect(a,b);
    results.num_prob(j) = sum(expLog_num(b,5))/numel(b);
end


%for i = 1:numel(durations)
for j = 1:numel(sizes)
    %a = find(expLog_size(:,5) == durations(i));
    b = find(expLog_size(:,4) == sizes(j));
    %c = intersect(a,b);
    results.size_prob(j) = sum(expLog_size(b,5))/numel(b);
end
%end


fun = @(p,t) (p(3)./(1+exp(-p(1)*(t-p(2)))))';
%fun = @(p,t) (p(3)./(p(1)+exp(-p(2)*t)))';
num_data = linspace(min(numeros)/num_std,max(numeros)/num_std,101);
num_fit = numeros/num_std;
%t_model = (t_data-mean(t_data))/std(t_data);

pguess  = [10 0.1 1];

[p1 fminres] = lsqcurvefit(fun,pguess,num_fit,results.num_prob(1,:));
% [p2 fminres] = lsqcurvefit(fun,pguess,num_fit,results.num_prob(2,:));
% [p3 fminres] = lsqcurvefit(fun,pguess,num_fit,results.num_prob(3,:));


num1_data = p1(3)./(1+exp(-p1(1)*(num_data-p1(2))));
% num2_data = p2(3)./(1+exp(-p2(1)*(num_data-p2(2))));
% num3_data = p3(3)./(1+exp(-p3(1)*(num_data-p3(2))));

% num1_data = p1(3)./(p1(1)+exp(-p1(2)*num_data));
% num2_data = p2(3)./(p2(1)+exp(-p2(2)*num_data));
% num3_data = p3(3)./(p3(1)+exp(-p3(2)*num_data));

check1 = abs(num1_data -0.5);
% check2 = abs(num2_data -0.5);
% check3 = abs(num3_data -0.5);

a1 = find(check1 == min(check1));
% a2 = find(check2 == min(check2));
% a3 = find(check3 == min(check3));
% 
check1 = round(mean(a1));
% check2 = round(mean(a2));
% check3 = round(mean(a3));

PSE_num1 = num_data(check1);
% PSE_num2 = num_data(check2);
% PSE_num3 = num_data(check3);

check1 = abs(num1_data -0.25);
% check2 = abs(num2_data -0.25);
% check3 = abs(num3_data -0.25);

a1 = find(check1 == min(check1));
% a2 = find(check2 == min(check2));
% a3 = find(check3 == min(check3));

check1 = round(mean(a1));
% check2 = round(mean(a2));
% check3 = round(mean(a3));

PSE25_num1 = num_data(check1);
% PSE25_num2 = num_data(check2);
% PSE25_num3 = num_data(check3);

weber_num1 = abs(PSE25_num1 - PSE_num1);
% weber_num2 = abs(PSE25_num2 - PSE_num2);
% weber_num3 = abs(PSE25_num3 - PSE_num3);

fun = @(p,t) (p(3)./(1+exp(-p(1)*(t-p(2)))))';
%fun = @(p,t) (p(3)./(p(1)+exp(-p(2)*t)))';
size_data = linspace(min(sizes)/size_std,max(sizes)/size_std,101);
size_fit = sizes/size_std;
%t_model = (t_data-mean(t_data))/std(t_data);

pguess  = [1 1 1];

[p1 fminres] = lsqcurvefit(fun,pguess,size_fit,results.size_prob(1,:));
% [p2 fminres] = lsqcurvefit(fun,pguess,size_fit,results.size_prob(2,:));
% [p3 fminres] = lsqcurvefit(fun,pguess,size_fit,results.size_prob(3,:));


size1_data = p1(3)./(1+exp(-p1(1)*(size_data-p1(2))));
% size2_data = p2(3)./(1+exp(-p2(1)*(size_data-p2(2))));
% size3_data = p3(3)./(1+exp(-p3(1)*(size_data-p3(2))));


% size1_data = p1(3)./(p1(1)+exp(-p1(2)*size_data));
% size2_data = p2(3)./(p2(1)+exp(-p2(2)*size_data));
% size3_data = p3(3)./(p3(1)+exp(-p3(2)*size_data));

check1 = abs(size1_data -0.5);
% check2 = abs(size2_data -0.5);
% check3 = abs(size3_data -0.5);
% 
a1 = find(check1 == min(check1));
% a2 = find(check2 == min(check2));
% a3 = find(check3 == min(check3));

check1 = round(mean(a1));
% check2 = round(mean(a2));
% check3 = round(mean(a3));

PSE_size1 = size_data(check1);
% PSE_size2 = size_data(check2);
% PSE_size3 = size_data(check3);

check1 = abs(size1_data -0.25);
% check2 = abs(size2_data -0.25);
% check3 = abs(size3_data -0.25);

a1 = find(check1 == min(check1));
% a2 = find(check2 == min(check2));
% a3 = find(check3 == min(check3));

check1 = round(mean(a1));
% check2 = round(mean(a2));
% check3 = round(mean(a3));

PSE25_size1 = size_data(check1);
% PSE25_size2 = size_data(check2);
% PSE25_size3 = size_data(check3);

weber_size1 = abs(PSE25_size1 - PSE_size1);
% weber_size2 = abs(PSE25_size2 - PSE_size2);
% weber_size3 = abs(PSE25_size3 - PSE_size3);

results.PSE_num = [PSE_num1];
results.PSE_size = [PSE_size1];
results.weber_num = [weber_num1];
results.weber_size = [weber_size1];
%results.durations = durations;


end
