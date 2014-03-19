/**
 *
 **************************************************************
 * @Project     : PositionManageDaoImpl.java
 * @date        : Nov 12, 2012 
 * @author      : Wu Di
 * @company     : Nasoft
 * @model		: PositionManage
 * @Description	: Position Manager Dao Impl
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */

package com.nasoft.sysmanage.persistence.sqlmapdao;

import java.util.List;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import com.nasoft.sysmanage.persistence.iface.IPositionManageDao;
import com.nasoft.sysmanage.model.*;

/**
 * @author Wu Di 2012-11-14
 */
public class PositionManageDaoImpl extends SqlMapClientTemplate implements
		IPositionManageDao {

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description get All Position's Code
	 */

	public List getAllPositionCode() {
		return queryForList("PositionManage.getAllPositionCode");
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return userInfoBean
	 * @Description get Position's Code
	 */

	public List getPositionCode(UserLoginBean userInfoBean) {
		return queryForList("PositionManage.getPositionCode", userInfoBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return companyCode
	 * @Description get Role's information
	 */

	public List<RoleBean> getRoleInfo(UserLoginBean userLoginBean) {
		String companyCode = userLoginBean.getCompany_code();
		return queryForList("PositionManage.getRoleInfo", companyCode);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return orgName
	 * @Description get Org's Name
	 */

	public String[] getOrgName(String orgCode) {
		OrgBean orgBean = (OrgBean) queryForObject("PositionManage.getOrgName",
				orgCode);
		String[] orgName = new String[3];
		orgName[0] = orgBean.getOrgName();
		orgName[1] = orgBean.getComCode();
		orgName[2] = orgBean.getOrgID();
		return orgName;
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return orgCode
	 * @Description get Position's information
	 */

	public List getPositionInfo(String orgCode, int firstResult, int maxResult) {
		return queryForList("PositionManage.getPositionInfo", orgCode,
				firstResult, maxResult);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description check Update information
	 */
	public Integer checkUpdateInfo(PositionBean positionBean) {
		return (Integer) queryForObject("PositionManage.checkUpdateInfo",
				positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description check Insert information
	 */
	public Integer checkInsertInfo(PositionBean positionBean) {
		return (Integer) queryForObject("PositionManage.checkInsertInfo",
				positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description get Sequence
	 */
	public Integer getSequence() {
		return (Integer) queryForObject("PositionManage.getSequence");
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description add Position's information
	 */
	public void addPositionInfo(PositionBean positionBean,
			UserLoginBean userLoginBean) {
		insert("PositionManage.addPositionInfo", positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description add Position Role's information
	 */
	public void addPositionRoleInfo(PositionBean positionBean) {
		insert("PositionManage.addPositionRoleInfo", positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionId
	 * @Description get position's information
	 */
	public PositionBean getOneInfo(String positionId) {
		return (PositionBean) queryForObject("PositionManage.getOneInfo",
				positionId);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description update Position's information
	 */
	public void updatePositionInfo(PositionBean positionBean) {
		update("PositionManage.updatePositionInfo", positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionbean
	 * @Description update Position Role's information
	 */
	public void updatePositionRoleInfo(PositionBean positionBean) {
		update("PositionManage.updatePositionRoleInfo", positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionId
	 * @Description get User's information
	 */
	public List getUserInfo(String positionId) {
		return queryForList("PositionManage.getUserInfo",
				positionId);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description get Menu's information
	 */
	public List getMenuInfo(PositionBean positionBean) {
		return queryForList("PositionManage.getMenuInfo", positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description delete Position's information
	 */
	public void deletePositionInfo(String positionId) {
		delete("PositionManage.deletePositionInfo", positionId);

	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description delete Position's role
	 */
	public void deletePositionRole(String positionId) {
		delete("PositionManage.deletePositionRole", positionId);

	}

	public void deletePositionUser(String positionId) {
		delete("PositionManage.deletePositionUser", positionId);
	}

	public void deleteUser(String userId) {
		delete("PositionManage.deleteUser", userId);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description delete Position's count
	 */
	public List getPositionCount(String positionId, PageBean pageBean) {
		return queryForList("PositionManage.getPositionCount", positionId,
				pageBean.getFirstResult(), pageBean.getMaxResult());
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionBean
	 * @Description get Position's count
	 */
	public Integer getPositionCount(String orgCode) {
		return (Integer) queryForObject("PositionManage.getPositionCount",
				orgCode);

	}

}
