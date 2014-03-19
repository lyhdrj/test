package com.nasoft.sysmanage.model;

/**
 * @author :david 创建时间：Aug 14, 2008 8:12:17 AM 类说明 update by 吕正超
 *         加入属性：managementCode，对应于数据表字段MANAGEMENT_CODE
 */

public class UserBean {
	private String number;
	private String userID;
	private String positionID;
	private String positionName;
	private String isLogin;
	private String comCode;
	private String rights;
	private String createBy;
	private String password;
	private String funcPwdMenuId;
	private String funcName;
	private String funcCnName;

	private String managementName;
	/** 用户管理人员的权限，-1代表无权限，0代表超级管理员，其它为公司或部门代码 */
	private String managementCode;

	/** sex property */
	private String sex;

	/** realName property */
	private String realName;

	/** userstatus property */
	private String userstatus;

	/** mobilePhone property */
	private String mobilePhone;

	/** userName property */
	private String userName;

	/** pinYinName property */
	private String pinYinName;

	/** companyCode property */
	private String companyCode;

	/** address property */
	private String address;

	/** email property */
	private String email;

	/** zipcode property */
	private String zipcode;

	/** birthday property */
	private String birthday;

	/**
	 * @return the number
	 */
	public String getNumber() {
		return number;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(String number) {
		this.number = number;
	}

	/**
	 * @return the userID
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @param userID the userID to set
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @return the positionID
	 */
	public String getPositionID() {
		return positionID;
	}

	/**
	 * @param positionID the positionID to set
	 */
	public void setPositionID(String positionID) {
		this.positionID = positionID;
	}

	/**
	 * @return the positionName
	 */
	public String getPositionName() {
		return positionName;
	}

	/**
	 * @param positionName the positionName to set
	 */
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	/**
	 * @return the isLogin
	 */
	public String getIsLogin() {
		return isLogin;
	}

	/**
	 * @param isLogin the isLogin to set
	 */
	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}

	/**
	 * @return the comCode
	 */
	public String getComCode() {
		return comCode;
	}

	/**
	 * @param comCode the comCode to set
	 */
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	/**
	 * @return the rights
	 */
	public String getRights() {
		return rights;
	}

	/**
	 * @param rights the rights to set
	 */
	public void setRights(String rights) {
		this.rights = rights;
	}

	/**
	 * @return the createBy
	 */
	public String getCreateBy() {
		return createBy;
	}

	/**
	 * @param createBy the createBy to set
	 */
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the funcPwdMenuId
	 */
	public String getFuncPwdMenuId() {
		return funcPwdMenuId;
	}

	/**
	 * @param funcPwdMenuId the funcPwdMenuId to set
	 */
	public void setFuncPwdMenuId(String funcPwdMenuId) {
		this.funcPwdMenuId = funcPwdMenuId;
	}

	/**
	 * @return the funcName
	 */
	public String getFuncName() {
		return funcName;
	}

	/**
	 * @param funcName the funcName to set
	 */
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}

	/**
	 * @return the funcCnName
	 */
	public String getFuncCnName() {
		return funcCnName;
	}

	/**
	 * @param funcCnName the funcCnName to set
	 */
	public void setFuncCnName(String funcCnName) {
		this.funcCnName = funcCnName;
	}

	/**
	 * @return the managementName
	 */
	public String getManagementName() {
		return managementName;
	}

	/**
	 * @param managementName the managementName to set
	 */
	public void setManagementName(String managementName) {
		this.managementName = managementName;
	}

	/**
	 * @return the managementCode
	 */
	public String getManagementCode() {
		return managementCode;
	}

	/**
	 * @param managementCode the managementCode to set
	 */
	public void setManagementCode(String managementCode) {
		this.managementCode = managementCode;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the realName
	 */
	public String getRealName() {
		return realName;
	}

	/**
	 * @param realName the realName to set
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}

	/**
	 * @return the userstatus
	 */
	public String getUserstatus() {
		return userstatus;
	}

	/**
	 * @param userstatus the userstatus to set
	 */
	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}

	/**
	 * @return the mobilePhone
	 */
	public String getMobilePhone() {
		return mobilePhone;
	}

	/**
	 * @param mobilePhone the mobilePhone to set
	 */
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the pinYinName
	 */
	public String getPinYinName() {
		return pinYinName;
	}

	/**
	 * @param pinYinName the pinYinName to set
	 */
	public void setPinYinName(String pinYinName) {
		this.pinYinName = pinYinName;
	}

	/**
	 * @return the companyCode
	 */
	public String getCompanyCode() {
		return companyCode;
	}

	/**
	 * @param companyCode the companyCode to set
	 */
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the zipcode
	 */
	public String getZipcode() {
		return zipcode;
	}

	/**
	 * @param zipcode the zipcode to set
	 */
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	/**
	 * @return the birthday
	 */
	public String getBirthday() {
		return birthday;
	}

	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	
}
