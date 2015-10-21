package com.slms.persistance.dao.impl;

import org.json.JSONArray;
import org.json.JSONObject;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.persistance.dao.iface.TeacherSettingDao;

public class TeacherSettingDaoImpl implements TeacherSettingDao{

	
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;

	@Override
	public String getFeedUser(int userId) {
		try {
			String url=baseUrl+"rest/user/getFeedUsers/userId/"+userId;
			System.out.println(url);
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
				e.printStackTrace();
			}
		System.out.println(response);
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
			System.out.println(url+" "+requestObj.toString());
			response = PostJsonObject.postJson(requestObj, url);
			System.out.println(response);
			} catch (Exception e) {
			}
			return response;
	}

	@Override
	public String getFeedAccessType(int userId) {
		try {
			String url=baseUrl+"rest/user/getFeedAccessType/userId/"+userId;
			System.out.println(url);
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
			}
		System.out.println(response);
			return response;
	}

	@Override
	public String setFeedAccessType(RegistrationVo registrationVo, int userAccessTypeId) {
		try {
			String url=baseUrl+"rest/user/setFeedAccessType/userId/"+registrationVo.getUserId()+"/accessTypeId/"+userAccessTypeId;
			System.out.println(url);
			response = GetJsonObject.getWebServceObj(url);
			} catch (Exception e) {
			}
		System.out.println(response);
			return response;
	}
}
