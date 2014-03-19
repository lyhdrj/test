var isRemainder=0;//是否是剩余物通知书
var remainderData; //剩余物通知书的树种信息

 var http_request = false;
             var optionValue="";
            function send_request(url) {//初始化，指定处理函数，发送请求的函数
            http_request = false;
               if (window.XMLHttpRequest) { // Mozilla浏览器
                   http_request = new XMLHttpRequest();
                   if (http_request.overrideMimeType) {
                       http_request.overrideMimeType('text/xml');//设置MIME类别
                   }
               } else if (window.ActiveXObject) { // IE 浏览器
                   try {
                       http_request = new ActiveXObject("Msxml2.XMLHTTP");
                       http_request.overrideMimeType('text/xml');//设置MIME类别
                   } catch (e) {
                       try {
                       http_request = new ActiveXObject("Microsoft.XMLHTTP");
                       } catch (e) {}
                   }
               }
                if (!http_request) {//异常，创建对象实例失败
                    alert('Giving up :( 创建对象实例失败');
                    return false;
                }
                http_request.onreadystatechange = processRequest;
                http_request.open('post', url, true);
                http_request.send(null);
            }
            function processRequest() {
                if (http_request.readyState == 4) {
                    if (http_request.status == 200) {
                     optionValue=http_request.responseText+"";
                     setSelectObj(optionValue);
                    } else {
                        alert('你所请求的页面有问题');
                    }
                }
            }
   


  function CheckNullPrice(obj, message,flag,objselect,nextValue) {
		
		 if(obj.readOnly==false)
	  { 
	  
		var str = Trim(obj.value); 
		//addby zhangc
		if (str+"" == "" || str+"" == "undefined" || str == null || str == "~!"){		     
    		alert(message + "必填");
    		obj.value="";
    		
    		obj.focus();
    		return false;
    	}
		else if(str.indexOf("'")!=-1)
		{
			alert(message+"中不能含有字符'");
			return false;		
		}
		else if(str.indexOf("’")!=-1)
		{
			alert(message+"中不能含有字符’");
			return false;		
		}
		else if(str.indexOf("%")!=-1)
		{
			alert(message+"中不能含有字符%");
			return false;		
		}
		else{
		
		 if(flag==0)
		 {
    	
    		getAboutPriceValue(obj.id,obj.value,objselect,nextValue); //为0时调用是否为数字方法
          }
         if(flag==1)
           return true;
          if(flag==2)
		 {
    		if(CheckNum(obj, message))
    		 return true;
          }
        
    	}
    	}
}
 function CheckNullPriceOfNotice(obj, message,flag,objselect,nextValue) {
		
		 if(obj.readOnly==false)
	  { 
	  
		var str = Trim(obj.value); 
		//addby zhangc
		if (str+"" == "" || str+"" == "undefined" || str == null || str == "~!"){		     
    		alert(message + "必填");
    		obj.value="";
    		
    		obj.focus();
    		return false;
    	}
		else if(str.indexOf("'")!=-1)
		{
			alert(message+"中不能含有字符'");
			return false;		
		}
		else if(str.indexOf("’")!=-1)
		{
			alert(message+"中不能含有字符’");
			return false;		
		}
		else if(str.indexOf("%")!=-1)
		{
			alert(message+"中不能含有字符%");
			return false;		
		}
		else{
		
		 if(flag==0)
		 {
    	
    		getAboutPriceValueOfNotice(obj.id,obj.value,objselect,nextValue); //为0时调用是否为数字方法
          }
         if(flag==1)
           return true;
          if(flag==2)
		 {
    		if(CheckNum(obj, message))
    		 return true;
          }
        
    	}
    	}
}
 
 
    //接收AJAX返回的信息 ALL
    function setSelectObj(obj) 
    {
    if(obj=="sessionNull") {
    	parent.location="userLogin.jsp";
    	return;
    }
      var values=obj.split('@');    
      var state=values[0]; 
    
      if(state=="orderNum") //运输系统调令管理
      { 
        getorderNumDataComm(obj);  
      }else if(state=="checkPrice")//验证价格管理
      {
          checkPriceComm(values);
      }else if(state=="liandong")//连动管理
      {
         
         getLiandongDataComm(obj);
      
      }else if(state=="checkOrderNumber")//连动管理
      {
       
         checkOrderNumber(values[1]);
      
      }else if(state=="storeOrderNum") //贮木系统调令查询管理
      { 
       
        getListData(obj);  
      }else if(state=="selectCustomer") //通知书客户查询
      { 
         
        getCustomerDataForNotice(obj);
      }else if(state=="checkIsSame") //初始化库存报表是否重复
      { 
       
        getInitStoreIsSame(values);
      }else if(state=="selectOrderNumber") //通知书客户查询
      { 
         
        getSelectOrderNumber(values);
      }else if(state=="deceiptPlace") //楞场楞号关联
      { 
         
        getLiandongDataComm(obj);
      }else if(state=="selectWoodReserve") //通知书查询库存
      { 
         
        getWoodReservResult(obj);
      }else if(state=="getDeceiptNum") //楞场楞号关联不是组合框时使用
      { 
      
        getDeceiptNumData(obj);
      }else if(state=="selectTrainPoleLength") 
      { 
        
        selectTrainPoleLengthReturn(obj);
      }else if(state=="getWoodBranchPrice") 
      { 
        
        getWoodBranchPriceValue(obj);
      }else if(state=="notice")			//通知书打印时验证是否查询到结果
      {
      	selectResult(obj);
      }
      else if(state=="selectRelationData")			//通知书打印时验证是否查询到结果
      {
      	getRelationData(obj);
      } else if(state=="selectRelationDataUpdate")			//通知书打印时验证是否查询到结果
      {
      	selectRelationDataUpdate(obj);
      }else if(state=="checkPriceRfid")//验证价格管理
      {
          checkPriceCommRfid(values);
      }else if(state=="maxOrderNum")		//通知书补录取得调令号
      {
      	 setMaxOrder(values[1]);
      }else if(state=="getLdData")//贮木联动
      {
          
          getLdData(obj);
      }
      else
      {
       
         getDataComm(obj);
      }
      
 }


	//时间比较
			function comptime(beginTime,endTime){

					var beginTimes=beginTime.substring(0,10).split('-');
					var endTimes=endTime.substring(0,10).split('-');
					
					beginTime=beginTimes[1]+'-'+beginTimes[2]+'-'+beginTimes[0]+' '+beginTime.substring(10,19);
					endTime=endTimes[1]+'-'+endTimes[2]+'-'+endTimes[0]+' '+endTime.substring(10,19);
					
					// alert(beginTime+endTime+beginTime);
					// alert(Date.parse(endTime));alert(Date.parse(beginTime));
					 
					var a =(Date.parse(endTime)-Date.parse(beginTime))/3600/1000;
					
					if(a<0){
					return -1;
					}else if (a>0){
					return 1;
					}else if (a==0){
					return 0;
					}else{
					return -1;
					}
			}
			
/*----------------------------------------------------------------------*/
//  方法名: checkOnlyNum(obj, name,len)
//  描  述：用于检查输入编码有几位,但可以为空
//  返回值：如果输入的字符长度与len不相符，返回到输入框
//  参数说明：
//	obj				待检查的表单对象，对象
//  name			待检查的表单对象所对应的名称，字符串
//  len             待检验的字符长度	
//	david
/*-----------------------------------------------------------------------*/
function checkOnlyNum(obj,name,len){
		 var str=obj.value;
		 if(str.length==len||str.length==0){
		 	
		 }else{
		 	alert(name+'为'+len+'位数字');
		 	obj.focus();
		 }
		
	}
function numberCheck(obj)//只能是数字加小数点只能出现一次
{

 //先把非数字的都替换掉，除了数字和.
obj.value = obj.value.replace(/[^\d.]/g,"");
//必须保证第一个为数字而不是.
obj.value = obj.value.replace(/^\./g,"");
//保证只有出现一个.而没有多个.
obj.value = obj.value.replace(/\.{2,}/g,".");
//保证.只出现一次，而不能出现两次以上
obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");


}

function CharHCheck(obj)//只能是汉字和小数点
{

 obj.value=obj.value.replace(/[^\u4E00-\u9FA5\.]/g,'');

} 
function CharCheck(obj)//只能是英文字符
{

 obj.value=obj.value.replace(/[\W]/g,"");

}  

function charHNumber(obj){	//只能是数字，汉字，字符
	var regex=/[^\w\u4E00-\u9FA5]/g;
	if(regex.test(obj.value)){
		obj.value = obj.value.replace(/[^\w\u4E00-\u9FA5]/g,"");
	}
}

function CharAndNumberCheck(obj)//
{
  
 obj.value=obj.value.replace(/[\W]/g,"");

} 
function numberCheckNOChar(obj)//只能是数字
{
 obj.value=obj.value.replace(/[^0-9]/gi,"");

} 
 function numberCheckIs(obj)//是否按的回车，组合框时调用
 {
   var     pattern     =     /[^\u4E00-\u9FA5]/;           
  var flag=!pattern.test(obj.value);
 
  if(!flag)
  {
     obj.value="";
     var ff=obj.id;
     var state=ff+"Select";
     var aa=document.all(state);
     aa[0].selected=true;
  }
 }
  function numberCheckNOCharYjw(obj)//只能是数字，组合框时调用
{
 
 obj.value=obj.value.replace(/[^0-9]/gi,"");
 var ff=obj.id;
 var state=ff+"Select";
 var aa=document.all(state);
 aa[0].selected=true;
} 
 function getWoodBarWoodStere(caichang1,jingji1)
 {
   var caichang=caichang1.value;
   var jingji=jingji1.value;
   var a=Math.pow(parseFloat(jingji), 2);
   var result=parseFloat(0.7854)*a*parseFloat(caichang)/parseFloat(10000);
   result=Math.floor((result+parseFloat(0.0005))*parseFloat(1000));
   result=result/parseFloat(1000);
   return result; 
 
 }
 function getTimberMinWoodStere(caichang,jingji)
  {
   var a=Math.pow(parseFloat(jingji)+parseFloat(0.45)*parseFloat(caichang)+parseFloat(0.2), 2);
   var result=parseFloat(0.7854)*parseFloat(caichang)*a/parseFloat(10000);
   if(jingji<8)
   {
   result=Math.floor((result+parseFloat(0.00005))*parseFloat(10000));
   result=result/parseFloat(10000);
   }
   else
   {
    result=Math.floor((result+parseFloat(0.0005))*parseFloat(1000));
    result=result/parseFloat(1000);
   }
   return result;          

  }
  function getTimberMaxWoodStere(caichang,jingji)
  {
   var a=parseFloat(jingji)+parseFloat(0.5)*parseFloat(caichang)+parseFloat(0.005)*Math.pow(parseFloat(caichang),2)
   		+parseFloat(0.000125)*parseFloat(caichang)*Math.pow(parseFloat(14)-parseFloat(caichang),2)*(parseFloat(jingji)-parseFloat(10));
   var result = parseFloat(0.7854)*parseFloat(caichang)*Math.pow(a,2)/parseFloat(10000);
    result=Math.floor((result+parseFloat(0.0005))*parseFloat(1000));
    result=result/parseFloat(1000);
   
   return result;
  }
  
  //得到日期
 function getdate()
{   
  var now=new Date();
  y=now.getFullYear();
  m=now.getMonth()+1;
  d=now.getDate();
  m=m<10?"0"+m:m;
  d=d<10?"0"+d:d;
  return y+"-"+m+"-"+d;
}
/*----------------------------------------------------------------------*/
//  方法名: onlyNum()
//  描  述：用于检查输入的参数是否为数字
//  返回值：
//  参数说明：
/*-----------------------------------------------------------------------*/


 function onlyNum(){
       if (!(((window.event.keyCode>=48) && (window.event.keyCode<=57))||(window.event.keyCode==13)))
        {
           window.event.keyCode=0;
        }
 }
 
/*----------------------------------------------------------------------*/
//  方法名: numAndDot()
//  描  述：用于检查输入的参数是否为数字,小数点
//  返回值：
//  参数说明：
/*-----------------------------------------------------------------------*/
function numAndDot(){
      if (!(((window.event.keyCode>=48) && (window.event.keyCode<=57))||(window.event.keyCode==13)||(window.event.keyCode==46)))
       {
       window.event.keyCode=0;
       }
}
//检查输入的参数为两位整数一位小数
function num2AndDot1(obj){
	var num=obj.value;
	if(num.indexOf('.')==-1){
		if(num.length>2){
			num=num.substring(0,2);
		}if(num.length>1&&num.charAt(0)=='0'){
			num=num.substring(1,2);
		}
	}else{
		var subNum=num.split('.');
		if(subNum.size>2){
			num.replace('.','');
		}else{
			if(subNum[0].length>1&&subNum[0].charAt(0)=='0'){
				subNum[0]=subNum[0].substring(1,2);
				num=subNum[0]+'.'+subNum[1];
			}if(subNum[0].length>2){
				subNum[0]=subNum[0].substring(0,subNum[0].length-1);
				num=subNum[0]+'.'+subNum[1];
			}if(subNum[1].length>1){
				num=subNum[0]+'.'+subNum[1].substring(0,subNum[1].length-1);
			}if(subNum[1]=='0'){
				num=subNum[0];
			}
		}
	}
	obj.value=num;
}


/*----------------------------------------------------------------------*/
//  方法名: CheckNull(obj, message)
//  描  述：用于检查输入的参数是否为空串
//  返回值：Boolean 如果空串false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象
//  messgae				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckNull(obj, message) {
		var str = Trim(obj.value); 
		//addby zhangc
		if (str+"" == "" || str+"" == "undefined" || str == null || str == "~!"){		     
    		alert(message + "必填");
    		
    		
    		obj.focus();
    		return false;
    	}
		else if(str.indexOf("'")!=-1)
		{
			alert(message+"中不能含有字符'");
			return false;		
		}
		else if(str.indexOf("’")!=-1)
		{
			alert(message+"中不能含有字符’");
			return false;		
		}
		else if(str.indexOf("%")!=-1)
		{
			alert(message+"中不能含有字符%");
			return false;		
		}else if(str.indexOf("“")!=-1)
		{
			alert(message+"中不能含有字符“");
			return false;		
		}else if(str.indexOf("”")!=-1)
		{
			alert(message+"中不能含有字符”");
			return false;		
		}else if(str.indexOf('"')!=-1)
		{
			alert(message+'中不能含有字符"');
			return false;		
		}else{
    		return true;
    	}
}
/*----------------------------------------------------------------------*/
//  方法名: CheckCh(obj, message)
//  描  述：用于检查下拉框输入的参数是否为非法字符
//  返回值：Boolean 如果空串false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象
//  messgae				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckCh(obj, message) 
{ 
	var str = Trim(obj.value);
	if(str.indexOf("-")!=-1)
	{
		alert(message+"中不能含有字符-'");
		return false;		
	}
	else if(str.indexOf("*")!=-1)
	{
		alert(message+"中不能含有字符*");
		return false;		
	}
	else if(str.indexOf("^")!=-1)
	{
		alert(message+"中不能含有字符^");
		return false;		
	}
	else if(str.indexOf("(")!=-1)
	{
		alert(message+"中不能含有字符(");
		return false;		
	}
	else if(str.indexOf(")")!=-1)
	{
		alert(message+"中不能含有字符)");
		return false;		
	}
	else if(str.indexOf("-")!=-1)
	{
		alert(message+"中不能含有字符-");
		return false;
	}
	else if(str.indexOf("@")!=-1)
	{
		alert(message+"中不能含有字符@");
		return false;
	}
	else if(str.indexOf("!")!=-1)
	{
		alert(message+"中不能含有字符!");
		return false;
	}
	else if(str.indexOf("$")!=-1)
	{
		alert(message+"中不能含有字符$");
		return false;
	}
	else if(str.indexOf("#")!=-1)
	{
		alert(message+"中不能含有字符#");
		return false;		
	}
	else if(str.indexOf("&")!=-1)
	{
		alert(message+"中不能含有字符&");
		return false;		
	}
	else if(str.indexOf("?")!=-1)
	{
		alert(message+"中不能含有字符?");
		return false;		
	}
	else if(str.indexOf("<")!=-1)
	{
		alert(message+"中不能含有字符<");
		return false;
	}
	else if(str.indexOf(">")!=-1)
	{
		alert(message+"中不能含有字符>");
		return false;
	}
	else if(str.indexOf("＿")!=-1)
	{
		alert(message+"中不能含有字符＿");
		return false;
	}
	else if(str.indexOf("＇")!=-1)
	{
		alert(message+"中不能含有字符＇");
		return false;		
	}
	else if(str.indexOf("＂")!=-1)
	{
		alert(message+"中不能含有字符＂");
		return false;		
	}
	else if(str.indexOf("，")!=-1)
	{
		alert(message+"中不能含有字符，");
		return false;		
	}
	else if(str.indexOf("．")!=-1)
	{
		alert(message+"中不能含有字符．");
		return false;		
	}
	else if(str.indexOf("/")!=-1)
	{
		alert(message+"中不能含有字符/");
		return false;		
	}
	else if(str.indexOf("\\")!=-1)
	{
		alert(message+"中不能含有字符\\");
		return false;		
	}
	else if(str.indexOf("％")!=-1)
	{
		alert(message+"中不能含有字符％");
		return false;		
	}else if(str.indexOf("+")!=-1)
	{
		alert(message+"中不能含有字符+");
		return false;		
	}
	else{
   		return true;
   	} 
}
/*----------------------------------------------------------------------*/
//  方法名: CheckStr(obj, str)
//  描  述：用于检查输入框中是否有非法字符
//  返回值：Boolean 如果包含非法字符返回false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象
//  messgae				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function checkStr(obj,str){
		  if(!(/^(?:[\u4e00-\u9fa5]*\w*\s*)+$/.test(obj.value))){
		   alert(str+"不能有非法字符");
		   obj.focus();
		   return false;
		  }else{
		  	return true;
		  }
   }
/*----------------------------------------------------------------------*/
//  方法名: CheckLong(obj, message)
//  描  述：用于检查下拉框输入的参数长度是否合法
//  返回值：Boolean 如果空串false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象
//  messgae				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckLong(obj, message) 
{
	var str = Trim(obj.value); 
	if(str.length > 3)
	{
		alert(message+"长度不能超过3个字符");
		return false;		
	}
	else{
   		return true;
   	} 
}
/*----------------------------------------------------------------------*/
//  方法名: CheckService_name(obj, message) 
//  描  述：用于检查下拉框输入的参数长度是否合法
//  返回值：Boolean 如果空串false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象
//  messgae				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/

function CheckService_name(obj, message) 
{
	var str = Trim(obj.value); 
	if(str.length > 40)
	{
		alert(message+"长度不能超过40个字符");
		return false;		
	}
	else{
   		return true;
   	}
}
/*
	判断IP是否正确
*/
 
function CheckIP(object,message){
	var value = object.value.split(".");
	var flag=true;
	for(var i=0;i<value.length;i++){
		if(value[i]<0 || value[i]>255){
			flag=false;
			break;
		}
	}
	if(!flag || value.length!=4){
		alert(message+"格式不正确");
		return false;
	}
	
	return flag;
}
/*----------------------------------------------------------------------*/
//  方法名: CheckSelectItemNull(object, message)
//  描  述：用于检查下拉框输入的参数是否为空串
//  返回值：Boolean 如果空串false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象
//  messgae				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckSelectItemNull(object,message){
	var str=object.value;
	if(  str+""=="undefined" || str==null || str=="" || str=="~!"){
		alert ("请选择:"+message);
		object.focus();
		return false;
	}else{
		return true;
	}
}

/*----------------------------------------------------------------------*/
//  方法名: CheckNum(obj, message)
//  描  述：用于检查输入的参数是否为合法数字
//  返回值：Boolean 如果为数字（可带+,-号）返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckNum(obj, message) {
	var str = obj.value;
	// 去掉前后空格
	str = str.replace(/^\s*/,"").replace(/\s*$/,"");
    //var intValue =  parseFloat(str);
    if( isNaN(str)) {
    	
    	alert(message + "必须为数字");
    	obj.focus();
    	return false;
    }else{
    	obj.value=str;// 将去掉空格后的值返回给标签
 		return true;
    }
}


/*----------------------------------------------------------------------*/
//  方法名: CheckInt(obj, message)
//  描  述：用于检查输入的参数是否为整数，
//  返回值：Boolean 如果为整数（可带+,-号）返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckInt(obj,message) {
	var str = obj.value;
	if (str+"" == "" || str+"" == "undefined" || str == null)
	{
    	
    	alert(message + "必填");
    	obj.focus();
    	return false;
  }
	str=Trim(str);
	if(JHshStrLen(str)!=str.length)//判断是否str中含有中文
  {
    	
    	alert(message + "必须为整数");
    	obj.focus();
    	return false;
  }
  	
  var intValue =  parseInt(str);
  var tmpValue=intValue+"";
  if(tmpValue.length!=str.length)
  {
    	alert(message + "必须为整数");
    	obj.focus();
    	return false;
  }
   if(intValue>2147483647||intValue<-2147483647){
   		alert(message + "必须为在-2147483647到2147483647之间");
    	obj.focus();
    	return false;
   }
  if( isNaN(intValue)) {
    	
    	alert(message + "必须为整数");
    	obj.focus();
    	return false;
  }else{
 			return true;   
  }
}

//比较两个整形值的大小，如果前面的值小于或等于后面的值，则为true,否则为false;

function CheckIntNumberBigger(strStart,strEnd,startName,endName){
	var iStart=parseInt(strStart);
	var iEnd=parseInt(strEnd);

	if(iStart<iEnd)
		return true;
	else
	{
		alert(startName+"必须小于"+endName);
		return false; 
	}
}



/*----------------------------------------------------------------------*/
//  方法名: CheckFloat(obj, message)
//  描  述：用于检查输入的参数是否为合法浮点数，如果输入为整数，转为浮点数
//  返回值：Boolean 如果为浮点数（可带+,-号）返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串

/*-----------------------------------------------------------------------*/
function CheckFloat(obj, message) {
	var str = obj.value;
	if(!str.match(/^(\d+\.\d+|\d+)$/)){
		alert(message + "必须为小数或整数");
    	obj.focus();
    	return false;
	}
    var intValue =  parseFloat(str);
    if( isNaN(intValue)) {
    	
    	alert(message + "必须为小数或整数");
    	obj.focus();
    	return false;
    }else{
 		return true;   
    }
    
    return true;
}
/*---------------------------------------------------------------------*/
//  方法名：CheckNotNegative(obj, message)
//  描  述：用于检查输入的参数是否为非负数
//  返回值：Boolean 如果为非负数（可带+号）返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckNotNegative(obj, message) {
		var str = obj.value;
		
		//只能为数字
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "必须为非负整数");
				    	obj.focus();
				    	return false;
					}
		}
		
    var intValue =  parseInt(str);
    if( isNaN(intValue)||intValue<0) {
    	
    	alert(message + "必须为非负整数");
    	obj.focus();
    	return false;
    }else{
 		return true;   
    }
}
/*---------------------------------------------------------------------*/
//  InputNumberOnly()
//  描  述：只允许输入数字字符
/*---------------------------------------------------------------------*/
function InputNumberOnly() {
    var key = window.event.keyCode;
    if( (key > 47 && key < 58) || ( key > 95 && key < 106 ) || key==8 ){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    } 	
} 
/*---------------------------------------------------------------------*/
//  InputNumberOnly()
//  描  述：只允许输入数字字符和小数点
/*---------------------------------------------------------------------*/
function InputFloatNumber() {
    var key = window.event.keyCode;
    if( ( key > 47 && key < 58 )|| (key==46)){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    } 	
}

/*---------------------------------------------------------------------*/
//  CheckEnterPress()
//  描  述：检查enter键是否被按下
/*---------------------------------------------------------------------*/
function CheckEnterPress() {
	var keyCode=event.keyCode;
	if (keyCode==13) {
		event.keyCode=9;
		return true;
	}else{
		return false;
	}
}


//检查日期是否输入合法
function isLeapYear(year) 
{ 
 if((year%4==0&&year%100!=0)||(year%400==0)) 
 { 
 return true; 
 }  
 return false; 
} 

//判断时间是否正确
function isRightDate(checktext){
var datetime;
var year,month,day;
var ret=false;

if(Trim(checktext.value)!=""){
   datetime=Trim(checktext.value);
   if(datetime.length==10){
            var timedata=datetime.split("-");
            year=timedata[0];
       		if(isNaN(year)==true){
          		alert("请输入日期!格式为(yyyy-mm-dd) \n例如：20040518 表示2004年5月18号！");
          		checktext.focus();
          		return false;
       		}
      
       		month=timedata[1];
       		if(isNaN(month)==true){
          		alert("请输入日期!格式为(yyyy-mm-dd) \n例如：20040518 表示2004年5月18号！");
          		checktext.focus();
          		return false;
       		}
     
      		day=timedata[2];
      		if(isNaN(day)==true){
        		alert("请输入日期!格式为(yyyy-mm-dd) \n例如：20040518 表示2004年5月18号！");
        		checktext.focus();
        		return false;
      		}
    
     		if(month<1||month>12) { 
          		alert("月份必须在01和12之间!"); 
          		checktext.focus();
         		return false; 
      		} 
     		if(day<1||day>31){ 
         		alert("日期必须在01和31之间!");
         		checktext.focus(); 
         		return false; 
     		}else{
    			if(month==2){  
     				if(isLeapYear(year)&&day>29){ 
       					alert("二月份日期必须在01到29之间!"); 
        				checktext.focus();
         				return false; 
       				}       
       				if(!isLeapYear(year)&&day>28){ 
         				alert("二月份日期必须在01到28之间!");
         				checktext.focus(); 
         				return false; 
       				} 
      			} 
       			if((month==4||month==6||month==9||month==11)&&(day>30)){ 
        			alert("在四，六，九，十一月份 \n日期必须在01到30之间!");
       				checktext.focus(); 
        			return false; 
      			} 
   		}
   		event.keyCode=9;
   		ret=true;
   		
   		
 	}else{
      		alert("日期长度不正确!格式为(yyyy-mm-dd) \n例如：2004-05-18 表示2004年5月18号！");
   		checktext.focus();
   		return false;
 
 	}
 	 
}
//为空
else{
  	alert("请输入日期!格式为(yyyymmdd) \n例如：20040518 表示2004年5月18号！");
  	checktext.focus();
  	return false;
 }
 
 return ret;
}

//不检查是否为空
function isRightDate1(checktext){
var datetime;
var year,month,day;
var ret=false;

if(Trim(checktext.value)!=""){
   datetime=Trim(checktext.value);
   if(datetime.length==8){
       		year=datetime.substring(0,4);
       		if(isNaN(year)==true){
          		alert("请输入日期!格式为(yyyymmdd) \n例如：20040518 表示2004年5月18号！");
          		checktext.focus();
          		return false;
       		}
      
       		month=datetime.substring(4,6);
       		if(isNaN(month)==true){
          		alert("请输入日期!格式为(yyyymmdd) \n例如：20040518 表示2004年5月18号！");
          		checktext.focus();
          		return false;
       		}
     
      		day=datetime.substring(6,8);
      		if(isNaN(day)==true)
      		{
        		alert("请输入日期!格式为(yyyymmdd) \n例如：20040518 表示2004年5月18号！");
        		checktext.focus();
        		return false;
      		}
    
     		if(month<1||month>12) { 
          		alert("月份必须在01和12之间!"); 
          		checktext.focus();
         		return false; 
      		} 
     		if(day<1||day>31){ 
         		alert("日期必须在01和31之间!");
         		checktext.focus(); 
         		return false; 
     		}else{
    			if(month==2){  
     				if(isLeapYear(year)&&day>29){ 
       					alert("二月份日期必须在01到29之间!"); 
        				checktext.focus();
         				return false; 
       				}       
       				if(!isLeapYear(year)&&day>28){ 
         				alert("二月份日期必须在01到28之间!");
         				checktext.focus(); 
         				return false; 
       				} 
      			} 
       			if((month==4||month==6||month==9||month==11)&&(day>30)){ 
        			alert("在四，六，九，十一月份 \n日期必须在01到30之间!");
       				checktext.focus(); 
        			return false; 
      			} 
   		}
   		
   		ret=true;
   		
   		
 	}else{
      		alert("日期长度不正确!格式为(yyyymmdd) \n例如：20040518 表示2004年5月18号！");
   		checktext.focus();
   		return false;
 
 	}
 	 
}
//为空
else{
  	
  	return true;
 }
 
 
 return ret;
}

//检查输入的参数是否为合法的数字, 返回true or false
function CheckNumber(str) {
	var rc=true;
    
	var dotFlag = 0;
	for(i=0;i<str.length;i++){
	   
		if(str.charAt(i)<'0' || str.charAt(i)>'9'){
			if( str.charAt(i)=='.') {
				dotFlag = dotFlag + 1;
				if(i==str.length-1){
				  rc=false;
				  break;
				}
			}else{
				rc=false;
				break;
			}
		}
	}
	if(dotFlag>1) {
		rc = false;
	}
	return rc;
}

// 检查输入参数是否为合法的身份证号码，对18位身份证进行位数校验和尾数校验，对15位身份证只进行位数校验
// 18位身份证号码参考 GB 11643
function CheckID(object){
	var sID = object.value;
    var W=new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
    var rc=false;
    if((sID+"" == "undefined") || (sID == null)||sID ==""){
        return false;
    } 
       else if(sID.length==15){
        rc = CheckNumber(sID);
    }
    else if(sID.length==18){
        var nCount=0;
        var nIdNum=0;
        for(var i=0;i<18;i++){
          var c=sID.charAt(i);
          if((c=='X')||(c=='x')){
             nIdNum=10;
          }  
          else if((c<='9')||(c>='0')){
             nIdNum=c-'0';
          }
          else{
			 rc = false;
			 break;
          }
          nCount+=nIdNum*W[i];
        }
        if((nCount%11)==1){
          rc=true;
        }
    }  
    
	if(!rc) {
		
		alert("无效的证件号码:" + sID);
		object.focus();
	}
    return rc;
}
//不检查是否为空
function CheckID1(object){
	var sID = object.value;
    var W=new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
    var rc=false;
    if((sID+"" == "undefined") || (sID == null)||sID ==""){
        return true;
    } 
       else if(sID.length==15){
        rc = CheckNumber(sID);
    }
    else if(sID.length==18){
        var nCount=0;
        var nIdNum=0;
        for(var i=0;i<18;i++){
          var c=sID.charAt(i);
          if((c=='X')||(c=='x')){
             nIdNum=10;
          }  
          else if((c<='9')||(c>='0')){
             nIdNum=c-'0';
          }
          else{
			 rc = false;
			 break;
          }
          nCount+=nIdNum*W[i];
        }
        if((nCount%11)==1){
          rc=true;
        }
    }  
    
	if(!rc) {
		
		alert("无效的证件号码:" + sID);
		object.focus();
	}
    return rc;
}

function CheckDate(yearObj,monthObj,dayObj,desc,isNeed){
	var year = yearObj.value;
	var month = monthObj.value;
	var day = dayObj.value;

	var rc=true;

	var monthMax=new Array(0,31,29,31,30,31,30,31,31,30,31,30,31);
	if((year+"" == "undefined" || year.length == 0) && (month+"" == "undefined" || month.length == 0) && (day+"" == "undefined" || day.length == 0)) {
		if(isNeed){
			
			alert(desc + "日期必填");	
			yearObj.focus();
			return false;
		}else{
			return true;
		}
	}

	if (year+"" == "undefined" || year.length == 0){
		
		alert(desc + "日期格式不正确:缺少年");	
		yearObj.focus();
		rc=false;
	}
	else if (month+"" == "undefined" || month.length == 0){
		
		alert(desc + "日期格式不正确:缺少月");	
		monthObj.focus();
		rc=false;
	}
	else if (day+"" == "undefined" || day.length == 0){
		
		alert(desc + "日期格式不正确:缺少天");	
		dayObj.focus();
		rc=false;
	} 
	else {
		year = parseInt(year);
		if(month.charAt(0)=='0') {
			month = month.charAt(1);
		}
		if(day.charAt(0)=='0') {
			day = day.charAt(1);
		}
		
		if(year<1900){
			
			alert(desc + "年份小于1900年");	
			yearObj.focus();
			rc=false;
		}else if(year>2100){
			
			alert(desc + "年份大于2100年");	
			yearObj.focus();
			rc=false;
		}
		else if(month<1){
			
			alert(desc + "月份小于1月");	
			monthObj.focus();
			rc=false;
		}else if(month>12){
			
			alert(desc + "月份大于12月");	
			monthObj.focus();
			rc=false;
		}
		else if((day<1)||(day>monthMax[month])){
			
			alert(desc + "中"+month+"月的天数"+day+"不正确");
			dayObj.focus();	
			rc=false;
		}
		else if((month==2)&&(day==29)){
			if(year%4!=0){
				
				alert(desc + "不是润年，2月份没有29天");	
				yearObj.focus();
				rc=false;
			}
		}
	}
    return rc;
}



//检查输入参数是否为合法的email地址
function CheckEmail(object){
  var str = object.value;
  if((str+"" == "undefined") || (str.length == 0)){
	  //may be need mofify
	  return true;
  }

  if (str.charAt(0)=="." ||        
	 str.charAt(0)=="@"||       
	 str.indexOf('@', 0)==-1 || 
	 str.indexOf('.', 0)==-1 || 
	 str.lastIndexOf("@")==str.length-1 || 
	 str.lastIndexOf(".")==str.length-1) {
	    
        alert("Email的格式不正确:" +str);
        object.focus();
        return false;
  }
  return true;
}

//检查电话号码是否正确实现
function CheckTelephoneImpl(str){
   	var rc=true;
	for(i=0;i<str.length;i++){
		if(!(str.charAt(i)>='0' && str.charAt(i)<='9')&& str.charAt(i)!='*' && str.charAt(i)!='('&& str.charAt(i)!=')'&& str.charAt(i)!='-'){
			rc= false;
			break;
		}
	 }
    return rc;
}
//检查电话号码
function CheckTelphone(object, msg) {
	var str = object.value;
	if (str+"" == "undefined" || str.length == 0){
		
		return true;
	}
	
	if(CheckTelephoneImpl(str)) {
		return true;
	}else{
		
        alert( msg + "格式不正确:" +str);
        object.focus();
		return false;
	}
}


//检查传真电话号码
function CheckFax(object, msg) {
	var str = object.value;
	if (str+"" == "undefined" || str.length == 0){
		return true;
	}
	
	if(CheckTelephoneImpl(str)) {
		return true;
	}else{
		
        alert(msg + "格式不正确:" +str);
        object.focus();
		return false;
	}
}

//检查输入数据长度
function LTrim(str){
	if (str.charAt(0) == " "){
		//如果字串左边第一个字符为空格
		str = str.slice(1);//将空格从字串中去掉
		//这一句也可改成 str = str.substring(1, str.length);
		str = LTrim(str); //递归调用
	}
	return str;
}

//去掉字串右边的空格
function RTrim(str) {
	var iLength;

	iLength = str.length;
	if (str.charAt(iLength - 1) == " "){
		//如果字串右边第一个字符为空格
		str = str.slice(0, iLength - 1);//将空格从字串中去掉
		//这一句也可改成 str = str.substring(0, iLength - 1);
		str = RTrim(str); //递归调用
	}
	return str;
}

//去掉字串两边的空格
function Trim(str){
	return LTrim(RTrim(str));
}
/**
* created by chengjw on 2007-11-08
* 校验手机号码
*　
*/
function CheckmobileNo(obj,str){
	//alert(obj.value);
	if(Trim(obj.value)+""==""){
		return true;
	}else{
		if(Trim(obj.value).length!=11){
			alert(str+"长度不正确");
			obj.focus();
			return false;
		}
		else if (Trim(obj.value.substring(0,1))+""!="1"){
			alert(str+"应该以1开头");
			obj.focus();
			return false;
		}else
		return true;
	}
}
// 检查数据长度
function CheckInputLen(inputObj,str,len) {
	if( CheckNull(inputObj, str)) {
		var minLen=Trim(inputObj.value).length;
		if(minLen>len){
			alert(str+"输入数据长度大于"+len);
			inputObj.focus();
			return false;
		}else{
			return true;
		}
	}
}


//替代字符串内容
//@param s:原字符串内容
//@param c:元字符串中要替代的字符
//@param rep:替换的字符
function replaceAll(s,c,rep){ 
     var i; 
     var s2 = s; 
     
     while(s2.indexOf(c)>0){ 
        i = s2.indexOf(c); 
        s2 = s2.substring(0, i) + rep + s2.substring(i + 2, s2.length); 
     } 
     return s2; 
} 




//==============================================================
//移动列表中的数据项
//fromList: 数据源列表
//toList :目标列表
function doMoveItem(fromList,toList) {
    var i;
    for (i = 0; i < fromList.length; i++){
       if (fromList[i].selected){
	       if (!isinlist(toList,fromList[i].value)){
	          var oOption = document.createElement("OPTION");
	          oOption.text = fromList[i].text;
	          oOption.value = fromList[i].value;
	          toList.add(oOption);
	       }else{
	          alert("<"+fromList[i].text+">"+"已经存在分配列表中");
	          break;
	       }
	     
	   }
   }
   doClearSelItem(fromList);
   
}
//清除列表中选择的数据项
function doClearSelItem(fromList){
    var i;
    var selLen = 0;//统计计数
    //统计选择的行数
	for(i=0;i<fromList.length;i++){
	   if(fromList[i].selected){
              selLen++;   
		}
     }
	 
     while (selLen > 0){
     	for(i=0;i<fromList.length;i++){
	   		      fromList.remove(fromList.selectedIndex);
                  break;
		}
		selLen--;
     }
}

//选中所有列表项
function doSelAllItem(list){
    var i;
	for(i= 0;i<list.length;i++){
	  list[i].selected = true;
	}
}



//判断值为value的值是否在目标列表toList中
function isinlist(toList,name){
    var i;
	for (i; i < toList.length; i++){
		if (toList[i].value == name){
			return true;
		}
	}

	return false;
}

//将fromList的所有项移动到toList列表中
function doMoveAllItem(fromList,toList){
    doSelAllItem(fromList);
	doMoveItem(fromList,toList);
	
}

//删除list列表中的所有项
function doDeleteAllItem(list){
    var i;
    for(i=0;i<list.length;i++){
       list.remove(i);
    }
}

function doSelectAllItem(list){
  var i;
  for(i=0;i<list.length;i++){
     list[i].selected=true;
  }
}

//判断IE版本关闭窗口
//IE 5.5 以下利用系统API关闭
//IE 5.5 及以上则为窗口定义一名称,然后CLOSE
//其他浏览器直接 window.close();
function closeWindow(){
	var ua=navigator.userAgent
	var ie=navigator.appName=="Microsoft Internet Explorer"?true:false
	if(ie){
		var IEversion=parseFloat(ua.substring(ua.indexOf("MSIE ")+5,ua.indexOf(";",ua.indexOf("MSIE "))))

		//alert(IEversion);
		if(IEversion< 5.5){
			var str  = '<object id=noTipClose classid="clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11">'
			str += '<param name="Command" value="Close"></object>';
			document.body.insertAdjacentHTML("beforeEnd", str);
			document.all.noTipClose.Click();
		}else{
			window.opener =null;
			window.close();
		}
	}
	else{
		window.close()
	}
}

//根据下拉列表名称，查找选择项
function doFindItem(obj,text){
   var contents=text;
   for(i=0;i<obj.length;i++){
	if(obj.options[i].text.indexOf(contents)!=-1){
	   obj.options[i].selected=true;
	   break;
     }
  }   
}

//判断是否为标准的日期格式,如2006-02-08
function isDateString(sDate,txtName)
{  
	var iaMonthDays = [31,28,31,30,31,30,31,31,30,31,30,31];
    var iaDate = new Array(3);
    var year, month, day;

    iaDate = sDate.toString().split("-");

    if (iaDate.length != 3)
	{
		alert(txtName+"的格式不对！请输入正确的格式如2000-01-01");
		return false;
	}
    if (iaDate[1].length > 2 || iaDate[2].length > 2)
    {
		alert(txtName+"的格式不对！请输入正确的格式如2000-01-01");
		return false;
	}

    year = parseFloat(iaDate[0]);
    month = parseFloat(iaDate[1]);
    day=parseFloat(iaDate[2]);

    if (year < 1900 || year > 2100 || year == null)
    {
		alert(txtName+"的格式不对！请输入正确的格式如2000-01-01");
		return false;
	}
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1]=29;
    if (month < 1 || month > 12 || month == null)
    {
		alert(txtName+"的格式不对！请输入正确的格式如2000-01-01");
		return false;
	}
    if (day < 1 || day > iaMonthDays[month - 1] || day == null)
	{
		alert(txtName+"的格式不对！请输入正确的格式如2000-01-01");
		return false;
	}
	
    return true
}

//选择日期函数 
function fPopUpDlg(endtarget,ctl,WINname,WINwidth,WINheight){
	showx =  WINwidth + 120  ; // + deltaX;
	showy = WINheight -50 ; // + deltaY;
	
	newWINwidth = WINwidth + 4 + 18;
	var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:yes;Resizeable=no';	
	retval = window.showModalDialog(endtarget, WINname , features );
	if( retval != null ){
		ctl.value = retval;
	}else{
		//alert("canceled");
	}
}

//比较日期大小函数,如果前面日期
//小于后面日期，则为true,否则为false;
function checkDateEarlier(strStart,strEnd,startName,endName){
    //如果有一个输入为空，则通过检验
    var arr1 = strStart.split("-");
    var arr2 = strEnd.split("-");
    var date1 = new Date(arr1[0],parseInt(arr1[1].replace(/^0/,""),10) - 1,arr1[2]);
    var date2 = new Date(arr2[0],parseInt(arr2[1].replace(/^0/,""),10) - 1,arr2[2]);
    if(arr1[1].length == 1)
        arr1[1] = "0" + arr1[1];
    if(arr1[2].length == 1)
        arr1[2] = "0" + arr1[2];
    if(arr2[1].length == 1)
        arr2[1] = "0" + arr2[1];
    if(arr2[2].length == 1)
        arr2[2]="0" + arr2[2];
    var d1 = arr1[0] + arr1[1] + arr1[2];
    var d2 = arr2[0] + arr2[1] + arr2[2];
    if(parseInt(d1,10) >=parseInt(d2,10))
	{
		alert(startName+"必须小于"+endName);
        return false;
	}
    else
       return true;
}

//只允许输入数字字符
function numberOnly() {
    var key = window.event.keyCode;
    if( key > 47 && key < 58 ){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    }
}

function phoneNumber() {
    var key = window.event.keyCode;
    if( ( key > 47 && key < 58 )|| (key==45)){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    }
}

//只允许输入数字字符和小数点
function floatNumber() {
    var key = window.event.keyCode;
    if( ( key > 47 && key < 58 )|| (key==46)){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    }
}

//只允许输入字符
function charsOnly() {
    var key = window.event.keyCode;
    if( key > 64 && key < 123 ){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    }
}

//允许数字输入字符输入
function charsShuru() {
    var key = window.event.keyCode;
    if( (key > 47 && key < 58) || (key > 64 && key < 123)){
   		window.event.returnValue = true;		
    }else{
    	window.event.returnValue = false;
    }
}
//允许数字输入字符输入和减号
function charsShuru1() {
    var key = window.event.keyCode;
    if( (key > 47 && key < 58) || (key > 64 && key < 123)||key==45 ){
   		window.event.returnValue = true;		
    }else{
    	window.event.returnValue = false;
    }
}


function CheckNullAndHshInputLen(inputObj,msg,len){
	 if(CheckNull(inputObj, msg)){
		 if(JHshStrLen(inputObj.value)>len){
			 alert(msg+"输入数据长度大于"+len);
			 inputObj.focus();
			 return false;
		 }else{
			 return true;
		 }
	 }
}
//输入数字字符首个为字母并且输入不能小于len
function CheckIntNumberBs(start,msg,end){
	var iEnd=parseInt(end);
		if(start.value.length>iEnd){
			if(start.value.length>1){
				if(CheckCoding(start,msg)){
					if(CheckCodings(start,msg)){
						return true;
					}
				}				
			}	
		}
	else{
		alert(msg+"值必须大于"+end+"位");
		return false;
	}
}


function CheckHshInputLen(inputObj,msg,len){
     
		 if(JHshStrLen(Trim(inputObj.value))>len){
			 alert(msg+"输入数据长度大于"+len);
			 inputObj.focus();
			 return false;
		 }else{
			 return true;
		 }
}

//返加包含汉字的字符长度
//
	function JHshStrLen(sString)
	{                      
		var sStr,iCount,i,strTemp ; 
						   
		iCount = 0 ;           
		sStr = sString.split("");
		for (i = 0 ; i < sStr.length ; i ++)
		{                      
			strTemp = escape(sStr[i]); 
			if (strTemp.indexOf("%u",0) == -1) // 表示是汉字
			{                      
				iCount = iCount + 1 ;  
			}                      
			else                   
			{                      
				iCount = iCount + 2 ;  
			}                      
		}                      
		return iCount ;        
	}	

	
//检查输入的参数是否为合法的正整数, 返回true or false
function CheckPositivenumber(obj,msg) {
    if(CheckNull(obj,msg)){
        var rc=true;
        var str=obj.value;
	for(i=0;i<str.length;i++){
	    if(str.charAt(i)<'0' || str.charAt(i)>'9'){
   	        rc=false;
   	        alert(msg+"输入非法");
	        break;
	    }
	}
	return rc;
    }else{
        return false;
    }
}

//检查输入的参数是否为合法的正整数, 返回true or false
function CheckPositiver(obj,msg) {
    if(CheckNull(obj,msg)){
        var rc=true;
        var str=obj.value;
	for(i=0;i<str.length;i++){
	    if(str.charAt(i)<'1' || str.charAt(i)>'9'){
   	        rc=false;
   	        alert(msg+"输入非法请输入大于0的数字");
	        break;
	    }
	}
	return rc;
    }else{
        return false;
    }
}


//hh:mm 23:59
function CheckHHMM(obj,msg){
    hhmm=obj.value;
    rc=true;
    
    if(CheckNull(obj,msg) && hhmm.length==5){

        if(hhmm.charAt(0)<'0' || hhmm.charAt(0)>'2') rc=false;
    
        if(hhmm.charAt(0)=='0' || hhmm.charAt(0)=='1'){
            if(hhmm.charAt(1)<'0' || hhmm.charAt(1)>'9') rc=false;
        }else{
            if(hhmm.charAt(1)<'0' || hhmm.charAt(1)>'3') rc=false;
        }
    
        if(hhmm.charAt(2)!=':') rc=false;
    
        if(hhmm.charAt(3)<'0' || hhmm.charAt(3)>'5') rc=false;
    
        if(hhmm.charAt(4)<'0' || hhmm.charAt(4)>'9') rc=false;
        
    }else{
        rc=false;
    }
    
    if(!rc) alert(msg+"非法的时间格式[格式:23:59]");
    
    return rc;
}

//hh:mm:ss 23:59:59
function CheckTime(timestr){
    if(timestr.charAt(0)<'0' || timestr.charAt(0)>'2') return false;
    
    if(timestr.charAt(0)=='0' || timestr.charAt(0)=='1'){
        if(timestr.charAt(1)<'0' || timestr.charAt(1)>'9') return false;
    }else{
        if(timestr.charAt(1)<'0' || timestr.charAt(1)>'3') return false;
    }
    
    if(timestr.charAt(2)!=':') return false;
    
    if(timestr.charAt(3)<'0' || timestr.charAt(3)>'5') return false;
    
    if(timestr.charAt(4)<'0' || timestr.charAt(4)>'9') return false;
    
    if(timestr.charAt(5)!=':') return false;
    
    if(timestr.charAt(6)<'0' || timestr.charAt(6)>'5') return false;
    
    if(timestr.charAt(7)<'0' || timestr.charAt(7)>'9') return false;
    
    return true;
}


//日期时间格式:2005-12-30 23:59:59
function CheckDateTime(obj,msg){
   strdatetime=Trim(obj.value);
    //alert(strdatetime+'length='+strdatetime.length);
    if(CheckNull(obj,msg) && (strdatetime.length==19)){
        strdate=strdatetime.substring(0,10);
        //alert(strdate);
        strsplit=strdatetime.substring(10,11);
        //alert(strsplit);
        strtime=strdatetime.substring(11,19);
        //alert(strtime);

    
        if(CheckIPTVDate(strdate,msg)){
           //alert('date test ok');
            if(strsplit!=' '){
                alert(msg+"日期与时间之间请用一个空格分开!!!");
                return false;
            }
            
            if (!CheckTime(strtime)){
                alert(msg+"时间格式非法[格式:2005-12-30 23:59:59]!!!");
                return false;
            }
            
        }else{
            alert(msg+"时间格式非法[格式:2005-12-30 23:59:59]!!!");
            return false;            
        }
        
        return true;
    }else{
            alert(msg+"时间格式非法[格式:2005-12-30 23:59:59]!!!");
            return false;           
    }
    
    
}
//日期时间格式:2005-12-30 23:59:59
function CheckDateTime1(obj,msg){
   strdatetime=Trim(obj.value);
    //alert(strdatetime+'length='+strdatetime.length);
    if(strdatetime.length==19){
      var strdate=strdatetime.substring(0,10);
       // alert(strdate+'4545');
        strsplit=strdatetime.substring(10,11);
      //  alert(strsplit);
        strtime=strdatetime.substring(11,19);
        //alert(strtime);

    
        if(CheckIPTVDate(strdate,msg)){
           //alert('date test ok');
            if(strsplit!=' '){
                alert(msg+"日期与时间之间请用一个空格分开!!!");
                return false;
            }
            
            if (!CheckTime(strtime)){
                alert(msg+"时间格式非法[格式:2005-12-30 23:59:59]！");
                return false;
            }
            
        }else{
            alert(msg+"时间格式非法[格式:2005-12-30 23:59:59]!!");
            return false;            
        }
        
        return true;
    }else if(strdatetime.length!=0){
            alert(msg+"时间格式非法[格式:2005-12-30 23:59:59]!");
            return false;           
    }
    
    return true;
}

function CheckIPTVDate(strdate,desc){

	var rc=true;

	var monthMax=new Array(0,31,29,31,30,31,30,31,31,30,31,30,31);

    if(strdate.charAt(4)!='-' || strdate.charAt(7)!='-') {
        return false;
    }
    
    year=strdate.substring(0,4);
    month=strdate.substring(5,7);
    day=strdate.substring(8,10);
    
	year = parseInt(year);

	if(month.charAt(0)=='0') {
		month = month.charAt(1);
	}
	if(day.charAt(0)=='0') {
		day = day.charAt(1);
	}
	
	if(year<1900){
		alert(desc + "年份小于1900年");	
		rc=false;
	}else if(year>2999){
		alert(desc + "年份大于2999年");	
		rc=false;
	}else if(month<1){
		alert(desc + "月份小于1月");	
		rc=false;
	}else if(month>12){
		alert(desc + "月份大于12月");	
		rc=false;
	}else if((day<1)||(day>monthMax[month])){
		alert(desc + "中"+month+"月的天数"+day+"不正确");	
		rc=false;
	}else if((month==2)&&(day==29)){
		if(year%4!=0){
			alert(desc + "不是润年，2月份没有29天");	
			rc=false;
		}
	}	
    return rc;
}


//检测编码,只允许字母与数字[如:A001 用户帐号等编码]
function CheckCoding(obj,msg){
    str=Trim(obj.value);
    //alert(str);
    if(CheckNull(obj,msg)){
        for(i=0;i<str.length;i++){
            if(!(    (str.charAt(i)>='0' && str.charAt(i)<='9') ||
                     (str.charAt(i)>='a' && str.charAt(i)<='z') ||
                     (str.charAt(i)>='A' && str.charAt(i)<='Z') ||
                     (str.charAt(i)=='_')
                 ))
            {
                alert(msg+"输入非法,只允许是字母或数字!!!");
                return false;
            }
        }
    }else{
        return false;
    }
    return true;
}

//检测编码,只允许字母与数字[如:A001 用户帐号等编码]
function CheckCoco(obj,msg){
    str=Trim(obj.value);
    //alert(str);
    if(str.length>=5){
        for(i=0;i<str.length;i++){
            if(!(    (str.charAt(i)>='0' && str.charAt(i)<='9') ||
                     (str.charAt(i)>='a' && str.charAt(i)<='z') ||
                     (str.charAt(i)>='A' && str.charAt(i)<='Z') ||
                     (str.charAt(i)=='_')
                 ))
            {
                alert(msg+"输入非法,只允许是字母或数字!!!");
                return false;
            }
        }
    }else{
		alert(msg+"输入非法,输入小于五位!!!");
        return false;
    }
    return true;
}

//检测编码,只允许数字[如:A001 用户帐号等编码]
function Checkscode(obj,msg){
    str=Trim(obj.value);
    //alert(str);
		if(str.length==3){
			if(!(	 
					(str>='200' && str<='299')
			))
			{
				alert(msg+"输入非法,请输入200-299之间的数字!!!");
				return false;
			}
		}
		else{
			alert(msg+"输入非法,输入只能是三位数字!!!");
			return false;
		}
        return true; 
}

//检测编码,只允许数字[如:A001 用户帐号等编码]
function Checkscodess(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length==3){
			if(!(	
				(str>='0' && str<='127')
			))
			{
				alert(msg+"输入非法,请输入0-127之间的数字");
				return false;
			}
				if(str.length==2){
					if(!(	 
						(str>='0' && str<='9')
					))
					{
						alert(msg+"输入非法,请输入0-127之间的数字");
						return false;	
					}
						if(str.length==1){
							if(!(
								(str>='0' && str<='99')	
							))
							{
								alert(msg+"输入非法,请输入0-127之间的数字");
								return false;
							}
						}
				}
	}

	return true; 
}

//检测编码,只允许数字[如:A001 用户帐号等编码]
function Checkscoshuzimoy(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length<2){
		if(!(	 
			(str>='0' && str<='9')
			))
			{
				alert(msg+"输入非法,请输入12位数字");
				return false;	
			}
	}
	else{
		alert(msg+"输入非法,请输入1-2位数字");
		return false;	
	}
	return true; 
}


//检测编码,只允许数字[如:A001 用户帐号等编码]
function Checkscoshuzi(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length==12){
		if(!(	 
			(str>='0' && str<='9')
			))
			{
				alert(msg+"输入非法,请输入12位数字");
				return false;	
			}
	}
	else{
		alert(msg+"输入非法,请输入12位数字");
		return false;	
	}
	return true; 
}

//检测编码,只允许数字[如:A001 用户帐号等编码]
function Checkscoshu(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length==4){
		if(!(	 
			(str>='0' && str<='9')
			))
			{
				alert(msg+"输入非法,请输入4位数字");
				return false;	
			}
	}
	else{
		alert(msg+"输入非法,请输入4位数字");
		return false;	
	}
	return true; 
}


function CheckCodings(obj,msg){
    str=Trim(obj.value);
    if(str+"" == "" || str+"" == "undefined" || str == null)
     return true;
    //alert(str);
   
        for(i=0;i<1;i++){
            if(!(	 
				(str.charAt(i)>='a' && str.charAt(i)<='z') ||
                (str.charAt(i)>='A' && str.charAt(i)<='Z') ||
                (str.charAt(i)=='_')
			))
            {
                alert(msg+"输入非法,第一位只允许是字母!!!");
                return false;
            }
        }
        return true; 
}

function CheckCs(obj,msg){
    str=Trim(obj.value);
    if(str+"" == "" || str+"" == "undefined" || str == null)
     return true;
    //alert(str);
        for(i=0;i<2;i++){
            if(!(	 
				(str.charAt(i)>='a' && str.charAt(i)<='z') ||
                (str.charAt(i)>='A' && str.charAt(i)<='Z') ||
                (str.charAt(i)=='_')
			))
            {
                alert(msg+"输入非法,只允许是字母!!!");
                return false;
            }
        }
        return true; 
}

//金额单位为元输入检测,数值且最多两位小数
function CheckMoney(obj,msg){
    var rc=true;
    var dot_pos=0;
    var decimal_count=0;
    var str=obj.value;
    for(i=0;i<str.length;i++){
        if(str.charAt(i)=='.'){
            if(dot_pos>0 || i==0){
               rc=false;
               alert(msg+"输入非法!!!");                
            }
            dot_pos=i;
        }else{
	    if(str.charAt(i)<'0' || str.charAt(i)>'9'){
                rc=false;
                alert(msg+"输入非法!!!!");
	        break;
	    }else{
	        if(dot_pos>0){
	            decimal_count++;
	            if(decimal_count>2){
	                rc=false;
	                alert(msg+"输入非法,金额只允两位小数!!!!");
	                break;
	            }
	        }
	    }
	}
    }
    return rc;
}
/*----------------------------------------------------------------------*/
//  方法名: CheckNull(obj, message)
//  描  述：两个浮点数相减，返回有两位小数的浮点数；
//  返回值：两个浮点数相减的结果
//  参数说明：
//	obj 				待检查的表单对象，对象
/*-----------------------------------------------------------------------*/

function sub(obj,obj){
alert("进入相减函数");
	return Math.round((obj.value*100)-(obj.value*100))/100;
}

//选择日期和时间函数，在日期后面添加：00:00:00 
//author:刘国祥
//create:2006/2/14
function fPopUpDlg2(endtarget,ctl,WINname,WINwidth,WINheight){
	showx =  WINwidth + 120  ; // + deltaX;
	showy = WINheight -50 ; // + deltaY;
	
	newWINwidth = WINwidth + 4 + 18;
	var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:yes;Resizeable=no';	
	retval = window.showModalDialog(endtarget, WINname , features );
	
	if( retval != null ){
		ctl.value = retval+" 00:00:00";
		if(ctl.name.indexOf("begintime_")==0){
			document.getElementsByName("purchasemonth_"+ctl.name.replace(/.*_/,''))[0].value='';
			document.getElementsByName("endtime_"+ctl.name.replace(/.*_/,''))[0].value='';
		}
	}else{
		//alert("canceled");
	}
}
//选择日期和时间函数，在日期后面添加：23:59:59 
//author:
//create:2006/6/20
function fPopUpDlg3(endtarget,ctl,WINname,WINwidth,WINheight){
	showx =  WINwidth + 120  ; // + deltaX;
	showy = WINheight -50 ; // + deltaY;
	
	newWINwidth = WINwidth + 4 + 18;
	var features =
		'dialogWidth:'  + newWINwidth  + 'px;' +
		'dialogHeight:' + WINheight + 'px;' +
		'dialogLeft:'   + showx     + 'px;' +
		'dialogTop:'    + showy     + 'px;' +
		'directories:no; localtion:no; menubar:no; status=no; toolbar=no;scrollbars:yes;Resizeable=no';	
	retval = window.showModalDialog(endtarget, WINname , features );
	if( retval != null ){
		ctl.value = retval+" 23:59:59";
	}else{
		//alert("canceled");
	}
}

///////////////////////////////////////////////////////////////////////////////////////
/**
*校验两个日期的先后（yyyy-MM-dd）by wchai
*返回值：
*如果其中有一个日期为空，校验通过,          返回true
*如果起始日期早于等于终止日期，校验通过，   返回true
*如果起始日期晚于终止日期，                 返回false    参考提示信息： 起始日期不能晚于结束日期。
*/
function checkDateEarlier(strStart,strEnd)
{
    if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
        return false;
    //如果有一个输入为空，则通过检验
    if (( strStart == "" ) || ( strEnd == "" ))
        return true;
    var arr1 = strStart.split("-");
    var arr2 = strEnd.split("-");
    var date1 = new Date(arr1[0],parseInt(arr1[1].replace(/^0/,""),10) - 1,arr1[2]);
    var date2 = new Date(arr2[0],parseInt(arr2[1].replace(/^0/,""),10) - 1,arr2[2]);
    if(arr1[1].length == 1)
        arr1[1] = "0" + arr1[1];
    if(arr1[2].length == 1)
        arr1[2] = "0" + arr1[2];
    if(arr2[1].length == 1)
        arr2[1] = "0" + arr2[1];
    if(arr2[2].length == 1)
        arr2[2]="0" + arr2[2];
    var d1 = arr1[0] + arr1[1] + arr1[2];
    var d2 = arr2[0] + arr2[1] + arr2[2];
    if(parseInt(d1,10) > parseInt(d2,10))
       return false;
    else
       return true;
}//~~~
/**
*校验字符串是否为日期型（yyyy-MM-dd） by wchai
*返回值：
*如果为空，定义校验通过，           返回true
*如果字串为日期型，校验通过，       返回true
*如果日期不合法，                   返回false    参考提示信息：输入域的时间不合法！（yyyy-MM-dd）
*/
function checkIsValidDate(str)
{
    //如果为空，则通过校验
    if(str == "")
        return false;
    var pattern = /^((\d{4})|(\d{2}))-(\d{1,2})-(\d{1,2})$/g;
    if(!pattern.test(str))
        return false;
    var arrDate = str.split("-");
    if(parseInt(arrDate[0],10) < 100)
        arrDate[0] = 2000 + parseInt(arrDate[0],10) + "";
    var date =  new Date(arrDate[0],(parseInt(arrDate[1],10) -1)+"",arrDate[2]);
    if(date.getYear() == arrDate[0]
       && date.getMonth() == (parseInt(arrDate[1],10) -1)+""
       && date.getDate() == arrDate[2])
        return true;
    else
        return false;
}//~~~
/**
*校验字符串是否为日期型（yyyy-MM-dd） by wchai
*返回值：
*如果为空，定义校验通过，           返回true
*如果字串为日期型，校验通过，       返回true
*如果日期不合法，                   返回false    参考提示信息：输入域的时间不合法！（yyyy-MM-dd）
*/
function checkIsValidDate_k(str)
{
    //如果为空，则通过校验
    if(str == "")
        return true;
    var pattern = /^((\d{4})|(\d{2}))-(\d{1,2})-(\d{1,2})$/g;
    if(!pattern.test(str))
        return false;
    var arrDate = str.split("-");
    if(parseInt(arrDate[0],10) < 100)
        arrDate[0] = 2000 + parseInt(arrDate[0],10) + "";
    var date =  new Date(arrDate[0],(parseInt(arrDate[1],10) -1)+"",arrDate[2]);
    if(date.getYear() == arrDate[0]
       && date.getMonth() == (parseInt(arrDate[1],10) -1)+""
       && date.getDate() == arrDate[2])
        return true;
    else
        return false;
}//~~~
//
/**
*弹出窗口公用函数 by wchai

*/
function openCenterWin(url,windowname,width,height) {
	var left=(screen.width-width)/2;
	var top=(screen.height-height)/2;
	window.open(url,windowname,"WIDTH="+width+",HEIGHT="+height+",left="+left+",top="+top+",menubar=no,resizable=no,scrollbars=yes,statusbar=no,toolbar=no,channelmode=0'");
}
//
//长时间更具弹性的正则表达示/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/
//时间为空不通过
//by wchai
 function  checkLongTime(elem){
  if(elem=="") return false;
  var pattern=/^(\d{4})(-)(\d{2})(-)(\d{2})(\s+)(\d{2})(:)(\d{2})(:)(\d{2})$/;
  var temp=elem.match(pattern);
  if(temp==null) return false;
  //date(year,month,date, hour,minutes,seconds)
  var d=new Date(temp[1],temp[3]-1,temp[5],temp[7],temp[9],temp[11]);
  return d.getFullYear()==temp[1]&&
    (d.getMonth()+1)==temp[3]&&
     d.getDate()==temp[5]&&
     d.getHours()==temp[7]&&
     d.getMinutes()==temp[9]&&
     d.getSeconds()==temp[11];
 }

 //长时间更具弹性的正则表达示/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/
//时间为空不通过
//by wchai
 function  checkLongTime_k(elem){
  if(elem=="") return true;
  var pattern=/^(\d{4})(-)(\d{2})(-)(\d{2})(\s+)(\d{2})(:)(\d{2})(:)(\d{2})$/;
  var temp=elem.match(pattern);
  if(temp==null) return false;
  //date(year,month,date, hour,minutes,seconds)
  var d=new Date(temp[1],temp[3]-1,temp[5],temp[7],temp[9],temp[11]);
  return d.getFullYear()==temp[1]&&
    (d.getMonth()+1)==temp[3]&&
     d.getDate()==temp[5]&&
     d.getHours()==temp[7]&&
     d.getMinutes()==temp[9]&&
     d.getSeconds()==temp[11];
 }
 //
 //比较两个长时候间大小 by wchai
 //
 //
  function  comTwoDate(fdate,tdate){
	var vfdate1=fdate.replace("-","");
	var vfdate2=vfdate1.replace("-","");
	var vfdate3=vfdate2.replace(" ","");
	var vfdate4=vfdate3.replace(":","");
	var vfdate5=vfdate4.replace(":","");
	
	var vtdate1=tdate.replace("-","");
	var vtdate2=vtdate1.replace("-","");
	var vtdate3=vtdate2.replace(" ","");
	var vtdate4=vtdate3.replace(":","");
	var vtdate5=vtdate4.replace(":","");
	//alert(parseInt(vfdate5)-parseInt(vtdate5));
	     if(parseInt(vfdate5)-parseInt(vtdate5)>0){
		     return false;
		 }else if(parseInt(vfdate5)-parseInt(vtdate5)<0){
		      return true;	 
		 }
  }
  //
  //cehck float for money    999999999.99>=money>=0.01
  //and check fz
  //by wchai
  //
	
	function checkFloat(thisp,zfflag,thismsg)
      {
			
			var reg = /^-?\d*(\.)?\d+$/;

			if (arr = thisp.value.match(reg))
			{
			//--------------------------------------------------
					 if(zfflag){//是否能充负值判断
					          if(thisp.value>0){
								  if(thisp.value*1.00>99999999.99){//不能超过8位数值
									alert("金额过大不于与受理");
									thisp.value="0.00";
									thisp.focus();
									return false;
								   }else if(thisp.value*1.00<0.01){
									alert("金额过小不于与受理");
									thisp.value="0.00";
									thisp.focus();
									return false;
								   }else if(!CheckDotMoney(thisp.value)){
								    thisp.value="0.00";
									thisp.focus();
									return false;
								   }else{
									return true;
								   }	
							   }else if(thisp.value<0){
								   if(thisp.value*1.00<-99999999.99){//不能超过8位数值
									alert("金额过小不于与受理");
									 thisp.value="0.00";
									 thisp.focus();
									return false;
								   }else if(thisp.value*1.00>-0.01){
									alert("金额过小不于与受理");
									 thisp.value="0.00";
									 thisp.focus();
									return false;
								   }else if(!CheckDotMoney(thisp.value)){
								    thisp.value="0.00";
									thisp.focus();
									return false;
								   }else{
									return true;
								   }
							   }else {
							            
							        return true;
							       
							   }
					   
					  //-------------------------------------------------
					  }else{
							   if(thisp.value>0){
								  if(thisp.value*1.00>99999999.99){//不能超过8位数值
									alert("金额过大不于与受理");
									thisp.value="0.00";
									thisp.focus();
									return false;
								   }else if(thisp.value*1.00<0.01){
									alert("金额过小不于与受理");
									thisp.value="0.00";
									thisp.focus();
									return false;
								   }else if(!CheckDotMoney(thisp.value)){
								    thisp.value="0.00";
									thisp.focus();
									return false;
								   }else{
									return true;
								   }	
							   }else if(thisp.value<0){
								   alert(thismsg);
								    thisp.value="0.00";
								   thisp.focus();
								   return false;
							   }else {   //零的情总
				
							        return true;  
									
							   }
					  } 
			        //-------------------------------------------------
			   
			}else{
				alert("输入串为空或非金额数字");
				 thisp.value="0.00";
				 thisp.focus();
				return false;
			}
	   
      }
  //
  //cehck float for money  
  //and check fz  上一个方法里用的，识别小数点后两位以上的数据
  //by wchai
  //
function CheckDotMoney(pvalue){
    var rc=true;
    var dot_pos=0;
    var decimal_count=0;
    for(i=0;i<pvalue.length;i++){
        if(pvalue.charAt(i)=='.'){
            if(dot_pos>0 || i==0){
               rc=false;
               alert("非法金额数字");                
            }
            dot_pos=i;
        }else{
	        if(dot_pos>0){
	            decimal_count++;
	            if(decimal_count>2){
	                rc=false;
	                alert("输入非法,金额只允两位小数");
	                break;
	            }
	        }
	    }
    }//for
    
    return rc;
}
	
  //cehck float for money    999999999.99>=money>=0.01
  //可判断正负 和金钱验证
  //by wchai
  //
function check_zf_money(thisp,zfflag)
  {
		
		var reg = /^-?\d*(\.)?\d+$/;
		if(thisp.value==""){
		return true;
		}else if (arr = thisp.value.match(reg))
		{
		//--------------------------------------------------
				 if(zfflag){//是否能充负值判断
						  if(thisp.value>0){
							  if(thisp.value*1.00>99999999.99){//不能超过8位数值
								alert("金额过大不于与受理");
								thisp.value="";
								thisp.focus();
								return false;
							   }else if(!CheckDotMoney(thisp.value)){
								thisp.value="";
								thisp.focus();
								return false;
							   }else{
								return true;
							   }	
						   }else if(thisp.value<0){
							   if(thisp.value*1.00<-99999999.99){//不能超过8位数值
								alert("金额过小不于与受理");
								 thisp.value="";
								 thisp.focus();
								return false;
							   }else if(!CheckDotMoney(thisp.value)){
								thisp.value="";
								thisp.focus();
								return false;
							   }else{
								return true;
							   }
						   }else {
									
								return true;
							   
						   }
				   
				  //-------------------------------------------------
				  }else{
						   if(thisp.value>0){
							  if(thisp.value*1.00>99999999.99){//不能超过8位数值
								alert("金额过大不于与受理");
								thisp.value="";
								thisp.focus();
								return false;
							   }else if(!CheckDotMoney(thisp.value)){
								thisp.value="";
								thisp.focus();
								return false;
							   }else{
								return true;
							   }	
						   }else if(thisp.value<0){
							   alert("不能输入负值");
							   thisp.focus();
							   return false;
						   }else {   //零的情总
			
								return true;  
								
						   }
				  } 
				//-------------------------------------------------
		   
		}else{
			alert("输入串为空或非金额数字");
			 thisp.value="";
			  thisp.focus();
			return false;
		}
   
  }
//动态增加行
//bywchai
function addOneRow1(tbname,source)
{
	var oRow;		 //行（TR）对象
	var oCell;		 //单元（TD）对象
   var nTbyRowNum; //总行数

   var tb = document.all(tbname);
   var id = document.all(source);
   if(id.rows.length <= 0) return;

   nTbyRowNum = tb.rows.length;

   oRow = tb.insertRow(-1);
   var cellsLength = tb.rows(0).cells.length;
	for(var i=0; i<cellsLength; i++)
   {
	  oCell = oRow.insertCell();
      oCell.innerHTML = id.rows(0).cells(i).innerHTML;
      //clearAreaValue(oCell,"");
	}

   //设置新增加行的序号值（第一列）
   tb.rows(nTbyRowNum).cells(0).childNodes.item(0).value = nTbyRowNum;
   
   //设置按钮的值  
   var cols = cellsLength - 1;   //最后一列
   t = id.rows(0).cells(cols).innerHTML;
   //var rule = /addOneRow1/g;  
   //var replaceText = "delOneRow";
   //t = t.replace(rule,replaceText);
   var row = nTbyRowNum;
   var pos1 = t.indexOf(")");
   t = t.substring(0,pos1) + "," + row + t.substring(pos1);
   tb.rows(row).cells(cols).innerHTML = t;
   //tb.rows(row).cells(cols).childNodes.item(0).value = '-';
  
}


//id为TABLE的id
//bywchai
function addOneRow(tbname)
{
	var oRow;		 //行（TR）对象
	var oCell;		 //单元（TD）对象
   var nTbyRowNum; //总行数

   var id = document.all(tbname);
   alert(id.rows.length);
   if(id.rows.length <= 0) return;

   nTbyRowNum = id.rows.length;
	oRow = id.insertRow(-1);

   var cellsLength = id.rows(0).cells.length;
	for(var i=0; i<cellsLength; i++)
   {
		oCell = oRow.insertCell();
      oCell.innerHTML = id.rows(nTbyRowNum - 1).cells(i).innerHTML;
      //clearAreaValue(oCell,"");
	}

   //设置新增加行的序号值（第一列）
   id.rows(nTbyRowNum).cells(0).childNodes.item(0).value = nTbyRowNum;
   
   //设置按钮的值
   var cols = cellsLength - 1;   //最后一列
   t = id.rows(nTbyRowNum - 1).cells(cols).innerHTML;
   var rule = /addOneRow/g;  
   var replaceText = "delOneRow";
   t = t.replace(rule,replaceText);

   var row = nTbyRowNum - 1;
   var pos1 = t.indexOf(")");
   t = t.substring(0,pos1) + "," + row + t.substring(pos1);

   id.rows(row).cells(cols).innerHTML = t;
   id.rows(row).cells(cols).childNodes.item(0).value = '-';
}

//id为TABLE的id，n为删除的记录号
//by wchai
function	delOneRow(tbname, n)
{
   var id = document.all(tbname);
   if(id.rows.length <= 0) return;

   if(confirm("确定要删除指定行吗？") == false) return;

   id.deleteRow(n);

   var nTbyRowNum = id.rows.length;
   if(nTbyRowNum <= 1)
   {
      return;
   }

   var cols = id.rows(0).cells.length;
   cols--;

   //该行以下各行号都减1
   for(k = n; k <= nTbyRowNum - 1; k++)
   {
      //设置行的序号（第一列）
      id.rows(k).cells(0).childNodes.item(0).value = k;

      //设置按钮的值（最后一列）
      t = id .rows(k).cells(cols).innerHTML;
      pos = t.indexOf("delOneRow");      
      if(pos != -1)
      {
         pos1 = t.indexOf(",");
         pos2 = t.indexOf(")");
         t = t.substring(0,pos1) + "," + k + t.substring(pos2);         
         id.rows(k).cells(cols).innerHTML = t;
      }
   }
}
//------------------------------产品订购开始------------------------------------------------------------------------------
var digits = "0123456789";

var sysPrompt = "[提示]\n";
var sysError = "[错误]\n";
var sysWarn = "请输入";
var sysWarnSelect = "请选择";


//-----------------------------以下为公共函数-----------------------------------------
//------------------------------------------------------------------------------------

///////////////////
//提示信息
///////////////////

//系统提示
function promptMsg(strMsg)
{
    alert(sysPrompt + strMsg);
    return;
}


///////////////////
//字符串过滤
///////////////////

function rtrim(str)
{
    var s = str;
    while (s.charAt(s.length-1) == " ")
    {
        s = s.substr(0, s.length-1);
    }

    while (s.charAt(s.length-1) == "　")
    {
        s = s.substr(0, s.length-1);
    }

    return s;
}

function ltrim(str)
{
    var s = str;
    while (s.charAt(0) == " ")
    {
        s = s.substr(1, s.length-1);
    }

    while (s.charAt(0) == "　")
    {
        s = s.substr(1, s.length-1);
    }

    return s;
}

function trim(str)
{
    return ltrim(rtrim(str));
}

//数字串
function isNumber(str)
{
    var allValid = true;

    for (i = 0;  i < str.length;  i++)
    {
        ch = str.charAt(i);
        for (j = 0;  j < digits.length;  j++)
            if (ch == digits.charAt(j)) break;

        if (j == digits.length)
        {
            allValid = false;
            break;
        }
    }

    return allValid;
}

function isNoSpecialSignal(str)
{    
    for (i = 0;  i < str.length;  i++)
    {
        ch = str.charAt(i);
        if(isNumber(ch) || ch == ',' ||ch == '.')
        {
        	continue;
        }
        else
        {
        	return false;
        }        		
    }
    return true;
}

function checkSpecialSignals2(formUnit,formUnitLabel)
{
    var field = formUnit.value;
    field = trim(field); //去掉前后空格   
    if(!isNoSpecialSignal(field))
    {
    	  // 修改提示信息 cupid yue 2006.12.14
        promptMsg(formUnitLabel + "只能由数字组成；编号之间的分隔符只能为',' 或 '.' 。");
        formUnit.focus();
        return false;            	
    }
    return true;
}


//检测编码,只允许数字与,.[如:123456,456789]
function checkSpecialSignals(obj,msg){
    str=Trim(obj.value);
    //alert(str);
    if(str.length>0){
        for(i=0;i<str.length;i++){
            if(!(    (str.charAt(i)>='0' && str.charAt(i)<='9') ||
                     (str.charAt(i)==',')
                 ))
            {
                alert(msg+"只能由数字组成；编号之间的分隔符只能为','。");
                return false;
            }
        } 
        //alert(str.charAt(str.length-1));
        if(str.charAt(str.length-1)==','){
         		alert(msg+"最后一位不能为','。");
                return false;
        }
    }
 	 	return true;
}


/*---------------------------------------------------------------------*/
//  方法名：CheckAgilitydiscount(obj, message)
//  描  述：用于检查输入的参数是否为1到100的整数
//  返回值：Boolean 如果为0到100的整数，则返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckAgilitydiscount(obj, message) {
		
		var str = Trim(obj.value);
		
		//不能为空
		if (str+"" == "" || str+"" == "undefined" || str == null){		     
    		alert(message + "必须为0~100的整数");
    		obj.focus();
    		return false;
    }	
    
    //只能为数字
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "必须为0~100的整数");
				    	obj.focus();
				    	return false;
					}
		}
		
		//必须为1-100的数字
    var intValue =  parseInt(str);
    if(intValue<0||intValue>100) {    	
    	alert(message + "必须为0~100的整数");
    	obj.focus();
    	return false;
    }else{
 				return true;   
    }
}

/*----------------------------------------------------------------------*/
//  方法名：CheckNotNegative(obj, message)
//  描  述：用于检查输入的参数是否为1到100的整数
//  返回值：Boolean 如果为0到100的整数，则返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckEquipAgilitydiscount(obj, message) {
		
		var str = Trim(obj.value);
		
		//不能为空
		if (str+"" == "" || str+"" == "undefined" || str == null){		     
    		alert(message + "必须为0~1000的整数");
    		obj.focus();
    		return false;
    }	
    
    //只能为数字
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "必须为0~1000的整数");
				    	obj.focus();
				    	return false;
					}
		}
		
		//必须为1-100的数字
    var intValue =  parseInt(str);
    if(intValue<0||intValue>1000) {    	
    	alert(message + "必须为0~1000的整数");
    	obj.focus();
    	return false;
    }else{
 				return true;   
    }
}

/*----------------------------------------------------------------------*/
//  CheckProductlevel(obj, message)
//  描  述：用于检查输入的参数是否为大于零的整数或者-1。
//  返回值：Boolean 如果为大于零的整数或者-1，则返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckProductlevel(obj, message) {
		
		var str = Trim(obj.value);
		
		//不能为空
		if (str+"" == "" || str+"" == "undefined" || str == null){		     
    		alert(message + "必须为大于零的整数");
    		obj.focus();
    		return false;
    }	
    
    //只能为数字或者"-"
		for(i=0;i<str.length;i++){
					if((str.charAt(i)<'0'&&str.charAt(i)!='-' )|| (str.charAt(i)>'9'&&str.charAt(i)!='-')){
							alert(message + "必须为大于零的整数");
				    	obj.focus();
				    	return false;
					}
		}
		
		var intValue =  parseInt(str);
    if(intValue<0&&intValue!=-1) {    
    //if(intValue<0) { 	
    	alert(message + "必须为大于零的整数");
    	obj.focus();
    	return false;
    }else{
 		return true;   
    }
}

///////////////////////////////////////////////////////////////////////////////////////
/**
*校验两个日期的先后（yyyy-MM-dd）by wchai
*返回值：
*如果其中有一个日期为空，校验通过,          返回true
*如果起始日期早于等于终止日期，校验通过，   返回true
*如果起始日期晚于终止日期，                 返回false    参考提示信息： 起始日期不能晚于结束日期。
*/
function checkDateEarlier2(strStart,strEnd)
{
    if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
        return false;
    //如果有一个输入为空，则通过检验
    if (( strStart == "" ) || ( strEnd == "" ))
        return true;
    var arr1 = strStart.split("-");
    var arr2 = strEnd.split("-");
    var date1 = new Date(arr1[0],parseInt(arr1[1].replace(/^0/,""),10) - 1,arr1[2]);
    var date2 = new Date(arr2[0],parseInt(arr2[1].replace(/^0/,""),10) - 1,arr2[2]);
    if(arr1[1].length == 1)
        arr1[1] = "0" + arr1[1];
    if(arr1[2].length == 1)
        arr1[2] = "0" + arr1[2];
    if(arr2[1].length == 1)
        arr2[1] = "0" + arr2[1];
    if(arr2[2].length == 1)
        arr2[2]="0" + arr2[2];
    var d1 = arr1[0] + arr1[1] + arr1[2];
    var d2 = arr2[0] + arr2[1] + arr2[2];
    if(parseInt(d1,10) > parseInt(d2,10))
       return false;
    else
       return true;
}
///////////////////////////////////////////////////////////////////////////////////////
/**
*校验两个日期的先后（yyyy-MM-dd）by wchai
*返回值：
*如果其中有一个日期为空，校验通过,          返回true
*如果起始日期早于等于终止日期，校验通过，   返回true
*如果起始日期晚于终止日期，                 返回false    参考提示信息： 起始日期不能晚于结束日期。
*/
function checkDateEarlier3(strStart,strEnd)
{
    if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
        return false;
    //如果有一个输入为空，则通过检验
    if (( strStart == "" ) || ( strEnd == "" ))
        return false;
    var arr1 = strStart.split("-");
    var arr2 = strEnd.split("-");
    var date1 = new Date(arr1[0],parseInt(arr1[1].replace(/^0/,""),10) - 1,arr1[2]);
    var date2 = new Date(arr2[0],parseInt(arr2[1].replace(/^0/,""),10) - 1,arr2[2]);
    if(arr1[1].length == 1)
        arr1[1] = "0" + arr1[1];
    if(arr1[2].length == 1)
        arr1[2] = "0" + arr1[2];
    if(arr2[1].length == 1)
        arr2[1] = "0" + arr2[1];
    if(arr2[2].length == 1)
        arr2[2]="0" + arr2[2];
    var d1 = arr1[0] + arr1[1] + arr1[2];
    var d2 = arr2[0] + arr2[1] + arr2[2];
    if(parseInt(d1,10) >= parseInt(d2,10))
       return false;
    else
       return true;
}
/*----------------------------------------------------------------------*/
//  方法名: isNotNull(obj)
//  描  述：用于检查输入的参数是否为空串
//  返回值：Boolean 如果空串false,否则返回true
//  参数说明：
//	obj 				待检查的表单对象，对象//  
/*-----------------------------------------------------------------------*/
function isNotNull(obj) {
		var str = Trim(obj.value);
		if (str+"" == "" || str+"" == "undefined" || str == null){
    		return false;
    }else{
    		return true;
   }
}

/*---------------------------------------------------------------------*/
//  方法名：CheckPositiveInt(obj, message)
//  描  述：用于检查输入的参数是否为正整数
//  返回值：Boolean 如果为正整数（可带+号）返回true,否则返回false
//  参数说明：
//	obj					待检查的表单对象，对象
//  message				待检查的表单对象的名称，字符串
/*-----------------------------------------------------------------------*/
function CheckPositiveInt(obj, message) {
		var str = obj.value;
		
		if(!isNotNull(obj)){
				return true;
		}
		
		//只能为数字
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "必须正整数");
				    	obj.focus();
				    	return false;
					}
		}
		
    var intValue =  parseInt(str);
    if( isNaN(intValue)||intValue<0) {
    	
    	alert(message + "必须为正整数");
    	obj.focus();
    	return false;
    }else{
 			return true;   
    }
}


/**************************
//  方法名：toDate(str) 
//  描  述：将制定格式的字符串转化为javascript中的日期类型
//  返回值：Date
//  参数说明：
//	str	  字符串日期 如:2007-11-14 21:12:01
***************************/
function toDate(str){
		var date = new Date();
		date.setFullYear(str.substring(0,4));
		date.setMonth(parseInt(str.substring(5,7),10) - 1);
		date.setDate(parseInt(str.substring(8,10),10));
		date.setHours(parseInt(str.substring(11,13),10));
		date.setMinutes(parseInt(str.substring(14,16),10));
		date.setSeconds(parseInt(str.substring(17,19),10));

		return date;	
}
/**************************
//  方法名：mathDate(str1,str2,message)
//  描  述：比较两个字符串表示的日期的大小,如果str1 < str2 则返回true
//  返回值：boolean
//  参数说明：
//	str1	  字符串日期 如:2007-11-14 21:12:01
//	str2	  字符串日期 如:2007-11-14 21:12:03
//	message	  如果返回false弹出的提示消息
***************************/
function mathDate(str1,str2,message){
	var date1 = toDate(str1);
	var date2 = toDate(str2);
	if(date1 >= date2){
		alert(message);
		return false;
	}
	
	return true;
}

/**
	验证手机号码 tjj 10.17
	str 控件名称
	num 验证类型 1电话(传真)号码 2手机号码
	flag 为空时是否验证 0不验证 1验证
*/
function checkNumStyle(str,num,flag){
	 var sReg ='';
	 var error='';
	 
	 if(num==1){
	  sReg ='^[0-9]{3,4}\-[0-9]{7,8}$';
	  error='电话号码或传真号码的格式不正确!';
	 }else if(num==2){
	  sReg ='^0{0,1}1[0-9]{10}$';
	  error='手机号码的格式不正确!';
	 }
	 
	 var obj=document.all(str);
	 var sVal = obj.value;
	 var reg = new RegExp(sReg,'g');
	 
	 if(flag==0){
	  	if(sVal==''){   
	  		return true;
	  	}else if(!reg.test(sVal)){
	   		//验证不通过,弹出提示error
	   		alert(error);
	   		obj.focus();
	   		return false;
	  	} 
	 }else if(!reg.test(sVal)){
	   //验证不通过,弹出提示warning
	   alert(error);
	   //该表单元素取得焦点,用通用返回函数
	   obj.value='';
	   obj.focus();
	   return false;
	 } 
	return true;
}
		

/**************************
//  方法名：textCounter(theField,maxLines,msg)
//  描  述：限制数量输入不要超过固定值
//  参数说明：
//	theField	  表单对象
//	maxLines	  输入限制最大行数
//	msg	  		  对象名称
***************************/
function check_custno_input(theField,maxLines,msg){
	var bmailsendtarget = theField;
	clearSuperabundanceBlankLine(theField);//清除存在的空行
	var tempAry = bmailsendtarget.value.split('\n');//将文本域通过回车换行符转换为数组，根据数组大小来判断输入的行数	   
//		   if (tempAry.length>maxLines)//如果输入超过1000个（含光标最后一行）
//		   {
		   		var nm=tempAry.length;
		   		if(Trim(tempAry[0])=='\n'||Trim(tempAry[0])=='\r'){
		   			nm=nm-1;
		   		}
		   		if(Trim(tempAry[tempAry.length-1])==""){
		   			nm=nm-1;
		   		}
		   		if(nm>maxLines)//如果输入超过1000个（含光标最后一行）
		   		{
			        theField.value="";
			        alert(msg+'输入不能大于'+maxLines+'个！');
			        return false;
			     }else{
			     	return true;
			     }
//		   }else{
//		        return true;	   
//		   }
}
///清除textArea中的空行----add by lij 20080521
function clearSuperabundanceBlankLine(theField) 
{       var bmailsendtarget = theField;	    
		k=bmailsendtarget.value ;
		k=trim(k);
		rgexp=/\r\n\s*?\r\n/m ;
		while(rgexp.test(k))k=k.replace(rgexp,"\r\n") 
//		k=k.replace(/(\r\n)+/g,"\r\n");
		bmailsendtarget.value=k;
} 
//用于校验参数设置当中代码位数不能小于两位且不能为00
function DigitValidate(obj,mess){
	var value = obj.value;
	var len = value.length;
	if(len <2 && len >0){
		alert(mess+'不能输入一位数字，请输入格式为0x，例如01');
		obj.focus();
		return false;
	}else if(value=='00' || value==0){
		alert(mess+'不能为0');
		obj.focus();
		return false;
	}else{
		return true;
	}
}
//用于校验参数设置当中代码不能以0开头
function zeroValidate(obj,mess){
	var value = obj.value;
	var firstOne = value.substring(0,1);
          if(firstOne == 0){
          	alert(mess+'不能以0开头');
          	return false;
          }else{
          	return true;
          }
}
//****2008-05-19:	
//****END	

//判断带小数的值的整数位和小数位的位数不能超过指定数
//inte：整数位长度；dec：小数位长度
//使用方法onblur="checkIntegerAndDecimalLength(this,'采伐面积',7,4);"
function checkIntegerAndDecimalLength(obj,msg,inte,dec){
	
	var numFlag=CheckNumber(obj.value);
	if(!numFlag){
	  alert("请输入正确的数字");
	  obj.value="";
	  return false;
	}else {
	
	 if(parseFloat(obj.value)==0){
	    alert("您录入的"+msg+"的值不能为零，请重新录入");
	    obj.value="";
	    return false;
	 }
	var value = obj.value.replace(/(^\s*)|(\s*$)/g,"");
	
		var arr = new Array();
		var dot_pos=0;
		if(value.match(/^([0-9]\d*)$/)){
			if(value.length > inte){
				alert(msg+'输入的值整数位长度不能大于'+inte+'位');
				obj.value="";
				obj.focus();
				return false;
			}
		}else{
			if(value.match(/^(0|[1-9]\d*)\.(\d+)$/)){
				arr=value.split('.');
				if(arr[0].length > inte){
				alert(msg+'输入的值整数位长度不能大于'+inte+'位');
				obj.value="";
				obj.focus();
				return false;
				}
				if(arr[1].length > dec){
					alert(msg+'输入的值小数位长度不能大于'+dec+'位');
					obj.value="";
					obj.focus();
					return false;
				}
			}else{
			
				if(value.length>0){
					    alert(msg+'输入的值不是小数');
						obj.value="";
						obj.focus();
						return false;
				}
			}
		}
		
		return true;
		}
}
	//判断是不是中文，如果不是中文自动舍取
	function checkChinese(obj){
    	obj.value=obj.value.replace(/[^\u4E00-\u9FA5]/g,'')
    
    }
    function clipboardChinese(){
    	clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''));
    }
    //按回车键到下一个文本框
	 function   enterkey()   
	  {   
	  if(event.keyCode==13   &&   event.srcElement.type   !="BUTTON"   &&   event.srcElement.type!="SUBMIT")   
	        event.keyCode=9;   
	  }  
	  //点击查询，导出报表按钮可用！
	  //state为true 或者是 false
	  function ShowAble(state){
				document.getElementById('excel').disabled = state;
	  }
	  
	  //set the table div's width and height
	  function setTableDiv(width,height){
	  	var scrollDiv = document.getElementById("scrollDiv");
		if (scrollDiv != null){
			scrollDiv.style.width=width;
			scrollDiv.style.height=height;
		}
	  }
/*
*方法说明：格式化数字
*参数说明：srcStr 要格式化的数字,nAfterDot要保留的小数位数
*作者：曹振海  日期：2009年11月23日
*/
function FormatNumber(srcStr,nAfterDot){
  var srcStr,nAfterDot;
  var resultStr,nTen;
  srcStr = ""+srcStr+"";
  strLen = srcStr.length;
  dotPos = srcStr.indexOf(".",0);
  if (dotPos == -1){
    resultStr = srcStr+".";
    for (i=0;i<nAfterDot;i++){
      resultStr = resultStr+"0";
    }
  }
  else{
    if ((strLen - dotPos - 1) >= nAfterDot){
      nAfter = dotPos + nAfterDot + 1;
      nTen =1;
      for(j=0;j<nAfterDot;j++){
        nTen = nTen*10;
      }
      resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
    }
    else{
      resultStr = srcStr;
      for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
        resultStr = resultStr+"0";
      }
      
    }
  }
 return resultStr;
}
	  