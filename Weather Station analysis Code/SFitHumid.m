function Zeta = SFitHumid(dayhumid)

k1 = 2*pi./(24*60*60);
k2 = 2*pi./(12*60*60);


XHumid = [ones(size(dayhumid(:,1))) cos(dayhumid(:,1)*(k1)) sin(dayhumid(:,1)*(k1)) cos(dayhumid(:,1)*(k2)) sin(dayhumid(:,1)*(k2)) ] ;





BetaHumid = inv(XHumid'*XHumid)*XHumid'*dayhumid(:,2); % derived formula


Zeta(1)=BetaHumid(1);
[Zeta(3),Zeta(2)]=cart2pol(BetaHumid(2),BetaHumid(3));
[Zeta(5),Zeta(4)]=cart2pol(BetaHumid(4),BetaHumid(5));
 
delta1Humid = Zeta(2);
phi1Humid = Zeta(3);
delta2Humid = Zeta(4);
phi2Humid = Zeta(5);

end


