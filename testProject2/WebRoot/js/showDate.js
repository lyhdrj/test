function getFullYear(d){
  //d is a date object
  yr=d.getYear();
  if(yr<1000){
    yr+=1900;
  }
  return yr;
}
function initArray()
{
  for(i=0;i<initArray.arguments.length;i++)
    this[i]=initArray.arguments[i];
}
var isnMonths = new initArray("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月");
var isnDays = new initArray("星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日");
function show5()
{
if(!document.layers && !document.all)
  return
var Digital=new Date();
var hours=Digital.getHours();
var minutes=Digital.getMinutes();
var seconds=Digital.getSeconds();
var dn="AM";
if(hours>12){
  dn="PM"
  hours=hours-12
}
if(hours==0)
  hours=12
if(minutes<=9)
  minutes="0"+minutes
if(seconds<=9)
  seconds="0"+seconds
//change font size here to your desire
//myclock="<b>"+getFullYear(Digital)+"年"+isnMonths[Digital.getMonth()]+Digital.getDate()+"日 "+isnDays[Digital.getDay()]+hours+":"+minutes+":"
//+seconds+" "+dn+"</b>"
myclock="<b>"+getFullYear(Digital)+"年"+isnMonths[Digital.getMonth()]+Digital.getDate()+"日 "+isnDays[Digital.getDay()]+"</b>"
if(document.layers){
  document.layers.liveclock.document.write(myclock);
  document.layers.liveclock.document.close();
}else if(document.all)
  liveclock.innerHTML=myclock
 // setTimeout("show5()",1000)
}
