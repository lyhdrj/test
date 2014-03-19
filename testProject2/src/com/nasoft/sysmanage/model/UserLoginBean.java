package com.nasoft.sysmanage.model;

/**
 * UserLoginVO 
 * @author bilimin
 * @version 1.0.1, 2008-07-17
 */
import java.util.Date;

/* update by ������ �������ԣ�managementCode����Ӧ�����ݱ��ֶ�MANAGEMENT_CODE */
public class UserLoginBean {
	private String userid;
	private String username;
	private String password;
	private String company;
	private String company_code;
	private String loginip;
	private Date logintime;
	private String realName;
	//��������
	private String orgName;
	private String rightsB = "false";
	// ��Ӧ�����ݱ��ֶ�MANAGEMENT_CODE
	private String managementCode;
	//��˾����
	private String companyName;
	
	/**
	 * �õ���˾����
	 * @return  ��˾����
	 */
	public String getCompanyName() {
		return companyName;
	}
	
	/**
	 * ���ù�˾����
	 * @param companyName  ��˾����
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getManagementCode() {
		return managementCode;
	}

	public void setManagementCode(String managementCode) {
		this.managementCode = managementCode;
	}

	public String getRightsB() {
		return rightsB;
	}

	public void setRightsB(String rightsB) {
		this.rightsB = rightsB;
	}
	
	/**
	 * �õ���������
	 * @return  ��������
	 */
	public String getOrgName() {
		return orgName;
	}
	
	/**
	 * ���ò�������
	 * @param orgName  ��������
	 */
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getLoginip() {
		return loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	
}
