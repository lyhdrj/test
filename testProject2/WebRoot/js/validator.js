/*----------------------------------------------------------------------*/
//  ������: checkNull(obj,name)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ��
//  ����ֵ��Boolean �����Ϊ�շ���true,�������name����Ϊ�շ���false
//  ����˵����
//	obj				�����ı����󣬶���
//  name			�����ı���������Ӧ�����ƣ��ַ���
/*-----------------------------------------------------------------------*/
function checkNull(obj,name){
    if(obj.value==""){
	   alert(name+"����Ϊ��");
	   obj.focus();
	   return false;
	}
	else{
	   return true;
	}
}
function checkNull12(obj,name){
  var parms=obj.value.length;
    if(parms==4){
     if(obj.value.indexOf(".")=="-1")
     {
       //alert(name+"�����Ϲ涨");
       alert(name+"�������ֲ��ܳ�����λ��С�����ֲ��ܳ���һλ");
	   obj.focus();
	   return false;
     } 
	}
	else if(parms==5)
	{
	  //alert(name+"�����Ϲ涨");
	  alert(name+"�������ֲ��ܳ�����λ��С�����ֲ��ܳ���һλ");
	   obj.focus();
	   return false;
	}
	else if(parms==3)
	{
	 if(obj.value.indexOf(".")=="-1")
     {
       //alert(name+"�����Ϲ涨");
       alert(name+"�������ֲ��ܳ�����λ��С�����ֲ��ܳ���һλ");
	   obj.focus();
	   return false;
     } 
	}
	else{
	   return true;
	}
}

/*----------------------------------------------------------------------*/
//  ������: checkInt(obj, name)
//  ��  �������ڼ������Ĳ����Ƿ�Ϊ�����Ҳ���Ϊ��
//  ����ֵ��Boolean ���Ϊ��������true,���򷵻�false
//  ����˵����
//	obj				�����ı����󣬶���
//  name			�����ı���������Ӧ�����ƣ��ַ���
/*-----------------------------------------------------------------------*/
function checkInt(obj,name){
     
	   var str=obj.value;
	     if(isNaN(str)){
		    alert(name+"�������!");
		    return false;
			}
			else{
			   if(str.indexOf(".")!="-1"){
	           alert(name+"����Ϊ����!");
	           obj.focus();
	           return false;
	           }
		       else{
			      return true;
			   }
             }
	
}
/*----------------------------------------------------------------------*/
//  ������: checkMoney(obj, name)
//  ��  �������ڼ������Ĳ���С��������ֻ����2λ
//  ����ֵ��Boolean ���С�����λ��С�ڻ����2λ�򷵻�true,���򷵻�false
//  ����˵����
//	obj				�����ı����󣬶���
//  name			�����ı���������Ӧ�����ƣ��ַ���
/*-----------------------------------------------------------------------*/
function checkMoney(obj,name){
    var str=obj.value;
     if(str.indexOf(".")!="-1"){
     var m = str.indexOf(".");
     if(m > 4){
     	alert(name+"С����ǰ�����ֳ��Ȳ��ܴ���4λ");
     	obj.focus();
     	return false;
     }
     var strArr=str.split(".");
     		if(strArr.length>2){
     		alert(name+'ֻ����һ��С���㣡');
     		obj.focus();
		     return false;
     		}
	      var ch=str.length-str.indexOf(".");
		  if(ch<"4"){
		  	 return true;
		  }else{
		  alert(name+"С�����ֻ����2λ");
		  obj.focus();
		     return false;
		  }
	 }else{
	      	 if(str.length > 4){
	      	 	alert(name+'����λ���ܴ���4λ');
	      	 	obj.focus();
	      	 	return false;
	      	 }else if(isNaN(str)){
			    alert(name+"����Ϊ����");
			    obj.focus();
				return false;
			 }
			 else{
			    return true;
			 }
		
	  }
}
/*----------------------------------------------------------------------*/
//  ������: checkNum(obj, name)
//  ��  �������ڼ������Ĳ���С��������ֻ����2λ,������Ϊ��
//  ����ֵ��Boolean ���С�����λ��С�ڻ����2λ�򷵻�true,���򷵻�false
//  ����˵����
//	obj				�����ı����󣬶���
//  name			�����ı���������Ӧ�����ƣ��ַ���
/*-----------------------------------------------------------------------*/
function checkNum(obj,name){
    var str=obj.value;
     if(str.indexOf(".")!="-1"){
	      var ch=str.length-str.indexOf(".");
		  if(ch<"4"){
		     return true;
		  }
		  else{
		  alert(name+"С�����ֻ����2λ");
		  obj.focus();
		     return false;
		  }
	 }
	  else{
	      if(checkNull(obj,name)){
		     if(isNaN(str)){
			    alert(name+"����Ϊ����");
			    obj.focus();
				return false;
			 }
			 else{
			    return true;
			 }
		  }
		  else{
		     return false;
		  }
	  }
}
/*----------------------------------------------------------------------*/
//  ������: checkMoney(obj, name)
//  ��  �������ڼ������Ĳ���С��������ֻ����2λ
//  ����ֵ��Boolean ���С�����λ��С�ڻ����2λ�򷵻�true,���򷵻�false
//  ����˵����
//	obj				�����ı����󣬶���
//  name			�����ı���������Ӧ�����ƣ��ַ���
/*-----------------------------------------------------------------------*/
function checkLength(obj,name){
    var str=obj.value;
	if(str.length<1 || str.length>3){
	   alert(name+"�������!");
	   return false;
	}
	else{
	   if(isNaN(str)){
	      alert(name+"�������!");
	   return false;
	   }
	   else{
	      if(str.length<3){
		      return true;
		  }
		  else{
		  if(comfirm(name+"Ϊ3λ��,�Ƿ����?")){
		      return true;
		  }
		  else{return false;}
		 }
	   }
	}
}
/*
	�ж��Ƿ���ڿո�
*/
function checkSpace(obj,info){
	if(obj.value.indexOf(" ")>-1){
		alert(info + "�����пո�");
		return false;
	}
	return true;
}

