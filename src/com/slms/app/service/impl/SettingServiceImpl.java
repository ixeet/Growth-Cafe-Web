package com.slms.app.service.impl;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.SettingServiceIface;

public class SettingServiceImpl implements SettingServiceIface{
	
	Logger logger = LoggerFactory.getLogger(HomeServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;

	@Override
	public String getFeedUser(int userId) {
		try {
			String url=baseUrl+"rest/user/getFeedUsers/userId/"+userId;
			response = GetJsonObject.getWebServceObj(url);
			logger.debug("SettingServiceImpl method:-getFeedUser  url:-"+url);
			} catch (Exception e) {
				logger.error("SettingServiceImpl method:-getFeedUser "+e.getMessage());
			}
			logger.debug("SettingServiceImpl method:-getFeedUser Response:"+response);
			return response;
	}

	@Override
	public String setFollowerStatus(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"rest/user/updateFollowersStatus";
			JSONObject requestObj = new JSONObject();
			requestObj.put("userid", registrationVo.getUserId());
			JSONArray jsonArr = new JSONArray();
			String[] users = registrationVo.getFollowStatus().split(",");
			for(int i=0;i<users.length;i++){
				JSONObject jsonObj = new JSONObject();
				String[] userDetail =users[i].split("-");
				jsonObj.put("userid", userDetail[0]);
				jsonObj.put("isFollowUpAllowed", userDetail[1]);
				jsonArr.put(jsonObj);
			}
			requestObj.put("usersList", jsonArr);
			response = PostJsonObject.postJson(requestObj, url);
			logger.debug("SettingServiceImpl method:-getFeedUser  url:-"+url);
			} catch (Exception e) {
				logger.error("SettingServiceImpl method:-getFeedUser "+e.getMessage());
			}
			logger.debug("SettingServiceImpl method:-getFeedUser Response:"+response);
			return response;
	}

	@Override
	public String getFeedAccessType(int userId) {
		try {
			String url=baseUrl+"rest/user/getFeedAccessType/userId/"+userId;
			response = GetJsonObject.getWebServceObj(url);
			logger.debug("SettingServiceImpl method:-getFeedUser  url:-"+url);
			} catch (Exception e) {
				logger.error("SettingServiceImpl method:-getFeedUser "+e.getMessage());
			}
			logger.debug("SettingServiceImpl method:-getFeedUser Response:"+response);
			return response;
	}

	@Override
	public String setFeedAccessType(RegistrationVo registrationVo, int userAccessTypeId) {
		try {
			String url=baseUrl+"rest/user/setFeedAccessType/userId/"+registrationVo.getUserId()+"/accessTypeId/"+userAccessTypeId;
			response = GetJsonObject.getWebServceObj(url);
			logger.debug("SettingServiceImpl method:-getFeedUser  url:-"+url);
			} catch (Exception e) {
				logger.error("SettingServiceImpl method:-getFeedUser "+e.getMessage());
			}
			logger.debug("SettingServiceImpl method:-getFeedUser Response:"+response);
			return response;
	}

}
