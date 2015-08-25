package com.slms.app.service.impl;

import org.json.JSONObject;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.UpdatesServiceIface;

public class UpdatesServiceImpl implements UpdatesServiceIface{


	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	@Override
	public String updates(RegistrationVo loginDetail) {
		try {
			String url=baseUrl+"SLMS/rest/common/getFeeds";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userId", loginDetail.getUserId());
			regJsonObject.put("searchText", "");
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String commentOnFeed(RegistrationVo loginDetail, int feedId,
			String commentTxt) {
		try {
			String url=baseUrl+"SLMS/rest/common/commentOnFeed";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userName", loginDetail.getUserName());
			regJsonObject.put("commentText",commentTxt);
			regJsonObject.put("feedId",feedId);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String likeOnFeed(RegistrationVo loginDetail, int feedId) {
		try {
			String url=baseUrl+"SLMS/rest/common/likeOnFeed/userName/"+loginDetail.getUserName()+"/feedId/"+feedId;
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String commentOnFeedComment(RegistrationVo loginDetail,
			int commentId, String commentTxt) {
		try {
			String url=baseUrl+"SLMS/rest/common/commentOnComment";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userName", loginDetail.getUserName());
			regJsonObject.put("commentText",commentTxt);
			regJsonObject.put("commentId",commentId);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String getCourseFromFeed(int feedId) {
		try {
			String url=baseUrl+"SLMS/rest/course/getCourse/feedId/"+feedId;
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String getModuleFromFeed(int feedId) {
		try {
			String url=baseUrl+"SLMS/rest/course/getModule/feedId/"+feedId;
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	@Override
	public String likeOnFeedComment(RegistrationVo loginDetail, int commentId) {
		try {
			String url=baseUrl+"SLMS/rest/common/likeOnComment/userName/"+loginDetail.getUserName()+"/commentId/"+commentId;
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

}
