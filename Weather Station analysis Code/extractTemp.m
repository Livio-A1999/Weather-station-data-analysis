  function daytemp = extractTemp(TimeAndTemp,day)
    C =(TimeAndTemp(:,1)>=day*86400)&(TimeAndTemp(:,1)<(day+1)*86400);
    daytemp = TimeAndTemp(C,:);
    daytemp(:,1)=daytemp(:,1)-day*86400;
  