/**
 *
 **************************************************************
 * @Project     : ICompanyManageDao.java
 * @date        : Nov 14,2012
 * @author      : Li Fengli
 * @company     : Nasoft
 * @model		: CompanyManage
 * @Description	: Company Manage Business Logic Layer
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.iface;

import java.util.List;

import com.nasoft.sysmanage.model.CompanyBean;
import com.nasoft.sysmanage.model.UserLoginBean;

/**
 * @author Li Fengli
 */
@SuppressWarnings("unchecked")
public interface ICompanyManageDao {

	/**
	 * @author Li Fengli 2012-11-14
	 * @param userLogin
	 * @Description get company code
	 */
	public List getCompanyCode(UserLoginBean userLogin);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param managementCode
	 * @Description get org count
	 */
	public Integer getOrgCount(String managementCode);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param userManagementCode
	 * @Description get user department
	 */
	public String getUserDepartment(String userManagementCode);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @Description get company name
	 */
	public String getCompanyName(String companyCode);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param parentComCode
	 * @param j 
	 * @param i 
	 * @Description get company info
	 */
	public List<CompanyBean> getCompanyInfo(String parentComCode, int firstResult,int maxResult);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean
	 * @Description get company name count
	 */
	public Integer getCompanyNameCount(CompanyBean companyBean);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean
	 * @Description get company code count
	 */
	public Integer getCompanyCodeCount(CompanyBean companyBean);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean,userID
	 * @Description add company info
	 */
	public void addCompanyInfo(CompanyBean companyBean, String userID);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @Description get company info
	 */
	public CompanyBean getOneInfo(String companyCode);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean 
	 * @Description update company info
	 */
	public void updateOneCompanyFunc(CompanyBean companyBean);

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean 
	 * @Description delete company info
	 */
	public void deleteOneCompanyFunc(CompanyBean companyBean);

	/**
	 * @author Li Fengli 2012-11-22
	 * @param companyBean 
	 * @Description delete org info
	 */
	public void deleteOrg(CompanyBean companyBean);

	/**
	 * @author Li Fengli 2012-11-22
	 * @param companyBean 
	 * @Description get sub company count
	 */
	public Integer getSubComCount(String parentComCode);

	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean 
	 * @Description delete user info
	 */
	public void deleteUser(CompanyBean companyBean);
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean 
	 * @Description delete position user info
	 */
	public void deletePositionUser(CompanyBean companyBean);
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean 
	 * @Description delete position role info
	 */
	public void deletePositionRole(CompanyBean companyBean);
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean 
	 * @Description delete position info
	 */
	public void deletePosition(CompanyBean companyBean);
}
