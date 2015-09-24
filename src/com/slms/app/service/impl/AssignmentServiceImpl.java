package com.slms.app.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.AssignmentServiceIface;
import com.slms.app.webapp.controller.HomeAction;

public class AssignmentServiceImpl implements AssignmentServiceIface{

	Logger logger = LoggerFactory.getLogger(AssignmentServiceImpl.class);
	
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String tempLocation=Utility.getProperties("application.properties").getProperty("tempLocation");
	String response;
	
	@Override
	public String assignments(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"rest/course/getAssignments";
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userId", registrationVo.getUserId());
			logingJsonObject.put("searchText","");
			logger.debug("AssignmentServiceImpl method:-assignments Request:-"+logingJsonObject);
			response = PostJsonObject.postJson(logingJsonObject, url);
		} catch (Exception e) {
			logger.error("AssignmentServiceImpl method:-assignments "+e.getMessage());
		}
		logger.debug("AssignmentServiceImpl method:-assignments Response:"+response);
		return response;
	}

	@Override
	public String uploadAssignment(AssignmentVo assignmentVo,
			RegistrationVo loginDetail) {
		try {
			String url=baseUrl+"rest/course/uploadResourceDetail";
			logger.debug("AssignmentServiceImpl method:-uploadAssignment ");
			 CloseableHttpClient httpclient = HttpClients.createDefault();
		        try {
		        		if(assignmentVo.getAssignmentRes() != null){
		        		String[] tempName = assignmentVo.getAssignmentResFileName().split("\\.");
		        		String tempFileName ="tempName."+tempName[1];
				        File fileToCreate = new File(tempLocation, tempFileName);  
				        FileUtils.copyFile(assignmentVo.getAssignmentRes(), fileToCreate);
				        HttpPost httppost = new HttpPost(url);
				        FileBody fileName = new FileBody(new File(tempLocation+tempFileName));
			            StringBody resourceName = new StringBody(assignmentVo.getAssignmentName(), ContentType.TEXT_PLAIN);
			            StringBody resourceAuthor = new StringBody(loginDetail.getFirstName()+" "+loginDetail.getLastName(), ContentType.TEXT_PLAIN);
			            StringBody userName = new StringBody(loginDetail.getUserName(), ContentType.TEXT_PLAIN);
			            StringBody uploadedUrl = new StringBody(assignmentVo.getAssignmentLink(), ContentType.TEXT_PLAIN);
			            StringBody assignmentId = new StringBody(""+assignmentVo.getAssignmentId(), ContentType.TEXT_PLAIN);
			            StringBody descTxt = new StringBody(""+assignmentVo.getAssignmentDesc(), ContentType.TEXT_PLAIN);
			            HttpEntity reqEntity = MultipartEntityBuilder.create()
		                    .addPart("fileName", fileName) //File
		                    .addPart("resourceName", resourceName)
		                    .addPart("resourceAuthor", resourceAuthor)
		                    .addPart("userName", userName)
		                    .addPart("uploadedUrl", uploadedUrl)
		                    .addPart("assignmentId", assignmentId)
		                    .addPart("descTxt", descTxt)
		                    .build();
			            	httppost.setEntity(reqEntity);
			            logger.debug("executing request " + httppost.getRequestLine());
			            CloseableHttpResponse serverResponse = httpclient.execute(httppost);
		            try {
	/*	                logger.debug("----------------------------------------");
		                logger.debug(serverResponse.getStatusLine());
	*/	                HttpEntity resEntity = serverResponse.getEntity();
		                if (resEntity != null) {
		                    BufferedReader reader = new BufferedReader(new InputStreamReader(resEntity.getContent()));
		                    StringBuilder out = new StringBuilder();
		                    String line;
		                    while ((line = reader.readLine()) != null) {
		                        out.append(line);
		                    }
		                    response = out.toString();   //Prints the string content read from input stream
		                    reader.close();
		                }
		                EntityUtils.consume(resEntity);
		            } finally {
		            	serverResponse.close();
		            }
		          }
		        	}catch (Exception e) {
		        		logger.error("AssignmentServiceImpl method:-uploadAssignment "+e.getMessage());
					}
			       finally {
			            httpclient.close();
			        }
			
			
		} catch (Exception e) {
			logger.error("AssignmentServiceImpl method:-uploadAssignment "+e.getMessage());
		}
		logger.debug("AssignmentServiceImpl uploadAssignment:-uploadAssignment Response:"+response);
		return response;
	}

}
