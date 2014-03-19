<%@page contentType="text/html; charset=GBK" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <%
 	String webroot=request.getContextPath();
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>登录页</TITLE>
<LINK 
href="<%=request.getContextPath()%>/images/public.css" type=text/css rel=stylesheet>
<LINK 
href="<%=request.getContextPath()%>/images/login.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
</STYLE>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/ChooseDateLine.js" type="text/javascript"></script>
	
	<script language="javascript">
	window.status   =   "技术支持";
	 
			  if(window.self!=window.top){
			 
	            	top.window.location=self.window.location;
			  }


function yz(){
	var username = document.all.username;
	var password = document.all.password;
	if(username.value==""){
		alert("请输入用户名！")
		username.focus();
		return ;
	}
	if(password.value==""){
		alert("请输入密码！")
		password.focus();
		return ;
	}
	getYZ(username.value,password.value);
}

function setSelectObj(obj)
{
	if(obj==1){
		document.forms[0].submit();
	}else {
		document.getElementById("username").value="";
		document.getElementById("password").value="";
     	document.getElementById("username").focus();
     	if(obj==0){
     		alert("用户名或密码不正确，请重新输入！");
     	}else{
     		alert("此用户没有登录权限！");
     	}
     }
}

function getYZ(loginname,pwd)
{
   send_request("<%=request.getContextPath()%>/login/userlogin!selectValidate?userLoginBean.username="+loginname+"&userLoginBean.password="+pwd);
} 
 
  function firstfocus(){
  	document.getElementById("username").focus();
     document.getElementById("username").value="system";
     document.getElementById("password").value="000000";
  }
  
  function clean(){
	 document.getElementById("username").value="";
     document.getElementById("password").value="";
     document.getElementById("username").focus();
  }
  
	</script>
</head>

<body onkeydown="KeyDown()"  onload="firstfocus();">
<DIV id=div1>
  <TABLE id=login height="100%" cellSpacing=0 cellPadding=0 width=800 
align=center>
    <TBODY>
      <TR id=main>
        <TD>
        	<s:form action="userlogin!userLogin" method="post" namespace="/login">
          <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
            <TBODY>
              <TR>
                <TD colSpan=4>&nbsp;</TD>
              </TR>
              <TR height=30>
                <TD width=380>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>用户名：</TD>
                <TD>
                  <INPUT class=textbox id=username name=userLoginBean.username>
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>密　码：</TD>
                <TD>
                  <INPUT class=textbox id=password type=password name=userLoginBean.password>
                </TD>
                <TD width=120><a href="">忘记密码？</a></TD>
              </TR>
              <TR height=40>
               <TD width=120>&nbsp;</TD>
                <TD align=center>
                  <img  src="<%=request.getContextPath()%>/images/login/b_login.jpg" onclick="yz();">
                  <img  src="<%=request.getContextPath()%>/images/login/b_regist.jpg" onclick="clean();">
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=110>
                <TD colSpan=4>&nbsp;</TD>
              </TR>
            </TBODY>
          </TABLE>
          </s:form>
        </TD>
      </TR>
      <TR id=root height=104>
        <TD>&nbsp;</TD>
      </TR>
    </TBODY>
  </TABLE>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</BODY>
</HTML>

