/**
 *
 **************************************************************
 * @Project     : RoleManageAction.java
 * @date        : Nov 12, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: RoleManage
 * @Description	: Role permissions based on user requests
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.struts.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.nasoft.base.BaseAction;
import com.nasoft.sysmanage.model.RoleBean;
import com.nasoft.sysmanage.model.RoleMenuBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.service.IRoleManageService;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public class RoleManageAction extends BaseAction{
	
	private IRoleManageService roleManageService;
	private RoleBean roleBean;
	private Integer flag;
	private String errorMessage;
	/**
	 * @return the roleBean
	 */
	public RoleBean getRoleBean() {
		return roleBean;
	}
	/**
	 * @param roleBean the roleBean to set
	 */
	public void setRoleBean(RoleBean roleBean) {
		this.roleBean = roleBean;
	}
	/**
	 * @return the flag
	 */
	public Integer getFlag() {
		return flag;
	}
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	/**
	 * @param roleManageService the roleManageService to set
	 */
	public void setRoleManageService(IRoleManageService roleManageService) {
		this.roleManageService = roleManageService;
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Modify role information
	 */
	public String modifyRole() {
		
		HttpSession session = request.getSession();
		String firstFlag = request.getParameter("firstFlag");
		if(firstFlag!=null&&firstFlag!=""){
			flag = -1;
		}
		if(getFlag()!=null&&firstFlag==null){
			request.setAttribute("flag", getFlag());
		}
		UserLoginBean userInfoBean=(UserLoginBean)session.getAttribute("userlogin");
		try{
			List roleList=roleManageService.getRoleInfo(userInfoBean.getCompany());
			request.setAttribute("roleList", roleList);
		}catch(Exception e){
			errorMessage = "在执行RoleManageAction类中的modifyRole方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}		
		return "querysuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Insert role information
	 */
	public String insertRole() {
		try{
			roleBean = getRoleBean();
			HttpSession session = request.getSession();
			UserLoginBean userInfoBean=(UserLoginBean)session.getAttribute("userlogin");
			String roleInfo=roleManageService.checkRoleInfo(roleBean,"insert",userInfoBean.getCompany_code());
			if(roleInfo.equalsIgnoreCase("")){
				roleBean.setUserId(userInfoBean.getUserid());
				roleBean.setCompanyCode(userInfoBean.getCompany());
				roleManageService.addRoleInfo(roleBean);
				request.setAttribute("flag", "true");
			}else{
				request.setAttribute("flag", "false");
				request.setAttribute("hintMsg", roleInfo);
			}
		}catch(Exception e) {
			errorMessage = "在执行RoleManageAction类中的insertRole方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "insertsuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Remove a Role
	 */
	public String deleteRole() {
		try{
			String roleID=request.getParameter("roleId");		
			boolean delFlag =roleManageService.deleteRole(roleID);
			HttpSession session = request.getSession();
			UserLoginBean userInfoBean=(UserLoginBean)session.getAttribute("userlogin");
			List roleList=roleManageService.getRoleInfo(userInfoBean.getCompany());
			flag = 3;
			if(!delFlag){
				flag = 30;
			}
			request.setAttribute("roleList", roleList);
			request.setAttribute("flag",flag);
		}catch(Exception e){
			errorMessage = "在执行RoleManageAction类中的deleteRole方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "querysuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Get a role information
	 */
	public String queryRole() {
		try{
			String roleID=request.getParameter("roleId");
			roleBean=roleManageService.getOneRoleInfo(roleID);	
		}catch(Exception e) {
			errorMessage = "在执行RoleManageAction类中的queryRole方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "queryonesuccess";
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Modify role information
	 */
	public String modifyOneRole() {
		try{
			UserLoginBean userInfoBean=(UserLoginBean)request.getSession().getAttribute("userlogin");
			roleBean=getRoleBean();	
			String roleInfo=roleManageService.checkRoleInfo(roleBean,"update",roleBean.getCompanyCode());
			
			if(roleInfo.equalsIgnoreCase("")){
				roleBean.setUserId(userInfoBean.getUserid());
				roleManageService.updateOneRoleInfo(roleBean);
				flag = 1;
			}else{
				if("角色名称".equals(roleInfo.substring(0,4))){
					flag = 11;
				}else{
					flag = 12;
				}
			}
		}catch(Exception e) {
			errorMessage = "在执行RoleManageAction类中的modifyOneRole方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "modifysuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Get permission
	 */
	public String queryPrivil() {
		String roleID=request.getParameter("roleId");
		UserLoginBean userInfoBean=(UserLoginBean)request.getSession().getAttribute("userlogin");
		List rolePrivilList=null;
		try{
			String rights=userInfoBean.getRightsB();
			rolePrivilList=roleManageService.getRolePrivilege(roleID,rights);
			
			request.setAttribute("rolePrivilList", rolePrivilList);
			request.setAttribute("roleID", roleID);
		}catch(Exception e){
			errorMessage = "在执行RoleManageAction类中的queryPrivil方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}		
		return "queryprivilsuc";
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Update role information
	 */
	public String updateRoleMenu() {
		String []roleMenuArr=request.getParameterValues("MENU_01");
		String roleID=request.getParameter("roleId");
		HttpSession session = request.getSession();
		UserLoginBean userInfoBean=(UserLoginBean)session.getAttribute("userlogin");
		String userID=userInfoBean.getUserid();
		String companyCode=userInfoBean.getCompany();
		List roleMenuList = new ArrayList();
		RoleMenuBean roleMenuBean;
		try{
			if(roleMenuArr!=null){
				for(int i=0;i<roleMenuArr.length;i++){
					roleMenuBean=new RoleMenuBean();
					roleMenuBean.setMenuID(roleMenuArr[i]);		
					roleMenuBean.setCreateBy(userID);
					roleMenuBean.setCompanyCode(companyCode);
					roleMenuBean.setRoleID(roleID);
					roleMenuList.add(roleMenuBean);
				}
			}
			String rights=userInfoBean.getRightsB();			
			roleManageService.updateRolePrivilege(roleMenuList,roleID,rights,companyCode);
			flag=2;
			if(roleMenuArr==null){
				flag=0;
			}
			request.setAttribute("flag", flag);
		}catch(Exception e){
			flag=-2;
			errorMessage = "在执行RoleManageAction类中的updateRoleMenu方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "modifysuccess";
	}
}
