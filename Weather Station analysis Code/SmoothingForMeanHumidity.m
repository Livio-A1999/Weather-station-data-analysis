k1 =  2*pi./365;
k2 =  2*pi./182.5;
Xvalues = (1:366)';

XDays = [ones(size(Xvalues)) cos(Xvalues*(k1)) sin(Xvalues*(k1)) cos(Xvalues*(k2)) sin(Xvalues*(k2)) ] ;

BetaMeanHumidity= inv(XDays'*XDays)*XDays'*SZeta(:,1);
betadailyharmonicamplitudeHumid = inv(XDays'*XDays)*XDays'*SZeta(:,2);
Betadailyharmonicphasehumid = inv(XDays'*XDays)*XDays'*SZeta(:,3);
BetaSemiDailyHarmonicAmplitudeHumid = inv(XDays'*XDays)*XDays'*SZeta(:,4);
BetaSemiDailyHarmonicPhaseHumid = inv(XDays'*XDays)*XDays'*SZeta(:,5);

plot((Xvalues),(XDays*BetaSemiDailyHarmonicPhaseHumid))

hold on

plot(Xvalues,SZeta(:,5))
hold off
legend('Least squares fitting','Original plot' )
xlabel('Day number')
ylabel('Humidity(%)')
title('Semi-daily humidity harmonic phase variation ')

