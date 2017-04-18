package com.file;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
public class  CreateNewFile {

 /**
 * Delete Files
*/
public void deleteFile(String path){
 String dPath="C:/apache-tomcat-6.0.45/webapps/ROOT/htmlstorage"+path;
 File f=new File(dPath);  //path:E:/tomcat/...
 try{
   f.delete();
 }catch(Exception e){}
 }

 /**
 *Create Files
*/
public boolean createFile(String _path, String _fileName) 
                      throws IOException {
 boolean success = false;
 String fileName = _fileName;
 String filePath = "C:/apache-tomcat-6.0.45/webapps/ROOT/htmlstorage"+_path;
 try {
 File file = new File(filePath);
 if (!file.isDirectory()) {
 file.mkdirs();
 }
 File f = new File(filePath + File.separator 
                                     + fileName);
 success = f.createNewFile();

 } catch (IOException e) {
 e.printStackTrace();
 }
 return success;

 }

 /**
 *Appedent Files
*/
public void writeFile(String _path, String _fileName,
                            String insertString,boolean isLast) 
                            throws IOException {

 try {
 String nPath="C:/apache-tomcat-6.0.45/webapps/ROOT/htmlstorage"+_path;
 BufferedWriter out = new BufferedWriter(new FileWriter(nPath + File.separator + _fileName));
 out.write(insertString);
 if(!isLast) out.newLine();
 out.flush();
 out.close();
 } catch (IOException e) {
 e.printStackTrace();
 }

 }

 } 