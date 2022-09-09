function dayhumid = extractHumid(TimeAndHumidity,day)
    C =(TimeAndHumidity(:,1)>=day*86400)&(TimeAndHumidity(:,1)<(day+1)*86400);
    dayhumid = TimeAndHumidity(C,:);
    dayhumid(:,1)=dayhumid(:,1)-day*86400;
  