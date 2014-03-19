/**
 *
 **************************************************************
 * @Project     : IPositionManageService.java
 * @date        : Nov 12, 2012 
 * @author      : Wu Di
 * @company     : Nasoft
 * @model		: PositionManage
 * @Description	: Position Manager Service
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service;

import java.util.List;

import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.PositionBean;

import com.nasoft.sysmanage.model.*;

public interface IPositionManageService {

	/**
	 * @author Wu Di 2012-11-14
	 * @param userInfoBean
	 * @return
	 * @Description get Position's Code
	 */
	public List getPositionCode(UserLoginBean userInfoBean);

	/**
	 * @author Wu Di 2012-11-14
	 * @param orgCode
	 * @return
	 * @Description get Position's information
	 */
	public List getPositionInfo(String orgCode, String flagDB, PageBean pageBean);

	public List getUserInfo(String positionID);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @param type
	 * @return
	 * @Description check position's information
	 */
	public String checkInfo(PositionBean positionBean, String type);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionId
	 * @return
	 * @Description get position's information
	 */
	public PositionBean getOneInfo(String positionId);

	/**
	 * @author Wu Di 2012-11-14
	 * @param positionBean
	 * @param userId
	 * @Description update Position's information
	 */
	public void updateOnePosition(PositionBean positionBean, String userId);

	/**
	 * @author Wu Di 2012-11-14
	 * @param userLogin
	 * @return
	 * @Description get Role's information
	 */
	public List<RoleBean> getRoleInfo(UserLoginBean userLogin);

	/**
	 * @author Wu Di 2012-11-14
	 * @param PositionCode
	 * @return
	 * @Description get Org's Name
	 */
	public String[] getOrgName(String PositionCode);

	/**
	 * @author Wu Di 2012-11-14
	 * @param
	 * @Description add Position's information
	 */
	public void addPositionInfo(PositionBean positionBean,
			UserLoginBean userLoginBean);

	/**
	 * @author Wu Di 2012-11-15
	 * @param positionID
	 * @return
	 * @Description delete Position's information
	 */
	public void deletePositionInfo(String positionId);

	/**
	 * @author Wu Di 2012-11-19
	 * @param positionId
	 * @return
	 * @Description get Position's Count
	 */
	public Integer getPositionCount(String orgCode);
}
