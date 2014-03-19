package com.nasoft.sysmanage.model;

/**
 * 
 * @author Cao Yang
 */

public class OrgBean {

	private String number;
	private String orgID;
	private String comCode;
	private String orgCode;
	private String orgName;
	private String parentOrgCode;
	private String parentOrgName;
	private String remark;
	private String userId;
	private String comCodeAndOrgCode;

	
	
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
	 * @return the orgID
	 */
	public String getOrgID() {
		return orgID;
	}

	/**
	 * @param orgID
	 *            the orgID to set
	 */
	public void setOrgID(String orgID) {
		this.orgID = orgID;
	}

	/**
	 * @return the comCode
	 */
	public String getComCode() {
		return comCode;
	}

	/**
	 * @param comCode
	 *            the comCode to set
	 */
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	/**
	 * @return the orgCode
	 */
	public String getOrgCode() {
		return orgCode;
	}

	/**
	 * @param orgCode
	 *            the orgCode to set
	 */
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}

	/**
	 * @return the orgName
	 */
	public String getOrgName() {
		return orgName;
	}

	/**
	 * @param orgName
	 *            the orgName to set
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	/**
	 * @return the parentOrgCode
	 */
	public String getParentOrgCode() {
		return parentOrgCode;
	}

	/**
	 * @param parentOrgCode
	 *            the parentOrgCode to set
	 */
	public void setParentOrgCode(String parentOrgCode) {
		this.parentOrgCode = parentOrgCode;
	}

	/**
	 * @return the parentOrgName
	 */
	public String getParentOrgName() {
		return parentOrgName;
	}

	/**
	 * @param parentOrgName
	 *            the parentOrgName to set
	 */
	public void setParentOrgName(String parentOrgName) {
		this.parentOrgName = parentOrgName;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark
	 *            the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the comCodeAndOrgCode
	 */
	public String getComCodeAndOrgCode() {
		return comCode + orgCode;
	}

	/**
	 * @param comCodeAndOrgCode
	 *            the comCodeAndOrgCode to set
	 */
	public void setComCodeAndOrgCode(String comCodeAndOrgCode) {
		this.comCodeAndOrgCode = comCodeAndOrgCode;
	}

}
