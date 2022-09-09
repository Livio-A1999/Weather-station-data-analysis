function Gamma = SFit(daytemp)

k1 = 2*pi./(24*60*60);
k2 = 2*pi./(12*60*60);


X = [ones(size(daytemp(:,1))) cos(daytemp(:,1)*(k1)) sin(daytemp(:,1)*(k1)) cos(daytemp(:,1)*(k2)) sin(daytemp(:,1)*(k2)) ] ;


Beta = inv(X'*X)*X'*daytemp(:,2); % derived formula



Gamma(1)=Beta(1);
[Gamma(3),Gamma(2)]=cart2pol(Beta(2),Beta(3));
[Gamma(5),Gamma(4)]=cart2pol(Beta(4),Beta(5));
 
delta1 = Gamma(2);
phi1 = Gamma(3);
delta2 = Gamma(4);
phi2 = Gamma(5);

end


