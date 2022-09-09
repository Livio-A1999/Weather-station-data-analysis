k1 = 2*pi./(24*60*60);
k2 = 2*pi./(12*60*60);
XHumid = [ones(size(dayhumid(:,1))) cos(dayhumid(:,1)*(k1)) sin(dayhumid(:,1)*(k1)) cos(dayhumid(:,1)*(k2)) sin(dayhumid(:,1)*(k2)) ] ;
%X = [ones(size(dayhumid(:,1))) 3.336912353*cos(dayhumid(:,1)*(k1)-2.132664352) 3.336912353*sin(dayhumid(:,1)*(k1)-2.132664352) 3.336912353*cos(dayhumid(:,1)*(k2)-2.132664352) 3.336912353*sin(dayhumid(:,1)*(k2)-2.132664352) ] ;
BetaHumid = inv(X'*X)*X'*dayhumid(:,2); % derived formula 

SSE = (dayhumid(:,2)-X*BetaHumid)'*(dayhumid(:,1)-X*BetaHumid); % sum squared error
SStot = sum((dayhumid(:,2)-mean(dayhumid(:,2))).^2); %total variance in the system 

R2 = 1-SSE/SStot; %how good our model fits
% 
plot(dayhumid(:,1),X*BetaHumid,'.')
 hold on
% plot(min(daytemp(:,2)),max(daytemp(:,2)),min(daytemp(:,2)),max(daytemp(:,2)))
 plot(dayhumid(:,1),dayhumid(:,2))


% 
% legend('Real reading','Least squares fitting' )
% xlabel('Time (s)')
% ylabel('Temperature^{o}C')
% title('Day 120 multiple least squares fitting')
