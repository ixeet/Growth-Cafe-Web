package com.slms.app.service.impl;

import org.json.JSONObject;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.AssignmentServiceIface;

public class AssignmentServiceImpl implements AssignmentServiceIface{

	
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	@Override
	public String assignments(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"SLMS/rest/course/getAssignments";
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userId", registrationVo.getUserId());
			logingJsonObject.put("searchText","");
			response = PostJsonObject.postJson(logingJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String uploadAssignment(AssignmentVo assignmentVo,
			RegistrationVo loginDetail) {
		try {
			String url=baseUrl+"SLMS/rest/course/uploadResourceDetail";
			
			/*JSONObject responseJsonObject = new JSONObject();
			responseJsonObject.put("resourceName",assignmentVo.getAssignmentName());
			responseJsonObject.put("resourceAuthor","");
			responseJsonObject.put("descTxt",assignmentVo.getAssignmentDesc());
			responseJsonObject.put("userName",loginDetail.getUserName());
			responseJsonObject.put("fileName",assignmentVo.getAssignmentResFileName());
			responseJsonObject.put("uploadedUrl",assignmentVo.getAssignmentLink());
			responseJsonObject.put("assignmentId",assignmentVo.getAssignmentId());
			response = PostJsonObject.postJson(responseJsonObject, url);*/
			
			
			/*CloseableHttpClient httpClient = HttpClients.createDefault();
			HttpPost uploadFile = new HttpPost(url);

			MultipartEntityBuilder builder = MultipartEntityBuilder.create();
			builder.addTextBody("field1", "yes", ContentType.TEXT_PLAIN);
			builder.addBinaryBody("file", new File("E:/"+assignmentVo.getAssignmentResFileName()), ContentType.APPLICATION_OCTET_STREAM, "file.ext");
			HttpEntity multipart = builder.build();

			uploadFile.setEntity(multipart);

			CloseableHttpResponse response = httpClient.execute(uploadFile);
			HttpEntity responseEntity = response.getEntity();*/
			
			
			/*CloseableHttpClient httpclient = HttpClients.createDefault();
	        try {
	            HttpPost httppost = new HttpPost(url);

	            FileBody fileName = new FileBody(new File("E:/"+assignmentVo.getAssignmentResFileName()));
	            
	            StringBody resourceName = new StringBody("rname", ContentType.TEXT_PLAIN);
	            StringBody resourceAuthor = new StringBody("rauthor", ContentType.TEXT_PLAIN);
	            StringBody userName = new StringBody(loginDetail.getUserName(), ContentType.TEXT_PLAIN);
	            StringBody uploadedUrl = new StringBody("test.com", ContentType.TEXT_PLAIN);
	            StringBody assignmentId = new StringBody("2", ContentType.TEXT_PLAIN);

	            HttpEntity reqEntity = MultipartEntityBuilder.create()
	                    .addPart("fileName", fileName) //File
	                    .addPart("resourceName", resourceName)
	                    .addPart("resourceAuthor", resourceAuthor)
	                    .addPart("userName", userName)
	                    .addPart("uploadedUrl", uploadedUrl)
	                    .addPart("assignmentId", assignmentId)
	                    .build();


	            httppost.setEntity(reqEntity);

	            System.out.println("executing request " + httppost.getRequestLine());
	            CloseableHttpResponse response = httpclient.execute(httppost);
	            try {
	                System.out.println("----------------------------------------");
	                System.out.println(response.getStatusLine());
	                HttpEntity resEntity = response.getEntity();
	                if (resEntity != null) {
	                    System.out.println("Response content length: " + resEntity.getContentLength());
	                    System.out.println(resEntity.getContentType());
	                }
	                EntityUtils.consume(resEntity);
	            } finally {
	                response.close();
	            }
	        } finally {
	            httpclient.close();
	        }*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

}
