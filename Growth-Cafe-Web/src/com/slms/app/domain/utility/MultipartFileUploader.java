package com.slms.app.domain.utility;


import java.io.File;
import java.io.IOException;
import java.util.List;

/**
* This program demonstrates a usage of the MultipartUtility class.
* @author www.codejava.net
*
*/
public class MultipartFileUploader {

   public static void main() {
       String charset = "UTF-8";
       File uploadFile1 = new File("E:/Big_Buck_Bunny.mp4");
       String requestURL = "http://191.239.57.54:8080/SLMS/rest/course/uploadResourceDetail";

       try {
           MultipartUtility multipart = new MultipartUtility(requestURL, charset);
            
           
           multipart.addHeaderField("resourceName", "yogTest");
           multipart.addHeaderField("resourceAuthor", "Yogendra");
           multipart.addHeaderField("descTxt", "Description");
           multipart.addHeaderField("userName", "anils@ixeet.com");
           //multipart.addHeaderField("fileName", "Big_Buck_Bunny.mp4");
           multipart.addHeaderField("uploadedUrl", "E:/Big_Buck_Bunny.mp4");
           multipart.addHeaderField("assignmentId", "2");
           multipart.addFilePart("fileName", uploadFile1);

           List<String> response = multipart.finish();
            
           System.out.println("SERVER REPLIED:");
            
           for (String line : response) {
               System.out.println(line);
           }
       } catch (IOException ex) {
           System.err.println(ex);
       }
   }
}
