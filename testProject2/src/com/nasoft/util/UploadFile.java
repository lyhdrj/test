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
    int fileMaxSize=4*1024*1024; // 设置文件最大长度 
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
        // 1.获得上传文件名.
        String fileName = file.getFileName();
        int fileSize=file.getFileSize();
        if(fileMaxSize<fileSize){
        	flag = "File Size over maximum value!";
        }else{
//        	 2. 上传文件不为空.
            if(fileName!=null&&!fileName.equals("")){
                int point = fileName.lastIndexOf('.');
                //3. 如果文件名不包含小数点，返回false
                if(point == -1){
                    fileType = "";
                    flag = "File Type is not null!";
                }else{
                    //3.获得上传文件的后缀名
                    fileType = fileName.substring(point).toLowerCase();

                    // 4.比较上传文件后缀名
                    if(".xls".equalsIgnoreCase(fileType)){
                        // 5.开始上传文件
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
