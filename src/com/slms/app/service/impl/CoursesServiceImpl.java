package com.slms.app.service.impl;

import org.json.JSONObject;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.CoursesServiceIface;

public class CoursesServiceImpl implements CoursesServiceIface{
	
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;

	@Override
	public String courses(RegistrationVo registrationVo) {
		try {
			String url=baseUrl+"SLMS/rest/course/getCourses/web";
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userId", registrationVo.getUserId());
			logingJsonObject.put("searchText","");
			response = PostJsonObject.postJson(logingJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	
	@Override
	public String moduleDescription(RegistrationVo registrationVo, CoursesVo coursesVo) {
		try {
			String url=baseUrl+"SLMS/rest/course/getModuleDetail";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("courseId", coursesVo.getCourseId());
			requestJsonObject.put("moduleId", coursesVo.getModuleId());
			requestJsonObject.put("userId", registrationVo.getUserId());
			requestJsonObject.put("searchText","");
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}


	@Override
	public String likeResource(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
		try {
			String url=baseUrl+"SLMS/rest/course/likeOnResource/userName/"+registrationVo.getUserName()+"/resourceId/"+coursesVo.getResourceId();
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}


	@Override
	public String commentOnResource(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
		try {
			String url=baseUrl+"SLMS/rest/course/commentOnResourse";
			
			JSONObject requestJsonObject = new JSONObject();
			requestJsonObject.put("userName", registrationVo.getUserName());
			requestJsonObject.put("resourceId", coursesVo.getResourceId());
			requestJsonObject.put("commentText", coursesVo.getResourceDesc());
			response = PostJsonObject.postJson(requestJsonObject, url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}


	@Override
	public String commentOnComment(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
			try {
				String url=baseUrl+"SLMS/rest/course/commentOnComment";
				
				JSONObject requestJsonObject = new JSONObject();
				requestJsonObject.put("userName", registrationVo.getUserName());
				requestJsonObject.put("commentId", coursesVo.getCommentId());
				requestJsonObject.put("commentText", coursesVo.getResourceDesc());
				response = PostJsonObject.postJson(requestJsonObject, url);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return response;
	}


	@Override
	public String likeOnComment(RegistrationVo registrationVo,
			CoursesVo coursesVo) {
		try {
			String url=baseUrl+"SLMS/rest/course/likeOnComment/userName/"+registrationVo.getUserName()+"/commentId/"+coursesVo.getCommentId();
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

}
