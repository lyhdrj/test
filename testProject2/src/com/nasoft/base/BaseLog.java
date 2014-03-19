package com.nasoft.base;
/*
 * 日志基类
 * @author bilimin
 * @version 1.0.1, 2008-07-01
 */
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BaseLog {
	/** 取得日志记录器Logger */
	public static Log log = LogFactory.getLog(BaseLog.class);
}