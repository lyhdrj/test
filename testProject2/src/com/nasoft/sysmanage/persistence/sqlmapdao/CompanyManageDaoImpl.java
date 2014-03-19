/**
 *
 **************************************************************
 * @Project     : CompanyManageDaoImpl.java
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
package com.nasoft.sysmanage.persistence.sqlmapdao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.sysmanage.model.CompanyBean;
import com.nasoft.sysmanage.persistence.iface.ICompanyManageDao;
import com.nasoft.sysmanage.model.UserLoginBean;

/**
 * @author Li Fengli
 */
@SuppressWarnings("unchecked")
public class CompanyManageDaoImpl extends SqlMapClientTemplate implements
		ICompanyManageDao {

	/**
	 * @author Li Fengli 2012-11-14
	 * @param userLogin
	 * @return 
	 * @Description get company code
	 */
	public List<CompanyBean> getCompanyCode(UserLoginBean userLogin) {
		return queryForList("CompanyManage.getCompanyCode", userLogin);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param managementCode
	 * @return 
	 * @Description get org count
	 */
	public Integer getOrgCount(String managementCode) {
		return (Integer) queryForObject("CompanyManage.getOrgCount",
				managementCode);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param userManagementCode
	 * @return 
	 * @Description get user department
	 */
	public String getUserDepartment(String userManagementCode) {
		return (String) queryForObject("CompanyManage.getUserDepartment",
				userManagementCode);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @return 
	 * @Description get company name
	 */
	public String getCompanyName(String companyCode) {
		return (String) queryForObject("CompanyManage.getCompanyName",
				companyCode);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param parentComCode
	 * @return 
	 * @Description get company info
	 */
	public List<CompanyBean> getCompanyInfo(String parentComCode,int firstResult,int maxResult) {
		return queryForList("CompanyManage.getCompanyInfo", parentComCode,firstResult,maxResult);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean
	 * @return 
	 * @Description get company name count
	 */
	public Integer getCompanyNameCount(CompanyBean companyBean) {
		return (Integer) queryForObject("CompanyManage.getCompanyNameCount",
				companyBean);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean
	 * @return 
	 * @Description get company code count
	 */
	public Integer getCompanyCodeCount(CompanyBean companyBean) {
		return (Integer) queryForObject("CompanyManage.getCompanyCodeCount",
				companyBean);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean,userID
	 * @return 
	 * @Description add company info
	 */
	public void addCompanyInfo(CompanyBean companyBean, String userID) {
		String code = companyBean.getCompanyCode();
		Map map = new HashMap();
		map.put("code", code);
		map.put("userID", userID);
		try {
			getSqlMapClient().startTransaction();
			insert("CompanyManage.addCompanyInfo", companyBean);

			getSqlMapClient().commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				getSqlMapClient().endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param company_code
	 * @return 
	 * @Description generate list
	 */
	private List<Map> generateRailwayCostsList(String company_code) {
		List<Map> list = new ArrayList<Map>();
		Map map = null;

		map = new HashMap();
		map.put("item", "车立柱");
		map.put("unit", "根");
		map.put("unitprice", "17");
		map.put("amount", "16");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "捆车器");
		map.put("unit", "根");
		map.put("unitprice", "58");
		map.put("amount", "8");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "铁线");
		map.put("unit", "千克");
		map.put("unitprice", "10");
		map.put("amount", "15.2");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "U型钉");
		map.put("unit", "立方米");
		map.put("unitprice", "65");
		map.put("amount", "1");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "盘条");
		map.put("unit", "千克");
		map.put("unitprice", "4");
		map.put("amount", "69.4");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "防火费");
		map.put("unit", "车");
		map.put("unitprice", "17.5");
		map.put("amount", "1");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "铁路运费");
		map.put("unit", "包装物");
		map.put("unitprice", "0");
		map.put("amount", "0");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "装车费");
		map.put("unit", "立方米");
		map.put("unitprice", "18");
		map.put("amount", "62.152");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "超装费");
		map.put("unit", "立方米");
		map.put("unitprice", "12");
		map.put("amount", "20");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "检疫费");
		map.put("unit", "车");
		map.put("unitprice", "5");
		map.put("amount", "1");
		map.put("company_code", company_code);
		list.add(map);

		map = new HashMap();
		map.put("item", "联网费");
		map.put("unit", "米");
		map.put("unitprice", "1");
		map.put("amount", "62");
		map.put("company_code", company_code);
		list.add(map);

		return list;
	}
	
	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @return 
	 * @Description get company info
	 */
	public CompanyBean getOneInfo(String companyCode) {
		return (CompanyBean) queryForObject("CompanyManage.getOneInfo",
				companyCode);
	}
	
	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean
	 * @return 
	 * @Description update company info
	 */
	public void updateOneCompanyFunc(CompanyBean companyBean) {
		update("CompanyManage.updateOneCompanyFunc", companyBean);
	}
	
	/**
	 * @author Li Fengli 2012-11-22
	 * @param companyBean
	 * @return 
	 * @Description delete company info
	 */
	public void deleteOneCompanyFunc(CompanyBean companyBean) {
		delete("CompanyManage.deleteOneCompanyFunc", companyBean);
	}

	/**
	 * @author Li Fengli 2012-11-22
	 * @param companyBean
	 * @return 
	 * @Description delete org info
	 */
	public void deleteOrg(CompanyBean companyBean) {
		delete("CompanyManage.deleteOrg", companyBean);
		
	}

	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean
	 * @return 
	 * @Description delete user info
	 */
	public void deleteUser(CompanyBean companyBean) {
		delete("CompanyManage.deleteUser", companyBean);
		
	}
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean
	 * @return 
	 * @Description delete position user info
	 */
	public void deletePositionUser(CompanyBean companyBean) {
		delete("CompanyManage.deletePositionUser", companyBean);
		
	}
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean
	 * @return 
	 * @Description delete position role info
	 */
	public void deletePositionRole(CompanyBean companyBean) {
		delete("CompanyManage.deletePositionRole", companyBean);
		
	}
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyBean
	 * @return 
	 * @Description delete position info
	 */
	public void deletePosition(CompanyBean companyBean) {
		delete("CompanyManage.deletePosition", companyBean);
		
	}
	
	/**
	 * @author Li Fengli 2012-11-22
	 * @param companyBean
	 * @return 
	 * @Description get sub company count
	 */
	public Integer getSubComCount(String parentComCode) {
		return (Integer)queryForObject("CompanyManage.getSubComCount",parentComCode);
	}
}
