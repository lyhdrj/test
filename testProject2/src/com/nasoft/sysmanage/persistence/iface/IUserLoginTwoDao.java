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
 * ������: �� �� �޸�ʱ��: 2009-03-19
 * 
 * ģ�飨�ӿڣ�˵���� ϵͳ��½���ܣ���˾��Ϣȡ�ù������ݲ�
 * 
 */
public interface IUserLoginTwoDao {

	/**
	 * �Ƿ���ͬ����
	 * 
	 * @return
	 */
	public Integer checkBName(UserLoginBean userLogin);

	/**
	 * �������ݿ�״̬
	 * 
	 * @return
	 */
	public Integer getDSState();

	public Integer queryUserIdByUserNameAndCompayCode(
			UserLoginBean userLogin);
}
