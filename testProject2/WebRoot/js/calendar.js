
													var lunarInfo=new Array(
					0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
					0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
					0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
					0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
					0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
					0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
					0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
					0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
					0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
					0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
					0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
					0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
					0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
					0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
					0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0)
					
					var solarMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
					var Gan=new Array("��","��","��","��","��","��","��","��","��","��");
					var Zhi=new Array("��","��","��","î","��","��","��","δ","��","��","��","��");
					var Animals=new Array("��","ţ","��","��","��","��","��","��","��","��","��","��");
					var solarTerm = new Array("С��","��","����","��ˮ","����","����","����","����","����","С��","â��","����","С��","����","����","����","��¶","���","��¶","˪��","����","Сѩ","��ѩ","����")
					var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758)
					var nStr1 = new Array('��','һ','��','��','��','��','��','��','��','��','ʮ')
					var nStr2 = new Array('��','ʮ','إ','ئ','��')
					var monthName = new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");
					var monthNong = new Array("��","��","��","��","��","��","��","��","��","��","ʮ","ʮһ","ʮ��");
					
					//�������� *��ʾ�ż���
					var sFtv = new Array(
					"0101*Ԫ��",
					"0214 ���˽�",
					"0308 ��Ů��",
					"0312 ֲ����",
					"0315 ������Ȩ����",
					"0401 ���˽�",
					"0501 �Ͷ���",
					"0504 �����",
					"0512 ��ʿ��",
					"0601 ��ͯ��",
					"0701 ������ ��ۻع����",
					"0801 ������",
					"0808 ���׽�",
					"0909 ë����������",
					"0910 ��ʦ��",
					"0928 ���ӵ���",
					"1001*�����",
					"1006 ���˽�",
					"1024 ���Ϲ���",
					"1112 ����ɽ��������",
					"1220 ���Żع����",
					"1225 ʥ����",
					"1226 ë�󶫵�������")
					
					//ũ������ *��ʾ�ż���
					var lFtv = new Array(
					"0101*����",
					"0115 Ԫ����",
					"0505 �����",
					"0707 ��Ϧ���˽�",
					"0715 ��Ԫ��",
					"0815 �����",
					"0909 ������",
					"1208 ���˽�",
					"1224 С��",
					"0100*��Ϧ")
					
					//ĳ�µĵڼ������ڼ�
					var wFtv = new Array(
					"0520 ĸ�׽�",
					"0716 ������",
					"0730 ��ū�۹�����",
					"1144 �ж���")
					function lYearDays(y) {
					   var i, sum = 348
					   for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0
					   return(sum+leapDays(y))
					}
					
					function leapDays(y) {
					   if(leapMonth(y))  return((lunarInfo[y-1900] & 0x10000)? 30: 29)
					   else return(0)
					}
					
					function leapMonth(y) {
					   return(lunarInfo[y-1900] & 0xf)
					}
					function monthDays(y,m) {
					   return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 )
					}
					
					function Lunar(objDate) {
					
					   var i, leap=0, temp=0
					   var baseDate = new Date(1900,0,31)
					   var offset   = (objDate - baseDate)/86400000
					
					   this.dayCyl = offset + 40
					   this.monCyl = 14
					
					   for(i=1900; i<2050 && offset>0; i++) {
					      temp = lYearDays(i)
					      offset -= temp
					      this.monCyl += 12
					   }
					
					   if(offset<0) {
					      offset += temp;
					      i--;
					      this.monCyl -= 12
					   }
					
					   this.year = i
					   this.yearCyl = i-1864
					
					   leap = leapMonth(i) //���ĸ���
					   this.isLeap = false
					
					   for(i=1; i<13 && offset>0; i++) {
					      //����
					      if(leap>0 && i==(leap+1) && this.isLeap==false)
					         { --i; this.isLeap = true; temp = leapDays(this.year); }
					      else
					         { temp = monthDays(this.year, i); }
					
					      //�������
					      if(this.isLeap==true && i==(leap+1)) this.isLeap = false
					
					      offset -= temp
					      if(this.isLeap == false) this.monCyl ++
					   }
					
					   if(offset==0 && leap>0 && i==leap+1)
					      if(this.isLeap)
					         { this.isLeap = false; }
					      else
					         { this.isLeap = true; --i; --this.monCyl;}
					
					   if(offset<0){ offset += temp; --i; --this.monCyl; }
					
					   this.month = i
					   this.day = offset + 1
					}
					
					
					function solarDays(y,m) {
					   if(m==1)
					      return(((y%4 == 0) && (y%100 != 0) || (y%400 == 0))? 29: 28)
					   else
					      return(solarMonth[m])
					}
					
					function cyclical(num) {
					   return(Gan[num%10]+Zhi[num%12])
					}
					
					
					function calElement(sYear,sMonth,sDay,week,lYear,lMonth,lDay,isLeap,cYear,cMonth,cDay) {
					
					      this.isToday    = false;
					      //����
					      this.sYear      = sYear;
					      this.sMonth     = sMonth;
					      this.sDay       = sDay;
					      this.week       = week;
					      //ũ��
					      this.lYear      = lYear;
					      this.lMonth     = lMonth;
					      this.lDay       = lDay;
					      this.isLeap     = isLeap;
					      //��֧
					      this.cYear      = cYear;
					      this.cMonth     = cMonth;
					      this.cDay       = cDay;
					
					      this.color      = '';
					
					      this.lunarFestival = ''; //ũ������
					      this.solarFestival = ''; //��������
					      this.solarTerms    = ''; //����
					
					}
					
					
					function sTerm(y,n) {
					   var offDate = new Date( ( 31556925974.7*(y-1900) + sTermInfo[n]*60000  ) + Date.UTC(1900,0,6,2,5) )
					   return(offDate.getUTCDate())
					}
					
					function calendar(y,m) {
					
					   var sDObj, lDObj, lY, lM, lD=1, lL, lX=0, tmp1, tmp2
					   var lDPOS = new Array(3)
					   var n = 0
					   var firstLM = 0
					
					   sDObj = new Date(y,m,1)            //����һ������
					
					   this.length    = solarDays(y,m)    //������������
					   this.firstWeek = sDObj.getDay()    //��������1�����ڼ�
					
					
					   for(var i=0;i<this.length;i++) {
					
					      if(lD>lX) {
					         sDObj = new Date(y,m,i+1)    //����һ������
					         lDObj = new Lunar(sDObj)     //ũ��
					         lY    = lDObj.year           //ũ����
					         lM    = lDObj.month          //ũ����
					         lD    = lDObj.day            //ũ����
					         lL    = lDObj.isLeap         //ũ���Ƿ�����
					         lX    = lL? leapDays(lY): monthDays(lY,lM) //ũ����������һ��
					
					         if(n==0) firstLM = lM
					         lDPOS[n++] = i-lD+1
					      }
					
					      this[i] = new calElement(y, m+1, i+1, nStr1[(i+this.firstWeek)%7],
					                               lY, lM, lD++, lL,
					                               cyclical(lDObj.yearCyl) ,cyclical(lDObj.monCyl), cyclical(lDObj.dayCyl++) )
					
					      
					   }
					
					   //����
					   tmp1=sTerm(y,m*2  )-1
					   tmp2=sTerm(y,m*2+1)-1
					   this[tmp1].solarTerms = solarTerm[m*2]
					   this[tmp2].solarTerms = solarTerm[m*2+1]
					
					
					   //��������
					   for(i in sFtv)
					      if(sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/))
					         if(Number(RegExp.$1)==(m+1)) {
					            this[Number(RegExp.$2)-1].solarFestival += RegExp.$4 + ' '
					            if(RegExp.$3=='*') this[Number(RegExp.$2)-1].color = 'red'
					         }
					
					   //���ܽ���
					   for(i in wFtv)
					      if(wFtv[i].match(/^(\d{2})(\d)(\d)([\s\*])(.+)$/))
					         if(Number(RegExp.$1)==(m+1)) {
					            tmp1=Number(RegExp.$2)
					            tmp2=Number(RegExp.$3)
					            this[((this.firstWeek>tmp2)?7:0) + 7*(tmp1-1) + tmp2 - this.firstWeek].solarFestival += RegExp.$5 + ' '
					         }
					
					   //ũ������
					   for(i in lFtv)
					      if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
					         tmp1=Number(RegExp.$1)-firstLM
					         if(tmp1==-11) tmp1=1
					         if(tmp1 >=0 && tmp1<n) {
					            tmp2 = lDPOS[tmp1] + Number(RegExp.$2) -1
					            if( tmp2 >= 0 && tmp2<this.length) {
					               this[tmp2].lunarFestival += RegExp.$4 + ' '
					               if(RegExp.$3=='*') this[tmp2].color = 'red'
					            }
					         }
					      }
					
					
					   if((this.firstWeek+12)%7==5)
					      this[12].solarFestival += '��ɫ������ '
					
					   //����
					   if(y==tY && m==tM) this[tD-1].isToday = true;
					
					}
					
					//====================== ��������
					function cDay(d){
					   var s;
					
					   switch (d) {
					      case 10:
					         s = '��ʮ'; break;
					      case 20:
					         s = '��ʮ'; break;
					         break;
					      case 30:
					         s = '��ʮ'; break;
					         break;
					      default :
					         s = nStr2[Math.floor(d/10)];
					         s += nStr1[d%10];
					   }
					   return(s);
					}
					
					var cld;
					var Today = new Date();
					var tY = Today.getFullYear();
					var tM = Today.getMonth();
					var tD = Today.getDate();
					//��ʾ��ϸ��������
					function mOvr(d) {
						  var s,festival;
					      if(cld[d].solarTerms == '' && cld[d].solarFestival == '' && cld[d].lunarFestival == '')
					         festival = '&nbsp;';
					      else
					         festival ="<br>&nbsp;"+cld[d].solarTerms + ' ' + cld[d].solarFestival + ' ' + cld[d].lunarFestival;
					
					      //s= "<TABLE WIDTH=150px BORDER=0 style='font-size:9pt'><tr><td>&nbsp;"+cld[d].sYear+'��'+cld[d].sMonth+'��'+cld[d].sDay+'�� &nbsp;����'+cld[d].week+'<br>'+'&nbsp;ũ��'+cld[d].cYear+'��'+(cld[d].isLeap?'��':'')+monthNong[cld[d].lMonth]+'��'+cDay(cld[d].lDay)+'<br>&nbsp;'+cld[d].cYear+'��'+cld[d].cMonth+'��'+cld[d].cDay + '��'+  festival +"</td></tr></table>";
					       s= ""+cld[d].sYear+'��'+cld[d].sMonth+'��'+cld[d].sDay+'��; ����'+cld[d].week+';ũ��'+cld[d].cYear+'��'+(cld[d].isLeap?'��':'')+cld[d].cMonth+'��'+cld[d].cDay + '��';
							return s;
					
					}
					
					var m_tdActive;
					
					function HowManyDays(strMonth,strYear)
					 {
						  
						cld = new calendar(strYear,strMonth-1);
						var strDate1=strMonth+"-"+"01"+"-"+strYear
						strMonth=parseInt(strMonth,10)+1
						var strDate2=strMonth +"-"+"01"+"-"+strYear	
						var date1=new Date(strDate1)
						var date2=new Date(strDate2)
						var days=(date2 - date1)/24/60/60/1000
						return days;
					}
					function setDaysToCalendar(strWeekday,strTotalDays,strToday)
					{
								
						var i,j,td,count
						count=1
						for(i=3;i<=8;i++)
						{ 
							if(i==3) 
								for(j=0;j<=6;j++)
								{
									td=tblTotalCalendar.rows(i).cells(j);
									if (j<strWeekday)
									{
										td.Active = false;
									}
									else
									{
										if (j == strWeekday && j>0)
										{
											 //tblTotalCalendar.rows(i).cells(j-1).style.borderRightColor = "#e0e3f7";
										}
					
										td.innerText=count;
										td.title = mOvr(count-1);
										
										td.style.borderRightColor = "#5661a8";
										if(count==strToday) 
										{
											currInfo.innerHTML=mOvr(count-1);		 
											td.style.backgroundColor = "yellow";
											td.Active = true;
											m_tdActive = td;
										}
										else td.Active = false;
										count=count+1;
									}
								}
							else if(count<=strTotalDays) 
								for(j=0;j<=6;j++)
								{
									td=tblTotalCalendar.rows(i).cells(j);
									td.innerText=count;
									td.title = mOvr(count-1);
					
									if(count==strToday)
									{
										td.style.backgroundColor = "yellow";
										td.Active = true;
										m_tdActive = td;
										currInfo.innerHTML=mOvr(count-1);	
									}
									else td.Active = false;
									count=count+1;        
									if (count>strTotalDays) 
										return true;
								}
						}  
					}
					
					function WriteNullToCalendar()
					{
						var i, j;
						var td;
						for(i=3; i<tblTotalCalendar.rows.length; i++)
							for(j=0; j<tblTotalCalendar.rows(i).cells.length; j++)
							{
								td = tblTotalCalendar.rows(i).cells(j);
								td.innerText = "";
							}
							return true;
					}
					
					function WhichDaySelected()
					{
						var i,j,td;
						var ls_date;
						for (i=3;i<=8;i++)
							for(j=0;j<=6;j++)
							{
								td = tblTotalCalendar.rows(i).cells(j);
								if(td.Active == true)
								{
									ls_date=td.innerText;
									return ls_date;		   
								}
							}
					}  
					
					function ResetbgColor()
					{
						m_tdActive.style.background = "";
						m_tdActive.Active = false;
						return true;
					}  
					
					function FormateDate(strYear,strMonth,strDate)
					{
						var ls_date
						strMonth=new String(strMonth)
						strDate=new String(strDate)
						if(strMonth.length==1)strMonth="0"+ strMonth
						if(strDate.length==1) strDate="0"+ strDate
						//ls_date=strMonth + "/" +strDate + "/" +strYear
						ls_date=strYear+"-"+strMonth + "-" +strDate 
						return ls_date;
					}
					var m_DateValue = "";
					function window_onload()
					{
						var strYear,strMonth,strDate,strDay;
						var dtCurrent=new Date();
						strYear= dtCurrent.getYear();
						strMonth= dtCurrent.getMonth();
						strDate= dtCurrent.getDate();
						strDay= dtCurrent.getDay();
						window.document.all("sltMonth").selectedIndex = strMonth;
						window.document.all("txtYear").value=strYear;
						var iWeekDate,iHowManyDays,strTemp;
						iWeekDate=(new Date(strYear,strMonth,1)).getDay();
						strTemp=strMonth+1;
						iHowManyDays=HowManyDays(strTemp,strYear);
						setDaysToCalendar(iWeekDate,iHowManyDays,strDate);
						m_DateValue=FormateDate(strYear,strTemp,strDate);	
								
					}
					
					function sleOnClick()
					{
						var strMonth;
						var strYear;
						var strDate;
						var iWeekDate;
						var iHowManyDays;
						strYear=window.document.all("txtYear").value ;
						strMonth=window.document.all("sltMonth").value ;
						iWeekDate = (new Date(strYear,strMonth-1,1)).getDay();
						iHowManyDays=HowManyDays(strMonth,strYear);
						strDate=WhichDaySelected();
						WriteNullToCalendar();
						ResetbgColor();
						setDaysToCalendar(iWeekDate,iHowManyDays,strDate);
						m_DateValue=FormateDate(strYear,strMonth,strDate);
						
					}
					
					
					function imgUpOnclick()
					{
						var strYear;
						strYear=document.all("txtYear").value;
						strYear=parseInt(strYear)+1;
						if (strYear>2050) strYear=2050;
						document.all("txtYear").value=strYear;
						strMonth=window.document.all("sltMonth").value ;
						iWeekDate = (new Date(strYear,strMonth-1,1)).getDay();
						iHowManyDays=HowManyDays(strMonth,strYear);
						strDate=WhichDaySelected();
						WriteNullToCalendar();
						ResetbgColor();
						setDaysToCalendar(iWeekDate,iHowManyDays,strDate);
						m_DateValue=FormateDate(strYear,strMonth,strDate);
						
					}
					
					function imgDownOnclick()
					{
						var strYear;
						strYear=document.all("txtYear").value;
						strYear=parseInt(strYear)-1;
						if (strYear<1900) strYear=1900;
						document.all("txtYear").value=strYear;
						strMonth=window.document.all("sltMonth").value ;
						iWeekDate = (new Date(strYear,strMonth-1,1)).getDay();
						iHowManyDays=HowManyDays(strMonth,strYear);
						strDate=WhichDaySelected();
						WriteNullToCalendar();
						ResetbgColor();
						setDaysToCalendar(iWeekDate,iHowManyDays,strDate);
						m_DateValue=FormateDate(strYear,strMonth,strDate);	
					}
					
					function txtYearOnchange()
					{
						var strYear,strMonth,strDate
						strYear=document.all("txtYear").value			
						strMonth=window.document.all("sltMonth").value 
						var intYear;
						intYear = parseInt(strYear,10)
						if(isNaN(intYear)){
							strYear = 1900;
							document.all("txtYear").value = strYear;
						}
						else if(intYear<1900 ){
							strYear = 1900;
							document.all("txtYear").value = strYear;
						}else if(intYear>2050){
							strYear = 2050;
							document.all("txtYear").value = strYear;
						}
						
						iWeekDate = (new Date(strYear,strMonth-1,1)).getDay();
						iHowManyDays=HowManyDays(strMonth,strYear);
						strDate=WhichDaySelected();
						WriteNullToCalendar();
						ResetbgColor();
						setDaysToCalendar(iWeekDate,iHowManyDays,strDate);
						m_DateValue=FormateDate(strYear,strMonth,strDate);	
					}
					
					function tdOnclick()
					{
						var src = event.srcElement 
						if (src.tagName != "TD")return false;
						var  strYear,strMonth,strDate
						if (src.innerText!="" && src.innerText!=" ")
						{
							ResetbgColor();
							src.style.backgroundColor ="yellow";
							src.Active = true;
							m_tdActive = src;
							strYear=document.all("txtYear").value;
							strMonth=window.document.all("sltMonth").value ;
							strDate=src.innerText;
							m_DateValue=FormateDate(strYear,strMonth,strDate);
							//alert(m_DateValue);
					       // parent.content.location="/houseWeb/newPage1.jsp?datePara="+m_DateValue;
					       // window.open("/houseWeb/rcap.do?datePara="+m_DateValue+"", target='rightTL','zjwin', 'height='+500+', width='+800+', top=50, left=50, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');
					      
							currInfo.innerHTML=mOvr(src.innerText-1);	
						}
					}
					function public_get_DateValue()
					{
						return m_DateValue;
					}