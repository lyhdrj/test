<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="true">
<head>

	<title>�û�����</title>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/removeShotcut.js"></script>
       <script type="text/javascript" src="<%=request.getContextPath()%>/js/tableCtrl.js"></script>
	
	<link rel="StyleSheet"
		href="<%=request.getContextPath()%>/css/dtree.css" type="text/css" />
			<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style1.css">
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/ChooseDateLine.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/validator.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/check.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dtreemanage.js"></script>
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
<script type="text/javascript">  
	function add(){
		   document.getElementById('addpanel').style.display = "";    
		   }   
	
	function yincang(){
		   document.getElementById('addpanel').style.display = "none";    
		   } 
		   </script>  
		   <script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>

<%
	String userShow = request.getContextPath()
				+ "/page/sysmanage/userManage!getAllUserInfo?userBean.positionID=";
		String userModify = request.getContextPath()
				+ "/page/sysmanage/userManage!modifyOneInfo?userBean.userID=";
		String userResetPwd = request.getContextPath()
				+ "/page/sysmanage/userManage!resetUserPwd?userBean.userID=";
		String userPositionModify = request.getContextPath()
				+ "/page/sysmanage/userManage!modifyUserPosition?userBean.userID=";
		String userDelete = request.getContextPath()
				+ "/page/sysmanage/userManage!deleteUserInfo?userBean.userID=";
%>
	<script type="text/javascript">
	function pageQuery(currentPage,type){
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
				alert('������1~��ҳ��������');
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
		var url = "<%=userShow %>p"+document.getElementById("userBean.positionID").value;
		url += "&pageBean.currentPage="+currentPage+"&pageBean.totalCount="+<s:property value="#request.pageBean.totalCount"/>;
		window.location.href = url;
	}
	}
	function isDelete(userID){
			var flag = confirm("ȷ��ɾ�����û���");
			if(flag){	
				var url = "<%=userDelete%>"+userID;
				window.location.href = url;
			}else{
				return flag;
			}
		}
	function noPermission(){
		document.getElementById("departmentName").value="";
		document.getElementById("userBean.managementCode").value="<s:property value="#request.user"/>";
	}
	function getOrgTree(){
		var str = window.showModalDialog("<%=request.getContextPath()%>/page/sysmanage/userManage!getOrgTree?userBean.comCode="+document.getElementById("userBean.comCode").value,"_blank","dialogWidth=200PX;dialogHeight=350px;scroll:auto;center:yes;status:no");
			if(str != null){
				if(str[0]!= null && str[0].length>0){
					document.getElementById("departmentName").value=str[0];
				}
				if(str[1]!= null && str[1].length>0){
					document.getElementById("userBean.managementCode").value=str[1];
				}
			}else{
    		}
	}
	function onCheck() {
		var test=document.getElementById("userBean.userName");
		var test1=document.getElementById("userBean.realName");
		var test2=document.getElementById("userBean.pinYinName");
		var test3=document.getElementById("userBean.mobilePhone");
		var test5=document.getElementById("userBean.address");
		var test6=document.getElementById("userBean.birthday");
		var test7=document.getElementById("userBean.zipcode");
		var test8=document.getElementById("userBean.email");
	    var array=new Array(test,test1,test2,test3,test5,test6);
    
    	if(!checkSpace(test1, '��ʵ����')){
    		return false;
    	}
		
    	if(!checkNull(test,'��¼����')){
			return false;
    	}
    	if(!checkNull(test1,'��ʵ����')){
			return false;
    	}
    	if(!checkNull(test3,'�ֻ�����')){
			return false;
    	}
    	if(!checkNull(test5,'��ϵ��ַ')){
			return false;
    	}
    	if(!checkNull(test6,'��������')){
			return false;
    	}
		if(!/^[a-zA-z]{1,20}$/.test(test2.value)) {
			alert("ƴ�����Ƹ�ʽ����ȷ��ƴ��������1-20λ��ĸ���");
			test2.select();
			return false;
		}
	    if (test8.value!="") { 
	    	if(!/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(test8.value)) {
		    	alert("�����ʼ���ʽ����ȷ");
				test8.select();
		    	return false;
		    }
	    }
	    if(test7.value!="") {
	    	if(!/^\d{6}$/.test(test7.value)) {
	    		alert("���������ʽ����ȷ");
				test7.select();
	    		return false;
	    	}
	    }
	    var permission = document.getElementsByName("permissionRadio");
		if(permission[1].checked&&document.getElementById("departmentName").value==""){
			alert("��������Աά��Ȩ��");
			return false;
		}
		
		if(test.value.indexOf(" ")>-1){
		alert("��¼���Ʋ����пո�");
		return false;
	}
		if(test1.value.indexOf(" ")>-1){
		alert("��ʵ���������пո�");
		return false;
	}
		if(test2.value.indexOf(" ")>-1){
		alert("ƴ�����Ʋ����пո�");
		return false;
	}
		if(test5.value.indexOf(" ")>-1){
		alert("��ϵ��ַ�����пո�");
		return false;
	}
		document.getElementById("addSubmit").disabled = "true";
		return true;    
	}
	
// ����ƴ��������������
	function IsChar(s)
	{ 
	 var Number = "0123456789.abcdefghijklmnopqrstuvwxyz-\/ABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()_";
	 for (i = 0; i < s.length;i++)
	    {   
	        // Check that current character isn't whitespace.
	        var c = s.charAt(i);
	        if (Number.indexOf(c) == -1)
	        return false;
	    }
	 return true;
	}
function CheckPinyin(theField)
{
 if (!IsChar(theField.value))
  theField.value="";
  alert("������ֻ������Ӣ�ļ����֣��벻Ҫ�������ģ�");
}
 
 
	function checkLoginName()// �ύ����̨
	{
	   var loginName=document.getElementById("userBean.userName").value;
	   
		if(loginName==""||loginName==null){
			;
		}else{
			send_request("<%=request.getContextPath()%>/page/sysmanage/userManage!checkLoginName?loginName="+loginName);
		}
	   
	} 
	function setSelectObj(obj)
	{
		var returnVal=obj;
		var strArray=returnVal.split('$');
		if(strArray.length>1){//����������
		    if(strArray[0]=="true"){
		    	alert('�û���ʼ�������óɹ���');	
		    }else{
		    	alert('�û���ʼ��������ʧ�ܣ�');
		    }
		}else{//��¼��У����
			if(obj=="false"){
				alert('��¼�����Ѵ��ڣ����������룡');	
				document.getElementById("userBean.userName").value="";		
				document.getElementById("userBean.userName").focus();
				return false;
			}
		}
		
		
	}
	
	function resetUserPwd(userId)// �ύ����̨
	{
		if(userId==null||userId==""){
		}else{
			send_request("<%=request.getContextPath()%>/page/sysmanage/userManage!resetUserPwd?userBean.userID="+userId);
		}
	   
	} 
function refresh(){
	window.location.reload();
}
	</script>
<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/tableCtrl.js">
</script>
<style>
.t1 td {background-color:#ffffff;}/* �����е�һ�еı���ɫ */
.t2 td {background-color:#DDE6EC;}/* �����еڶ��еı���ɫ */
.t3 td {background-color:lightblue;}/* ��꾭��ʱ�ı���ɫ */
</style>
</head>

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
									<span>&nbsp;&nbsp;&nbsp;&nbsp;��ǰλ�ã��û�����&raquo;�û��б�</span>
								</div>
								<div align="right">
								<a href="javascript:add();">��ʾ��Ӳ˵�</a>
								<a href="javascript:yincang();">������Ӳ˵�</a>
								</div>		
								<div id="content">
		                  		<table id="addTab">
			<tr>
				<td width="20%" valign="top"><a href="javascript:history.go(0);">ˢ��</a>
									<script type="text/javascript">
 tree = new dTree('tree');
 tree.add(0,-1,'�û�����');
 <s:if test="#request.userDepartment=='no'">
	tree.add("1","0","<s:property value="%{getText('hint.noprivilege')}"/>","","","");
 </s:if>
 <s:else>
 	<s:iterator id="userListPage" value="#request.userList">
 		<s:if test="#userListPage.status==3">
     	tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<a href='<%=userShow%><s:property value="#userListPage.code"/>&pageBean.currentPage=1&pageBean.totalCount=0'><s:property value="#userListPage.name"/></a>");
 		</s:if>
 		<s:else>
 		 tree.add("<s:property value="#userListPage.code"/>","<s:property value="#userListPage.parentCode"/>","<s:property value="#userListPage.name"/>");
 		</s:else>
 	</s:iterator>
 </s:else>
       document.write(tree);      
</script>
</td>
				<td width="79%" valign="top">
				<s:if test="#request.funShow!='none'">
				
					<table cellspacing=0>
						<tr
													style="background: url('<%=request.getContextPath()%>/images/common/bg_th.gif'); height: 27px;">
													<th width="10%">
														���
													</th>
													<th width="10%">
														ְλ����
													</th>
													<th width="10%">
														��¼����
													</th>
													<th width="10%">
														��ʵ����
													</th>
													<th width="10%">
														ƴ������
													</th>
													<th width="10%">
														��Աά��Ȩ��
													</th>
													<s:if test="#session.userlogin.rightsB=='true'">
								                    <th width="10%">
									                    A-B��
								                    </th>
							                        </s:if>
													<th width="10%">
														��������
													</th>
													<th width="10%">
														ְλ����
													</th>
													<th width="10%">
														��������
													</th>
												</tr>
						<s:if test="#request.subUserList!=null">
                        <tbody id="tab">
							<s:iterator id="subUserList" value="#request.subUserList">
								<tr>
									<td>
										<center><s:property value="#subUserList.number"/></center>
									</td>
									<td><center><s:property value="#request.positionName"/></center></td>
									<td>
										<center><s:property value="#subUserList.userName"/></center>
									</td>
									<td>
										<center><s:property value="#subUserList.realName"/></center>
									</td>
									<td>
										<center><s:property value="#subUserList.pinYinName"/></center>
									</td>
									<td>
										<center><s:property value="#subUserList.managementName"/></center>
									</td>
									<s:if test="#session.userlogin.rightsB=='true'">
										<td align="center"><center>
											<s:property value="#subUserList.rights"/></center>
										</td>
									</s:if>
									<td><center>
										[<a href="<%=userModify%><s:property value="#subUserList.userID"/>">�޸�</a>]
										[<a href="javascript:void(0);" onclick="isDelete(<s:property value="#subUserList.userID"/>)">ɾ��</a>]</center>
									</td>
									<td>
										<center>[<a href="<%=userPositionModify%><s:property value="#subUserList.userID"/>">����</a>]</center>
									</td>
									<td><center>
										<input type="button" onClick="resetUserPwd(<s:property value="#subUserList.userID"/>)" value="����" class="input_img"></center>
									</td>
								</tr>
							</s:iterator>
							 </tbody>
							<tr>
								<td colspan=4 style="border-right: none; text-align: left;">
									��<s:property value="#request.pageBean.totalCount"/>������
									&nbsp;
									<s:if test="#request.pageBean.totalPage==0">
										��ǰΪ��0/<s:property value="#request.pageBean.totalPage"/>ҳ
									</s:if>
									<s:else>��ǰΪ��<s:property value="#request.pageBean.currentPage"/>/<s:property value="#request.pageBean.totalPage"/>ҳ
									</s:else>
									&nbsp;
									&nbsp;
									</td>
								    <td colspan="5" style="text-align: right;">
								<s:if test="#request.pageBean.isFirstPage==true&&#request.pageBean.isLastPage==true">
									��ҳ
									��һҳ
									��һҳ
									βҳ
								</s:if>
								<s:elseif test="#request.pageBean.isFirstPage==true">
									��ҳ
									��һҳ
									<a href="javascript:;" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1);">��һҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
								</s:elseif>
								<s:elseif test="#request.pageBean.isLastPage==true">
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
									��һҳ
									βҳ
								</s:elseif>
								<s:else>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',0)">��ҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',-1)">��һҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.currentPage"/>',1)">��һҳ</a>
									<a href="javascript:void(0);" onclick="pageQuery('<s:property value="#request.pageBean.totalPage"/>',99)">βҳ</a>
								</s:else>
								ת����<input id="goCurrentPage" class="textBox2" onkeyup="numberCheckNOChar(this)" onkeypress="numAndDot(this);if(event.keyCode==13){pageQuery(document.getElementById('goCurrentPage').value,100);}" size=2/>ҳ
								</td>
							</tr>
						</s:if>
					</table>
					<div style="display: none;" id="addpanel">
					<s:form action="userManage!addUserInfo" method="post" namespace="/page/sysmanage"
						onsubmit="return onCheck();">
							<table cellspacing=0>
							<tr>
									<td colspan="2">
										��
										<font color="red">*</font>��Ϊ�����ֶ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<s:if test="#request.hintMsg!=null">
											<font color="red"><s:property value="#request.hintMsg" />
											</font>
										</s:if>
									</td>
								</tr>
							<tr>
								<td>
									ְλ����
								</td>

								<td>
								<input type="text" class="textBox1" value="${userBean.positionName}" id="userBean.positionName" readonly="true" style="background-color: lightgray;"/>
								<s:hidden name="userBean.positionID" id="userBean.positionID"></s:hidden>
								<s:hidden name="userBean.comCode" id="userBean.comCode"></s:hidden>
								</td>
							</tr>
							<tr>
								<td>
									��¼����
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.userName" maxlength="10"
										onkeypress="charsShuru();" 
										onblur="checkLoginName();" id="userBean.userName"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									��ʵ����
								</td>

								<td>
									<input type="text" class="textBox1" name='userBean.realName' maxlength="10"
										 id="userBean.realName"/>
										<font color="red">*</font>
								</td>

							</tr>

							<tr>
								<td>
									ƴ������
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.pinYinName" maxlength="20"
										onkeypress="charsShuru();"  id="userBean.pinYinName"/>
										<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									�û��Ա�
								</td>
								<td>
								<s:select list="#{'��':'��','Ů':'Ů'}" name="userBean.sex"
										id="userBean.sex"></s:select>
								</td>
							</tr>
							<tr>
								<td>
									��������
								</td>
								<td>
									 <input type="text" class="textBox1" name="userBean.birthday"
										onclick="fPopCalendar(this)" readonly="readonly"
										 id="userBean.birthday"/>
									<font color="red">*</font></td>
							</tr>
							<tr>
								<td>
									�ֻ�����
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.mobilePhone" maxlength="12"
										id="userBean.mobilePhone" onkeypress="numAndDot(this)" onblur="CheckNum(this, '�ֻ�')" onkeyup="numberCheckNOChar(this)"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									�����ʼ�
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.email" maxlength="120"
										id="userBean.email"/>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									��������
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.zipcode" onkeypress="numAndDot(this)"
										onblur="CheckNum(this, '��������')" 
										maxlength="10" id="userBean.zipcode"/>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									��ϵ��ַ
								</td>
								<td>
									<input type="text" class="textBox1" name="userBean.address" maxlength="150"
										id="userBean.address"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td class="td_color">
									��¼ϵͳȨ��
								</td>
								<td>
									<s:radio id="userBean.isLogin" list="#{'1':'���Ե�¼','0':'�����Ե�¼'}" name="userBean.isLogin" value="1"></s:radio>
								</td>
							</tr>

							<s:if test="#request.userDepartment=='admin'">
								<tr>
									<td class="td_color">
										��Աά��Ȩ��
									</td>
									<td>
									<input type="radio" name="permissionRadio" id="permissionRadio" value="0"
											onclick="noPermission()" checked />
										��
										<input type="radio" name="permissionRadio" id="permissionRadio" value="1"
											onclick="getOrgTree()" />
										Ȩ�޲��ţ�
										<input type="text" name="departmentName" class="textBox1" value="" readonly />
										<s:hidden id="userBean.managementCode" name="userBean.managementCode" value="no"></s:hidden>
									</td>
								</tr>
							</s:if>
							<s:if test="#request.userDepartment=='1'">
								<tr>
									<td class="td_color">
										��Աά��Ȩ��
									</td>
									<td>
										<input type="radio" name="permissionRadio" id="permissionRadio" value="0"
											onclick="noPermission()" checked />
										��
										<input type="radio" name="permissionRadio" id="permissionRadio" value="1"
											onclick="getOrgTree()" />
										Ȩ�޲��ţ�
										<input type="text" name="departmentName" class="textBox1" value="" readonly />
										<s:hidden id="userBean.managementCode" name="userBean.managementCode" value="no"></s:hidden>
									</td>
								</tr>
							</s:if>
							<s:if test="#session.userlogin.rightsB=='true'">
								<tr>
									<td class="td_color">
										����Ȩ��
									</td>
									<td>
										<s:radio id="userBean.rights" list="#{'A':'A��','B':'B��'}" name="userBean.rights"
										value="A"></s:radio>
									</td>
								</tr>
							</s:if>
							<tr>
								<td colspan="4" align="center">
									<input type="submit" name="addSubmit" value="���" class="input_img"/>
									<input type="button" onclick="window.history.back();" value="����" class="input_img"/>
								</td>
								</tr>
							</table>
						</s:form>
						</div>
						</s:if>
				</td>
			</tr>
		</table>
		<s:if test="#request.modifyMsg=='true'">
		<script type="text/javascript">
			alert('������Ϣ�ɹ���');
		</script>
	</s:if>
	<s:elseif test="#request.modifyMsg=='false'">
		<script>
			alert('������Ϣʧ�ܣ�����ϵͳ����Ա��ϵ��');
		</script>
	</s:elseif>
	<s:if test="#request.modifyPosition=='false'">
		<script>
			alert('�û���Ϣ�޸�ʧ�ܣ�����ϵͳ����Ա��ϵ��');
		</script>
	</s:if>
	<s:elseif test="#request.modifyPosition=='true'">
		<script>
			alert('�û���Ϣ�޸ĳɹ���');
		</script>
	</s:elseif>
	
	
	<s:if test="#request.deleteUser==false">
		<script>
			alert('�û���Ϣɾ��ʧ�ܣ�����ϵͳ����Ա��ϵ��');
		</script>
	</s:if>
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
							
						
	