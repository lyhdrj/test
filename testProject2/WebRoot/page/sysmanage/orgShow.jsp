<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
	<head>
		<title>���Ź���</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">


		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/removeShotcut.js">
</script>
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
		<link rel="StyleSheet"
			href="<%=request.getContextPath()%>/css/style1.css" type="text/css" />
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/validator.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/check.js">
</script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/dtreemanage.js">
</script>
<script type="text/javascript">
function onCheck() {
	var test1 = document.getElementById("orgBean.orgName");
	var test2 = document.getElementById("orgBean.orgCode");
	if (!checkNull(test1, '��������')) {
		return false;
	}
	if (!checkNull(test2, '���Ŵ���')) {
		return false;
	}
	if(test1.value.indexOf(" ")>-1){
		alert("�������Ʋ����пո�");
		return false;
	}
	document.getElementById("addSubmit").disabled = "true";
	return true;
}

function checkInfo(obj)// �ύ����̨
{
	/**
	  var orgName=obj.name;
	  var inputval=obj.value;
	  var comCode=document.getElementById("orgBean.comCode").value;
	  var parentOrgCode=document.getElementById("orgBean.parentOrgCode").value;
	if(orgName=="orgBean.orgName"&&inputval!=""){
		
		send_request("<%=request.getContextPath()%>/page/sysmanage/orgManage!checkInfo?checkval="+inputval+"&type=orgname&comcode="+comCode+"&parentcode="+parentOrgCode);
	}
	if(orgName=="orgBean.orgCode"&&inputval!=""){
	
		send_request("<%=request.getContextPath()%>/page/sysmanage/orgManage!checkInfo?checkval="+inputval+"&type=orgcode&comcode="+comCode);
	}
	 */
}
function setSelectObj(obj) {
	var infoArr = obj.split('@');
	if (infoArr[1] != "true") {
		if (infoArr[0] == "orgname") {
			alert(infoArr[1]);
			document.getElementById("orgBean.orgName").value = "";
			document.getElementById("orgBean.orgName").focus();
			return false;
		}
		if (infoArr[0] == "orgcode") {
			alert(infoArr[1]);
			document.getElementById("orgBean.orgCode").value = "";
			document.getElementById("orgBean.orgCode").focus();
			return false;
		}
	}

}

function checkNumLength(obj, name, len) {
	var str = obj.value;
	if (str.length == len || str.length == 0) {

	} else {
		alert(name + 'Ϊ' + len + 'λ����');
		obj.value = '';
		obj.focus();
	}

}
</script>
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
	</head>
<%
		String companyShow = request.getContextPath()
				+ "/page/sysmanage/orgManage!queryOneInfo?orgBean.orgCode=";
		String companyModify = request.getContextPath()
				+ "/page/sysmanage/orgManage!modifyOneInfo?orgBean.orgCode=";
		String companyDelete = request.getContextPath()
				+ "/page/sysmanage/orgManage!deleteOneInfo?orgBean.orgCode=";
		String parentOrgCode = (String) request
				.getAttribute("orgBean.parentOrgCode");
	%>
<script type="text/javascript">
function isDelete(orgCode) {
	var flag = confirm("��ȷ��ɾ���ò��������ɾ�����ò����µ�ְλ��ְλ��Ӧ�Ľ�ɫ���û���һ��ɾ����");
	if (flag) {
		var url = "<%=companyDelete%>" + orgCode;
		window.location.href = url;
	} else {
		return flag;
	}
}

function pageQuery(currentPage, type) {
if(type == '0'){
			currentPage = 1;
		}else if(type == '-1'){
			currentPage--;
		}else if(type == '1'){
			currentPage++;
		}else if(type == '99'){
			currentPage=<s:property value="#request.pageBean.totalPage"/>;
		}else{
			if(currentPage > <s:property value="#request.pageBean.totalPage"/>||
				currentPage < 1){
				alert('������1����ҳ��������');
				return false;
			}
			if(currentPage.indexOf('.') > -1){
				alert('��������Ч������');
				return false;
			}
			if(isNaN(currentPage)){
   				alert("�������������");
   				return true;
			} 
		}
		var url = "<%=companyShow + parentOrgCode%>";
		url += "&pageBean.currentPage="+currentPage+"&pageBean.totalCount="+<s:property value="#request.pageBean.totalCount"/>;
		window.location.href = url;
	}
function refresh(){
	window.location.reload();
}
	</script>
	
	<script type="text/javascript">  
	function add(){
		   document.getElementById('addpanel').style.display = "";    
		   }   
	
	function yincang(){
		   document.getElementById('addpanel').style.display = "none";    
		   } 
		   </script>  
	<body onkeydown="KeyDown()" onLoad="$()">
		<DIV>
			<TABLE height="97%" cellSpacing=0 cellPadding=0 width="99%" border=0>
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
							<div>
								<div id="current">
									<span>&nbsp;&nbsp;&nbsp;&nbsp;��ǰλ�ã����Ź���&raquo;�����б�</span>
								</div>
								<div align="right">
								<a href="javascript:add();">��ʾ��Ӳ˵�</a>
								<a href="javascript:yincang();">������Ӳ˵�</a>
								</div>	
								<div id="content">
		                  		<table id="addTab">


			<tr>
				<td width="25%" valign="top"><a href="javascript:history.go(0);">ˢ��</a>
					<script type="text/javascript">
tree = new dTree('tree');
tree.add(0, -1, '���Ź���');<s:if test="#request.userDepartment=='no'">
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}" />","","","");
</s:if>
<s:else>
	<s:iterator id="orgList" value="#request.orgList">
	     tree.add("<s:property value="#orgList.orgCode"/>","<s:property value="#orgList.parentOrgCode"/>","<s:property value="#orgList.orgName"/>", "<%=companyShow%><s:property value="#orgList.orgCode"/>&pageBean.currentPage=1&pageBean.totalCount=0","","");
	     </s:iterator>
</s:else>
       document.write(tree);
</script>
</td>
				<td width="74%" valign="top">

					<s:if test="#request.funShow!='none'">

						<table cellspacing=0>
							<tr align="center"
													style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="15%">
														���
													</th>
													<th width="20%">
														��λ����
													</th>
													<th width="20%">
														��������
													</th>
													<th width="15%">
														���Ŵ���
													</th>
													<th width="30%">
														��������
													</th>
												</tr>


						

							<s:if test="#request.subOrgList!=null">
								<tbody id="tab">
									<s:iterator id="subOrgList" value="#request.subOrgList">
										   <tr>
											<td>
												<center><s:property value="#subOrgList.number" /></center>
											</td>
											<td><center><%=(String) request.getAttribute("parentOrgName")%></center></td>
											<td>
												<center><s:property value="#subOrgList.orgName" /></center>
											</td>
											<td>
												<center><s:property value="#subOrgList.orgCode" /></center>
											</td>
											<td><center>
												[<a
													href="<%=companyModify%><s:property value="#subOrgList.orgCode"/>">�޸�</a>]
												[<a href="javascript:void(0);"
													onclick="isDelete('<s:property value="#subOrgList.orgCode"/>')">ɾ��</a>]
											</center></td>
										</tr>
									</s:iterator>
								</tbody>
								<tr>
									<td colspan="3" style="border-right: none; text-align: left;">
														��<span id="total"><s:property value="#request.pageBean.totalCount" /></span>������&nbsp;
														��ǰΪ��<s:property value="%{pageBean.currentPage}" />/<s:property value="%{pageBean.totalPage}"/>ҳ
													</td>
													<td colspan="4" style="text-align: right;">
													
															<s:if
											test="#request.pageBean.isFirstPage==true&&#request.pageBean.isLastPage==true">
											��ҳ
											��һҳ
											��һҳ
											βҳ
									</s:if>
										<s:elseif test="#request.pageBean.isFirstPage==true">
											��ҳ
											��һҳ
											<a href="javascript:;"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1);">��һҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
										</s:elseif>
										<s:elseif test="#request.pageBean.isLastPage==true">
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
											��һҳ
											βҳ
									</s:elseif>
										<s:else>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1)">��һҳ</a>
											<a href="javascript:void(0);"
												onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
										</s:else>
										ת����<input id="goCurrentPage" onkeyup="numberCheckNOChar(this)"
											onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}"
											size=5 class="textBox2"/>ҳ
									</td>
								</tr>
							</s:if>
						</table>
						<div>
						<s:if test="#request.hintMsg!=null">
											<font color="red"><s:property value="#request.hintMsg" /></font>
						</s:if>
						</div>
						<div style="display: none;" id="addpanel">
						<s:form action="orgManage!insertOrg" method="post"
							namespace="/page/sysmanage" onsubmit="return onCheck();">
							<table cellspacing=0>
							<tr>
									<td colspan="2">
										��<font color="red">*</font>��Ϊ�����ֶ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td>
										��λ����
									</td>

									<td>
										<input type="text" class="textBox1" value="${orgBean.parentOrgName}"
											id="orgBean.parentOrgName" maxlength="60" readonly="readonly" style="background-color: lightgray;"/>
										<s:hidden name="orgBean.parentOrgCode"
											id="orgBean.parentOrgCode"></s:hidden>
										<s:hidden name="orgBean.comCode" id="orgBean.comCode"></s:hidden>
									</td>
								</tr>
								<tr>
									<td>
										��������
									</td>
									<td>
										<input type="text" name="orgBean.orgName" id="orgBean.orgName"
											maxlength="10" onblur="checkInfo(this);"
											onkeydown="enterkey();" class="textbox1"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										���Ŵ���
									</td>
									<td>
										<input type="text" class="textBox1" name="orgBean.orgCode" id="orgBean.orgCode"
											onkeyup="numberCheckNOChar(this)" onkeydown="enterkey();"
											onblur="checkNumLength(this,'���Ŵ���',2),checkInfo(this);"
											maxlength="2"/>
										<font color="red">*</font>
									</td>
								</tr>
								<tr>
									<td>
										����˵��
									</td>
									<td>
										<input type="text" class="textBox1" name="orgBean.remark" id="orgBean.remark"
											onkeydown="enterkey();" maxlength="100"/>
									</td>
								</tr>

								<tr>
									<td colspan="4" align="center">
									<input type="submit" name="addSubmit" value="���" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="����" class="input_img"/>
									</td>
								</tr>
							</table>
						</s:form>
						</div>
						<s:if test="#request.flag==true">
							<script language="javascript">
alert('���沿����Ϣ�ɹ���');
</script>
						</s:if>
						<s:elseif test="#request.flag==false">
							<script language="javascript">
alert('���沿����Ϣʧ�ܣ�');
</script>
						</s:elseif>
					</s:if>
				</td>
			</tr>
		</table>
								</div>
							</div>
						</TD>
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
	</body>
</html>
