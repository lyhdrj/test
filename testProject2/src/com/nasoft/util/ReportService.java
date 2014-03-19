package com.nasoft.util;

import javax.servlet.http.HttpServletResponse;
import com.nasoft.sysmanage.model.ReportBean;

public class ReportService {

	private Reports report;
	/**
	 * @param report the report to set
	 */
	public void setReport(Reports report) {
		this.report = report;
	}
	
	private static final String EXCEL_TYPE = "1";
	private static final String PDF_TYPE = "2";
	private static final String WORD_TYPE = "3";
	
	public void createReport(ReportBean reportBean,HttpServletResponse response) throws Exception{
		
		reportBean.setReportUrl((reportBean.getRealPath()+ReportConstants.REPORT_PLATE_PATH).replace("\\", "/")+reportBean.getPlateName());
		if(EXCEL_TYPE.equals(reportBean.getReportType())||"EXCEL".equalsIgnoreCase(reportBean.getReportType())){
			report.selectExcelReport(response,reportBean);
		}else if(PDF_TYPE.equals(reportBean.getReportType())||"PDF".equalsIgnoreCase(reportBean.getReportType())){
			report.selectPDFReport(response,reportBean);
		}else if(WORD_TYPE.equals(reportBean.getReportType())||"WORD".equalsIgnoreCase(reportBean.getReportType())){
			report.selectWordReport(response,reportBean);
		}
	}
}
