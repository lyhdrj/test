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
var isnMonths = new initArray("1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��");
var isnDays = new initArray("������","����һ","���ڶ�","������","������","������","������","������");
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
//myclock="<b>"+getFullYear(Digital)+"��"+isnMonths[Digital.getMonth()]+Digital.getDate()+"�� "+isnDays[Digital.getDay()]+hours+":"+minutes+":"
//+seconds+" "+dn+"</b>"
myclock="<b>"+getFullYear(Digital)+"��"+isnMonths[Digital.getMonth()]+Digital.getDate()+"�� "+isnDays[Digital.getDay()]+"</b>"
if(document.layers){
  document.layers.liveclock.document.write(myclock);
  document.layers.liveclock.document.close();
}else if(document.all)
  liveclock.innerHTML=myclock
 // setTimeout("show5()",1000)
}
