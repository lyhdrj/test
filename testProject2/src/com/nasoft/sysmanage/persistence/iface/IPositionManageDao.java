/**
 *
 **************************************************************
 * @Project     : IPositionManageDao.java
 * @date        : Nov 12, 2012 
 * @author      : Wu Di
 * @company     : Nasoft
 * @model		: PositionManage
 * @Description	: Position Manager Dao
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

import com.nasoft.sysmanage.model.*;

public interface IPositionManageDao {

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description get All Position's Code
	 */
	public List getAllPositionCode();

	/**
	 * @author Wu Di 2012-11-14
	 * @param userInfoBean
	 * @return
	 * @Description get Position's Code
	 */
	public List getPositionCode(UserLoginBean userInfoBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param userLoginBean
	 * @return
	 * @Description get Role's information
	 */
	public List<RoleBean> getRoleInfo(UserLoginBean userLoginBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param orgCode
	 * @return
	 * @Description get Org's Name
	 */
	public String[] getOrgName(String orgCode);

	/**
	 * @author Wu Di 2012-11-14
	 * @param orgCode
	 * @return
	 * @Description get Position's information
	 */
	public List getPositionInfo(String orgCode, int firstResult, int maxResult);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @return
	 * @Description check Update Information
	 */
	public Integer checkUpdateInfo(PositionBean positionBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @return
	 * @Description check Insert Information
	 */
	public Integer checkInsertInfo(PositionBean positionBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description get Sequence
	 */
	public Integer getSequence();

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @param userLoginBean
	 * @Description add Position's Information
	 */
	public void addPositionInfo(PositionBean positionBean,
			UserLoginBean userLoginBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @Description add Position Role's Information
	 */
	public void addPositionRoleInfo(PositionBean positionBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionId
	 * @return
	 * @Description get position Information
	 */
	public PositionBean getOneInfo(String positionId);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @Description update Position's Information
	 */
	public void updatePositionInfo(PositionBean positionBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @Description update Position Role's Information
	 */
	public void updatePositionRoleInfo(PositionBean positionBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionId
	 * @return
	 * @Description get User's Information
	 */
	public List getUserInfo(String positionId);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @return
	 * @Description get Menu's Information
	 */
	public List getMenuInfo(PositionBean positionBean);

	/**
	 * @author Wu Di 2012-11-15
	 * @param positionId
	 * @Description delete Position
	 */
	public void deletePositionInfo(String positionId);

	/**
	 * @author Wu Di 2012-11-19
	 * @param positionId
	 * @Description delete Position's role
	 */
	public void deletePositionRole(String positionId);

	/**
	 * @author Wu Di 2012-11-19
	 * @param positionId
	 * @Description delete Position's user
	 */
	public void deletePositionUser(String positionId);

	/**
	 * @author Wu Di 2012-12-25
	 * @param userId
	 * @Description delete users
	 */
	public void deleteUser(String userId);
	
	/**
	 * @author Wu Di 2012-11-19
	 * @param positionId
	 * @param pageBean
	 * @return
	 * @Description get Position's Count
	 */
	public Integer getPositionCount(String orgCode);

}
