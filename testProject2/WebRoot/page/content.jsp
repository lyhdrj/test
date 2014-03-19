
<%@ page contentType="text/html; charset=GBK" pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>SSI_系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/scroll.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/showDate.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.float.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
<!--

function switchSysBar(){
if (switchPoint.innerText==3){
switchPoint.innerText=4
document.all("frmTitle").style.display="none"
}else{
switchPoint.innerText=3
document.all("frmTitle").style.display=""
}
}


window.onresize = resizeDiv; 
window.onerror = function(){} 
//短信提示使用(asilas添加) 
var divTop,divLeft,divWidth,divHeight,docHeight,docWidth,objTimer,i = 0; 

function resizeDiv() 
{ 
i+=1 
if(i>800) closeDiv() 
try{ 
divHeight = parseInt(document.getElementById("eMeng").offsetHeight,10) 
divWidth = parseInt(document.getElementById("eMeng").offsetWidth,10) 
docWidth = document.body.clientWidth; 
docHeight = document.body.clientHeight; 
document.getElementById("eMeng").style.top = docHeight - divHeight + parseInt(document.body.scrollTop,10) 
document.getElementById("eMeng").style.left = docWidth - divWidth + parseInt(document.body.scrollLeft,10) 
} 
catch(e){} 
} 
function moveDiv() 
{ 
try 
{ 
if(parseInt(document.getElementById("eMeng").style.top,10) <= (docHeight - divHeight + parseInt(document.body.scrollTop,10))) 
{ 
window.clearInterval(objTimer) 
objTimer = window.setInterval("resizeDiv()",1) 
} 
divTop = parseInt(document.getElementById("eMeng").style.top,10) 
document.getElementById("eMeng").style.top = divTop - 1 
} 
catch(e){} 
} 
function closeDiv() 
{ 
document.getElementById('eMeng').style.visibility='hidden'; 
if(objTimer) window.clearInterval(objTimer) 
} 

/* 加入托动脚本 */
 $(document).ready(function(){
    //及时调整页面内容的高度
    setInterval(function(){
     var winH= document.body.clientHeight-139;
     $("#tbl,#sideBar,#toggleBar,#main").css("height",winH);
     $("td").each(function(){$(this).html()||$(this).html("&nbsp;")});
    },100)
   }
  );
  
  var begin_x; 
  var drag_flag = false; 
  document.onmousemove = mouseDrag
  document.onmouseup = mouseDragEnd
  //半透明的拖动条（模拟）
  var alphaDiv="<div class=div id=alphaDiv style=position:absolute;height:2000px;top:0;z-index:10001;filter:alpha(opacity=50);opacity:0.5;left:220px>&nbsp;</div>";
  function setDrag(){
   drag_flag=true; 
   begin_x=event.x;
   //添加蒙板
   createMask();
   //添加半透明拖动条
   $(alphaDiv).css("left",$("#toggleBar")[0].offsetLeft).appendTo("body");
  }
  
  //关键部分
  function createMask(){
   //创建背景
   var rootEl=document.documentElement||document.body;
   var docHeight=((rootEl.clientHeight>rootEl.scrollHeight)?rootEl.clientHeight:rootEl.scrollHeight)+"px";
   var docWidth=((rootEl.clientWidth>rootEl.scrollWidth)?rootEl.clientWidth:rootEl.scrollWidth)+"px";
   var shieldStyle="position:absolute;top:0px;left:0px;width:"+docWidth+";height:"+docHeight+";background:#000;z-index:10000;filter:alpha(opacity=0);opacity:0";
   $("<div id=shield style=\""+shieldStyle+"\"></div>").appendTo("body");
  }
  //拖动时执行的函数
  function mouseDrag(){
   if(drag_flag==true){
    if (window.event.button==1){
     var now_x=event.x;
     var value=parseInt($("#alphaDiv")[0].style.left)+now_x-begin_x;
     
     	$("#alphaDiv")[0].style.left=value+"px";
      begin_x=now_x;
    } 
    $("body").css("cursor","e-resize"); //设定光标类型
   }else{
    try{
     $("#shield").remove();
     $("#sideBar")[0].style.pixelWidth=$("#alphaDiv")[0].style.left;
     $("#alphaDiv").remove();
    }catch(e){}
   }
  }
  
  function mouseDragEnd(){
   //设置拖动条的位置
   if(drag_flag==true){
    //设定拖动条的位置（设定左侧的宽度）
    $("#sideBar")[0].style.pixelWidth=parseInt($("#alphaDiv")[0].style.left);
    $("#shield").remove(); //删除蒙板
    $("#alphaDiv").remove(); //删除半透明拖动条
    $("body").css("cursor","normal"); //恢复光标类型
   }
   drag_flag=false;
  }
  
  function addtab(){
  	window.frames["right"].addadd('a','a','a');
  }
-->
</script>
<style type="text/css">
<!--
.STYLE3 {
         color:#ffffff;
         font-family: "新宋体";
	     font-weight: bold;
		 }
.STYLE2 {
	color:#ffffff;
	font-family: "新宋体";
	font-weight: bold;
}
.STYLE4 {color: #000000}
.navPoint {COLOR: #ffffff; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt;FONT-COLOR: #ffffff}
#msgnums {
	color: #c30;
	margin: auto 2px;
	font-weight: 500;
}
.btn{
	background-image:url(<%=request.getContextPath()%>/images/manager/big.gif);
	background-repeat:no-repeat;
	border:0;
	FONT-SIZE: 9pt;
	HEIGHT: 22px;
	width: 90px;
	display:block;
	text-align: center;
	padding-top: 4px;
	padding-left:2px;
	font-size:12px;
	color:#fff;
}

/* 托动样式 */
*{margin:0px;padding:0px}
  html{overflow:hidden}
  #sideBar{width:220px;height:100%;overflow:auto}
  #toggleBar,.div{
   width:1px;height:100%;
   overflow:hidden;background:#ffffff;
   cursor:e-resize;
  }
  td{display:block;overflow:auto;word-break:break-all;}
-->
</style>
</head>
<body onkeydown="KeyDown()">
<input type=hidden name="number" />
<table id="tbl" border="0" bordercollaspe="collapse" cellpadding="2" cellspacing="0" width="100%">
   <tr>
    <td width="1" bgcolor="#ffffff"><div id="sideBar" style="width:230px;"><iframe src="<%=request.getContextPath()%>/sidebar.jsp" id="frmMain" scrolling="yes" width="100%" height="100%"></iframe></div>
    </td>
    <td width="1" onmousedown="setDrag()" id="toggleBar" title="拖动可调整大小" bgcolor="#ffffff">
    </td>
    <td id="main" bgcolor="#ffffff">
     <iframe src="<%=request.getContextPath()%>/index.html" id="right" name="right" width="100%" height="100%" scrolling="yes"></iframe>
    </td>
   </tr>
  </table>
</body>
</html>
