var isRemainder=0;//�Ƿ���ʣ����֪ͨ��
var remainderData; //ʣ����֪ͨ���������Ϣ

 var http_request = false;
             var optionValue="";
            function send_request(url) {//��ʼ����ָ������������������ĺ���
            http_request = false;
               if (window.XMLHttpRequest) { // Mozilla�����
                   http_request = new XMLHttpRequest();
                   if (http_request.overrideMimeType) {
                       http_request.overrideMimeType('text/xml');//����MIME���
                   }
               } else if (window.ActiveXObject) { // IE �����
                   try {
                       http_request = new ActiveXObject("Msxml2.XMLHTTP");
                       http_request.overrideMimeType('text/xml');//����MIME���
                   } catch (e) {
                       try {
                       http_request = new ActiveXObject("Microsoft.XMLHTTP");
                       } catch (e) {}
                   }
               }
                if (!http_request) {//�쳣����������ʵ��ʧ��
                    alert('Giving up :( ��������ʵ��ʧ��');
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
                        alert('���������ҳ��������');
                    }
                }
            }
   


  function CheckNullPrice(obj, message,flag,objselect,nextValue) {
		
		 if(obj.readOnly==false)
	  { 
	  
		var str = Trim(obj.value); 
		//addby zhangc
		if (str+"" == "" || str+"" == "undefined" || str == null || str == "~!"){		     
    		alert(message + "����");
    		obj.value="";
    		
    		obj.focus();
    		return false;
    	}
		else if(str.indexOf("'")!=-1)
		{
			alert(message+"�в��ܺ����ַ�'");
			return false;		
		}
		else if(str.indexOf("��")!=-1)
		{
			alert(message+"�в��ܺ����ַ���");
			return false;		
		}
		else if(str.indexOf("%")!=-1)
		{
			alert(message+"�в��ܺ����ַ�%");
			return false;		
		}
		else{
		
		 if(flag==0)
		 {
    	
    		getAboutPriceValue(obj.id,obj.value,objselect,nextValue); //Ϊ0ʱ�����Ƿ�Ϊ���ַ���
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
    		alert(message + "����");
    		obj.value="";
    		
    		obj.focus();
    		return false;
    	}
		else if(str.indexOf("'")!=-1)
		{
			alert(message+"�в��ܺ����ַ�'");
			return false;		
		}
		else if(str.indexOf("��")!=-1)
		{
			alert(message+"�в��ܺ����ַ���");
			return false;		
		}
		else if(str.indexOf("%")!=-1)
		{
			alert(message+"�в��ܺ����ַ�%");
			return false;		
		}
		else{
		
		 if(flag==0)
		 {
    	
    		getAboutPriceValueOfNotice(obj.id,obj.value,objselect,nextValue); //Ϊ0ʱ�����Ƿ�Ϊ���ַ���
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
 
 
    //����AJAX���ص���Ϣ ALL
    function setSelectObj(obj) 
    {
    if(obj=="sessionNull") {
    	parent.location="userLogin.jsp";
    	return;
    }
      var values=obj.split('@');    
      var state=values[0]; 
    
      if(state=="orderNum") //����ϵͳ�������
      { 
        getorderNumDataComm(obj);  
      }else if(state=="checkPrice")//��֤�۸����
      {
          checkPriceComm(values);
      }else if(state=="liandong")//��������
      {
         
         getLiandongDataComm(obj);
      
      }else if(state=="checkOrderNumber")//��������
      {
       
         checkOrderNumber(values[1]);
      
      }else if(state=="storeOrderNum") //��ľϵͳ�����ѯ����
      { 
       
        getListData(obj);  
      }else if(state=="selectCustomer") //֪ͨ��ͻ���ѯ
      { 
         
        getCustomerDataForNotice(obj);
      }else if(state=="checkIsSame") //��ʼ����汨���Ƿ��ظ�
      { 
       
        getInitStoreIsSame(values);
      }else if(state=="selectOrderNumber") //֪ͨ��ͻ���ѯ
      { 
         
        getSelectOrderNumber(values);
      }else if(state=="deceiptPlace") //�㳡��Ź���
      { 
         
        getLiandongDataComm(obj);
      }else if(state=="selectWoodReserve") //֪ͨ���ѯ���
      { 
         
        getWoodReservResult(obj);
      }else if(state=="getDeceiptNum") //�㳡��Ź���������Ͽ�ʱʹ��
      { 
      
        getDeceiptNumData(obj);
      }else if(state=="selectTrainPoleLength") 
      { 
        
        selectTrainPoleLengthReturn(obj);
      }else if(state=="getWoodBranchPrice") 
      { 
        
        getWoodBranchPriceValue(obj);
      }else if(state=="notice")			//֪ͨ���ӡʱ��֤�Ƿ��ѯ�����
      {
      	selectResult(obj);
      }
      else if(state=="selectRelationData")			//֪ͨ���ӡʱ��֤�Ƿ��ѯ�����
      {
      	getRelationData(obj);
      } else if(state=="selectRelationDataUpdate")			//֪ͨ���ӡʱ��֤�Ƿ��ѯ�����
      {
      	selectRelationDataUpdate(obj);
      }else if(state=="checkPriceRfid")//��֤�۸����
      {
          checkPriceCommRfid(values);
      }else if(state=="maxOrderNum")		//֪ͨ�鲹¼ȡ�õ����
      {
      	 setMaxOrder(values[1]);
      }else if(state=="getLdData")//��ľ����
      {
          
          getLdData(obj);
      }
      else
      {
       
         getDataComm(obj);
      }
      
 }


	//ʱ��Ƚ�
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
//  ������: checkOnlyNum(obj, name,len)
//  ��  �������ڼ����������м�λ,������Ϊ��
//  ����ֵ�����������ַ�������len����������ص������
//  ����˵����
//	obj				�����ı����󣬶���
//  name			�����ı���������Ӧ�����ƣ��ַ���
//  len             ��������ַ�����	
//	david
/*-----------------------------------------------------------------------*/
function checkOnlyNum(obj,name,len){
		 var str=obj.value;
		 if(str.length==len||str.length==0){
		 	
		 }else{
		 	alert(name+'Ϊ'+len+'λ����');
		 	obj.focus();
		 }
		
	}
function numberCheck(obj)//ֻ�������ּ�С����ֻ�ܳ���һ��
{

 //�Ȱѷ����ֵĶ��滻�����������ֺ�.
obj.value = obj.value.replace(/[^\d.]/g,"");
//���뱣֤��һ��Ϊ���ֶ�����.
obj.value = obj.value.replace(/^\./g,"");
//��ֻ֤�г���һ��.��û�ж��.
obj.value = obj.value.replace(/\.{2,}/g,".");
//��֤.ֻ����һ�Σ������ܳ�����������
obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");


}

function CharHCheck(obj)//ֻ���Ǻ��ֺ�С����
{

 obj.value=obj.value.replace(/[^\u4E00-\u9FA5\.]/g,'');

} 
function CharCheck(obj)//ֻ����Ӣ���ַ�
{

 obj.value=obj.value.replace(/[\W]/g,"");

}  

function charHNumber(obj){	//ֻ�������֣����֣��ַ�
	var regex=/[^\w\u4E00-\u9FA5]/g;
	if(regex.test(obj.value)){
		obj.value = obj.value.replace(/[^\w\u4E00-\u9FA5]/g,"");
	}
}

function CharAndNumberCheck(obj)//
{
  
 obj.value=obj.value.replace(/[\W]/g,"");

} 
function numberCheckNOChar(obj)//ֻ��������
{
 obj.value=obj.value.replace(/[^0-9]/gi,"");

} 
 function numberCheckIs(obj)//�Ƿ񰴵Ļس�����Ͽ�ʱ����
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
  function numberCheckNOCharYjw(obj)//ֻ�������֣���Ͽ�ʱ����
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
  
  //�õ�����
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
//  ������: onlyNum()
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ����
//  ����ֵ��
//  ����˵����
/*-----------------------------------------------------------------------*/


 function onlyNum(){
       if (!(((window.event.keyCode>=48) && (window.event.keyCode<=57))||(window.event.keyCode==13)))
        {
           window.event.keyCode=0;
        }
 }
 
/*----------------------------------------------------------------------*/
//  ������: numAndDot()
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ����,С����
//  ����ֵ��
//  ����˵����
/*-----------------------------------------------------------------------*/
function numAndDot(){
      if (!(((window.event.keyCode>=48) && (window.event.keyCode<=57))||(window.event.keyCode==13)||(window.event.keyCode==46)))
       {
       window.event.keyCode=0;
       }
}
//�������Ĳ���Ϊ��λ����һλС��
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
//  ������: CheckNull(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ�մ�
//  ����ֵ��Boolean ����մ�false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���
//  messgae				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckNull(obj, message) {
		var str = Trim(obj.value); 
		//addby zhangc
		if (str+"" == "" || str+"" == "undefined" || str == null || str == "~!"){		     
    		alert(message + "����");
    		
    		
    		obj.focus();
    		return false;
    	}
		else if(str.indexOf("'")!=-1)
		{
			alert(message+"�в��ܺ����ַ�'");
			return false;		
		}
		else if(str.indexOf("��")!=-1)
		{
			alert(message+"�в��ܺ����ַ���");
			return false;		
		}
		else if(str.indexOf("%")!=-1)
		{
			alert(message+"�в��ܺ����ַ�%");
			return false;		
		}else if(str.indexOf("��")!=-1)
		{
			alert(message+"�в��ܺ����ַ���");
			return false;		
		}else if(str.indexOf("��")!=-1)
		{
			alert(message+"�в��ܺ����ַ���");
			return false;		
		}else if(str.indexOf('"')!=-1)
		{
			alert(message+'�в��ܺ����ַ�"');
			return false;		
		}else{
    		return true;
    	}
}
/*----------------------------------------------------------------------*/
//  ������: CheckCh(obj, message)
//  ��  �������ڼ������������Ĳ����Ƿ�Ϊ�Ƿ��ַ�
//  ����ֵ��Boolean ����մ�false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���
//  messgae				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckCh(obj, message) 
{ 
	var str = Trim(obj.value);
	if(str.indexOf("-")!=-1)
	{
		alert(message+"�в��ܺ����ַ�-'");
		return false;		
	}
	else if(str.indexOf("*")!=-1)
	{
		alert(message+"�в��ܺ����ַ�*");
		return false;		
	}
	else if(str.indexOf("^")!=-1)
	{
		alert(message+"�в��ܺ����ַ�^");
		return false;		
	}
	else if(str.indexOf("(")!=-1)
	{
		alert(message+"�в��ܺ����ַ�(");
		return false;		
	}
	else if(str.indexOf(")")!=-1)
	{
		alert(message+"�в��ܺ����ַ�)");
		return false;		
	}
	else if(str.indexOf("-")!=-1)
	{
		alert(message+"�в��ܺ����ַ�-");
		return false;
	}
	else if(str.indexOf("@")!=-1)
	{
		alert(message+"�в��ܺ����ַ�@");
		return false;
	}
	else if(str.indexOf("!")!=-1)
	{
		alert(message+"�в��ܺ����ַ�!");
		return false;
	}
	else if(str.indexOf("$")!=-1)
	{
		alert(message+"�в��ܺ����ַ�$");
		return false;
	}
	else if(str.indexOf("#")!=-1)
	{
		alert(message+"�в��ܺ����ַ�#");
		return false;		
	}
	else if(str.indexOf("&")!=-1)
	{
		alert(message+"�в��ܺ����ַ�&");
		return false;		
	}
	else if(str.indexOf("?")!=-1)
	{
		alert(message+"�в��ܺ����ַ�?");
		return false;		
	}
	else if(str.indexOf("<")!=-1)
	{
		alert(message+"�в��ܺ����ַ�<");
		return false;
	}
	else if(str.indexOf(">")!=-1)
	{
		alert(message+"�в��ܺ����ַ�>");
		return false;
	}
	else if(str.indexOf("��")!=-1)
	{
		alert(message+"�в��ܺ����ַ���");
		return false;
	}
	else if(str.indexOf("��")!=-1)
	{
		alert(message+"�в��ܺ����ַ���");
		return false;		
	}
	else if(str.indexOf("��")!=-1)
	{
		alert(message+"�в��ܺ����ַ���");
		return false;		
	}
	else if(str.indexOf("��")!=-1)
	{
		alert(message+"�в��ܺ����ַ���");
		return false;		
	}
	else if(str.indexOf("��")!=-1)
	{
		alert(message+"�в��ܺ����ַ���");
		return false;		
	}
	else if(str.indexOf("/")!=-1)
	{
		alert(message+"�в��ܺ����ַ�/");
		return false;		
	}
	else if(str.indexOf("\\")!=-1)
	{
		alert(message+"�в��ܺ����ַ�\\");
		return false;		
	}
	else if(str.indexOf("��")!=-1)
	{
		alert(message+"�в��ܺ����ַ���");
		return false;		
	}else if(str.indexOf("+")!=-1)
	{
		alert(message+"�в��ܺ����ַ�+");
		return false;		
	}
	else{
   		return true;
   	} 
}
/*----------------------------------------------------------------------*/
//  ������: CheckStr(obj, str)
//  ��  �������ڼ����������Ƿ��зǷ��ַ�
//  ����ֵ��Boolean ��������Ƿ��ַ�����false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���
//  messgae				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function checkStr(obj,str){
		  if(!(/^(?:[\u4e00-\u9fa5]*\w*\s*)+$/.test(obj.value))){
		   alert(str+"�����зǷ��ַ�");
		   obj.focus();
		   return false;
		  }else{
		  	return true;
		  }
   }
/*----------------------------------------------------------------------*/
//  ������: CheckLong(obj, message)
//  ��  �������ڼ������������Ĳ��������Ƿ�Ϸ�
//  ����ֵ��Boolean ����մ�false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���
//  messgae				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckLong(obj, message) 
{
	var str = Trim(obj.value); 
	if(str.length > 3)
	{
		alert(message+"���Ȳ��ܳ���3���ַ�");
		return false;		
	}
	else{
   		return true;
   	} 
}
/*----------------------------------------------------------------------*/
//  ������: CheckService_name(obj, message) 
//  ��  �������ڼ������������Ĳ��������Ƿ�Ϸ�
//  ����ֵ��Boolean ����մ�false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���
//  messgae				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/

function CheckService_name(obj, message) 
{
	var str = Trim(obj.value); 
	if(str.length > 40)
	{
		alert(message+"���Ȳ��ܳ���40���ַ�");
		return false;		
	}
	else{
   		return true;
   	}
}
/*
	�ж�IP�Ƿ���ȷ
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
		alert(message+"��ʽ����ȷ");
		return false;
	}
	
	return flag;
}
/*----------------------------------------------------------------------*/
//  ������: CheckSelectItemNull(object, message)
//  ��  �������ڼ������������Ĳ����Ƿ�Ϊ�մ�
//  ����ֵ��Boolean ����մ�false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���
//  messgae				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckSelectItemNull(object,message){
	var str=object.value;
	if(  str+""=="undefined" || str==null || str=="" || str=="~!"){
		alert ("��ѡ��:"+message);
		object.focus();
		return false;
	}else{
		return true;
	}
}

/*----------------------------------------------------------------------*/
//  ������: CheckNum(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ�Ϸ�����
//  ����ֵ��Boolean ���Ϊ���֣��ɴ�+,-�ţ�����true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckNum(obj, message) {
	var str = obj.value;
	// ȥ��ǰ��ո�
	str = str.replace(/^\s*/,"").replace(/\s*$/,"");
    //var intValue =  parseFloat(str);
    if( isNaN(str)) {
    	
    	alert(message + "����Ϊ����");
    	obj.focus();
    	return false;
    }else{
    	obj.value=str;// ��ȥ���ո���ֵ���ظ���ǩ
 		return true;
    }
}


/*----------------------------------------------------------------------*/
//  ������: CheckInt(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ������
//  ����ֵ��Boolean ���Ϊ�������ɴ�+,-�ţ�����true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckInt(obj,message) {
	var str = obj.value;
	if (str+"" == "" || str+"" == "undefined" || str == null)
	{
    	
    	alert(message + "����");
    	obj.focus();
    	return false;
  }
	str=Trim(str);
	if(JHshStrLen(str)!=str.length)//�ж��Ƿ�str�к�������
  {
    	
    	alert(message + "����Ϊ����");
    	obj.focus();
    	return false;
  }
  	
  var intValue =  parseInt(str);
  var tmpValue=intValue+"";
  if(tmpValue.length!=str.length)
  {
    	alert(message + "����Ϊ����");
    	obj.focus();
    	return false;
  }
   if(intValue>2147483647||intValue<-2147483647){
   		alert(message + "����Ϊ��-2147483647��2147483647֮��");
    	obj.focus();
    	return false;
   }
  if( isNaN(intValue)) {
    	
    	alert(message + "����Ϊ����");
    	obj.focus();
    	return false;
  }else{
 			return true;   
  }
}

//�Ƚ���������ֵ�Ĵ�С�����ǰ���ֵС�ڻ���ں����ֵ����Ϊtrue,����Ϊfalse;

function CheckIntNumberBigger(strStart,strEnd,startName,endName){
	var iStart=parseInt(strStart);
	var iEnd=parseInt(strEnd);

	if(iStart<iEnd)
		return true;
	else
	{
		alert(startName+"����С��"+endName);
		return false; 
	}
}



/*----------------------------------------------------------------------*/
//  ������: CheckFloat(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ�Ϸ����������������Ϊ������תΪ������
//  ����ֵ��Boolean ���Ϊ���������ɴ�+,-�ţ�����true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���

/*-----------------------------------------------------------------------*/
function CheckFloat(obj, message) {
	var str = obj.value;
	if(!str.match(/^(\d+\.\d+|\d+)$/)){
		alert(message + "����ΪС��������");
    	obj.focus();
    	return false;
	}
    var intValue =  parseFloat(str);
    if( isNaN(intValue)) {
    	
    	alert(message + "����ΪС��������");
    	obj.focus();
    	return false;
    }else{
 		return true;   
    }
    
    return true;
}
/*---------------------------------------------------------------------*/
//  ��������CheckNotNegative(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ�Ǹ���
//  ����ֵ��Boolean ���Ϊ�Ǹ������ɴ�+�ţ�����true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckNotNegative(obj, message) {
		var str = obj.value;
		
		//ֻ��Ϊ����
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "����Ϊ�Ǹ�����");
				    	obj.focus();
				    	return false;
					}
		}
		
    var intValue =  parseInt(str);
    if( isNaN(intValue)||intValue<0) {
    	
    	alert(message + "����Ϊ�Ǹ�����");
    	obj.focus();
    	return false;
    }else{
 		return true;   
    }
}
/*---------------------------------------------------------------------*/
//  InputNumberOnly()
//  ��  ����ֻ�������������ַ�
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
//  ��  ����ֻ�������������ַ���С����
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
//  ��  �������enter���Ƿ񱻰���
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


//��������Ƿ�����Ϸ�
function isLeapYear(year) 
{ 
 if((year%4==0&&year%100!=0)||(year%400==0)) 
 { 
 return true; 
 }  
 return false; 
} 

//�ж�ʱ���Ƿ���ȷ
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
          		alert("����������!��ʽΪ(yyyy-mm-dd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
          		checktext.focus();
          		return false;
       		}
      
       		month=timedata[1];
       		if(isNaN(month)==true){
          		alert("����������!��ʽΪ(yyyy-mm-dd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
          		checktext.focus();
          		return false;
       		}
     
      		day=timedata[2];
      		if(isNaN(day)==true){
        		alert("����������!��ʽΪ(yyyy-mm-dd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
        		checktext.focus();
        		return false;
      		}
    
     		if(month<1||month>12) { 
          		alert("�·ݱ�����01��12֮��!"); 
          		checktext.focus();
         		return false; 
      		} 
     		if(day<1||day>31){ 
         		alert("���ڱ�����01��31֮��!");
         		checktext.focus(); 
         		return false; 
     		}else{
    			if(month==2){  
     				if(isLeapYear(year)&&day>29){ 
       					alert("���·����ڱ�����01��29֮��!"); 
        				checktext.focus();
         				return false; 
       				}       
       				if(!isLeapYear(year)&&day>28){ 
         				alert("���·����ڱ�����01��28֮��!");
         				checktext.focus(); 
         				return false; 
       				} 
      			} 
       			if((month==4||month==6||month==9||month==11)&&(day>30)){ 
        			alert("���ģ������ţ�ʮһ�·� \n���ڱ�����01��30֮��!");
       				checktext.focus(); 
        			return false; 
      			} 
   		}
   		event.keyCode=9;
   		ret=true;
   		
   		
 	}else{
      		alert("���ڳ��Ȳ���ȷ!��ʽΪ(yyyy-mm-dd) \n���磺2004-05-18 ��ʾ2004��5��18�ţ�");
   		checktext.focus();
   		return false;
 
 	}
 	 
}
//Ϊ��
else{
  	alert("����������!��ʽΪ(yyyymmdd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
  	checktext.focus();
  	return false;
 }
 
 return ret;
}

//������Ƿ�Ϊ��
function isRightDate1(checktext){
var datetime;
var year,month,day;
var ret=false;

if(Trim(checktext.value)!=""){
   datetime=Trim(checktext.value);
   if(datetime.length==8){
       		year=datetime.substring(0,4);
       		if(isNaN(year)==true){
          		alert("����������!��ʽΪ(yyyymmdd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
          		checktext.focus();
          		return false;
       		}
      
       		month=datetime.substring(4,6);
       		if(isNaN(month)==true){
          		alert("����������!��ʽΪ(yyyymmdd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
          		checktext.focus();
          		return false;
       		}
     
      		day=datetime.substring(6,8);
      		if(isNaN(day)==true)
      		{
        		alert("����������!��ʽΪ(yyyymmdd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
        		checktext.focus();
        		return false;
      		}
    
     		if(month<1||month>12) { 
          		alert("�·ݱ�����01��12֮��!"); 
          		checktext.focus();
         		return false; 
      		} 
     		if(day<1||day>31){ 
         		alert("���ڱ�����01��31֮��!");
         		checktext.focus(); 
         		return false; 
     		}else{
    			if(month==2){  
     				if(isLeapYear(year)&&day>29){ 
       					alert("���·����ڱ�����01��29֮��!"); 
        				checktext.focus();
         				return false; 
       				}       
       				if(!isLeapYear(year)&&day>28){ 
         				alert("���·����ڱ�����01��28֮��!");
         				checktext.focus(); 
         				return false; 
       				} 
      			} 
       			if((month==4||month==6||month==9||month==11)&&(day>30)){ 
        			alert("���ģ������ţ�ʮһ�·� \n���ڱ�����01��30֮��!");
       				checktext.focus(); 
        			return false; 
      			} 
   		}
   		
   		ret=true;
   		
   		
 	}else{
      		alert("���ڳ��Ȳ���ȷ!��ʽΪ(yyyymmdd) \n���磺20040518 ��ʾ2004��5��18�ţ�");
   		checktext.focus();
   		return false;
 
 	}
 	 
}
//Ϊ��
else{
  	
  	return true;
 }
 
 
 return ret;
}

//�������Ĳ����Ƿ�Ϊ�Ϸ�������, ����true or false
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

// �����������Ƿ�Ϊ�Ϸ������֤���룬��18λ���֤����λ��У���β��У�飬��15λ���ֻ֤����λ��У��
// 18λ���֤����ο� GB 11643
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
		
		alert("��Ч��֤������:" + sID);
		object.focus();
	}
    return rc;
}
//������Ƿ�Ϊ��
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
		
		alert("��Ч��֤������:" + sID);
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
			
			alert(desc + "���ڱ���");	
			yearObj.focus();
			return false;
		}else{
			return true;
		}
	}

	if (year+"" == "undefined" || year.length == 0){
		
		alert(desc + "���ڸ�ʽ����ȷ:ȱ����");	
		yearObj.focus();
		rc=false;
	}
	else if (month+"" == "undefined" || month.length == 0){
		
		alert(desc + "���ڸ�ʽ����ȷ:ȱ����");	
		monthObj.focus();
		rc=false;
	}
	else if (day+"" == "undefined" || day.length == 0){
		
		alert(desc + "���ڸ�ʽ����ȷ:ȱ����");	
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
			
			alert(desc + "���С��1900��");	
			yearObj.focus();
			rc=false;
		}else if(year>2100){
			
			alert(desc + "��ݴ���2100��");	
			yearObj.focus();
			rc=false;
		}
		else if(month<1){
			
			alert(desc + "�·�С��1��");	
			monthObj.focus();
			rc=false;
		}else if(month>12){
			
			alert(desc + "�·ݴ���12��");	
			monthObj.focus();
			rc=false;
		}
		else if((day<1)||(day>monthMax[month])){
			
			alert(desc + "��"+month+"�µ�����"+day+"����ȷ");
			dayObj.focus();	
			rc=false;
		}
		else if((month==2)&&(day==29)){
			if(year%4!=0){
				
				alert(desc + "�������꣬2�·�û��29��");	
				yearObj.focus();
				rc=false;
			}
		}
	}
    return rc;
}



//�����������Ƿ�Ϊ�Ϸ���email��ַ
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
	    
        alert("Email�ĸ�ʽ����ȷ:" +str);
        object.focus();
        return false;
  }
  return true;
}

//���绰�����Ƿ���ȷʵ��
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
//���绰����
function CheckTelphone(object, msg) {
	var str = object.value;
	if (str+"" == "undefined" || str.length == 0){
		
		return true;
	}
	
	if(CheckTelephoneImpl(str)) {
		return true;
	}else{
		
        alert( msg + "��ʽ����ȷ:" +str);
        object.focus();
		return false;
	}
}


//��鴫��绰����
function CheckFax(object, msg) {
	var str = object.value;
	if (str+"" == "undefined" || str.length == 0){
		return true;
	}
	
	if(CheckTelephoneImpl(str)) {
		return true;
	}else{
		
        alert(msg + "��ʽ����ȷ:" +str);
        object.focus();
		return false;
	}
}

//����������ݳ���
function LTrim(str){
	if (str.charAt(0) == " "){
		//����ִ���ߵ�һ���ַ�Ϊ�ո�
		str = str.slice(1);//���ո���ִ���ȥ��
		//��һ��Ҳ�ɸĳ� str = str.substring(1, str.length);
		str = LTrim(str); //�ݹ����
	}
	return str;
}

//ȥ���ִ��ұߵĿո�
function RTrim(str) {
	var iLength;

	iLength = str.length;
	if (str.charAt(iLength - 1) == " "){
		//����ִ��ұߵ�һ���ַ�Ϊ�ո�
		str = str.slice(0, iLength - 1);//���ո���ִ���ȥ��
		//��һ��Ҳ�ɸĳ� str = str.substring(0, iLength - 1);
		str = RTrim(str); //�ݹ����
	}
	return str;
}

//ȥ���ִ����ߵĿո�
function Trim(str){
	return LTrim(RTrim(str));
}
/**
* created by chengjw on 2007-11-08
* У���ֻ�����
*��
*/
function CheckmobileNo(obj,str){
	//alert(obj.value);
	if(Trim(obj.value)+""==""){
		return true;
	}else{
		if(Trim(obj.value).length!=11){
			alert(str+"���Ȳ���ȷ");
			obj.focus();
			return false;
		}
		else if (Trim(obj.value.substring(0,1))+""!="1"){
			alert(str+"Ӧ����1��ͷ");
			obj.focus();
			return false;
		}else
		return true;
	}
}
// ������ݳ���
function CheckInputLen(inputObj,str,len) {
	if( CheckNull(inputObj, str)) {
		var minLen=Trim(inputObj.value).length;
		if(minLen>len){
			alert(str+"�������ݳ��ȴ���"+len);
			inputObj.focus();
			return false;
		}else{
			return true;
		}
	}
}


//����ַ�������
//@param s:ԭ�ַ�������
//@param c:Ԫ�ַ�����Ҫ������ַ�
//@param rep:�滻���ַ�
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
//�ƶ��б��е�������
//fromList: ����Դ�б�
//toList :Ŀ���б�
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
	          alert("<"+fromList[i].text+">"+"�Ѿ����ڷ����б���");
	          break;
	       }
	     
	   }
   }
   doClearSelItem(fromList);
   
}
//����б���ѡ���������
function doClearSelItem(fromList){
    var i;
    var selLen = 0;//ͳ�Ƽ���
    //ͳ��ѡ�������
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

//ѡ�������б���
function doSelAllItem(list){
    var i;
	for(i= 0;i<list.length;i++){
	  list[i].selected = true;
	}
}



//�ж�ֵΪvalue��ֵ�Ƿ���Ŀ���б�toList��
function isinlist(toList,name){
    var i;
	for (i; i < toList.length; i++){
		if (toList[i].value == name){
			return true;
		}
	}

	return false;
}

//��fromList���������ƶ���toList�б���
function doMoveAllItem(fromList,toList){
    doSelAllItem(fromList);
	doMoveItem(fromList,toList);
	
}

//ɾ��list�б��е�������
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

//�ж�IE�汾�رմ���
//IE 5.5 ��������ϵͳAPI�ر�
//IE 5.5 ��������Ϊ���ڶ���һ����,Ȼ��CLOSE
//���������ֱ�� window.close();
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

//���������б����ƣ�����ѡ����
function doFindItem(obj,text){
   var contents=text;
   for(i=0;i<obj.length;i++){
	if(obj.options[i].text.indexOf(contents)!=-1){
	   obj.options[i].selected=true;
	   break;
     }
  }   
}

//�ж��Ƿ�Ϊ��׼�����ڸ�ʽ,��2006-02-08
function isDateString(sDate,txtName)
{  
	var iaMonthDays = [31,28,31,30,31,30,31,31,30,31,30,31];
    var iaDate = new Array(3);
    var year, month, day;

    iaDate = sDate.toString().split("-");

    if (iaDate.length != 3)
	{
		alert(txtName+"�ĸ�ʽ���ԣ���������ȷ�ĸ�ʽ��2000-01-01");
		return false;
	}
    if (iaDate[1].length > 2 || iaDate[2].length > 2)
    {
		alert(txtName+"�ĸ�ʽ���ԣ���������ȷ�ĸ�ʽ��2000-01-01");
		return false;
	}

    year = parseFloat(iaDate[0]);
    month = parseFloat(iaDate[1]);
    day=parseFloat(iaDate[2]);

    if (year < 1900 || year > 2100 || year == null)
    {
		alert(txtName+"�ĸ�ʽ���ԣ���������ȷ�ĸ�ʽ��2000-01-01");
		return false;
	}
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1]=29;
    if (month < 1 || month > 12 || month == null)
    {
		alert(txtName+"�ĸ�ʽ���ԣ���������ȷ�ĸ�ʽ��2000-01-01");
		return false;
	}
    if (day < 1 || day > iaMonthDays[month - 1] || day == null)
	{
		alert(txtName+"�ĸ�ʽ���ԣ���������ȷ�ĸ�ʽ��2000-01-01");
		return false;
	}
	
    return true
}

//ѡ�����ں��� 
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

//�Ƚ����ڴ�С����,���ǰ������
//С�ں������ڣ���Ϊtrue,����Ϊfalse;
function checkDateEarlier(strStart,strEnd,startName,endName){
    //�����һ������Ϊ�գ���ͨ������
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
		alert(startName+"����С��"+endName);
        return false;
	}
    else
       return true;
}

//ֻ�������������ַ�
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

//ֻ�������������ַ���С����
function floatNumber() {
    var key = window.event.keyCode;
    if( ( key > 47 && key < 58 )|| (key==46)){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    }
}

//ֻ���������ַ�
function charsOnly() {
    var key = window.event.keyCode;
    if( key > 64 && key < 123 ){
   		window.event.returnValue = true;
    }else{
    	window.event.returnValue = false;
    }
}

//�������������ַ�����
function charsShuru() {
    var key = window.event.keyCode;
    if( (key > 47 && key < 58) || (key > 64 && key < 123)){
   		window.event.returnValue = true;		
    }else{
    	window.event.returnValue = false;
    }
}
//�������������ַ�����ͼ���
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
			 alert(msg+"�������ݳ��ȴ���"+len);
			 inputObj.focus();
			 return false;
		 }else{
			 return true;
		 }
	 }
}
//���������ַ��׸�Ϊ��ĸ�������벻��С��len
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
		alert(msg+"ֵ�������"+end+"λ");
		return false;
	}
}


function CheckHshInputLen(inputObj,msg,len){
     
		 if(JHshStrLen(Trim(inputObj.value))>len){
			 alert(msg+"�������ݳ��ȴ���"+len);
			 inputObj.focus();
			 return false;
		 }else{
			 return true;
		 }
}

//���Ӱ������ֵ��ַ�����
//
	function JHshStrLen(sString)
	{                      
		var sStr,iCount,i,strTemp ; 
						   
		iCount = 0 ;           
		sStr = sString.split("");
		for (i = 0 ; i < sStr.length ; i ++)
		{                      
			strTemp = escape(sStr[i]); 
			if (strTemp.indexOf("%u",0) == -1) // ��ʾ�Ǻ���
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

	
//�������Ĳ����Ƿ�Ϊ�Ϸ���������, ����true or false
function CheckPositivenumber(obj,msg) {
    if(CheckNull(obj,msg)){
        var rc=true;
        var str=obj.value;
	for(i=0;i<str.length;i++){
	    if(str.charAt(i)<'0' || str.charAt(i)>'9'){
   	        rc=false;
   	        alert(msg+"����Ƿ�");
	        break;
	    }
	}
	return rc;
    }else{
        return false;
    }
}

//�������Ĳ����Ƿ�Ϊ�Ϸ���������, ����true or false
function CheckPositiver(obj,msg) {
    if(CheckNull(obj,msg)){
        var rc=true;
        var str=obj.value;
	for(i=0;i<str.length;i++){
	    if(str.charAt(i)<'1' || str.charAt(i)>'9'){
   	        rc=false;
   	        alert(msg+"����Ƿ����������0������");
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
    
    if(!rc) alert(msg+"�Ƿ���ʱ���ʽ[��ʽ:23:59]");
    
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


//����ʱ���ʽ:2005-12-30 23:59:59
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
                alert(msg+"������ʱ��֮������һ���ո�ֿ�!!!");
                return false;
            }
            
            if (!CheckTime(strtime)){
                alert(msg+"ʱ���ʽ�Ƿ�[��ʽ:2005-12-30 23:59:59]!!!");
                return false;
            }
            
        }else{
            alert(msg+"ʱ���ʽ�Ƿ�[��ʽ:2005-12-30 23:59:59]!!!");
            return false;            
        }
        
        return true;
    }else{
            alert(msg+"ʱ���ʽ�Ƿ�[��ʽ:2005-12-30 23:59:59]!!!");
            return false;           
    }
    
    
}
//����ʱ���ʽ:2005-12-30 23:59:59
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
                alert(msg+"������ʱ��֮������һ���ո�ֿ�!!!");
                return false;
            }
            
            if (!CheckTime(strtime)){
                alert(msg+"ʱ���ʽ�Ƿ�[��ʽ:2005-12-30 23:59:59]��");
                return false;
            }
            
        }else{
            alert(msg+"ʱ���ʽ�Ƿ�[��ʽ:2005-12-30 23:59:59]!!");
            return false;            
        }
        
        return true;
    }else if(strdatetime.length!=0){
            alert(msg+"ʱ���ʽ�Ƿ�[��ʽ:2005-12-30 23:59:59]!");
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
		alert(desc + "���С��1900��");	
		rc=false;
	}else if(year>2999){
		alert(desc + "��ݴ���2999��");	
		rc=false;
	}else if(month<1){
		alert(desc + "�·�С��1��");	
		rc=false;
	}else if(month>12){
		alert(desc + "�·ݴ���12��");	
		rc=false;
	}else if((day<1)||(day>monthMax[month])){
		alert(desc + "��"+month+"�µ�����"+day+"����ȷ");	
		rc=false;
	}else if((month==2)&&(day==29)){
		if(year%4!=0){
			alert(desc + "�������꣬2�·�û��29��");	
			rc=false;
		}
	}	
    return rc;
}


//������,ֻ������ĸ������[��:A001 �û��ʺŵȱ���]
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
                alert(msg+"����Ƿ�,ֻ��������ĸ������!!!");
                return false;
            }
        }
    }else{
        return false;
    }
    return true;
}

//������,ֻ������ĸ������[��:A001 �û��ʺŵȱ���]
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
                alert(msg+"����Ƿ�,ֻ��������ĸ������!!!");
                return false;
            }
        }
    }else{
		alert(msg+"����Ƿ�,����С����λ!!!");
        return false;
    }
    return true;
}

//������,ֻ��������[��:A001 �û��ʺŵȱ���]
function Checkscode(obj,msg){
    str=Trim(obj.value);
    //alert(str);
		if(str.length==3){
			if(!(	 
					(str>='200' && str<='299')
			))
			{
				alert(msg+"����Ƿ�,������200-299֮�������!!!");
				return false;
			}
		}
		else{
			alert(msg+"����Ƿ�,����ֻ������λ����!!!");
			return false;
		}
        return true; 
}

//������,ֻ��������[��:A001 �û��ʺŵȱ���]
function Checkscodess(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length==3){
			if(!(	
				(str>='0' && str<='127')
			))
			{
				alert(msg+"����Ƿ�,������0-127֮�������");
				return false;
			}
				if(str.length==2){
					if(!(	 
						(str>='0' && str<='9')
					))
					{
						alert(msg+"����Ƿ�,������0-127֮�������");
						return false;	
					}
						if(str.length==1){
							if(!(
								(str>='0' && str<='99')	
							))
							{
								alert(msg+"����Ƿ�,������0-127֮�������");
								return false;
							}
						}
				}
	}

	return true; 
}

//������,ֻ��������[��:A001 �û��ʺŵȱ���]
function Checkscoshuzimoy(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length<2){
		if(!(	 
			(str>='0' && str<='9')
			))
			{
				alert(msg+"����Ƿ�,������12λ����");
				return false;	
			}
	}
	else{
		alert(msg+"����Ƿ�,������1-2λ����");
		return false;	
	}
	return true; 
}


//������,ֻ��������[��:A001 �û��ʺŵȱ���]
function Checkscoshuzi(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length==12){
		if(!(	 
			(str>='0' && str<='9')
			))
			{
				alert(msg+"����Ƿ�,������12λ����");
				return false;	
			}
	}
	else{
		alert(msg+"����Ƿ�,������12λ����");
		return false;	
	}
	return true; 
}

//������,ֻ��������[��:A001 �û��ʺŵȱ���]
function Checkscoshu(obj,msg){
    str=Trim(obj.value);
    //alert(str);
	if(str.length==4){
		if(!(	 
			(str>='0' && str<='9')
			))
			{
				alert(msg+"����Ƿ�,������4λ����");
				return false;	
			}
	}
	else{
		alert(msg+"����Ƿ�,������4λ����");
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
                alert(msg+"����Ƿ�,��һλֻ��������ĸ!!!");
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
                alert(msg+"����Ƿ�,ֻ��������ĸ!!!");
                return false;
            }
        }
        return true; 
}

//��λΪԪ������,��ֵ�������λС��
function CheckMoney(obj,msg){
    var rc=true;
    var dot_pos=0;
    var decimal_count=0;
    var str=obj.value;
    for(i=0;i<str.length;i++){
        if(str.charAt(i)=='.'){
            if(dot_pos>0 || i==0){
               rc=false;
               alert(msg+"����Ƿ�!!!");                
            }
            dot_pos=i;
        }else{
	    if(str.charAt(i)<'0' || str.charAt(i)>'9'){
                rc=false;
                alert(msg+"����Ƿ�!!!!");
	        break;
	    }else{
	        if(dot_pos>0){
	            decimal_count++;
	            if(decimal_count>2){
	                rc=false;
	                alert(msg+"����Ƿ�,���ֻ����λС��!!!!");
	                break;
	            }
	        }
	    }
	}
    }
    return rc;
}
/*----------------------------------------------------------------------*/
//  ������: CheckNull(obj, message)
//  ��  ���������������������������λС���ĸ�������
//  ����ֵ����������������Ľ��
//  ����˵����
//	obj 				�����ı����󣬶���
/*-----------------------------------------------------------------------*/

function sub(obj,obj){
alert("�����������");
	return Math.round((obj.value*100)-(obj.value*100))/100;
}

//ѡ�����ں�ʱ�亯���������ں�����ӣ�00:00:00 
//author:������
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
//ѡ�����ں�ʱ�亯���������ں�����ӣ�23:59:59 
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
*У���������ڵ��Ⱥ�yyyy-MM-dd��by wchai
*����ֵ��
*���������һ������Ϊ�գ�У��ͨ��,          ����true
*�����ʼ�������ڵ�����ֹ���ڣ�У��ͨ����   ����true
*�����ʼ����������ֹ���ڣ�                 ����false    �ο���ʾ��Ϣ�� ��ʼ���ڲ������ڽ������ڡ�
*/
function checkDateEarlier(strStart,strEnd)
{
    if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
        return false;
    //�����һ������Ϊ�գ���ͨ������
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
*У���ַ����Ƿ�Ϊ�����ͣ�yyyy-MM-dd�� by wchai
*����ֵ��
*���Ϊ�գ�����У��ͨ����           ����true
*����ִ�Ϊ�����ͣ�У��ͨ����       ����true
*������ڲ��Ϸ���                   ����false    �ο���ʾ��Ϣ���������ʱ�䲻�Ϸ�����yyyy-MM-dd��
*/
function checkIsValidDate(str)
{
    //���Ϊ�գ���ͨ��У��
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
*У���ַ����Ƿ�Ϊ�����ͣ�yyyy-MM-dd�� by wchai
*����ֵ��
*���Ϊ�գ�����У��ͨ����           ����true
*����ִ�Ϊ�����ͣ�У��ͨ����       ����true
*������ڲ��Ϸ���                   ����false    �ο���ʾ��Ϣ���������ʱ�䲻�Ϸ�����yyyy-MM-dd��
*/
function checkIsValidDate_k(str)
{
    //���Ϊ�գ���ͨ��У��
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
*�������ڹ��ú��� by wchai

*/
function openCenterWin(url,windowname,width,height) {
	var left=(screen.width-width)/2;
	var top=(screen.height-height)/2;
	window.open(url,windowname,"WIDTH="+width+",HEIGHT="+height+",left="+left+",top="+top+",menubar=no,resizable=no,scrollbars=yes,statusbar=no,toolbar=no,channelmode=0'");
}
//
//��ʱ����ߵ��Ե�������ʾ/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/
//ʱ��Ϊ�ղ�ͨ��
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

 //��ʱ����ߵ��Ե�������ʾ/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/
//ʱ��Ϊ�ղ�ͨ��
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
 //�Ƚ�������ʱ����С by wchai
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
					 if(zfflag){//�Ƿ��ܳ为ֵ�ж�
					          if(thisp.value>0){
								  if(thisp.value*1.00>99999999.99){//���ܳ���8λ��ֵ
									alert("��������������");
									thisp.value="0.00";
									thisp.focus();
									return false;
								   }else if(thisp.value*1.00<0.01){
									alert("����С����������");
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
								   if(thisp.value*1.00<-99999999.99){//���ܳ���8λ��ֵ
									alert("����С����������");
									 thisp.value="0.00";
									 thisp.focus();
									return false;
								   }else if(thisp.value*1.00>-0.01){
									alert("����С����������");
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
								  if(thisp.value*1.00>99999999.99){//���ܳ���8λ��ֵ
									alert("��������������");
									thisp.value="0.00";
									thisp.focus();
									return false;
								   }else if(thisp.value*1.00<0.01){
									alert("����С����������");
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
							   }else {   //�������
				
							        return true;  
									
							   }
					  } 
			        //-------------------------------------------------
			   
			}else{
				alert("���봮Ϊ�ջ�ǽ������");
				 thisp.value="0.00";
				 thisp.focus();
				return false;
			}
	   
      }
  //
  //cehck float for money  
  //and check fz  ��һ���������õģ�ʶ��С�������λ���ϵ�����
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
               alert("�Ƿ��������");                
            }
            dot_pos=i;
        }else{
	        if(dot_pos>0){
	            decimal_count++;
	            if(decimal_count>2){
	                rc=false;
	                alert("����Ƿ�,���ֻ����λС��");
	                break;
	            }
	        }
	    }
    }//for
    
    return rc;
}
	
  //cehck float for money    999999999.99>=money>=0.01
  //���ж����� �ͽ�Ǯ��֤
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
				 if(zfflag){//�Ƿ��ܳ为ֵ�ж�
						  if(thisp.value>0){
							  if(thisp.value*1.00>99999999.99){//���ܳ���8λ��ֵ
								alert("��������������");
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
							   if(thisp.value*1.00<-99999999.99){//���ܳ���8λ��ֵ
								alert("����С����������");
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
							  if(thisp.value*1.00>99999999.99){//���ܳ���8λ��ֵ
								alert("��������������");
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
							   alert("�������븺ֵ");
							   thisp.focus();
							   return false;
						   }else {   //�������
			
								return true;  
								
						   }
				  } 
				//-------------------------------------------------
		   
		}else{
			alert("���봮Ϊ�ջ�ǽ������");
			 thisp.value="";
			  thisp.focus();
			return false;
		}
   
  }
//��̬������
//bywchai
function addOneRow1(tbname,source)
{
	var oRow;		 //�У�TR������
	var oCell;		 //��Ԫ��TD������
   var nTbyRowNum; //������

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

   //�����������е����ֵ����һ�У�
   tb.rows(nTbyRowNum).cells(0).childNodes.item(0).value = nTbyRowNum;
   
   //���ð�ť��ֵ  
   var cols = cellsLength - 1;   //���һ��
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


//idΪTABLE��id
//bywchai
function addOneRow(tbname)
{
	var oRow;		 //�У�TR������
	var oCell;		 //��Ԫ��TD������
   var nTbyRowNum; //������

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

   //�����������е����ֵ����һ�У�
   id.rows(nTbyRowNum).cells(0).childNodes.item(0).value = nTbyRowNum;
   
   //���ð�ť��ֵ
   var cols = cellsLength - 1;   //���һ��
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

//idΪTABLE��id��nΪɾ���ļ�¼��
//by wchai
function	delOneRow(tbname, n)
{
   var id = document.all(tbname);
   if(id.rows.length <= 0) return;

   if(confirm("ȷ��Ҫɾ��ָ������") == false) return;

   id.deleteRow(n);

   var nTbyRowNum = id.rows.length;
   if(nTbyRowNum <= 1)
   {
      return;
   }

   var cols = id.rows(0).cells.length;
   cols--;

   //�������¸��кŶ���1
   for(k = n; k <= nTbyRowNum - 1; k++)
   {
      //�����е���ţ���һ�У�
      id.rows(k).cells(0).childNodes.item(0).value = k;

      //���ð�ť��ֵ�����һ�У�
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
//------------------------------��Ʒ������ʼ------------------------------------------------------------------------------
var digits = "0123456789";

var sysPrompt = "[��ʾ]\n";
var sysError = "[����]\n";
var sysWarn = "������";
var sysWarnSelect = "��ѡ��";


//-----------------------------����Ϊ��������-----------------------------------------
//------------------------------------------------------------------------------------

///////////////////
//��ʾ��Ϣ
///////////////////

//ϵͳ��ʾ
function promptMsg(strMsg)
{
    alert(sysPrompt + strMsg);
    return;
}


///////////////////
//�ַ�������
///////////////////

function rtrim(str)
{
    var s = str;
    while (s.charAt(s.length-1) == " ")
    {
        s = s.substr(0, s.length-1);
    }

    while (s.charAt(s.length-1) == "��")
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

    while (s.charAt(0) == "��")
    {
        s = s.substr(1, s.length-1);
    }

    return s;
}

function trim(str)
{
    return ltrim(rtrim(str));
}

//���ִ�
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
    field = trim(field); //ȥ��ǰ��ո�   
    if(!isNoSpecialSignal(field))
    {
    	  // �޸���ʾ��Ϣ cupid yue 2006.12.14
        promptMsg(formUnitLabel + "ֻ����������ɣ����֮��ķָ���ֻ��Ϊ',' �� '.' ��");
        formUnit.focus();
        return false;            	
    }
    return true;
}


//������,ֻ����������,.[��:123456,456789]
function checkSpecialSignals(obj,msg){
    str=Trim(obj.value);
    //alert(str);
    if(str.length>0){
        for(i=0;i<str.length;i++){
            if(!(    (str.charAt(i)>='0' && str.charAt(i)<='9') ||
                     (str.charAt(i)==',')
                 ))
            {
                alert(msg+"ֻ����������ɣ����֮��ķָ���ֻ��Ϊ','��");
                return false;
            }
        } 
        //alert(str.charAt(str.length-1));
        if(str.charAt(str.length-1)==','){
         		alert(msg+"���һλ����Ϊ','��");
                return false;
        }
    }
 	 	return true;
}


/*---------------------------------------------------------------------*/
//  ��������CheckAgilitydiscount(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ1��100������
//  ����ֵ��Boolean ���Ϊ0��100���������򷵻�true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckAgilitydiscount(obj, message) {
		
		var str = Trim(obj.value);
		
		//����Ϊ��
		if (str+"" == "" || str+"" == "undefined" || str == null){		     
    		alert(message + "����Ϊ0~100������");
    		obj.focus();
    		return false;
    }	
    
    //ֻ��Ϊ����
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "����Ϊ0~100������");
				    	obj.focus();
				    	return false;
					}
		}
		
		//����Ϊ1-100������
    var intValue =  parseInt(str);
    if(intValue<0||intValue>100) {    	
    	alert(message + "����Ϊ0~100������");
    	obj.focus();
    	return false;
    }else{
 				return true;   
    }
}

/*----------------------------------------------------------------------*/
//  ��������CheckNotNegative(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ1��100������
//  ����ֵ��Boolean ���Ϊ0��100���������򷵻�true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckEquipAgilitydiscount(obj, message) {
		
		var str = Trim(obj.value);
		
		//����Ϊ��
		if (str+"" == "" || str+"" == "undefined" || str == null){		     
    		alert(message + "����Ϊ0~1000������");
    		obj.focus();
    		return false;
    }	
    
    //ֻ��Ϊ����
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "����Ϊ0~1000������");
				    	obj.focus();
				    	return false;
					}
		}
		
		//����Ϊ1-100������
    var intValue =  parseInt(str);
    if(intValue<0||intValue>1000) {    	
    	alert(message + "����Ϊ0~1000������");
    	obj.focus();
    	return false;
    }else{
 				return true;   
    }
}

/*----------------------------------------------------------------------*/
//  CheckProductlevel(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ���������������-1��
//  ����ֵ��Boolean ���Ϊ���������������-1���򷵻�true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckProductlevel(obj, message) {
		
		var str = Trim(obj.value);
		
		//����Ϊ��
		if (str+"" == "" || str+"" == "undefined" || str == null){		     
    		alert(message + "����Ϊ�����������");
    		obj.focus();
    		return false;
    }	
    
    //ֻ��Ϊ���ֻ���"-"
		for(i=0;i<str.length;i++){
					if((str.charAt(i)<'0'&&str.charAt(i)!='-' )|| (str.charAt(i)>'9'&&str.charAt(i)!='-')){
							alert(message + "����Ϊ�����������");
				    	obj.focus();
				    	return false;
					}
		}
		
		var intValue =  parseInt(str);
    if(intValue<0&&intValue!=-1) {    
    //if(intValue<0) { 	
    	alert(message + "����Ϊ�����������");
    	obj.focus();
    	return false;
    }else{
 		return true;   
    }
}

///////////////////////////////////////////////////////////////////////////////////////
/**
*У���������ڵ��Ⱥ�yyyy-MM-dd��by wchai
*����ֵ��
*���������һ������Ϊ�գ�У��ͨ��,          ����true
*�����ʼ�������ڵ�����ֹ���ڣ�У��ͨ����   ����true
*�����ʼ����������ֹ���ڣ�                 ����false    �ο���ʾ��Ϣ�� ��ʼ���ڲ������ڽ������ڡ�
*/
function checkDateEarlier2(strStart,strEnd)
{
    if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
        return false;
    //�����һ������Ϊ�գ���ͨ������
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
*У���������ڵ��Ⱥ�yyyy-MM-dd��by wchai
*����ֵ��
*���������һ������Ϊ�գ�У��ͨ��,          ����true
*�����ʼ�������ڵ�����ֹ���ڣ�У��ͨ����   ����true
*�����ʼ����������ֹ���ڣ�                 ����false    �ο���ʾ��Ϣ�� ��ʼ���ڲ������ڽ������ڡ�
*/
function checkDateEarlier3(strStart,strEnd)
{
    if(checkIsValidDate(strStart) == false || checkIsValidDate(strEnd) == false)
        return false;
    //�����һ������Ϊ�գ���ͨ������
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
//  ������: isNotNull(obj)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ�մ�
//  ����ֵ��Boolean ����մ�false,���򷵻�true
//  ����˵����
//	obj 				�����ı����󣬶���//  
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
//  ��������CheckPositiveInt(obj, message)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ������
//  ����ֵ��Boolean ���Ϊ���������ɴ�+�ţ�����true,���򷵻�false
//  ����˵����
//	obj					�����ı����󣬶���
//  message				�����ı���������ƣ��ַ���
/*-----------------------------------------------------------------------*/
function CheckPositiveInt(obj, message) {
		var str = obj.value;
		
		if(!isNotNull(obj)){
				return true;
		}
		
		//ֻ��Ϊ����
		for(i=0;i<str.length;i++){
					if(str.charAt(i)<'0' || str.charAt(i)>'9'){
							alert(message + "����������");
				    	obj.focus();
				    	return false;
					}
		}
		
    var intValue =  parseInt(str);
    if( isNaN(intValue)||intValue<0) {
    	
    	alert(message + "����Ϊ������");
    	obj.focus();
    	return false;
    }else{
 			return true;   
    }
}


/**************************
//  ��������toDate(str) 
//  ��  �������ƶ���ʽ���ַ���ת��Ϊjavascript�е���������
//  ����ֵ��Date
//  ����˵����
//	str	  �ַ������� ��:2007-11-14 21:12:01
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
//  ��������mathDate(str1,str2,message)
//  ��  �����Ƚ������ַ�����ʾ�����ڵĴ�С,���str1 < str2 �򷵻�true
//  ����ֵ��boolean
//  ����˵����
//	str1	  �ַ������� ��:2007-11-14 21:12:01
//	str2	  �ַ������� ��:2007-11-14 21:12:03
//	message	  �������false��������ʾ��Ϣ
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
	��֤�ֻ����� tjj 10.17
	str �ؼ�����
	num ��֤���� 1�绰(����)���� 2�ֻ�����
	flag Ϊ��ʱ�Ƿ���֤ 0����֤ 1��֤
*/
function checkNumStyle(str,num,flag){
	 var sReg ='';
	 var error='';
	 
	 if(num==1){
	  sReg ='^[0-9]{3,4}\-[0-9]{7,8}$';
	  error='�绰����������ĸ�ʽ����ȷ!';
	 }else if(num==2){
	  sReg ='^0{0,1}1[0-9]{10}$';
	  error='�ֻ�����ĸ�ʽ����ȷ!';
	 }
	 
	 var obj=document.all(str);
	 var sVal = obj.value;
	 var reg = new RegExp(sReg,'g');
	 
	 if(flag==0){
	  	if(sVal==''){   
	  		return true;
	  	}else if(!reg.test(sVal)){
	   		//��֤��ͨ��,������ʾerror
	   		alert(error);
	   		obj.focus();
	   		return false;
	  	} 
	 }else if(!reg.test(sVal)){
	   //��֤��ͨ��,������ʾwarning
	   alert(error);
	   //�ñ�Ԫ��ȡ�ý���,��ͨ�÷��غ���
	   obj.value='';
	   obj.focus();
	   return false;
	 } 
	return true;
}
		

/**************************
//  ��������textCounter(theField,maxLines,msg)
//  ��  ���������������벻Ҫ�����̶�ֵ
//  ����˵����
//	theField	  ������
//	maxLines	  ���������������
//	msg	  		  ��������
***************************/
function check_custno_input(theField,maxLines,msg){
	var bmailsendtarget = theField;
	clearSuperabundanceBlankLine(theField);//������ڵĿ���
	var tempAry = bmailsendtarget.value.split('\n');//���ı���ͨ���س����з�ת��Ϊ���飬���������С���ж����������	   
//		   if (tempAry.length>maxLines)//������볬��1000������������һ�У�
//		   {
		   		var nm=tempAry.length;
		   		if(Trim(tempAry[0])=='\n'||Trim(tempAry[0])=='\r'){
		   			nm=nm-1;
		   		}
		   		if(Trim(tempAry[tempAry.length-1])==""){
		   			nm=nm-1;
		   		}
		   		if(nm>maxLines)//������볬��1000������������һ�У�
		   		{
			        theField.value="";
			        alert(msg+'���벻�ܴ���'+maxLines+'����');
			        return false;
			     }else{
			     	return true;
			     }
//		   }else{
//		        return true;	   
//		   }
}
///���textArea�еĿ���----add by lij 20080521
function clearSuperabundanceBlankLine(theField) 
{       var bmailsendtarget = theField;	    
		k=bmailsendtarget.value ;
		k=trim(k);
		rgexp=/\r\n\s*?\r\n/m ;
		while(rgexp.test(k))k=k.replace(rgexp,"\r\n") 
//		k=k.replace(/(\r\n)+/g,"\r\n");
		bmailsendtarget.value=k;
} 
//����У��������õ��д���λ������С����λ�Ҳ���Ϊ00
function DigitValidate(obj,mess){
	var value = obj.value;
	var len = value.length;
	if(len <2 && len >0){
		alert(mess+'��������һλ���֣��������ʽΪ0x������01');
		obj.focus();
		return false;
	}else if(value=='00' || value==0){
		alert(mess+'����Ϊ0');
		obj.focus();
		return false;
	}else{
		return true;
	}
}
//����У��������õ��д��벻����0��ͷ
function zeroValidate(obj,mess){
	var value = obj.value;
	var firstOne = value.substring(0,1);
          if(firstOne == 0){
          	alert(mess+'������0��ͷ');
          	return false;
          }else{
          	return true;
          }
}
//****2008-05-19:	
//****END	

//�жϴ�С����ֵ������λ��С��λ��λ�����ܳ���ָ����
//inte������λ���ȣ�dec��С��λ����
//ʹ�÷���onblur="checkIntegerAndDecimalLength(this,'�ɷ����',7,4);"
function checkIntegerAndDecimalLength(obj,msg,inte,dec){
	
	var numFlag=CheckNumber(obj.value);
	if(!numFlag){
	  alert("��������ȷ������");
	  obj.value="";
	  return false;
	}else {
	
	 if(parseFloat(obj.value)==0){
	    alert("��¼���"+msg+"��ֵ����Ϊ�㣬������¼��");
	    obj.value="";
	    return false;
	 }
	var value = obj.value.replace(/(^\s*)|(\s*$)/g,"");
	
		var arr = new Array();
		var dot_pos=0;
		if(value.match(/^([0-9]\d*)$/)){
			if(value.length > inte){
				alert(msg+'�����ֵ����λ���Ȳ��ܴ���'+inte+'λ');
				obj.value="";
				obj.focus();
				return false;
			}
		}else{
			if(value.match(/^(0|[1-9]\d*)\.(\d+)$/)){
				arr=value.split('.');
				if(arr[0].length > inte){
				alert(msg+'�����ֵ����λ���Ȳ��ܴ���'+inte+'λ');
				obj.value="";
				obj.focus();
				return false;
				}
				if(arr[1].length > dec){
					alert(msg+'�����ֵС��λ���Ȳ��ܴ���'+dec+'λ');
					obj.value="";
					obj.focus();
					return false;
				}
			}else{
			
				if(value.length>0){
					    alert(msg+'�����ֵ����С��');
						obj.value="";
						obj.focus();
						return false;
				}
			}
		}
		
		return true;
		}
}
	//�ж��ǲ������ģ�������������Զ���ȡ
	function checkChinese(obj){
    	obj.value=obj.value.replace(/[^\u4E00-\u9FA5]/g,'')
    
    }
    function clipboardChinese(){
    	clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''));
    }
    //���س�������һ���ı���
	 function   enterkey()   
	  {   
	  if(event.keyCode==13   &&   event.srcElement.type   !="BUTTON"   &&   event.srcElement.type!="SUBMIT")   
	        event.keyCode=9;   
	  }  
	  //�����ѯ����������ť���ã�
	  //stateΪtrue ������ false
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
*����˵������ʽ������
*����˵����srcStr Ҫ��ʽ��������,nAfterDotҪ������С��λ��
*���ߣ�����  ���ڣ�2009��11��23��
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
	  