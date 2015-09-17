package com.slms.app.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

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
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.UserProfileServiceIface;

public class UserProfileServiceImpl implements UserProfileServiceIface{
	
	Logger logger = LoggerFactory.getLogger(UserProfileServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String tempLocation=Utility.getProperties("application.properties").getProperty("tempLocation");
	String response;
	
	
	@Override
	public String updateProfile(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"rest/user/updateProfile";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("userid", registrationVo.getUserId());
			requestJsonObject.put("userName", registrationVo.getUserName());
			requestJsonObject.put("title", registrationVo.getTitle());
			requestJsonObject.put("firstName", registrationVo.getFirstName());
			requestJsonObject.put("lastName", registrationVo.getLastName());
			requestJsonObject.put("emailId", registrationVo.getUserName());
			logger.debug("UserProfileServiceImpl method:-updateProfile Request:-"+requestJsonObject);
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			logger.error("UserProfileServiceImpl method:-updateProfile "+e.getMessage());
		}
		logger.debug("UserProfileServiceImpl method:-updateProfile Response:-"+response);
		return response;
	}
	
	
	@Override
	public String changePassword(RegistrationVo registrationVo) {
		try {
		String url=baseUrl+"rest/user/changePwd";
		JSONObject chpasJsonObject = new JSONObject();
		chpasJsonObject.put("userName", registrationVo.getUserName());
		chpasJsonObject.put("userPassword", registrationVo.getUserPassword());
		chpasJsonObject.put("userNewPassword", registrationVo.getUserNewPassword());
		logger.debug("UserProfileServiceImpl method:-changePassword Request:-"+chpasJsonObject);
		response = PostJsonObject.postJson(chpasJsonObject, url);
		} catch (Exception e) {
			logger.error("UserProfileServiceImpl method:-changePassword "+e.getMessage());
		}
		logger.debug("UserProfileServiceImpl method:-changePassword Response:-"+response);
		return response;
	}


	@Override
	public String updateProfileImg(RegistrationVo registrationVo) {
			String url=baseUrl+"rest/user/uploadProfileImage";
			logger.debug("UserProfileServiceImpl method:-updateProfileImg ");
			CloseableHttpClient httpclient =null;
			try {
				httpclient = HttpClients.createDefault();
				HttpServletRequest request = ServletActionContext.getRequest();
				RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
				if(loginDetail !=null){
					if(registrationVo.getProfilePhoto() != null){
						String[] tempName = registrationVo.getProfilePhotoFileName().split("\\.");
		        		String tempFileName ="tempName."+tempName[1];
				        File fileToCreate = new File(tempLocation+tempFileName);  
				        FileUtils.copyFile(registrationVo.getProfilePhoto(), fileToCreate);
					
				        HttpPost httppost = new HttpPost(url);
				        FileBody fileName = new FileBody(new File(tempLocation+tempFileName));
			            StringBody userName = new StringBody(loginDetail.getUserName(), ContentType.TEXT_PLAIN);
			            HttpEntity reqEntity = MultipartEntityBuilder.create()
		                    .addPart("profilePhoto", fileName) //File
		                    .addPart("userName", userName)
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
		                    JSONObject jsonResponse = new JSONObject(response);
		                    if(jsonResponse.has("statusMessage") && jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
		                    	loginDetail.setProfilePhotoFileName(jsonResponse.getString("uploadLocation"));
		                    	request.getSession().setAttribute("loginDetail", loginDetail);
		                    }
		                    reader.close();
		                }
		                EntityUtils.consume(resEntity);
		            } finally {
		            	serverResponse.close();
		            }
					}
		          }
		        	}catch (Exception e) {
		        		logger.debug("UserProfileServiceImpl method:-updateProfileImg "+e.getMessage());
					}
			       finally {
			            try {
							httpclient.close();
						} catch (IOException e) {
							logger.error("UserProfileServiceImpl method:-updateProfileImg "+e.getMessage());
						}
			        }
			logger.debug("UserProfileServiceImpl method:-updateProfileImg Response:-"+response);
		return response;
	}

}
