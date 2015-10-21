package com.slms.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.FeedVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.domain.vo.SearchVo;
import com.slms.app.service.iface.SearchServiceIface;
import com.slms.app.service.impl.SearchServiceImpl;
import com.slms.app.service.impl.UpdatesServiceImpl;

public class TeacherSearchAction extends ActionSupport implements ModelDriven<SearchVo>, ServletResponseAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(UpdatesServiceImpl.class);
	String response;
	SearchVo searchVo;
	List<SearchVo> searchResult;
	List<CoursesVo> coursesList;
	List<FeedVo> updateList;
	List<RegistrationVo> profileList;
	List<AssignmentVo> assignmentList;
	HttpServletResponse servletResponse;
	

	@Override
	public SearchVo getModel() {
		searchVo = new SearchVo();
		return searchVo;
	}
	

	public String categorySearch(){
		SearchServiceIface  searchServiceIface = new SearchServiceImpl();
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
			if(loginDetail != null){
				response = searchServiceIface.getCategory(searchVo, loginDetail.getUserId());
				JSONObject jsonResponse = new JSONObject(response);
				if(jsonResponse.getString("statusMessage") != null && jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonSearchArr = jsonResponse.getJSONArray("searchList");
					for(int i=0;i<jsonSearchArr.length();i++){
						JSONObject jsonCatObj = jsonSearchArr.getJSONObject(i);
						if(jsonCatObj.getString("category").equalsIgnoreCase("Update")){
							if(jsonCatObj.has("feedList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("feedList");
							updateList = new ArrayList<FeedVo>();
							for(int k=0;k<jsonCatArr.length();k++){
								JSONObject jsonFeedObj = jsonCatArr.getJSONObject(k);
								FeedVo feedObj = new FeedVo();
								if(jsonFeedObj.has("commentCounts")){
									feedObj.setCommentCounts(jsonFeedObj.getInt("commentCounts"));
									}
									if(jsonFeedObj.has("feedId")){
									feedObj.setFeedId(jsonFeedObj.getInt("feedId"));
									} 
									if(jsonFeedObj.has("feedOn")){
										feedObj.setFeedOn(Utility.getBeforeTime(jsonFeedObj.getString("feedOn")));
										} 
									if(jsonFeedObj.has("likeCounts")){
										feedObj.setLikeCounts(jsonFeedObj.getInt("likeCounts"));
										}
									if(jsonFeedObj.has("isLiked")){
									feedObj.setLikeStatus(jsonFeedObj.getBoolean("isLiked"));
									}if(jsonFeedObj.has("feedText")){
										String feedText=jsonFeedObj.getString("feedText");
										if(feedText.contains("$")){
										String[] feedTextArr =feedText.split("\\$");
										JSONArray feedTextContentArr = jsonFeedObj.getJSONArray("feedTextArray");
										//String[] content = new String[feedTextContentArr.length()];
										feedText="";
										String feedTextPost="";
										for(int j=0;j<feedTextContentArr.length();j++){
											JSONObject jsonFeedContentObj = feedTextContentArr.getJSONObject(j);
											String type=jsonFeedContentObj.getString("type");
											String value=jsonFeedContentObj.getString("value");
											int key=jsonFeedContentObj.getInt("key");
											feedText=feedText+feedTextArr[j]+"<a href='javaScript:;' onclick=\"clickableResource("+feedObj.getFeedId()+",'"+type+"',"+key+");\">"+value+"</a>";
											feedTextPost=feedTextPost+feedTextArr[j]+value;
											}
										if(feedTextArr.length > feedTextContentArr.length() && feedTextArr[feedTextContentArr.length()] != null){
											feedText=feedText+feedTextArr[feedTextContentArr.length()];
											feedTextPost=feedTextPost+feedTextArr[feedTextContentArr.length()];
										}
											feedObj.setFeedText(feedText);
											feedObj.setFeedTextPost(feedTextPost);
										}
									}
									/**
									 * user detail
									 */if(jsonFeedObj.has("user")){
										JSONObject jsonUserObj = jsonFeedObj.getJSONObject("user");
										RegistrationVo user = new RegistrationVo();
										user.setUserId(jsonUserObj.getInt("userId"));
										user.setUserName(jsonUserObj.getString("userName"));
										if(jsonUserObj.has("userFbId")){
										user.setUserFbId(jsonUserObj.getString("userFbId"));
										}
										user.setFirstName(jsonUserObj.getString("firstName"));
										user.setLastName(jsonUserObj.getString("lastName"));
										if(jsonUserObj.has("title")){
										user.setTitle(jsonUserObj.getString("title"));
									 	}
										
										if(jsonUserObj.getString("profileImage")!=null && !jsonUserObj.getString("profileImage").equalsIgnoreCase("")){
										user.setProfilePhotoFileName(jsonUserObj.getString("profileImage"));
										}
										else{
											user.setProfilePhotoFileName("view/helper/images/people/50/guy-6.jpg");
										}
										
										user.setEmailId(jsonUserObj.getString("emailId"));
										feedObj.setUser(user);
									 }
										 
										 updateList.add(feedObj);
							}
						}
							
						}else if(jsonCatObj.getString("category").equalsIgnoreCase("Course")){
							if(jsonCatObj.has("courseList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("courseList");
							coursesList = new ArrayList<CoursesVo>();
							for(int j=0;j<jsonCatArr.length();j++){
								JSONObject jsonObj = jsonCatArr.getJSONObject(j);
								CoursesVo course = new CoursesVo();
								course.setCourseName(jsonObj.getString("courseName"));
								course.setCourseId(jsonObj.getInt("courseId"));
								course.setResourceDesc(jsonObj.getString("courseDesc"));
								coursesList.add(course);
							}
							}
						}else if(jsonCatObj.getString("category").equalsIgnoreCase("Assignment")){
							if(jsonCatObj.has("assignmentList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("assignmentList");
							assignmentList= new ArrayList<AssignmentVo>();
							for(int j=0;j<jsonCatArr.length();j++){
								JSONObject jsonObj = jsonCatArr.getJSONObject(j);
								AssignmentVo assignment = new AssignmentVo();
								assignment.setAssignmentId(jsonObj.getInt("assignmentId"));
								assignment.setAssignmentName(jsonObj.getString("assignmentName"));
								assignment.setAssignmentDesc(jsonObj.getString("assignmentDesc"));
								assignmentList.add(assignment);
							}
						}
						}else if(jsonCatObj.getString("category").equalsIgnoreCase("People")){
							if(jsonCatObj.has("usersList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("usersList");
							profileList = new ArrayList<RegistrationVo>();
							for(int j=0;j<jsonCatArr.length();j++){
								JSONObject jsonObj = jsonCatArr.getJSONObject(j);
								RegistrationVo people = new RegistrationVo();
								people.setUserId(jsonObj.getInt("userId"));
								people.setUserName(jsonObj.getString("userName"));
								
								if(jsonObj.getString("profileImage")!=null && !jsonObj.getString("profileImage").equalsIgnoreCase("")){
									people.setProfilePhotoFileName(jsonObj.getString("profileImage"));
								}
								else{
								people.setProfilePhotoFileName(jsonObj.getString("view/helper/images/people/50/guy-6.jpg"));
								}
								profileList.add(people);
							}
						}
						}
					}
					
				}
				
				
			}
			request.setAttribute("searchText", searchVo.getSearchText());
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getMoreUpdates(){
		SearchServiceIface  searchServiceIface = new SearchServiceImpl();
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
			if(loginDetail != null){
				response = searchServiceIface.getCategory(searchVo, loginDetail.getUserId());
				JSONObject jsonResponse = new JSONObject(response);
				if(jsonResponse.getString("statusMessage") != null && jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonSearchArr = jsonResponse.getJSONArray("searchList");
					for(int i=0;i<jsonSearchArr.length();i++){
						JSONObject jsonCatObj = jsonSearchArr.getJSONObject(i);
						if(jsonCatObj.getString("category").equalsIgnoreCase("Update")){
							if(jsonCatObj.has("feedList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("feedList");
							updateList = new ArrayList<FeedVo>();
							for(int k=0;k<jsonCatArr.length();k++){
								JSONObject jsonFeedObj = jsonCatArr.getJSONObject(k);
								FeedVo feedObj = new FeedVo();
								if(jsonFeedObj.has("commentCounts")){
									feedObj.setCommentCounts(jsonFeedObj.getInt("commentCounts"));
									}
									if(jsonFeedObj.has("feedId")){
									feedObj.setFeedId(jsonFeedObj.getInt("feedId"));
									} 
									if(jsonFeedObj.has("feedOn")){
										feedObj.setFeedOn(Utility.getBeforeTime(jsonFeedObj.getString("feedOn")));
										} 
									if(jsonFeedObj.has("likeCounts")){
										feedObj.setLikeCounts(jsonFeedObj.getInt("likeCounts"));
										}
									if(jsonFeedObj.has("isLiked")){
									feedObj.setLikeStatus(jsonFeedObj.getBoolean("isLiked"));
									}if(jsonFeedObj.has("feedText")){
										String feedText=jsonFeedObj.getString("feedText");
										if(feedText.contains("$")){
										String[] feedTextArr =feedText.split("\\$");
										JSONArray feedTextContentArr = jsonFeedObj.getJSONArray("feedTextArray");
										//String[] content = new String[feedTextContentArr.length()];
										feedText="";
										String feedTextPost="";
										for(int j=0;j<feedTextContentArr.length();j++){
											JSONObject jsonFeedContentObj = feedTextContentArr.getJSONObject(j);
											String type=jsonFeedContentObj.getString("type");
											String value=jsonFeedContentObj.getString("value");
											int key=jsonFeedContentObj.getInt("key");
											feedText=feedText+feedTextArr[j]+"<a href='javaScript:;' onclick=\"clickableResource("+feedObj.getFeedId()+",'"+type+"',"+key+");\">"+value+"</a>";
											feedTextPost=feedTextPost+feedTextArr[j]+value;
											}
										if(feedTextArr.length > feedTextContentArr.length() && feedTextArr[feedTextContentArr.length()] != null){
											feedText=feedText+feedTextArr[feedTextContentArr.length()];
											feedTextPost=feedTextPost+feedTextArr[feedTextContentArr.length()];
										}
											feedObj.setFeedText(feedText);
											feedObj.setFeedTextPost(feedTextPost);
										}
									}
									/**
									 * user detail
									 */if(jsonFeedObj.has("user")){
										JSONObject jsonUserObj = jsonFeedObj.getJSONObject("user");
										RegistrationVo user = new RegistrationVo();
										user.setUserId(jsonUserObj.getInt("userId"));
										user.setUserName(jsonUserObj.getString("userName"));
										if(jsonUserObj.has("userFbId")){
										user.setUserFbId(jsonUserObj.getString("userFbId"));
										}
										user.setFirstName(jsonUserObj.getString("firstName"));
										user.setLastName(jsonUserObj.getString("lastName"));
										if(jsonUserObj.has("title")){
										user.setTitle(jsonUserObj.getString("title"));
									 	}
										if(jsonUserObj.getString("profileImage")!=null && !jsonUserObj.getString("profileImage").equalsIgnoreCase("")){
											user.setProfilePhotoFileName(jsonUserObj.getString("profileImage"));
											}
											else{
												user.setProfilePhotoFileName("view/helper/images/people/50/guy-6.jpg");
											}
										user.setEmailId(jsonUserObj.getString("emailId"));
										feedObj.setUser(user);
									 }
										 
										 updateList.add(feedObj);
							}
						}
							
						}
					}
					
				}
			}
			
			JSONArray jfeedArray = new JSONArray();
			if(updateList.size()>0 && !updateList.isEmpty()){
				for(FeedVo feedVo : updateList){
					JSONObject jsonFeedObj = new JSONObject();
						jsonFeedObj.put("feedId",feedVo.getFeedId());	
						jsonFeedObj.put("feedOn",feedVo.getFeedOn());	
						jsonFeedObj.put("feedText",feedVo.getFeedText());	
						jsonFeedObj.put("feedTextPost",feedVo.getFeedTextPost());	
						jsonFeedObj.put("profilePhotoFileName",feedVo.getUser().getProfilePhotoFileName());	
						jsonFeedObj.put("userId",feedVo.getUser().getUserId());	
						jfeedArray.put(jsonFeedObj);
				}
			
			}
			servletResponse.getWriter().print(jfeedArray);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String getMoreAssignment(){
		SearchServiceIface  searchServiceIface = new SearchServiceImpl();
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
			if(loginDetail != null){
				response = searchServiceIface.getCategory(searchVo, loginDetail.getUserId());
				JSONObject jsonResponse = new JSONObject(response);
				if(jsonResponse.getString("statusMessage") != null && jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonSearchArr = jsonResponse.getJSONArray("searchList");
					for(int i=0;i<jsonSearchArr.length();i++){
						JSONObject jsonCatObj = jsonSearchArr.getJSONObject(i);
						if(jsonCatObj.getString("category").equalsIgnoreCase("Assignment")){
							if(jsonCatObj.has("assignmentList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("assignmentList");
							assignmentList= new ArrayList<AssignmentVo>();
							for(int j=0;j<jsonCatArr.length();j++){
								JSONObject jsonObj = jsonCatArr.getJSONObject(j);
								AssignmentVo assignment = new AssignmentVo();
								assignment.setAssignmentId(jsonObj.getInt("assignmentId"));
								assignment.setAssignmentName(jsonObj.getString("assignmentName"));
								assignment.setAssignmentDesc(jsonObj.getString("assignmentDesc"));
								assignmentList.add(assignment);
							}
						}
						}
					}
					
				}
			}
			
			JSONArray jfeedArray = new JSONArray();
			if(assignmentList.size()>0 && !assignmentList.isEmpty()){
				for(AssignmentVo assignVo : assignmentList){
					JSONObject jsonFeedObj = new JSONObject();
						jsonFeedObj.put("assignmentName",assignVo.getAssignmentName());
						jsonFeedObj.put("assignmentDesc",assignVo.getAssignmentDesc());	
						jfeedArray.put(jsonFeedObj);
				}
			}
			servletResponse.getWriter().print(jfeedArray);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

public String getMoreCourse(){
	SearchServiceIface  searchServiceIface = new SearchServiceImpl();
	try{
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		if(loginDetail != null){
			response = searchServiceIface.getCategory(searchVo, loginDetail.getUserId());
			JSONObject jsonResponse = new JSONObject(response);
			if(jsonResponse.getString("statusMessage") != null && jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonSearchArr = jsonResponse.getJSONArray("searchList");
				for(int i=0;i<jsonSearchArr.length();i++){
					JSONObject jsonCatObj = jsonSearchArr.getJSONObject(i);
					if(jsonCatObj.getString("category").equalsIgnoreCase("Course")){
						if(jsonCatObj.has("courseList")){
						JSONArray jsonCatArr = jsonCatObj.getJSONArray("courseList");
						coursesList = new ArrayList<CoursesVo>();
						for(int j=0;j<jsonCatArr.length();j++){
							JSONObject jsonObj = jsonCatArr.getJSONObject(j);
							CoursesVo course = new CoursesVo();
							course.setCourseName(jsonObj.getString("courseName"));
							course.setCourseId(jsonObj.getInt("courseId"));
							course.setResourceDesc(jsonObj.getString("courseDesc"));
							coursesList.add(course);
						}
						}
					}
				}
				
			}
		}
		JSONArray jfeedArray = new JSONArray();
		if(coursesList.size()>0 && !coursesList.isEmpty()){
			for(CoursesVo coursesVo : coursesList){
				JSONObject jsonFeedObj = new JSONObject();
					jsonFeedObj.put("courseName",coursesVo.getCourseName());
					jsonFeedObj.put("courseDesc",coursesVo.getResourceDesc());
					
					jfeedArray.put(jsonFeedObj);
			}
		}
		servletResponse.getWriter().print(jfeedArray);
	}catch (Exception e) {
		e.printStackTrace();
	}
	return null;
	
}



public String getMoreProfile(){
	SearchServiceIface  searchServiceIface = new SearchServiceImpl();
	try{
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		if(loginDetail != null){
			response = searchServiceIface.getCategory(searchVo, loginDetail.getUserId());
			JSONObject jsonResponse = new JSONObject(response);
			if(jsonResponse.getString("statusMessage") != null && jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonSearchArr = jsonResponse.getJSONArray("searchList");
				for(int i=0;i<jsonSearchArr.length();i++){
					JSONObject jsonCatObj = jsonSearchArr.getJSONObject(i);
					 if(jsonCatObj.getString("category").equalsIgnoreCase("People")){
							if(jsonCatObj.has("usersList")){
							JSONArray jsonCatArr = jsonCatObj.getJSONArray("usersList");
							profileList = new ArrayList<RegistrationVo>();
							for(int j=0;j<jsonCatArr.length();j++){
								JSONObject jsonObj = jsonCatArr.getJSONObject(j);
								RegistrationVo people = new RegistrationVo();
								people.setUserId(jsonObj.getInt("userId"));
								people.setUserName(jsonObj.getString("userName"));
								if(jsonObj.getString("profileImage")!=null && !jsonObj.getString("profileImage").equalsIgnoreCase("")){
									people.setProfilePhotoFileName(jsonObj.getString("profileImage"));
								}
								else{
								people.setProfilePhotoFileName(jsonObj.getString("view/helper/images/people/50/guy-6.jpg"));
								}
								profileList.add(people);
							}
						}
						}
				}
				
			}
		}
		JSONArray jfeedArray = new JSONArray();
		if(profileList.size()>0 && !profileList.isEmpty()){
			for(RegistrationVo registrationVo : profileList){
				JSONObject jsonFeedObj = new JSONObject();
					jsonFeedObj.put("userName",registrationVo.getUserName());
						jsonFeedObj.put("profileImage",registrationVo.getProfilePhotoFileName());
					jsonFeedObj.put("userId",registrationVo.getUserId());
					jfeedArray.put(jsonFeedObj);
			}
		}
		servletResponse.getWriter().print(jfeedArray);
	}catch (Exception e) {
		e.printStackTrace();
	}
	return null;
	
}


	public List<FeedVo> getUpdateList() {
		return updateList;
	}


	public void setUpdateList(List<FeedVo> updateList) {
		this.updateList = updateList;
	}


	public List<RegistrationVo> getProfileList() {
		return profileList;
	}


	public void setProfileList(List<RegistrationVo> profileList) {
		this.profileList = profileList;
	}


	public List<AssignmentVo> getAssignmentList() {
		return assignmentList;
	}


	public void setAssignmentList(List<AssignmentVo> assignmentList) {
		this.assignmentList = assignmentList;
	}


	public List<CoursesVo> getCoursesList() {
		return coursesList;
	}


	public void setCoursesList(List<CoursesVo> coursesList) {
		this.coursesList = coursesList;
	}


	public SearchVo getSearchVo() {
		return searchVo;
	}


	public void setSearchVo(SearchVo searchVo) {
		this.searchVo = searchVo;
	}


	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;

	}


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}


}
