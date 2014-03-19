/**
 *
 **************************************************************
 * @Project     : UserLoginTwoDaoImpl.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Login
 * @Description	: User Login Two DAO Implement
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.sqlmapdao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.persistence.iface.IUserLoginTwoDao;

public class UserLoginTwoDaoImpl extends SqlMapClientTemplate implements IUserLoginTwoDao{

	/**
	 * 是否相同名称
	 * @param loginName
	 * @param comCode
	 * @param flagDB
	 * @return
	 */
	public Integer checkBName(UserLoginBean userLogin) {
		 return (Integer)queryForObject("UserLogin.getUserCount",userLogin);
	}

	/**
	 * 测试数据库状态 
	 * @return
	 */
	public Integer getDSState() {
		return (Integer)queryForObject("UserLogin.getDataBaseStatus");
	}
	
	public Integer queryUserIdByUserNameAndCompayCode(UserLoginBean userLogin) {
		 return (Integer)queryForObject("UserLogin.queryUserIdByUserNameAndCompayCode",userLogin);
	} 
}