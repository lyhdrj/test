package com.nasoft.sysmanage.model;

import java.util.HashMap;
import java.util.List;

public class ReportBean {
	
	//���ݼ���
	private List list;
	//�������
	private HashMap map;
	//����·��
	private String reportUrl;
	//ģ������
	private String plateName;
	//��������
	private String reportType;
	//��Ŀ·��
	private String realPath;
	//���ɱ�������
	private String reportName;

	/**
	 * @return the reportName
	 */
	public String getReportName() {
		return reportName;
	}
	/**
	 * @param reportName the reportName to set
	 */
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	/**
	 * @return the exportName
	 */
	public String getPlateName() {
		return plateName;
	}
	/**
	 * @param exportName the exportName to set
	 */
	public void setPlateName(String plateName) {
		this.plateName = plateName;
	}
	/**
	 * @return the realPath
	 */
	public String getRealPath() {
		return realPath;
	}
	/**
	 * @param realPath the realPath to set
	 */
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	/**
	 * @return the list
	 */
	public List getList() {
		return list;
	}
	/**
	 * @param list the list to set
	 */
	public void setList(List list) {
		this.list = list;
	}
	/**
	 * @return the map
	 */
	public HashMap getMap() {
		return map;
	}
	/**
	 * @param map the map to set
	 */
	public void setMap(HashMap map) {
		this.map = map;
	}
	/**
	 * @return the reportUrl
	 */
	public String getReportUrl() {
		return reportUrl;
	}
	/**
	 * @param reportUrl the reportUrl to set
	 */
	public void setReportUrl(String reportUrl) {
		this.reportUrl = reportUrl;
	}
	/**
	 * @return the reportType
	 */
	public String getReportType() {
		return reportType;
	}
	/**
	 * @param reportType the reportType to set
	 */
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
}
