package com.nasoft.log.model;

public class LogBean {
	
	//��־��ʶ
	private String logId;
	//��������
	private String logType;
	//��־��Ϣ
	private String logMessage;
	//������Ա
	private String logOper;
	//����ʱ��
	private String createDate;
	
	/**
	 * @return the logType
	 */
	public String getLogType() {
		return logType;
	}
	/**
	 * @param logType the logType to set
	 */
	public void setLogType(String logType) {
		this.logType = logType;
	}
	/**
	 * @return the logMessage
	 */
	public String getLogMessage() {
		return logMessage;
	}
	/**
	 * @param logMessage the logMessage to set
	 */
	public void setLogMessage(String logMessage) {
		this.logMessage = logMessage;
	}
	/**
	 * @return the logId
	 */
	public String getLogId() {
		return logId;
	}
	/**
	 * @param logId the logId to set
	 */
	public void setLogId(String logId) {
		this.logId = logId;
	}
	/**
	 * @return the logOper
	 */
	public String getLogOper() {
		return logOper;
	}
	/**
	 * @param logOper the logOper to set
	 */
	public void setLogOper(String logOper) {
		this.logOper = logOper;
	}
	/**
	 * @return the createDate
	 */
	public String getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
