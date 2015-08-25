package com.slms.app.webapp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;

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
import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.UserProfileServiceIface;
import com.slms.app.service.impl.HomeServiceImpl;
import com.slms.app.service.impl.UserProfileServiceImpl;

public class UserProfileAction extends ActionSupport implements ModelDriven<RegistrationVo>, ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	RegistrationVo registrationVo;
	UserProfileServiceIface userProfileServiceIface;
	String response;
	HttpServletRequest request;
	@Override
	public RegistrationVo getModel() {
		registrationVo = new RegistrationVo();
		return registrationVo;
	}
	
	public String execute() {
		getRequest().getSession().removeAttribute("selectedTab");
		return SUCCESS;
	}
	
	public String updateProfile() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				registrationVo.setUserName(loginDetail.getUserName());
				registrationVo.setUserId(loginDetail.getUserId());
				loginDetail.setFirstName(registrationVo.getFirstName());
				loginDetail.setLastName(registrationVo.getLastName());
				loginDetail.setTitle(registrationVo.getTitle());
				userProfileServiceIface = new UserProfileServiceImpl();
				response = userProfileServiceIface.updateProfile(registrationVo);
				request.getSession().setAttribute("loginDetail", loginDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String updateProfileImg() {
		CloseableHttpClient httpclient =null;
		try {
			httpclient = HttpClients.createDefault();
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				if(registrationVo.getProfilePhoto() != null){
					 
			        File fileToCreate = new File("E:/"+registrationVo.getProfilePhotoFileName());  
			        FileUtils.copyFile(registrationVo.getProfilePhoto(), fileToCreate);
				
			        HttpPost httppost = new HttpPost("http://191.239.57.54:8080/SLMS/rest/user/uploadProfileImage");
			        FileBody fileName = new FileBody(new File("E:/"+registrationVo.getProfilePhotoFileName()));
		            StringBody userName = new StringBody(loginDetail.getUserName(), ContentType.TEXT_PLAIN);
		            HttpEntity reqEntity = MultipartEntityBuilder.create()
	                    .addPart("profilePhoto", fileName) //File
	                    .addPart("userName", userName)
	                    .build();
		            	httppost.setEntity(reqEntity);
		            System.out.println("executing request " + httppost.getRequestLine());
		            CloseableHttpResponse serverResponse = httpclient.execute(httppost);
	            try {
/*	                System.out.println("----------------------------------------");
	                System.out.println(serverResponse.getStatusLine());
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
					e.printStackTrace();
				}
		       finally {
		            try {
						httpclient.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		        }
				
		return SUCCESS;
	}


	
	public String changePassword() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				registrationVo.setUserName(loginDetail.getUserName());
			userProfileServiceIface = new UserProfileServiceImpl();
			response = userProfileServiceIface.changePassword(registrationVo);
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return SUCCESS;
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
	public HttpServletRequest getServletRequest() {
		return request;
	}

	/**
	 * @return the request
	 */
	public HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * @param request the request to set
	 */
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
}
