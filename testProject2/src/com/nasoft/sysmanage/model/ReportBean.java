package com.nasoft.sysmanage.model;

import java.util.HashMap;
import java.util.List;

public class ReportBean {
	
	//数据集合
	private List list;
	//报表参数
	private HashMap map;
	//报表路径
	private String reportUrl;
	//模版名称
	private String plateName;
	//生成类型
	private String reportType;
	//项目路径
	private String realPath;
	//生成报表名称
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
