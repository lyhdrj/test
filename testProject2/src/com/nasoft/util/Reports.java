package com.nasoft.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

import com.nasoft.sysmanage.model.ReportBean;

public class Reports {
	
	/**
	 * @author Liu Hanpeng Dec 13, 2012
	 * @param list
	 * @param response
	 * @param url
	 * @param map 
	 * @Description create html file
	 */
	public void selectHtmlReport(HttpServletResponse response,ReportBean reportBean) throws Exception{
		response.setContentType("text/html;charset=GBK");
		File reportFile = new File(reportBean.getReportUrl());
		JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
		
		JRBeanCollectionDataSource jrbean = new JRBeanCollectionDataSource(reportBean.getList());
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,reportBean.getMap(),jrbean);
		JRHtmlExporter exporter = new JRHtmlExporter();
		PrintWriter out = response.getWriter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
		exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
		exporter.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);
		exporter.exportReport();
	}
	
	/**
	 * @author Liu Hanpeng Dec 13, 2012
	 * @param response
	 * @param reportBean 
	 * @Description create excel file
	 */
	public void selectExcelReport(HttpServletResponse response,ReportBean reportBean) throws Exception{
		//加载jasper文件
		File reportFile = new File(reportBean.getReportUrl());
		JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
		//装载数据
		JRBeanCollectionDataSource jrbean = new JRBeanCollectionDataSource(reportBean.getList());
		//构造jasperPrint对象
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportBean.getMap(), jrbean);
		//输出流
		ByteArrayOutputStream oStream = new ByteArrayOutputStream();
		//构造输出对象
		JExcelApiExporter exporter = new JExcelApiExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, oStream);
		exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录最下面的空行
		exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);// 删除多余的ColumnHeader
		exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
		exporter.exportReport();
		//excel文件名
	    String fileName = reportBean.getReportName() + ".xls";
	    response.reset();
	    //解决文件名乱码问题
	    response.setHeader("Content-Disposition", "attachment;filename=\"" + new String(fileName.getBytes("GBK"), "ISO8859_1") + "\"");
	    response.setContentType("application/vnd.ms-excel;charset=GBK");
		//写输出流
	    outPrint(response,oStream,reportBean);
	}
	
	/**
	 * @author Liu Hanpeng Dec 13, 2012
	 * @param response
	 * @param reportBean 
	 * @Description create pdf file
	 */
	public void selectPDFReport(HttpServletResponse response,ReportBean reportBean) throws Exception{
		//加载jasper文件
		File reportFile = new File(reportBean.getReportUrl());
		JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
		//装载数据
		JRBeanCollectionDataSource jrbean = new JRBeanCollectionDataSource(reportBean.getList());
		//构造jasperPrint对象
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportBean.getMap(), jrbean);
	    //输出流
		ByteArrayOutputStream oStream = new ByteArrayOutputStream();
		//构造输出对象
		JRPdfExporter exporter = new JRPdfExporter();
	    exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	    exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, oStream);
	    exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE); // 删除记录最下面的空行
	    exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);// 删除多余的ColumnHeader
	    exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);// 显示边框
	    exporter.exportReport();
	    //pdf文件名
	    String fileName = reportBean.getReportName() + ".pdf";
	    response.reset();
		//解决文件名乱码问题
	    response.setHeader("Content-Disposition", "attachment;filename=\"" + new String(fileName.getBytes("GBK"), "ISO8859_1") + "\"");
	    response.setContentType("application/pdf;charset=GBK");
		//写输出流
	    outPrint(response,oStream,reportBean);
	}
	
	/**
	 * @author Liu Hanpeng Dec 13, 2012
	 * @param response
	 * @param reportBean 
	 * @Description create word file
	 */
	public void selectWordReport(HttpServletResponse response,ReportBean reportBean) throws Exception{
		//加载jasper文件
		File reportFile = new File(reportBean.getReportUrl());
		JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
		
		//装载数据
		JRBeanCollectionDataSource jrbean = new JRBeanCollectionDataSource(reportBean.getList());
		//构造jasperPrint对象
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportBean.getMap(), jrbean);
		//输出流
		ByteArrayOutputStream oStream = new ByteArrayOutputStream();
		//构造输出对象
		JRExporter exporter = new JRRtfExporter();
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, oStream);
		exporter.exportReport();
		String fileName = reportBean.getReportName() + ".doc";
		response.reset();
		response.setHeader("Content-Disposition", "attachment;filename=\"" + new String(fileName.getBytes("GBK"), "ISO8859_1") + "\"");
		response.setContentType("application/msword;charset=GBK");
		//写输出流
		outPrint(response,oStream,reportBean);
	}
	
	/**
	 * @author Liu Hanpeng Dec 13, 2012
	 * @param response
	 * @param oStream
	 * @param reportBean 
	 * @Description print file
	 */
	public void outPrint(HttpServletResponse response,ByteArrayOutputStream oStream,ReportBean reportBean) throws Exception{
		ServletOutputStream ouputStream=null;
		try{
			byte[] bytes = oStream.toByteArray();
			if(bytes != null && bytes.length > 0) {
				response.setContentLength(bytes.length); 
				ouputStream = response.getOutputStream(); 
				ouputStream.write(bytes,0,bytes.length); 
				ouputStream.flush();
			}
		}finally{
			ouputStream.close();
		}
	}
	
	/**
	 * @author Liu Hanpeng Dec 14, 2012
	 * @param key
	 * @return 
	 * @Description get report name
	 */
	public String getProperties(String key) throws Exception{
		Properties pros = new Properties();
		InputStream path = this.getClass().getClassLoader().getResourceAsStream(ReportConstants.REPORT_PROPERTIES_PATH);
		pros.load(path);
		return pros.getProperty(key);
	}
}
