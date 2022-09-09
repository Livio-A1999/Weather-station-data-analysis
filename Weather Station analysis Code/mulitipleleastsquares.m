k1 = 2*pi./(24*60*60);
k2 = 2*pi./(12*60*60);
X = [ones(size(daytemp(:,1))) cos(daytemp(:,1)*(k1)) sin(daytemp(:,1)*(k1)) cos(daytemp(:,1)*(k2)) sin(daytemp(:,1)*(k2)) ] ;

Beta = inv(X'*X)*X'*daytemp(:,2); % derived formula 

SSE = (daytemp(:,2)-X*Beta)'*(daytemp(:,1)-X*Beta); % sum squared error
SStot = sum((daytemp(:,2)-mean(daytemp(:,2))).^2); %total variance in the system 

R2 = 1-SSE/SStot; %how good our model fits

plot(daytemp(:,1),X*Beta,'.')
hold on
% plot(min(daytemp(:,2)),max(daytemp(:,2)),min(daytemp(:,2)),max(daytemp(:,2)))
plot(daytemp(:,1),daytemp(:,2))



legend('Least squares fitting','Real reading' )
xlabel('Time (s)')
ylabel('Temperature^{o}C')
title('Day 365 multiple least squares fitting')
