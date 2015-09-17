package com.slms.app.service.impl;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.CoursesServiceIface;

public class CoursesServiceImpl implements CoursesServiceIface{
	Logger logger = LoggerFactory.getLogger(CoursesServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;

	@Override
	public String courses(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"rest/course/getCourses/web";
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userId", registrationVo.getUserId());
			logingJsonObject.put("searchText","");
			logger.debug("CoursesServiceImpl method:-courses Request:-"+logingJsonObject);
			response = PostJsonObject.postJson(logingJsonObject, url);
		} catch (Exception e) {
			logger.error("CoursesServiceImpl method:-courses "+e.getMessage());
		}
		logger.debug("CoursesServiceImpl method:-courses Response:-"+response);
		return response;
	}

	
	@Override
	public String moduleDescription(RegistrationVo registrationVo, CoursesVo coursesVo) {
		try {
			String url=baseUrl+"rest/course/getModuleDetail";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("courseId", coursesVo.getCourseId());
			requestJsonObject.put("moduleId", coursesVo.getModuleId());
			requestJsonObject.put("userId", registrationVo.getUserId());
			requestJsonObject.put("searchText","");
			logger.debug("CoursesServiceImpl method:-moduleDescription Request:-"+requestJsonObject);
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			logger.error("CoursesServiceImpl method:-moduleDescription "+e.getMessage());
		}
		logger.debug("CoursesServiceImpl method:-moduleDescription Response:-"+response);
		return response;
	}


	@Override
	public String likeResource(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
		try {
			String url=baseUrl+"rest/course/likeOnResource/userName/"+registrationVo.getUserName()+"/resourceId/"+coursesVo.getResourceId();
			logger.debug("CoursesServiceImpl method:-likeResource url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			logger.error("CoursesServiceImpl method:-likeResource "+e.getMessage());
		}
		logger.debug("CoursesServiceImpl method:-likeResource Response:-"+response);
		return response;
	}


	@Override
	public String commentOnResource(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
		try {
			String url=baseUrl+"rest/course/commentOnResourse";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("userName", registrationVo.getUserName());
			requestJsonObject.put("resourceId", coursesVo.getResourceId());
			requestJsonObject.put("commentText", coursesVo.getResourceDesc());
			logger.debug("CoursesServiceImpl method:-commentOnResource Request:-"+requestJsonObject);
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			logger.error("CoursesServiceImpl method:-commentOnResource "+e.getMessage());
		}
		logger.debug("CoursesServiceImpl method:-commentOnResource Response:-"+response);
		return response;
	}


	@Override
	public String commentOnComment(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
			try {
				String url=baseUrl+"rest/course/commentOnComment";
				
				JSONObject requestJsonObject = new JSONObject();
				requestJsonObject.put("userName", registrationVo.getUserName());
				requestJsonObject.put("commentId", coursesVo.getCommentId());
				requestJsonObject.put("commentText", coursesVo.getResourceDesc());
				logger.debug("CoursesServiceImpl method:-commentOnComment Request:-"+requestJsonObject);
				response = PostJsonObject.postJson(requestJsonObject, url);
			} catch (Exception e) {
				logger.error("CoursesServiceImpl method:-commentOnComment "+e.getMessage());
			}
			logger.debug("CoursesServiceImpl method:-commentOnComment Response:-"+response);
			return response;
	}


	@Override
	public String likeOnComment(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
		try {
			String url=baseUrl+"rest/course/likeOnComment/userName/"+registrationVo.getUserName()+"/commentId/"+coursesVo.getCommentId();
			logger.debug("CoursesServiceImpl method:-likeOnComment url:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			logger.error("CoursesServiceImpl method:-likeOnComment "+e.getMessage());
		}
		logger.debug("CoursesServiceImpl method:-likeOnComment Response:-"+response);
		return response;
	}

}
