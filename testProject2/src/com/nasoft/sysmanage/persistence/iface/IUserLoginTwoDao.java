/**
 *
 **************************************************************
 * @Project     : IUserLoginDao.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Login
 * @Description	: User Login DAO Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.iface;

import java.util.Map;

import com.nasoft.sysmanage.model.UserLoginBean;

/**
 * 创建人: 陈 凯 修改时间: 2009-03-19
 * 
 * 模块（接口）说明： 系统登陆功能，公司信息取得功能数据层
 * 
 */
public interface IUserLoginTwoDao {

	/**
	 * 是否相同名称
	 * 
	 * @return
	 */
	public Integer checkBName(UserLoginBean userLogin);

	/**
	 * 测试数据库状态
	 * 
	 * @return
	 */
	public Integer getDSState();

	public Integer queryUserIdByUserNameAndCompayCode(
			UserLoginBean userLogin);
}
