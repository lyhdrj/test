package com.nasoft.log.persistence.sqlmapdao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.log.model.LogBean;
import com.nasoft.log.persistence.iface.ILogManageDao;

public class LogManageDaoImpl extends SqlMapClientTemplate implements ILogManageDao {

	public void addLogInfo(LogBean logBean) {
		insert("LogManage.addLogInfo",logBean);
	}
	
}
