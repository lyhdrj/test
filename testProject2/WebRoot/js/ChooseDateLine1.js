
var gdCtrl1 = new Object();
var goSelectTag = new Array();
var bool = true;
var gcGray = "#808080";
var gcToggle = "#ffff00";
var gcBG = "#cccccc";

var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth()+1;
var giDay = gdCurDate.getDate();

function fPopCalendar1(popCtrl){
  event.cancelBubble=true;
  gdCtrl1 = popCtrl;
  fSetYearMon1(giYear, giMonth);
  var point = fGetXY1(popCtrl);
  with (VicPopCal1.style) {
  	left = point.x;
	top  = point.y+popCtrl.offsetHeight+1;
	width = VicPopCal1.offsetWidth;
	height = VicPopCal1.offsetHeight;
	fToggleTags1(point);
	fSetSelected1(0);
	visibility = 'visible';
  }
  VicPopCal1.focus();
}

function fSetDate1(iYear, iMonth){
	if(iMonth<10) iMonth="0"+iMonth;
	

gdCtrl1.value = iYear+"-"+iMonth; //Here, you could modify the locale as you need !!!!
  if(bool){
  	fHideCalendar1();
  }
}

function fHideCalendar1(){
  VicPopCal1.style.visibility = "hidden";
  for (i in goSelectTag)
  	goSelectTag[i].style.visibility = "visible";
  goSelectTag.length = 0;
}

function fSetSelected1(aCell,state){
  var iOffset = 0;
  bool = state;
  var iYear = parseInt(tbSelYear1.value);
  var iMonth = parseInt(tbSelMonth1.value);

  fSetDate1(iYear, iMonth);
}

function Point1(iX, iY){
	this.x = iX;
	this.y = iY;
}



function fSetYearMon1(iYear, iMon){
  tbSelMonth1.options[iMon-1].selected = true;
  for (i = 0; i < tbSelYear1.length; i++)
	if (tbSelYear1.options[i].value == iYear)
		tbSelYear1.options[i].selected = true;

}

function fPrevMonth1(){
  var iMon = tbSelMonth1.value;
  var iYear = tbSelYear1.value;

  if (--iMon<1) {
	  iMon = 12;
	  iYear--;
  }

  fSetYearMon1(iYear, iMon);
}

function fNextMonth1(){
  var iMon = tbSelMonth1.value;
  var iYear = tbSelYear1.value;

  if (++iMon>12) {
	  iMon = 1;
	  iYear++;
  }

  fSetYearMon1(iYear, iMon);
}

function fToggleTags1(){
  with (document.all.tags("SELECT")){
 	for (i=0; i<length; i++)
 		if ((item(i).Victor!="Won")&&fTagInBound(item(i))){
 		//	item(i).style.visibility = "hidden";
 			goSelectTag[goSelectTag.length] = item(i);
 		}
  }
}

function fTagInBound1(aTag){
  with (VicPopCal1.style){
  	var l = parseInt(left);
  	var t = parseInt(top);
  	var r = l+parseInt(width);
  	var b = t+parseInt(height);
	var ptLT = fGetXY(aTag);
	return !((ptLT.x>r)||(ptLT.x+aTag.offsetWidth<l)||(ptLT.y>b)||(ptLT.y+aTag.offsetHeight<t));
  }
}

function fGetXY1(aTag){
  var oTmp = aTag;
  var pt = new Point1(0,0);
  do {
  	pt.x += oTmp.offsetLeft;
  	pt.y += oTmp.offsetTop;
  	oTmp = oTmp.offsetParent;
  } while(oTmp.tagName!="BODY");
  return pt;
}

var gMonths=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");

with (document) {
write("<Div id='VicPopCal1' onclick='event.cancelBubble=true' style='POSITION:absolute;visibility:hidden;border:2px ridge;width:10;z-index:100;'>");
write("<table border='0' bgcolor='#6699cc'>");
write("<TR>");
write("<td valign='middle' align='center'><input type='button' name='PrevMonth' value='<' style='height:20;width:20;FONT:bold' onClick='fPrevMonth1()'>");
//write("&nbsp;<SELECT name='tbSelYear1' onChange='fUpdateCal1(tbSelYear1.value, tbSelMonth1.value)' Victor='Won'>");
write("&nbsp;<SELECT name='tbSelYear1' onChange='fSetSelected1(this,false)' Victor='Won'>");
for(i=1990;i<2015;i++)
	write("<OPTION value='"+i+"'>"+i+"</OPTION>");
write("</SELECT>");
write("&nbsp;<select name='tbSelMonth1' onChange='fSetSelected1(this,true)' Victor='Won'>");
for (i=0; i<12; i++)
	write("<option value='"+(i+1)+"'>"+gMonths[i]+"</option>");
write("</SELECT>");
write("&nbsp;<input type='button' name='PrevMonth' value='>' style='height:20;width:20;FONT:bold' onclick='fNextMonth1()'>");
write("</td>");
write("</TR><TR>");
write("<td align='center'>");
write("<DIV style='background-color:teal'><table width='100%' border='0' cellpadding='2'>");

write("</table></DIV>");
write("</td>");
write("</TR>");

write("</TABLE></Div>");
write("<SCRIPT event=onclick() for=document>fHideCalendar1()</SCRIPT>");
}

 -->
 	