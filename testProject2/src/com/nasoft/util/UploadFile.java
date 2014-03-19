package com.nasoft.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts.upload.FormFile;



public class UploadFile {
	String dir = "";
    String fileType = "";
    FormFile file = null;
    String filePath="";
    String filePathTemp="";
    int fileMaxSize=4*1024*1024; // �����ļ���󳤶� 
    public UploadFile(FormFile file,String dirTemp){
        this.file = file;
        for (int i = 0; i < dirTemp.length(); i++) {
			char ch = dirTemp.charAt(i);
			char t = '\\';
			if (ch == t)
				ch = '/';
			filePathTemp = filePathTemp + ch;
		}
        this.dir = filePathTemp;
    }

    public String upload() throws Exception{
    	
        String flag ="true";
        // 1.����ϴ��ļ���.
        String fileName = file.getFileName();
        int fileSize=file.getFileSize();
        if(fileMaxSize<fileSize){
        	flag = "File Size over maximum value!";
        }else{
//        	 2. �ϴ��ļ���Ϊ��.
            if(fileName!=null&&!fileName.equals("")){
                int point = fileName.lastIndexOf('.');
                //3. ����ļ���������С���㣬����false
                if(point == -1){
                    fileType = "";
                    flag = "File Type is not null!";
                }else{
                    //3.����ϴ��ļ��ĺ�׺��
                    fileType = fileName.substring(point).toLowerCase();

                    // 4.�Ƚ��ϴ��ļ���׺��
                    if(".xls".equalsIgnoreCase(fileType)){
                        // 5.��ʼ�ϴ��ļ�
                    	Date date=new Date();
                    	filePath=dir+"/"+date.getTime()+"_"+fileName;
                        InputStream streamIn = file.getInputStream();
                        OutputStream StreamOut = new FileOutputStream(filePath);
                        flag=filePath;
                        byte[] buffer = new byte[8192];
                        int bytesRead = 0;
                        while ((bytesRead = streamIn.read(buffer, 0, 8192)) != -1) {
                            StreamOut.write(buffer, 0, bytesRead);
                        }
                        StreamOut.close();
                        streamIn.close();
                    } else {
                        fileType = "";
                        flag = "File is not Excel File!";
                    }
                }
            }
        }
        
        return flag;
    }
    public void delete(String path){
    	File f = new File(path);
		if (f.exists()) {
			f.delete();//delete File
		}
    }
    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

}
