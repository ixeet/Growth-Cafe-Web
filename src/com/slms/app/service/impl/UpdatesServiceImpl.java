package com.slms.app.service.impl;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.UpdatesServiceIface;

public class UpdatesServiceImpl implements UpdatesServiceIface{

	Logger logger = LoggerFactory.getLogger(UpdatesServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	@Override
	public String updates(RegistrationVo loginDetail , int offset) {
		try {
			String url=baseUrl+"rest/common/getFeeds";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userId", loginDetail.getUserId());
			regJsonObject.put("searchText", "");
			regJsonObject.put("offset", offset);
			regJsonObject.put("noOfRecords", 5);
			logger.debug("UpdatesServiceImpl method:-updates Request:-"+regJsonObject);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-updates "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-updates Response:-"+response);
		return response;
	}

	@Override
	public String commentOnFeed(RegistrationVo loginDetail, int feedId,
			String commentTxt) {
		try {
			String url=baseUrl+"rest/common/commentOnFeed";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userName", loginDetail.getUserName());
			regJsonObject.put("commentText",commentTxt);
			regJsonObject.put("feedId",feedId);
			logger.debug("UpdatesServiceImpl method:-commentOnFeed Request:-"+regJsonObject);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-commentOnFeed "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-commentOnFeed Response:-"+response);
		return response;
	}

	@Override
	public String likeOnFeed(RegistrationVo loginDetail, int feedId) {
		try {
			String url=baseUrl+"rest/common/likeOnFeed/userName/"+loginDetail.getUserName()+"/feedId/"+feedId;
			logger.debug("UpdatesServiceImpl method:-likeOnFeed url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-likeOnFeed "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-likeOnFeed Response:-"+response);
		return response;
	}

	@Override
	public String commentOnFeedComment(RegistrationVo loginDetail,
			int commentId, String commentTxt) {
		try {
			String url=baseUrl+"rest/common/commentOnComment";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userName", loginDetail.getUserName());
			regJsonObject.put("commentText",commentTxt);
			regJsonObject.put("commentId",commentId);
			logger.debug("UpdatesServiceImpl method:-commentOnFeedComment Request:-"+regJsonObject);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-commentOnFeedComment "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-commentOnFeedComment Response:-"+response);
		return response;
	}

	@Override
	public String getCourseFromFeed(int feedId) {
		try {
			String url=baseUrl+"rest/course/getCourse/feedId/"+feedId;
			response = GetJsonObject.getWebServceObj(url);
			logger.debug("UpdatesServiceImpl method:-getCourseFromFeed url:-"+url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-getCourseFromFeed "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-getCourseFromFeed Response:-"+response);
		return response;
	}

	@Override
	public String getModuleFromFeed(int feedId) {
		try {
			String url=baseUrl+"rest/course/getModule/feedId/"+feedId;
			logger.debug("UpdatesServiceImpl method:-getModuleFromFeed url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-getModuleFromFeed "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-getModuleFromFeed Response:-"+response);
		return response;
	}

	@Override
	public String likeOnFeedComment(RegistrationVo loginDetail, int commentId) {
		try {
			String url=baseUrl+"rest/common/likeOnComment/userName/"+loginDetail.getUserName()+"/commentId/"+commentId;
			logger.debug("UpdatesServiceImpl method:-likeOnFeedComment url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-likeOnFeedComment "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-likeOnFeedComment Response:-"+response);
		return response;
	}

	@Override
	public String getFeedDetail(int feedId, int userId) {
		try {
			String url=baseUrl+"rest/common/getFeedDetail/userId/"+userId+"/feedId/"+feedId;
			logger.debug("UpdatesServiceImpl method:-getFeedDetail url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			logger.error("UpdatesServiceImpl method:-likeOnFeedComment "+e.getMessage());
		}
		logger.debug("UpdatesServiceImpl method:-likeOnFeedComment Response:-"+response);
		return response;
	}

}
