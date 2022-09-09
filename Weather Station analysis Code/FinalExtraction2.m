
clc ;

which extract
AprMayJun2019 = readtable("Outdoor_AprMayJun_2019.xls") ;
JulAugSep2019 = readtable("Outdoor_JulAugSep_2019.xls") ;
OctNovDec2019 = readtable("Outdoor_OctNovDec_2019.xls"); 
JanFebMar2020 = readtable("Outdoor_JanFebMar_2020.xls");

yeardata = [AprMayJun2019;JulAugSep2019;OctNovDec2019;JanFebMar2020]

Times =table2array(yeardata(:,1));
Times = Times-Times(1)+17; 
Temp =table2array(yeardata(:,3));
Humidity = table2array(yeardata(:,4));
TimeAndTemp = [Times,Temp];
TimeAndHumidity = [Times,Humidity]

for day = 0:365
daytemp = extractTemp(TimeAndTemp,day)
dayhumid = extractHumid(TimeAndHumidity,day)


Gamma = SFit(daytemp)
SGamma(day+1,1:5) = Gamma
end
plot(SGamma(:,1))
hold on
plot(SGamma(:,2))
plot(SGamma(:,3))
plot(SGamma(:,4))
plot(SGamma(:,5))

hold off
legend('Mean temperature','Daily harmonic amplitude','Daily harmonic phase','Semi daily harmonic amplitude','Semi daily harmonic phase')
figure(2)
histogram(SGamma(:,2))
figure(3)
histogram(SGamma(:,3))
figure(5)
histfit(SGamma(:,1))












