package com.nasoft.sysmanage.model;
/**
 * @author :david
 * 创建时间：Aug 11, 2008 1:26:12 PM
 * 类说明
 */

public class RoleMenuBean {
	private String menuID;
	private String createBy;
	private String roleID;
	private String companyCode;
	
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getMenuID() {
		return menuID;
	}
	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	
	

}
