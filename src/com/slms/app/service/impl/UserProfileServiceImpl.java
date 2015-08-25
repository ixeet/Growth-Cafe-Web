package com.slms.app.service.impl;

import org.json.JSONObject;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.UserProfileServiceIface;

public class UserProfileServiceImpl implements UserProfileServiceIface{

	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	
	@Override
	public String updateProfile(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"SLMS/rest/user/updateProfile";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("userid", registrationVo.getUserId());
			requestJsonObject.put("userName", registrationVo.getUserName());
			requestJsonObject.put("title", registrationVo.getTitle());
			requestJsonObject.put("firstName", registrationVo.getFirstName());
			requestJsonObject.put("lastName", registrationVo.getLastName());
			requestJsonObject.put("emailId", registrationVo.getUserName());
			
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
	
	
	@Override
	public String changePassword(RegistrationVo registrationVo) {
		try {
		String url=baseUrl+"SLMS/rest/user/changePwd";
		JSONObject chpasJsonObject = new JSONObject();
		chpasJsonObject.put("userName", registrationVo.getUserName());
		chpasJsonObject.put("userPassword", registrationVo.getUserPassword());
		chpasJsonObject.put("userNewPassword", registrationVo.getUserNewPassword());
		response = PostJsonObject.postJson(chpasJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}


	@Override
	public String updateProfileImg(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"SLMS/rest/user/uploadProfileImage";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("userName", registrationVo.getUserName());
			requestJsonObject.put("profilePhoto", "E:/learning-logo.png");
			
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

}
