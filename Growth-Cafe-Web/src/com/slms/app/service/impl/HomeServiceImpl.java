package com.slms.app.service.impl;

import org.json.JSONObject;
import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.FacebookApi;
import org.scribe.oauth.OAuthService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.HomeServiceIface;

public class HomeServiceImpl implements HomeServiceIface{
	Logger logger = LoggerFactory.getLogger(HomeServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	@Override
	public String registration(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"rest/user/register";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userName", registrationVo.getUserName());
			regJsonObject.put("firstName", registrationVo.getFirstName());
			regJsonObject.put("lastName", registrationVo.getLastName());
			regJsonObject.put("emailId", registrationVo.getUserName());
			regJsonObject.put("schoolId", registrationVo.getSchoolId());
			regJsonObject.put("schoolName", registrationVo.getSchoolName());
			//regJsonObject.put("address", "usa");
			regJsonObject.put("classId", registrationVo.getClassId());
			regJsonObject.put("className", registrationVo.getClassName());
			regJsonObject.put("homeRoomId", registrationVo.getHomeRoomId());
			regJsonObject.put("homeRoomName", registrationVo.getHomeRoomName());
			regJsonObject.put("adminEmailId", registrationVo.getAdminEmailId());
			regJsonObject.put("userPassword", registrationVo.getUserPassword());
			regJsonObject.put("title", registrationVo.getTitle());
			logger.debug("HomeServiceImpl method:-registration Request:-"+regJsonObject);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			logger.error("HomeServiceImpl method:-registration "+e.getMessage());
		}
		logger.debug("HomeServiceImpl method:-registration Response:"+response);
		return response;
	}

	@Override
	public String login(RegistrationVo registrationVo) {
		try {
			
			String url=baseUrl+"rest/user/login";
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userName", registrationVo.getUserName());
			logingJsonObject.put("userPassword", registrationVo.getUserPassword());
			logger.debug("HomeServiceImpl method:-login  Request:-"+logingJsonObject);
			response = PostJsonObject.postJson(logingJsonObject, url);
		} catch (Exception e) {
			logger.error("HomeServiceImpl login:-getSchoolMasterData "+e.getMessage());
		}
		logger.debug("HomeServiceImpl login:-getSchoolMasterData Response:"+response);
		return response;
	}

	@Override
	public String setFacebookId(RegistrationVo registrationVo) {
		
		String userName = registrationVo.getUserName();
		String FbId = registrationVo.getUserFbId();
		
		try {
		String url=baseUrl+"rest/user/setFBId/userName/"+userName+"/userFbId/"+FbId;
		response = GetJsonObject.getWebServceObj(url);
		logger.debug("HomeServiceImpl method:-setFacebookId  url:-"+url);
		} catch (Exception e) {
			logger.error("HomeServiceImpl method:-setFacebookId "+e.getMessage());
		}
		logger.debug("HomeServiceImpl method:-setFacebookId Response:"+response);
		return response;
	}

	@Override
	public String forgetPassword(RegistrationVo registrationVo) {
		String userName = registrationVo.getUserName();
		try {
		String url=baseUrl+"rest/user/forgetPwd/userId/"+userName;
		response = GetJsonObject.getWebServceObj(url);
		logger.debug("HomeServiceImpl method:-forgetPassword  url:-"+url);
		} catch (Exception e) {
			logger.error("HomeServiceImpl method:-forgetPassword "+e.getMessage());
		}
		logger.debug("HomeServiceImpl method:-forgetPassword Response:"+response);
		return response;
	}


	@Override
	public String getByFBId(RegistrationVo registrationVo) {
		String fbId =registrationVo.getUserFbId();
		
		try {
			
			String url=baseUrl+"rest/user/getByFBId/userFbId/"+fbId;
			response = GetJsonObject.getWebServceObj(url);
			logger.debug("HomeServiceImpl method:-getByFBId  url:-"+url);
			} catch (Exception e) {
				logger.error("HomeServiceImpl method:-getByFBId "+e.getMessage());
			}
			logger.debug("HomeServiceImpl method:-getByFBId Response:"+response);
			return response;
	}

	@Override
	public String getSchoolMasterData(){
			try {
			String url=baseUrl+"rest/common/getMasterData";
			System.out.println("HomeServiceImpl method:-getSchoolMasterData url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
				System.out.println("HomeServiceImpl method:-getSchoolMasterData "+e.getMessage());
			}
			System.out.println("HomeServiceImpl method:-getSchoolMasterData Response:"+response);
			return response;
	}
	
	@Override
	public String personalProfile(int userId) {
		try {
			String url=baseUrl+"rest/common/getUser/id/"+userId;
			System.out.println("HomeServiceImpl method:-personalProfile url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
				System.out.println("HomeServiceImpl method:-personalProfile "+e.getMessage());
			}
		System.out.println("HomeServiceImpl method:-personalProfile Response:"+response);
			return response;
	}

}
