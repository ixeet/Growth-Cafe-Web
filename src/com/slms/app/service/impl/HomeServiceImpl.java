package com.slms.app.service.impl;

import org.json.JSONObject;
import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.FacebookApi;
import org.scribe.oauth.OAuthService;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.HomeServiceIface;

public class HomeServiceImpl implements HomeServiceIface{
	
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	@Override
	public String registration(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"SLMS/rest/user/register";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userName", registrationVo.getUserName());
			regJsonObject.put("firstName", registrationVo.getFirstName());
			regJsonObject.put("lastName", registrationVo.getLastName());
			regJsonObject.put("emailId", registrationVo.getUserName());
			regJsonObject.put("schoolId", registrationVo.getSchoolId());
			regJsonObject.put("schoolName", registrationVo.getSchoolName());
			//regJsonObject.put("address", registrationVo.getAddress());
			regJsonObject.put("classId", registrationVo.getClassId());
			regJsonObject.put("className", registrationVo.getClassName());
			regJsonObject.put("homeRoomId", registrationVo.getHomeRoomId());
			regJsonObject.put("homeRoomName", registrationVo.getHomeRoomName());
			regJsonObject.put("adminEmailId", registrationVo.getAdminEmailId());
			regJsonObject.put("userPassword", registrationVo.getUserPassword());
			regJsonObject.put("title", registrationVo.getTitle());
			response = PostJsonObject.postJson(regJsonObject, url);
			System.out.println("registration success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String login(RegistrationVo registrationVo) {
		try {
			
			String url=baseUrl+"SLMS/rest/user/login";
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userName", registrationVo.getUserName());
			logingJsonObject.put("userPassword", registrationVo.getUserPassword());
			response = PostJsonObject.postJson(logingJsonObject, url);
			//System.out.println("login successfully");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String setFacebookId(RegistrationVo registrationVo) {
		
		String userName = registrationVo.getUserName();
		String FbId = registrationVo.getUserFbId();
		
		try {
		String url=baseUrl+"SLMS/rest/user/setFBId/userName/"+userName+"/userFbId/"+FbId;
		response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String forgetPassword(RegistrationVo registrationVo) {
		String userName = registrationVo.getUserName();
		try {
		String url=baseUrl+"SLMS/rest/user/forgetPwd/userId/"+userName;
		response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}


	@Override
	public String getByFBId(RegistrationVo registrationVo) {
		String fbId =registrationVo.getUserFbId();
		
		try {
			
			String url=baseUrl+"SLMS/rest/user/getByFBId/userFbId/"+fbId;
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return response;
	}

	@Override
	public String getSchoolMasterData(){
			try {
			String url=baseUrl+"SLMS/rest/common/getMasterData";
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return response;
	}
	
	@Override
	public String personalProfile(int userId) {
		try {
			String url=baseUrl+"SLMS/rest/common/getUser/id/"+userId;
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return response;
	}

}
