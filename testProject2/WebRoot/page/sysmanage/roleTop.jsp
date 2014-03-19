<%@ page language="java" pageEncoding="GBK"%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>roleTop.jsp</title><script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>

   <LINK href="<%=request.getContextPath()%>/css/style.css" type=text/css rel=stylesheet>
	<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>
<%
 	String webroot=request.getContextPath();
  %>
  </head>
  
  <body onkeydown="KeyDown()"  topmargin=0 leftmargin=0 onLoad="MM_preloadImages('<%=webroot%>/images/gole_m3.gif','<%=webroot%>/images/role_a3.gif','<%=webroot%>/images/role_a2.gif','<%=webroot%>/images/role_a4.gif');MM_preloadImages('<%=webroot%>/images/gole_m2.gif');MM_preloadImages('<%=webroot%>/images/gole_m4.gif')">
    <table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="20"></td>
    <td><a href="<%=request.getContextPath()%>/page/sysmanage/roleManage!modifyRole?firstFlag=100" target="role_main" onClick="MM_nbGroup('down','group1','gole_m1','<%=webroot%>/images/role_m3.gif',0)" onMouseOver="MM_nbGroup('over','gole_m1','<%=webroot%>/images/role_m2.gif','<%=webroot%>/images/role_m4.gif',0)" onMouseOut="MM_nbGroup('out')"><img src="<%=webroot%>/images/role_m3.gif" alt="角色管理" name="gole_m1" border="0" onload="MM_nbGroup('init','group1','gole_m1','<%=webroot%>/images/role_m1.gif',0)"></a></td>
  	<td><a href="roleAdd.jsp" target="role_main" onClick="MM_nbGroup('down','group1','role_add','<%=webroot%>/images/role_a3.gif',1)" onMouseOver="MM_nbGroup('over','role_add','<%=webroot%>/images/role_a2.gif','<%=webroot%>/images/role_a4.gif',1)" onMouseOut="MM_nbGroup('out')"><img name="role_add" src="<%=webroot%>/images/role_a1.gif" border="0" alt="新建角色" ></a></td>
  </tr>
</table>
  </body>
</html>
