/*----------------------------------------------------------------------*/
//  方法名: checkNull(obj,name)
//  描  述：用于检查输入的参数是否为空
//  返回值：Boolean 如果不为空返回true,否则输出name不能为空返回false
//  参数说明：
//	obj				待检查的表单对象，对象
//  name			待检查的表单对象所对应的名称，字符串
/*-----------------------------------------------------------------------*/
function checkNull(obj,name){
    if(obj.value==""){
	   alert(name+"不能为空");
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
       //alert(name+"不符合规定");
       alert(name+"整数部分不能超过两位，小数部分不能超过一位");
	   obj.focus();
	   return false;
     } 
	}
	else if(parms==5)
	{
	  //alert(name+"不符合规定");
	  alert(name+"整数部分不能超过两位，小数部分不能超过一位");
	   obj.focus();
	   return false;
	}
	else if(parms==3)
	{
	 if(obj.value.indexOf(".")=="-1")
     {
       //alert(name+"不符合规定");
       alert(name+"整数部分不能超过两位，小数部分不能超过一位");
	   obj.focus();
	   return false;
     } 
	}
	else{
	   return true;
	}
}

/*----------------------------------------------------------------------*/
//  方法名: checkInt(obj, name)
//  描  述：用于检查输入的参数是否为整数且不能为空
//  返回值：Boolean 如果为整数返回true,否则返回false
//  参数说明：
//	obj				待检查的表单对象，对象
//  name			待检查的表单对象所对应的名称，字符串
/*-----------------------------------------------------------------------*/
function checkInt(obj,name){
     
	   var str=obj.value;
	     if(isNaN(str)){
		    alert(name+"输入错误!");
		    return false;
			}
			else{
			   if(str.indexOf(".")!="-1"){
	           alert(name+"必须为整数!");
	           obj.focus();
	           return false;
	           }
		       else{
			      return true;
			   }
             }
	
}
/*----------------------------------------------------------------------*/
//  方法名: checkMoney(obj, name)
//  描  述：用于检查输入的参数小数点后最多只能有2位
//  返回值：Boolean 如果小数点后位数小于或等于2位则返回true,否则返回false
//  参数说明：
//	obj				待检查的表单对象，对象
//  name			待检查的表单对象所对应的名称，字符串
/*-----------------------------------------------------------------------*/
function checkMoney(obj,name){
    var str=obj.value;
     if(str.indexOf(".")!="-1"){
     var m = str.indexOf(".");
     if(m > 4){
     	alert(name+"小数点前的数字长度不能大于4位");
     	obj.focus();
     	return false;
     }
     var strArr=str.split(".");
     		if(strArr.length>2){
     		alert(name+'只能有一个小数点！');
     		obj.focus();
		     return false;
     		}
	      var ch=str.length-str.indexOf(".");
		  if(ch<"4"){
		  	 return true;
		  }else{
		  alert(name+"小数点后只能有2位");
		  obj.focus();
		     return false;
		  }
	 }else{
	      	 if(str.length > 4){
	      	 	alert(name+'整数位不能大于4位');
	      	 	obj.focus();
	      	 	return false;
	      	 }else if(isNaN(str)){
			    alert(name+"必须为数字");
			    obj.focus();
				return false;
			 }
			 else{
			    return true;
			 }
		
	  }
}
/*----------------------------------------------------------------------*/
//  方法名: checkNum(obj, name)
//  描  述：用于检查输入的参数小数点后最多只能有2位,但可以为空
//  返回值：Boolean 如果小数点后位数小于或等于2位则返回true,否则返回false
//  参数说明：
//	obj				待检查的表单对象，对象
//  name			待检查的表单对象所对应的名称，字符串
/*-----------------------------------------------------------------------*/
function checkNum(obj,name){
    var str=obj.value;
     if(str.indexOf(".")!="-1"){
	      var ch=str.length-str.indexOf(".");
		  if(ch<"4"){
		     return true;
		  }
		  else{
		  alert(name+"小数点后只能有2位");
		  obj.focus();
		     return false;
		  }
	 }
	  else{
	      if(checkNull(obj,name)){
		     if(isNaN(str)){
			    alert(name+"必须为数字");
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
//  方法名: checkMoney(obj, name)
//  描  述：用于检查输入的参数小数点后最多只能有2位
//  返回值：Boolean 如果小数点后位数小于或等于2位则返回true,否则返回false
//  参数说明：
//	obj				待检查的表单对象，对象
//  name			待检查的表单对象所对应的名称，字符串
/*-----------------------------------------------------------------------*/
function checkLength(obj,name){
    var str=obj.value;
	if(str.length<1 || str.length>3){
	   alert(name+"输入错误!");
	   return false;
	}
	else{
	   if(isNaN(str)){
	      alert(name+"输入错误!");
	   return false;
	   }
	   else{
	      if(str.length<3){
		      return true;
		  }
		  else{
		  if(comfirm(name+"为3位数,是否继续?")){
		      return true;
		  }
		  else{return false;}
		 }
	   }
	}
}
/*
	判断是否存在空格
*/
function checkSpace(obj,info){
	if(obj.value.indexOf(" ")>-1){
		alert(info + "不能有空格");
		return false;
	}
	return true;
}

