package com.slms.app.webapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.JSONResult;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.CommentVo;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.CoursesServiceIface;
import com.slms.app.service.impl.CoursesServiceImpl;
import com.sun.faces.facelets.compiler.UIText;

public class CoursesAction extends ActionSupport implements ModelDriven<CoursesVo> , ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(CoursesAction.class);
	CoursesVo coursesVo;
	CoursesVo moduleDescription;
	CoursesServiceIface coursesServiceIface;
	ArrayList<CoursesVo> coursesList;
	ArrayList<CoursesVo> moduleList;
	ArrayList<CoursesVo> resourcesList;
	ArrayList<AssignmentVo> assignmentsList;
	String response;
	HttpServletRequest servletRequest;
	@Override
	public CoursesVo getModel() {
		coursesVo =  new CoursesVo();
		return coursesVo;
	}
	
	/**
	 * This method used for to get courses list
	 * @return
	 */
	public String courses(){
		try {
			logger.debug("CoursesAction method:-courses ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
			coursesServiceIface = new CoursesServiceImpl();
			response = coursesServiceIface.courses(registrationVo);
			JSONObject jsonResObject = new JSONObject(response);
				if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonCourseArray = jsonResObject.getJSONArray("courseList");
					coursesList = new ArrayList<CoursesVo>();
					for(int i=0;i<jsonCourseArray.length();i++){
						JSONObject jsonCourseObj = jsonCourseArray.getJSONObject(i);
						CoursesVo courseVo = new CoursesVo();
						String[] starton = jsonCourseObj.getString("startedOn").split(" ");
						if(Utility.isValidDate(starton[0])){
						courseVo.setStartedOn(Utility.getDisplayDate(starton[0]));
						}
						if(jsonCourseObj.has("completedOn")){
						String[] completeon = jsonCourseObj.getString("completedOn").split(" ");
						if(Utility.isValidDate(completeon[0])){
						courseVo.setCompletedOn(Utility.getDisplayDate(completeon[0]));
						}
						}
						courseVo.setCourseName(jsonCourseObj.getString("courseName"));
						Double d = jsonCourseObj.getDouble("completedPercentStatus");
						int completPer = d.intValue();
						courseVo.setCompletedPerStatus(""+completPer);
						courseVo.setCourseId(jsonCourseObj.getInt("courseId"));
						JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
						ArrayList<CoursesVo> modules = new ArrayList<CoursesVo>();
						if(jsonModuleArr.length()>0){
							int check=jsonModuleArr.length();
							if(check>2){
								check=2;
							}
							for(int j=0;j<check;j++){
								CoursesVo module = new CoursesVo();
								JSONObject josnModuleObj = jsonModuleArr.getJSONObject(j);
								module.setModuleName(josnModuleObj.getString("moduleName"));
								module.setModuleId(josnModuleObj.getInt("moduleId"));
								starton = josnModuleObj.getString("startedOn").split(" ");
								if(Utility.isValidDate(starton[0])){
									module.setStartedOn(Utility.getDisplayDate(starton[0]));
								}
								
								if(josnModuleObj.has("completedOn")){
								String[] completeon = josnModuleObj.getString("completedOn").split(" ");
								if(Utility.isValidDate(completeon[0])){
									module.setCompletedOn(Utility.getDisplayDate(completeon[0]));
								}
								int days = Utility.timeDifference(starton[0], completeon[0]);
								module.setTimeDuration(days);
								}
								
								
								modules.add(module);
							}
						}
						courseVo.setModulesList(modules);
						coursesList.add(courseVo);
					}
				}
			}
			getServletRequest().getSession().setAttribute("selectedTab","coursesTabId");
		} catch (Exception e) {
			logger.error("CoursesAction method:-courses error:-"+e.getMessage());
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * This method used to get modules List with resources list of a course
	 * 
	 */
	public String getModules(){
		try {
			logger.debug("CoursesAction method:-getModules ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
			coursesServiceIface = new CoursesServiceImpl();
			response = coursesServiceIface.courses(registrationVo);
			JSONObject jsonResObject = new JSONObject(response);
				if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonCourseArray = jsonResObject.getJSONArray("courseList");
					moduleList = new ArrayList<CoursesVo>();
					for(int i=0;i<jsonCourseArray.length();i++){
						JSONObject jsonCourseObj = jsonCourseArray.getJSONObject(i);
						if(jsonCourseObj.getInt("courseId")==coursesVo.getCourseId()){
							JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
							for(int j=0;j<jsonModuleArr.length();j++){
								CoursesVo courseVo = new CoursesVo();
								JSONObject jsonModuleObj = jsonModuleArr.getJSONObject(j);
								String[] starton = jsonModuleObj.getString("startedOn").split(" ");
								if(Utility.isValidDate(starton[0])){
								courseVo.setStartedOn(Utility.getDisplayDate(starton[0]));
								}
								if(jsonModuleObj.has("completedOn")){
								String[] completeon = jsonModuleObj.getString("completedOn").split(" ");
								if(Utility.isValidDate(completeon[0])){
								courseVo.setCompletedOn(Utility.getDisplayDate(completeon[0]));
								}
								}
								courseVo.setModuleName(jsonModuleObj.getString("moduleName"));
								Double d = jsonModuleObj.getDouble("completedPercentStatus");
								int completPer = d.intValue();
								courseVo.setCompletedPerStatus(""+completPer);
								courseVo.setModuleId(jsonModuleObj.getInt("moduleId"));
								JSONArray jsonResArr = jsonModuleObj.getJSONArray("resourceList");
								ArrayList<CoursesVo> resourcesList = new ArrayList<CoursesVo>();
								if(jsonResArr.length()>0){
									for(int k=0;k<1;k++){
										JSONObject jsonResObj = (JSONObject) jsonResArr.get(k);
										CoursesVo resource = new CoursesVo();
										resource.setAuthorName(jsonResObj.getString("authorName"));
										resource.setResourceId(jsonResObj.getInt("resourceId"));
										resource.setResourceName(jsonResObj.getString("resourceName"));
										resourcesList.add(resource);
									}
								}
								courseVo.setResourceList(resourcesList);
								moduleList.add(courseVo);
							}
							break;
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("CoursesAction method:-getModules error:-"+e.getMessage());
		}
		getServletRequest().getSession().setAttribute("selectedTab","coursesTabId");
		return SUCCESS;
	}
	
	
	public String moduleDescription() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("CoursesAction method:-moduleDescription ");
		try {
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
			coursesServiceIface = new CoursesServiceImpl();
			response = coursesServiceIface.moduleDescription(registrationVo,coursesVo);
			JSONObject jsonResObject = new JSONObject(response);
			resourcesList = new ArrayList<CoursesVo>();
			if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonResourceList = jsonResObject.getJSONArray("resourceList");
				for(int i=0;i<jsonResourceList.length();i++){
					JSONObject jsonResObj = jsonResourceList.getJSONObject(i);
					CoursesVo resourceObj = new CoursesVo();
					resourceObj.setCourseId(coursesVo.getCourseId());
					resourceObj.setModuleId(coursesVo.getModuleId());
					if(jsonResObj.has("likeCounts")){
					resourceObj.setLikeCounts(jsonResObj.getInt("likeCounts"));
					}
					if(jsonResObj.has("commentCounts")){
					resourceObj.setCommentCounts(jsonResObj.getInt("commentCounts"));
					}
					resourceObj.setResourceId(jsonResObj.getInt("resourceId"));
					resourceObj.setResourceName(jsonResObj.getString("resourceName"));
					resourceObj.setResourceUrl(jsonResObj.getString("resourceUrl"));
					resourceObj.setResourceDesc(jsonResObj.getString("resourceDesc"));
					String[] starton = jsonResObj.getString("startedOn").split(" ");
					if(Utility.isValidDate(starton[0])){
						resourceObj.setStartedOn(Utility.getDisplayDate(starton[0]));
						}
					if(jsonResObj.has("completedOn")){
					String[] completeon = jsonResObj.getString("completedOn").split(" ");
					if(Utility.isValidDate(completeon[0])){
						resourceObj.setCompletedOn(Utility.getDisplayDate(completeon[0]));
						}
					int days = Utility.timeDifference(starton[0], completeon[0]);
					resourceObj.setTimeDuration(days);
					}
					
					resourceObj.setAuthorName(jsonResObj.getString("authorName"));
					resourceObj.setAuthorImg(jsonResObj.getString("authorImg"));
					resourceObj.setThumbImg(jsonResObj.getString("thumbImg"));
					if(jsonResObj.has("isLiked")){
					resourceObj.setLikeStatus(jsonResObj.getBoolean("isLiked"));
					}
					JSONArray jsonCommentArr = jsonResObj.getJSONArray("commentList");
					ArrayList<CommentVo> commentsList = new ArrayList<CommentVo>();
					for(int j=0;j<jsonCommentArr.length();j++){
						JSONObject jsonCommentObj = jsonCommentArr.getJSONObject(j);
						CommentVo comment = new CommentVo();
						comment.setCommentId(jsonCommentObj.getInt("commentId"));
						if(jsonCommentObj.has("likeCounts")){
						comment.setLikeCounts(jsonCommentObj.getInt("likeCounts"));
						}
						if(jsonResObj.has("commentCounts")){
						comment.setCommentCounts(jsonCommentObj.getInt("commentCounts"));
						}
						comment.setShareCounts(jsonCommentObj.getInt("shareCounts"));
						comment.setParentCommentId(jsonCommentObj.getInt("parentCommentId"));
						if(jsonCommentObj.has("isLiked")){
						comment.setLikeStatus(jsonCommentObj.getBoolean("isLiked"));
						}
						comment.setCommentBy(jsonCommentObj.getString("commentBy"));
						comment.setCommentById(jsonCommentObj.getInt("commentById"));
						comment.setCommentTxt(jsonCommentObj.getString("commentTxt"));
						comment.setCommentByImg(jsonCommentObj.getString("commentByImage"));
						comment.setCommentDate(Utility.getBeforeTime(jsonCommentObj.getString("commentDate")));
						 JSONArray jsonSubCommArr = jsonCommentObj.getJSONArray("subComments");
						 ArrayList<CommentVo> subCommentList = new ArrayList<CommentVo>();
						 for(int y=0;y<jsonSubCommArr.length();y++){
							 JSONObject jsonSubCommObj = jsonSubCommArr.getJSONObject(y);
							 CommentVo subCommentObj = new CommentVo();
							 subCommentObj.setLikeStatus(jsonSubCommObj.getBoolean("isLiked"));
							 subCommentObj.setCommentId(jsonSubCommObj.getInt("commentId"));
							 subCommentObj.setCommentBy(jsonSubCommObj.getString("commentBy"));
							 subCommentObj.setCommentByImg(jsonSubCommObj.getString("commentByImage"));
							 subCommentObj.setCommentTxt(jsonSubCommObj.getString("commentTxt"));
							 subCommentObj.setCommentById(jsonSubCommObj.getInt("commentById"));
							 subCommentObj.setLikeCounts(jsonSubCommObj.getInt("likeCounts"));
							 subCommentObj.setCommentCounts(jsonSubCommObj.getInt("commentCounts"));
							 subCommentObj.setCommentDate(Utility.getBeforeTime(jsonSubCommObj.getString("commentDate")));
							 subCommentList.add(subCommentObj);
						 }
						 comment.setSubCommentList(subCommentList);
						commentsList.add(comment);
					}
					resourceObj.setCommentList(commentsList);
					
					JSONArray jsonVideoList = jsonResObj.getJSONArray("relatedVideoList");
					ArrayList<CoursesVo> videoList = new ArrayList<CoursesVo>();
					for(int k=0;k<jsonVideoList.length();k++){
						JSONObject jsonVedio = jsonVideoList.getJSONObject(k);
						CoursesVo video = new CoursesVo();
						video.setResourceId(jsonVedio.getInt("resourceId"));
						video.setResourceName(jsonVedio.getString("resourceName"));
						video.setResourceDesc(jsonVedio.getString("resourceDesc"));
						video.setResourceUrl(jsonVedio.getString("resourceUrl"));
						String[] uploadedDate = jsonVedio.getString("uploadedDate").split(" ");
						if(Utility.isValidDate(uploadedDate[0])){
							video.setUploadedDate(Utility.getDisplayDate(uploadedDate[0]));
							}
						video.setThumbImg(jsonVedio.getString("thumbImg"));
						videoList.add(video);
					}
					resourceObj.setRelatedVideoList(videoList);
					resourcesList.add(resourceObj);
					if(coursesVo.getResourceId()==0){
						moduleDescription = resourcesList.get(0);
						coursesVo.setResourceId(moduleDescription.getResourceId());
						}
					else if(coursesVo.getResourceId()==resourceObj.getResourceId()){
						moduleDescription = resourceObj;
						coursesVo.setResourceId(moduleDescription.getResourceId());
						resourcesList.set(i, resourcesList.get(0));
						resourcesList.set(0, moduleDescription);
					}
				}
				JSONArray jsonAssignmentList = jsonResObject.getJSONArray("assignmentList");
				assignmentsList = new ArrayList<AssignmentVo>();
				for(int x=0;x<jsonAssignmentList.length();x++){
					AssignmentVo assignment = new AssignmentVo();
					JSONObject jsonAssObj = jsonAssignmentList.getJSONObject(x);
					assignment.setAssignmentId(jsonAssObj.getInt("assignmentId"));
					assignment.setAssignmentName(jsonAssObj.getString("assignmentName"));
					assignment.setAssignmentStatus(Integer.parseInt(jsonAssObj.getString("assignmentStatus")));
					assignment.setAssignmentSubmittedBy(jsonAssObj.getString("assignmentSubmittedBy"));
					if(jsonAssObj.has("assignmentSubmittedDate")){
						assignment.setAssignmentSubmittedDate(Utility.getDisplayDate(jsonAssObj.getString("assignmentSubmittedDate")));
						}
					
					if(jsonAssObj.has("assignmentDueDate")){
						assignment.setAssignmentDueDate((Utility.getDisplayDate(jsonAssObj.getString("assignmentDueDate"))));
						}
						if(assignment.getAssignmentStatus()==1 && assignment.getAssignmentSubmittedDate() !=null){
							int status = Utility.checkDateIsPreDate(assignment.getAssignmentSubmittedDate());
							assignment.setAssignmentStatus(status);
						}
					assignmentsList.add(assignment);
				}
				
			}
			
			}
			request.getSession().setAttribute("relatedVideos", moduleDescription.getRelatedVideoList());
			getServletRequest().getSession().setAttribute("selectedTab","coursesTabId");
		} catch (Exception e) {
			logger.error("CoursesAction method:-moduleDescription error:-"+e.getMessage());
		}
		return SUCCESS;	
	}
	
	
	public String likeResource(){
		try{
			logger.debug("CoursesAction method:-likeResource ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
				coursesServiceIface = new CoursesServiceImpl();
				response = coursesServiceIface.likeResource(registrationVo,coursesVo);
				moduleDescription();
			}
			}catch (Exception e) {
				logger.error("CoursesAction method:-likeResource error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String commentOnResource(){
		try{
			logger.debug("CoursesAction method:-commentOnResource ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
				coursesServiceIface = new CoursesServiceImpl();
				response = coursesServiceIface.commentOnResource(registrationVo,coursesVo);
				moduleDescription();
			}
			}catch (Exception e) {
				logger.error("CoursesAction method:-commentOnResource error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String commentOnComment(){
		try{
			logger.debug("CoursesAction method:-commentOnComment ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
				coursesServiceIface = new CoursesServiceImpl();
				response = coursesServiceIface.commentOnComment(registrationVo,coursesVo);
				moduleDescription();
			}
			}catch (Exception e) {
				logger.error("CoursesAction method:-commentOnComment error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String likeOnComment(){
		try{
			logger.debug("CoursesAction method:-likeOnComment ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
				coursesServiceIface = new CoursesServiceImpl();
				response = coursesServiceIface.likeOnComment(registrationVo,coursesVo);
				moduleDescription();
			}
			}catch (Exception e) {
				logger.error("CoursesAction method:-likeOnComment error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String relatedVideo(){
		try{
			logger.debug("CoursesAction method:-relatedVideo ");
			HttpServletRequest request = ServletActionContext.getRequest();
			ArrayList<CoursesVo> relatedVideoList = (ArrayList<CoursesVo>) request.getSession().getAttribute("relatedVideos");
			if(relatedVideoList !=null){
				for(CoursesVo resource :relatedVideoList){
					if(resource.getResourceId() == coursesVo.getResourceId()){
						coursesVo.setResourceDesc(resource.getResourceDesc());
						coursesVo.setResourceName(resource.getResourceName());
						coursesVo.setResourceUrl(resource.getResourceUrl());
						break;
					}
				}
				
			}
			
			}catch (Exception e) {
				logger.error("CoursesAction method:-relatedVideo error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	/**
	 * @return the coursesList
	 */
	public ArrayList<CoursesVo> getCoursesList() {
		return coursesList;
	}

	/**
	 * @param coursesList the coursesList to set
	 */
	public void setCoursesList(ArrayList<CoursesVo> coursesList) {
		this.coursesList = coursesList;
	}

	/**
	 * @return the moduleList
	 */
	public ArrayList<CoursesVo> getModuleList() {
		return moduleList;
	}

	/**
	 * @param moduleList the moduleList to set
	 */
	public void setModuleList(ArrayList<CoursesVo> moduleList) {
		this.moduleList = moduleList;
	}

	/**
	 * @return the resourcesList
	 */
	public ArrayList<CoursesVo> getResourcesList() {
		return resourcesList;
	}

	/**
	 * @param resourcesList the resourcesList to set
	 */
	public void setResourcesList(ArrayList<CoursesVo> resourcesList) {
		this.resourcesList = resourcesList;
	}

	/**
	 * @return the moduleDescription
	 */
	public CoursesVo getModuleDescription() {
		return moduleDescription;
	}

	/**
	 * @param moduleDescription the moduleDescription to set
	 */
	public void setModuleDescription(CoursesVo moduleDescription) {
		this.moduleDescription = moduleDescription;
	}

	/**
	 * @return the assignmentsList
	 */
	public ArrayList<AssignmentVo> getAssignmentsList() {
		return assignmentsList;
	}

	/**
	 * @param assignmentsList the assignmentsList to set
	 */
	public void setAssignmentsList(ArrayList<AssignmentVo> assignmentsList) {
		this.assignmentsList = assignmentsList;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		servletRequest=arg0;
		
	}

	/**
	 * @return the servletRequest
	 */
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

}
