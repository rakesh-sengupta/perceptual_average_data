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
% Data Loading and Preprocessing:
%
% The code loads the experimental log data from a CSV file, separating trials based on numerosity and size tasks.
% It identifies unique numerosity and size values used in the experiment.
% Numerosity and Size Analysis:
% For each unique numerosity and size value, the code calculates the probability of participants' responses.
% It fits a logistic function to model the relationship between numerosity/size and participants' responses, 
% determining the Point of Subjective Equality (PSE) and Weber fraction.
% Numerosity Analysis:
% The code fits a logistic function to the probability data for numerosity trials, estimating 
% parameters such as the slope, midpoint, and maximum probability.
% It calculates the PSE and Weber fraction for numerosity perception.
% Size Analysis:
% Similarly, the code fits a logistic function to the probability data for size trials, 
% estimating parameters such as the slope, midpoint, and maximum probability.
% It calculates the PSE and Weber fraction for size perception.
% Results Storage:
% Finally, the code stores the calculated PSE and Weber fraction values for numerosity and size tasks in the results structure.

function results = exp_analyze(file)

% Load experimental log data
expLog = csvread(file,1,0);

% Define standard values for numerosity and size
num_std = 13;
num_trials = find(expLog(:,2) == 1);

% Extract trials for numerosity and size tasks
expLog_num = expLog(num_trials,:);
size_std = 50;
size_trials = find(expLog(:,2) == 2);
expLog_size = expLog(size_trials,:);

% Identify unique numerosity and size values
numeros = unique(expLog(:,3));
sizes = unique(expLog(:,4));

% Numerosity analysis
for j = 1:numel(numeros)
    %a = find(expLog_num(:,5) == durations(i));
    b = find(expLog_num(:,3) == numeros(j));
    %c = intersect(a,b);
    results.num_prob(j) = sum(expLog_num(b,5))/numel(b);
end

% Size analysis
%for i = 1:numel(durations)
for j = 1:numel(sizes)
    %a = find(expLog_size(:,5) == durations(i));
    b = find(expLog_size(:,4) == sizes(j));
    %c = intersect(a,b);
    results.size_prob(j) = sum(expLog_size(b,5))/numel(b);
end
%end

% Fit logistic function for numerosity perception
fun = @(p,t) (p(3)./(1+exp(-p(1)*(t-p(2)))))';
%fun = @(p,t) (p(3)./(p(1)+exp(-p(2)*t)))';
num_data = linspace(min(numeros)/num_std,max(numeros)/num_std,101);
num_fit = numeros/num_std;
%t_model = (t_data-mean(t_data))/std(t_data);

pguess  = [10 0.1 1];

[p1 fminres] = lsqcurvefit(fun,pguess,num_fit,results.num_prob(1,:));


num1_data = p1(3)./(1+exp(-p1(1)*(num_data-p1(2))));

% Calculate PSE and Weber fraction for numerosity
check1 = abs(num1_data -0.5);
a1 = find(check1 == min(check1));
check1 = round(mean(a1));
PSE_num1 = num_data(check1);
check1 = abs(num1_data -0.25);
a1 = find(check1 == min(check1));
check1 = round(mean(a1));
PSE25_num1 = num_data(check1);
weber_num1 = abs(PSE25_num1 - PSE_num1);

% Fit logistic function for size perception
fun = @(p,t) (p(3)./(1+exp(-p(1)*(t-p(2)))))';
%fun = @(p,t) (p(3)./(p(1)+exp(-p(2)*t)))';
size_data = linspace(min(sizes)/size_std,max(sizes)/size_std,101);
size_fit = sizes/size_std;
%t_model = (t_data-mean(t_data))/std(t_data);

pguess  = [1 1 1];

[p1 fminres] = lsqcurvefit(fun,pguess,size_fit,results.size_prob(1,:));

% Calculate PSE and Weber fraction for size
size1_data = p1(3)./(1+exp(-p1(1)*(size_data-p1(2))));
check1 = abs(size1_data -0.5);
a1 = find(check1 == min(check1));
check1 = round(mean(a1));
PSE_size1 = size_data(check1);
check1 = abs(size1_data -0.25);
a1 = find(check1 == min(check1));
check1 = round(mean(a1));
PSE25_size1 = size_data(check1);
weber_size1 = abs(PSE25_size1 - PSE_size1);

% Store results
results.PSE_num = [PSE_num1];
results.PSE_size = [PSE_size1];
results.weber_num = [weber_num1];
results.weber_size = [weber_size1];


end
