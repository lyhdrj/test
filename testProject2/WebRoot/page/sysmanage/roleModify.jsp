<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>��ɫ����</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<STYLE type="text/css">
#tablediv {
	font-size: 12px;
}

#content table {
	font-size: 12px;
	width: 100%;
	border-left: 1px solid #009ED2;
	border-top: 1px solid #009ED2;
}

#content table th {
	border-right: 1px solid #009ED2;
	border-bottom: 1px solid #009ED2;
}

#content table td {
	border-right: 1px solid #009ED2;
	border-bottom: 1px solid #009ED2;
	text-align: left;
}
</STYLE>
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
<style>
.t1 td {background-color:#ffffff;}/* �����е�һ�еı���ɫ */
.t2 td {background-color:#DDE6EC;}/* �����еڶ��еı���ɫ */
.t3 td {background-color:lightblue;}/* ��꾭��ʱ�ı���ɫ */
</style>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
  </head>
    <%
		String   roleDel=request.getContextPath()+"/page/sysmanage/roleManage!deleteRole?roleId=";
		String   roleQuery=request.getContextPath()+"/page/sysmanage/roleManage!queryRole?roleId=";
		String   rolePrivil=request.getContextPath()+"/page/sysmanage/roleManage!queryPrivil?roleId=";
	%>
	<script type="text/javascript">
		function isDelete(roleID){
			var flag = confirm("ȷ��ɾ���˽�ɫ��");
			if(flag){	
				var url = "<%=roleDel%>"+roleID;
				window.location.href = url;
			}else{
				return flag;
			}
		}
		
	</script>
	
	<body onkeydown="KeyDown()"  onLoad="$()">
		<DIV>
			<TABLE height="95%" cellSpacing=0 cellPadding=0 width="99%" border=0>
				<TBODY>
					<TR
						style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/bg_header.gif); BACKGROUND-REPEAT: repeat-x"
						height=47>
						<TD width=10>
							<SPAN
								style="FLOAT: left; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
						</TD>
						<TD>
						</TD>
						<TD
							style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_rc.gif)"
							width=10></TD>
					</TR>
					<TR>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_ls.gif)">
							&nbsp;
						</TD>
						<TD
							style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white"
							vAlign=top align="center">
								<div id="current">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;��ǰλ�ã���ɫ����&raquo;��ɫ�б�</span>
								</div>
								<div align="right">
									<a href="roleAdd.jsp">��ӽ�ɫ</a>
								</div>
								<div id="content">
								<div><s:if test="#request.hintMsg!=null">
   	 <font color="red"><s:property value="#request.hintMsg"/></font>
   </s:if></div>
								<table id="addTab" cellspacing=0> 
								<tr >
									
				<td width="99%">
						
								<table cellspacing="0" id="mytable">
								
												<tr
													style="background: url('<%=request.getContextPath() %>/images/common/bg_th.gif'); height: 27px;">
													<th width="40%">
														��ɫ����
													</th>
													<th width="60%">
														����
													</th>
												</tr>
												 <s:if test="#request.roleList!=null&&!#request.roleList.isEmpty()">
												  <tbody id="tab">
												    <s:iterator id="roleList" value="#request.roleList">
												<tr bgcolor="white"
																onmouseover="this.style.backgroundColor='lightblue'"
																onmouseout="this.style.backgroundColor='white'">
													<td><center>
														<s:property value="#roleList.roleName"/>
													</center></td>
													<td><center>
														[<a href="<%=roleQuery %><s:property value="#roleList.roleID"/>">�޸�</a>]&nbsp;&nbsp;[<a href="<%=rolePrivil%><s:property value="#roleList.roleID"/>">����Ȩ��</a>]&nbsp;&nbsp;[<a href="javascript:void(0);" onclick="isDelete('<s:property value="#roleList.roleID"/>')">ɾ��</a>]
													</center></td>
													</tr>
													</s:iterator>
													</tbody>
											</s:if>
											</table>
													
								
						</td>
						</TABLE>
		</DIV></TD>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_rs.gif)"></TD>
						</TR>
					<TR
						style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_fs.gif); BACKGROUND-REPEAT: repeat-x"
						height=10>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_lf.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_fs.gif)"></TD>
						<TD style="BACKGROUND-IMAGE: url(<%=request.getContextPath()%>/images/common/main_rf.gif)"></TD>
					</TR>
		</TBODY>
		</TABLE>
		</DIV>	
		<s:if test="#request.flag==1">
		<script>
		 	alert('�޸Ľ�ɫȨ�޳ɹ���');
		 </script>
		</s:if>
		<s:elseif test="#request.flag==11">
		<script>
		 	alert('�޸Ľ�ɫȨ��ʧ�ܣ���ɫ�����ظ���');
		 </script>
		</s:elseif>
		<s:if test="#request.flag==12">
		<script>
		 	alert('�޸Ľ�ɫȨ��ʧ�ܣ���ɫ�����ظ���');
		 </script>
		</s:if>
		<s:if test="#request.flag==0">
		<script>
		 	alert('��ɫȨ�޳ɹ�����Ϊ�գ�');
		 </script>
		 </s:if>
		<s:elseif test="#request.flag==2">
		 <script>
		 	alert('��ɫȨ�����óɹ���');
		 </script>
		</s:elseif>
		<s:if test="#request.flag==3">
		<script>
		 	alert('ɾ����ɫȨ�޳ɹ���');
		 </script>
		</s:if>
		<s:elseif test="#request.flag==30">
		<script>
		 	alert('���ɫȨ������Ӧ�Ĳ˵�����ְλ����Ӧ�Ĺ�����ɾ����ɫȨ��ʧ�ܣ�');
		 </script>
		</s:elseif>
	</body>
</html>