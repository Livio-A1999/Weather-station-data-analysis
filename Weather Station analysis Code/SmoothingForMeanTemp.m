k1 =  2*pi./365;
k2 =  2*pi./182.5;
Xvalues = (1:366)';

XMeanTemp = [ones(size(Xvalues)) cos(Xvalues*(k1)) sin(Xvalues*(k1)) cos(Xvalues*(k2)) sin(Xvalues*(k2)) ] ;

BetaMeanTemp= inv(XMeanTemp'*XMeanTemp)*XMeanTemp'*SGamma(:,1);
Betadailyharmonicamplitude = inv(XMeanTemp'*XMeanTemp)*XMeanTemp'*SGamma(:,2);
betadailyharmonicphase = inv(XMeanTemp'*XMeanTemp)*XMeanTemp'*SGamma(:,3);
Betasemidailyharmonicamplitude = inv(XMeanTemp'*XMeanTemp)*XMeanTemp'*SGamma(:,4);
betasemidailyharmonicphase = inv(XMeanTemp'*XMeanTemp)*XMeanTemp'*SGamma(:,5);

plot(Xvalues,SGamma(:,4))
hold on
plot((Xvalues),(XMeanTemp*betasemidailyharmonicphase))
hold off
legend('Original plot','Least squares fitting')
xlabel('Day number')
ylabel('Temperature^{o}C')
title('Semi-daily harmonic phase variation')




% plot((Xvalues),(XMeanTemp*BetaMeanTemp))
% 
% hold on
% 
% plot(Xvalues,SGamma(:,1))
% hold off
% legend('Real reading','Least squares fitting' )
% xlabel('Day number')
% ylabel('Temperature^{o}C')
% title('Mean temperature variation through the year')
% 
% print2pdf('Meantemperature')
% 
% var(SGamma(:,1))
% skewness(SGamma(:,1))
% kurtosis(SGamma(:,1))
% std(SGamma(:,1))






