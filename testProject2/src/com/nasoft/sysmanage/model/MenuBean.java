package com.nasoft.sysmanage.model;

import java.io.Serializable;

public class MenuBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8578109867835737589L;
	private String menuID="";
	private String menuType;
	private String menuName;
	private String menuFunc;
	private String parentMenuID;
	private String parentMenuName;
	private String menuLevel;
	private String status;
	private String userId;
	//ÐòºÅ
	private String menuNum;
	
	/**
	 * @return the menuNum
	 */
	public String getMenuNum() {
		return menuNum;
	}
	/**
	 * @param menuNum the menuNum to set
	 */
	public void setMenuNum(String menuNum) {
		this.menuNum = menuNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}
	public String getParentMenuName() {
		return parentMenuName;
	}
	public void setParentMenuName(String parentMenuName) {
		this.parentMenuName = parentMenuName;
	}
	public String getParentMenuID() {
		return parentMenuID;
	}
	public void setParentMenuID(String parentMenuID) {
		this.parentMenuID = parentMenuID;
	}
	public String getMenuID() {
		return menuID;
	}
	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuFunc() {
		return menuFunc;
	}
	public void setMenuFunc(String menuFunc) {
		this.menuFunc = menuFunc;
	}
}
