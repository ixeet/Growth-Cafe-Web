package com.slms.app.webapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.CommentVo;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.FeedVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.AssignmentServiceIface;
import com.slms.app.service.iface.CoursesServiceIface;
import com.slms.app.service.iface.UpdatesServiceIface;
import com.slms.app.service.impl.AssignmentServiceImpl;
import com.slms.app.service.impl.CoursesServiceImpl;
import com.slms.app.service.impl.UpdatesServiceImpl;

public class UpdatesAction extends ActionSupport implements ServletResponseAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(UpdatesAction.class);
	HttpServletResponse servletResponse;
	int offset;
	String response;
	public ArrayList<FeedVo> feedList;
	public ArrayList<CommentVo> commentList;
	ArrayList<CoursesVo> moduleList;
	int courseId;
	int moduleId;
	int resourceId;
	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	CoursesVo coursesVo;
	FeedVo feedDetails;
	ArrayList<CoursesVo> resourcesList;
	ArrayList<CoursesVo> coursesList;
	ArrayList<AssignmentVo> assignmentsList;
	CoursesVo moduleDescription;
	public String execute() {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("UpdatesAction method:-execute ");
		try {
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
			UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
			if(request.getSession().getAttribute("offset") !=null && offset>0){
			offset = (Integer) request.getSession().getAttribute("offset");
			}
			response = updatesServiceIface.updates(loginDetail,offset);
			JSONObject jsonResponseObj = new JSONObject(response);
			if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonFeedList = jsonResponseObj.getJSONArray("feedList");
				feedList = new ArrayList<FeedVo>();
				for(int i=0;i<jsonFeedList.length();i++){
					/**
					 * feed parsing
					 */
					JSONObject jsonFeedObj = (JSONObject) jsonFeedList.get(i);
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
						user.setProfilePhotoFileName(jsonUserObj.getString("profileImage"));
						user.setEmailId(jsonUserObj.getString("emailId"));
						feedObj.setUser(user);
					 }
					
					 
					 /**
						 * resource detail
						 */if(jsonFeedObj.has("resource")){
							JSONObject jsonResourceObj = jsonFeedObj.getJSONObject("resource");
							CoursesVo resource = new CoursesVo();
							resource.setResourceId(jsonResourceObj.getInt("resourceId"));
							resource.setResourceName(jsonResourceObj.getString("resourceName"));
							resource.setResourceUrl(jsonResourceObj.getString("resourceUrl"));
							resource.setResourceDesc(jsonResourceObj.getString("resourceDesc"));
							resource.setAuthorName(jsonResourceObj.getString("authorName"));
							resource.setAuthorImg(jsonResourceObj.getString("authorImg"));
							resource.setThumbImg(jsonResourceObj.getString("thumbImg"));
							feedObj.setResource(resource);
						 }
						 
						 /**
							 * comment detail
							 */
						 if(jsonFeedObj.has("feedCommentsList")){
						 JSONArray jsonFeedCommentsArr = jsonFeedObj.getJSONArray("feedCommentsList");
						 ArrayList<CommentVo> commentList=null;
						 if(jsonFeedCommentsArr.length()>0){
						  commentList = new ArrayList<CommentVo>();
						 }
						 for(int x=0;x<jsonFeedCommentsArr.length();x++){
							 JSONObject jsonCommentObj = (JSONObject) jsonFeedCommentsArr.get(x);
							 CommentVo comment = new CommentVo();
							 comment.setCommentId(jsonCommentObj.getInt("commentId"));
							 comment.setCommentBy(jsonCommentObj.getString("commentBy"));
							 comment.setCommentTxt(jsonCommentObj.getString("commentTxt"));
							 comment.setCommentCounts(jsonCommentObj.getInt("commentCounts"));
							 comment.setLikeCounts(jsonCommentObj.getInt("likeCounts"));
							 if(jsonCommentObj.getString("commentByImage") != null){
							 comment.setCommentByImg(jsonCommentObj.getString("commentByImage"));
							 }
							 comment.setLikeStatus(jsonCommentObj.getBoolean("isLiked"));
							 comment.setCommentById(jsonCommentObj.getInt("commentById"));
							 comment.setCommentDate(Utility.getBeforeTime(jsonCommentObj.getString("commentDate")));
							 JSONArray jsonSubCommArr = jsonCommentObj.getJSONArray("subComments");
							 ArrayList<CommentVo> subCommentList = new ArrayList<CommentVo>();
							 for(int y=0;y<jsonSubCommArr.length();y++){
								 JSONObject jsonSubCommObj = jsonSubCommArr.getJSONObject(y);
								 CommentVo subCommentObj = new CommentVo();
								 subCommentObj.setCommentBy(jsonSubCommObj.getString("commentBy"));
								 subCommentObj.setCommentTxt(jsonSubCommObj.getString("commentTxt"));
								 subCommentObj.setCommentById(jsonSubCommObj.getInt("commentById"));
								 subCommentObj.setCommentId(jsonSubCommObj.getInt("commentId"));
								 subCommentObj.setLikeCounts(jsonSubCommObj.getInt("likeCounts"));
								 subCommentObj.setLikeStatus(jsonSubCommObj.getBoolean("isLiked"));
								 subCommentObj.setCommentByImg(jsonSubCommObj.getString("commentByImage"));
								 subCommentObj.setCommentDate(Utility.getBeforeTime(jsonSubCommObj.getString("commentDate")));
								 subCommentList.add(subCommentObj);
							 }
							 comment.setSubCommentList(subCommentList);
							 commentList.add(comment);
						 }
						 feedObj.setCommentList(commentList);
								 }
					feedList.add(feedObj);
				}
				if(offset==0){
				request.getSession().setAttribute("feedList", feedList);
				}
				if(offset>0 && feedList.size()>0){
					offset=offset+feedList.size();
					request.getSession().setAttribute("offset", offset);
					return SUCCESS;
				}else if(feedList.size()>0){
					offset=feedList.size();
					request.getSession().setAttribute("offset", offset);
				}
				
				
				
			}
			
			/**
			 * CoursesList
			 */
			/*coursesList = (ArrayList<CoursesVo>) request.getSession().getAttribute("courseList");
			if(coursesList == null){*/
			CoursesServiceIface coursesServiceIface = new CoursesServiceImpl();
			response = coursesServiceIface.courses(loginDetail);
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
						String[] completedOn = jsonCourseObj.getString("completedOn").split(" ");
						if(Utility.isValidDate(completedOn[0])){
						courseVo.setCompletedOn(Utility.getDisplayDate(completedOn[0]));
						}
						}
						courseVo.setCourseName(jsonCourseObj.getString("courseName"));
						Double d = jsonCourseObj.getDouble("completedPercentStatus");
						int completPer = d.intValue();
						courseVo.setCompletedPerStatus(""+completPer);
						courseVo.setCourseId(jsonCourseObj.getInt("courseId"));
						JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
						ArrayList<CoursesVo> modules = new ArrayList<CoursesVo>();
						
							for(int j=0;j<jsonModuleArr.length();j++){
								CoursesVo module = new CoursesVo();
								JSONObject josnModuleObj = jsonModuleArr.getJSONObject(j);
								module.setModuleName(josnModuleObj.getString("moduleName"));
								module.setModuleId(josnModuleObj.getInt("moduleId"));
								starton = josnModuleObj.getString("startedOn").split(" ");
								if(Utility.isValidDate(starton[0])){
									module.setStartedOn(Utility.getDisplayDate(starton[0]));
								}
								if(josnModuleObj.has("completedOn")){
								String[] completedOn = josnModuleObj.getString("completedOn").split(" ");
								if(Utility.isValidDate(completedOn[0])){
									module.setCompletedOn(Utility.getDisplayDate(completedOn[0]));
								}
								int days = Utility.timeDifference(starton[0], completedOn[0]);
								module.setTimeDuration(days);
								}
								
								modules.add(module);
						}
						courseVo.setModulesList(modules);
						coursesList.add(courseVo);
					}
				}
				 request.getSession().setAttribute("courseList",coursesList);
			/*}*/
			
				/**
				 * AssignmentList
				 */
			ArrayList<AssignmentVo> assignmentList = (ArrayList<AssignmentVo>) request.getSession().getAttribute("assignmentList");
			if(assignmentList ==null){
				AssignmentServiceIface assignmentServiceIface = new AssignmentServiceImpl();
				response = assignmentServiceIface.assignments(loginDetail);
				jsonResponseObj = new JSONObject(response);
				if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
					if(jsonResponseObj.has("assignmentList")){
						JSONArray jsonAssignmentArr = jsonResponseObj.getJSONArray("assignmentList");
						 assignmentList = new ArrayList<AssignmentVo>();
						for(int k=0;k<jsonAssignmentArr.length();k++){
							JSONObject jsonAssignmentObj = jsonAssignmentArr.getJSONObject(k);
							AssignmentVo assignment = new AssignmentVo();
							assignment.setCourseId(jsonAssignmentObj.getInt("courseId"));
							assignment.setCourseName(jsonAssignmentObj.getString("courseName"));
							assignment.setModuleId(jsonAssignmentObj.getInt("moduleId"));
							assignment.setModuleName(jsonAssignmentObj.getString("moduleName"));
							assignment.setAssignmentId(jsonAssignmentObj.getInt("assignmentId"));
							assignment.setAssignmentName(jsonAssignmentObj.getString("assignmentName"));
							assignment.setAssignmentStatus(Integer.parseInt(jsonAssignmentObj.getString("assignmentStatus")));
							assignment.setAssignmentDesc(jsonAssignmentObj.getString("assignmentDesc"));
							if(jsonAssignmentObj.has("assignmentSubmittedDate")){
								assignment.setAssignmentSubmittedDate(Utility.getDisplayDate(jsonAssignmentObj.getString("assignmentSubmittedDate")));
								}
								if(jsonAssignmentObj.has("assignmentDueDate")){
									assignment.setAssignmentDueDate((Utility.getDisplayDate(jsonAssignmentObj.getString("assignmentDueDate"))));
									}
								if(assignment.getAssignmentStatus()==1 && assignment.getAssignmentDueDate() !=null){
									int status = Utility.checkDateIsPreDate(assignment.getAssignmentDueDate());
									assignment.setAssignmentStatus(status);
								}
							if(jsonAssignmentObj.has("attachedResources")){
								JSONArray attachedResourcesArr = jsonAssignmentObj.getJSONArray("attachedResources");
								ArrayList<CoursesVo> resourceList = new ArrayList<CoursesVo>();
								for(int j=0;j<attachedResourcesArr.length();j++){
									JSONObject jsonResourceObj = attachedResourcesArr.getJSONObject(j);
									CoursesVo resource = new CoursesVo();
									resource.setResourceId(jsonResourceObj.getInt("resourceId"));
									resource.setResourceName(jsonResourceObj.getString("resourceName"));
									resource.setResourceDesc(jsonResourceObj.getString("resourceDesc"));
									resource.setResourceUrl(jsonResourceObj.getString("resourceUrl"));
									resource.setAuthorName(jsonResourceObj.getString("authorName"));
									resource.setAuthorImg(jsonResourceObj.getString("authorImg"));
									resource.setThumbImg(jsonResourceObj.getString("thumbImg"));
									resourceList.add(resource);
								}
								assignment.setResourcesList(resourceList);
							}
							assignmentList.add(assignment);
						}
						request.getSession().setAttribute("assignmentList",assignmentList);
						}
						
					}
				
			}
			}
		} catch (Exception e) {
			logger.error("UpdatesAction method:-execute error:-"+e.getMessage());
		}
		request.getSession().setAttribute("selectedTab","updatesTabId");
		return SUCCESS;
	}
	
	public ArrayList<FeedVo> getFeedList() {
		return feedList;
	}

	public void setFeedList(ArrayList<FeedVo> feedList) {
		this.feedList = feedList;
	}

	public ArrayList<FeedVo> updateSupport() {
		execute();
		return feedList;
		
	}
	
	public String commentOnFeed() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("UpdatesAction method:-commentOnFeed ");
		try {
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
				int feedId = Integer.parseInt(request.getParameter("feedId"));
				String commentTxt = request.getParameter("commentTxt");
				response = updatesServiceIface.commentOnFeed(loginDetail,feedId,commentTxt);
				response = updatesServiceIface.getFeedDetail(feedId,loginDetail.getUserId());
				getFeedDetail();
				/*execute();
				if(feedList !=null){
					for(FeedVo feed : feedList){
						if(feed.getFeedId()==feedId){
							feedDetails =feed;
							break;
						}
					}
					
				}*/
				}
			}catch (Exception e) {
				logger.error("UpdatesAction method:-commentOnFeed error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String commentOnFeedComment() {
		logger.debug("UpdatesAction method:-commentOnFeedComment ");
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
				int commentId = Integer.parseInt(request.getParameter("commentId"));
				int feedId = Integer.parseInt(request.getParameter("feedId"));
				String commentTxt = request.getParameter("commentTxt");
				response = updatesServiceIface.commentOnFeedComment(loginDetail,commentId,commentTxt);
				response = updatesServiceIface.getFeedDetail(feedId,loginDetail.getUserId());
				getFeedDetail();
				/*execute();
				if(feedList !=null){
					for(FeedVo feed : feedList){
						if(feed.getFeedId()==feedId){
							feedDetails =feed;
							break;
							likeCounts =feed.getLikeCounts();
							commentCounts = feed.getCommentCounts();
							commentList= feed.getCommentList();
						}
					}
					
				}*/
				}
			}catch (Exception e) {
				logger.error("UpdatesAction method:-commentOnFeedComment error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	
	public String likeOnFeed() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("UpdatesAction method:-likeOnFeed ");
		try {
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
				int feedId = Integer.parseInt(request.getParameter("feedId"));
				response = updatesServiceIface.likeOnFeed(loginDetail,feedId);
				response = updatesServiceIface.getFeedDetail(feedId,loginDetail.getUserId());
				getFeedDetail();
				/*execute();
				if(feedList !=null){
					for(FeedVo feed : feedList){
						if(feed.getFeedId()==feedId){
							feedDetails =feed;
							break;
							likeCounts =feed.getLikeCounts();
							commentCounts = feed.getCommentCounts();
							commentList= feed.getCommentList();
						}
					}
				}*/
				}
			}catch (Exception e) {
				logger.error("UpdatesAction method:-likeOnFeed error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String likeOnFeedComment() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("UpdatesAction method:-likeOnFeedComment ");
		try {
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
				int commentId = Integer.parseInt(request.getParameter("commentId"));
				int feedId = Integer.parseInt(request.getParameter("feedId"));
				response = updatesServiceIface.likeOnFeedComment(loginDetail,commentId);
				response = updatesServiceIface.getFeedDetail(feedId,loginDetail.getUserId());
				getFeedDetail();
				/*execute();
				if(feedList !=null){
					for(FeedVo feed : feedList){
						if(feed.getFeedId()==feedId){
							feedDetails =feed;
							break;
							likeCounts =feed.getLikeCounts();
							commentCounts = feed.getCommentCounts();
							commentList= feed.getCommentList();
						}
					}
				}*/
				}
			}catch (Exception e) {
				logger.error("UpdatesAction method:-likeOnFeedComment error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	public String getCourseFromFeed() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("UpdatesAction method:-getCourseFromFeed ");
		try {
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
				int feedId = Integer.parseInt(request.getParameter("feedId"));
				UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
				response = updatesServiceIface.getCourseFromFeed(feedId);
				JSONObject jsonResObject = new JSONObject(response);
				if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONObject jsonCourseObj = jsonResObject.getJSONObject("courseDetail");
					courseId = jsonCourseObj.getInt("courseId");
					moduleList = new ArrayList<CoursesVo>();
							JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
							for(int j=0;j<jsonModuleArr.length();j++){
								CoursesVo courseVo = new CoursesVo();
								JSONObject jsonModuleObj = jsonModuleArr.getJSONObject(j);
								String[] starton = jsonModuleObj.getString("startedOn").split(" ");
								if(Utility.isValidDate(starton[0])){
									courseVo.setStartedOn(Utility.getDisplayDate(starton[0]));
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
										resourcesList.add(resource);
									}
								}
								courseVo.setResourceList(resourcesList);
								moduleList.add(courseVo);
							}
				}
			}
		} catch (Exception e) {
			logger.error("UpdatesAction method:-getCourseFromFeed error:-"+e.getMessage());
		}
		request.getSession().setAttribute("selectedTab","coursesTabId");
		return SUCCESS;
	}
	
	public String getModuleFromFeed() {
		HttpServletRequest request = ServletActionContext.getRequest();
		logger.debug("UpdatesAction method:-getModuleFromFeed ");
		try {
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(registrationVo !=null){
			UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
			int feedId = Integer.parseInt(request.getParameter("feedId"));
			response = updatesServiceIface.getModuleFromFeed(feedId);
			JSONObject jsonResObject = new JSONObject(response);
			resourcesList = new ArrayList<CoursesVo>();
			if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
				JSONObject jsonModuleObj = jsonResObject.getJSONObject("moduleDetail");
				JSONArray jsonResourceList = jsonModuleObj.getJSONArray("resourceList");
				for(int i=0;i<jsonResourceList.length();i++){
					JSONObject jsonResObj = jsonResourceList.getJSONObject(i);
					CoursesVo resourceObj = new CoursesVo();
					resourceObj.setCourseId(jsonModuleObj.getInt("courseId"));
					resourceObj.setModuleId(jsonModuleObj.getInt("moduleId"));
					resourceObj.setLikeCounts(jsonResObj.getInt("likeCounts"));
					resourceObj.setCommentCounts(jsonResObj.getInt("commentCounts"));
					resourceObj.setResourceId(jsonResObj.getInt("resourceId"));
					resourceObj.setResourceName(jsonResObj.getString("resourceName"));
					resourceObj.setResourceUrl(jsonResObj.getString("resourceUrl"));
					resourceObj.setResourceDesc(jsonResObj.getString("resourceDesc"));
					String[] starton = jsonResObj.getString("startedOn").split(" ");
					if(Utility.isValidDate(starton[0])){
						resourceObj.setStartedOn(Utility.getDisplayDate(starton[0]));
						}
					String[] completeon = jsonResObj.getString("completedOn").split(" ");
					if(Utility.isValidDate(completeon[0])){
						resourceObj.setCompletedOn(Utility.getDisplayDate(completeon[0]));
						}
					/*int days = Utility.timeDifference(starton[0], completeon[0]);
					resourceObj.setTimeDuration(days);*/
					resourceObj.setAuthorName(jsonResObj.getString("authorName"));
					resourceObj.setAuthorImg(jsonResObj.getString("authorImg"));
					resourceObj.setThumbImg(jsonResObj.getString("thumbImg"));
					
					JSONArray jsonCommentArr = jsonResObj.getJSONArray("commentList");
					ArrayList<CommentVo> commentsList = new ArrayList<CommentVo>();
					if(i==0){
					for(int j=0;j<jsonCommentArr.length();j++){
						JSONObject jsonCommenttObj = jsonCommentArr.getJSONObject(j);
						CommentVo comment = new CommentVo();
						comment.setCommentId(jsonCommenttObj.getInt("commentId"));
						comment.setLikeCounts(jsonCommenttObj.getInt("likeCounts"));
						comment.setCommentCounts(jsonCommenttObj.getInt("commentCounts"));
						comment.setShareCounts(jsonCommenttObj.getInt("shareCounts"));
						comment.setParentCommentId(jsonCommenttObj.getInt("parentCommentId"));
						comment.setLikeStatus(jsonCommenttObj.getBoolean("isLiked"));
						comment.setCommentBy(jsonCommenttObj.getString("commentBy"));
						comment.setCommentByImg(jsonCommenttObj.getString("commentByImage"));
						comment.setCommentTxt(jsonCommenttObj.getString("commentTxt"));
						comment.setCommentDate(Utility.getBeforeTime(jsonCommenttObj.getString("commentDate")));
						JSONArray jsonSubCommArr = jsonCommenttObj.getJSONArray("subComments");
						 ArrayList<CommentVo> subCommentList = new ArrayList<CommentVo>();
						 for(int y=0;y<jsonSubCommArr.length();y++){
							 JSONObject jsonSubCommObj = jsonSubCommArr.getJSONObject(y);
							 CommentVo subCommentObj = new CommentVo();
							 subCommentObj.setCommentBy(jsonSubCommObj.getString("commentBy"));
							 subCommentObj.setCommentByImg(jsonSubCommObj.getString("commentByImage"));
							 subCommentObj.setCommentTxt(jsonSubCommObj.getString("commentTxt"));
							 subCommentObj.setCommentById(jsonSubCommObj.getInt("commentById"));
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
					}
					resourcesList.add(resourceObj);
					/*if(coursesVo.getResourceId()==0){
						moduleDescription = resourcesList.get(0);
						coursesVo.setResourceId(moduleDescription.getResourceId());
						}
					else if(coursesVo.getResourceId()==resourceObj.getResourceId()){
						moduleDescription = resourceObj;
						coursesVo.setResourceId(moduleDescription.getResourceId());
						resourcesList.set(i, resourcesList.get(0));
						resourcesList.set(0, moduleDescription);
					}*/
				}
				moduleDescription = resourcesList.get(0);
				courseId = moduleDescription.getCourseId();
				moduleId = moduleDescription.getModuleId();
				resourceId = moduleDescription.getResourceId();
				JSONArray jsonAssignmentList = jsonModuleObj.getJSONArray("assignmentList");
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
					assignmentsList.add(assignment);
				}
				
			}
			
			}
		} catch (Exception e) {
			logger.error("UpdatesAction method:-getModuleFromFeed error:-"+e.getMessage());
		}
		request.getSession().setAttribute("relatedVideos", moduleDescription.getRelatedVideoList());
		request.getSession().setAttribute("selectedTab","coursesTabId");
		return SUCCESS;	
	}
		
	
	public void getFeedDetail(){
		
		JSONObject jsonResponseObj = new JSONObject(response);
		if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
			JSONObject jsonFeedObj = jsonResponseObj.getJSONObject("feedDetail");
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
					user.setProfilePhotoFileName(jsonUserObj.getString("profileImage"));
					user.setEmailId(jsonUserObj.getString("emailId"));
					feedObj.setUser(user);
				 }
				
				 
				 /**
					 * resource detail
					 */if(jsonFeedObj.has("resource")){
						JSONObject jsonResourceObj = jsonFeedObj.getJSONObject("resource");
						CoursesVo resource = new CoursesVo();
						resource.setResourceId(jsonResourceObj.getInt("resourceId"));
						resource.setResourceName(jsonResourceObj.getString("resourceName"));
						resource.setResourceUrl(jsonResourceObj.getString("resourceUrl"));
						resource.setResourceDesc(jsonResourceObj.getString("resourceDesc"));
						resource.setAuthorName(jsonResourceObj.getString("authorName"));
						resource.setAuthorImg(jsonResourceObj.getString("authorImg"));
						resource.setThumbImg(jsonResourceObj.getString("thumbImg"));
						feedObj.setResource(resource);
					 }
					 
					 /**
						 * comment detail
						 */
					 if(jsonFeedObj.has("feedCommentsList")){
					 JSONArray jsonFeedCommentsArr = jsonFeedObj.getJSONArray("feedCommentsList");
					 ArrayList<CommentVo> commentList=null;
					 if(jsonFeedCommentsArr.length()>0){
					  commentList = new ArrayList<CommentVo>();
					 }
					 for(int x=0;x<jsonFeedCommentsArr.length();x++){
						 JSONObject jsonCommentObj = (JSONObject) jsonFeedCommentsArr.get(x);
						 CommentVo comment = new CommentVo();
						 comment.setCommentId(jsonCommentObj.getInt("commentId"));
						 comment.setCommentBy(jsonCommentObj.getString("commentBy"));
						 comment.setCommentTxt(jsonCommentObj.getString("commentTxt"));
						 comment.setCommentCounts(jsonCommentObj.getInt("commentCounts"));
						 comment.setLikeCounts(jsonCommentObj.getInt("likeCounts"));
						 if(jsonCommentObj.getString("commentByImage") != null){
						 comment.setCommentByImg(jsonCommentObj.getString("commentByImage"));
						 }
						 comment.setLikeStatus(jsonCommentObj.getBoolean("isLiked"));
						 comment.setCommentById(jsonCommentObj.getInt("commentById"));
						 comment.setCommentDate(Utility.getBeforeTime(jsonCommentObj.getString("commentDate")));
						 JSONArray jsonSubCommArr = jsonCommentObj.getJSONArray("subComments");
						 ArrayList<CommentVo> subCommentList = new ArrayList<CommentVo>();
						 for(int y=0;y<jsonSubCommArr.length();y++){
							 JSONObject jsonSubCommObj = jsonSubCommArr.getJSONObject(y);
							 CommentVo subCommentObj = new CommentVo();
							 subCommentObj.setCommentBy(jsonSubCommObj.getString("commentBy"));
							 subCommentObj.setCommentTxt(jsonSubCommObj.getString("commentTxt"));
							 subCommentObj.setCommentById(jsonSubCommObj.getInt("commentById"));
							 subCommentObj.setCommentId(jsonSubCommObj.getInt("commentId"));
							 subCommentObj.setLikeCounts(jsonSubCommObj.getInt("likeCounts"));
							 subCommentObj.setLikeStatus(jsonSubCommObj.getBoolean("isLiked"));
							 subCommentObj.setCommentByImg(jsonSubCommObj.getString("commentByImage"));
							 subCommentObj.setCommentDate(Utility.getBeforeTime(jsonSubCommObj.getString("commentDate")));
							 subCommentList.add(subCommentObj);
						 }
						 comment.setSubCommentList(subCommentList);
						 commentList.add(comment);
					 }
					 feedObj.setCommentList(commentList);
							 }
					 feedDetails =feedObj;
		}
		
	}
	

	
	
	
	/**
	 * @return the commentList
	 */
	public ArrayList<CommentVo> getCommentList() {
		return commentList;
	}

	/**
	 * @param commentList the commentList to set
	 */
	public void setCommentList(ArrayList<CommentVo> commentList) {
		this.commentList = commentList;
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
	 * @return the courseId
	 */
	public int getCourseId() {
		return courseId;
	}

	/**
	 * @param courseId the courseId to set
	 */
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	/**
	 * @return the coursesVo
	 */
	public CoursesVo getCoursesVo() {
		return coursesVo;
	}

	/**
	 * @param coursesVo the coursesVo to set
	 */
	public void setCoursesVo(CoursesVo coursesVo) {
		this.coursesVo = coursesVo;
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
	 * @return the servletResponse
	 */
	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}

	/**
	 * @param servletResponse the servletResponse to set
	 */
	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}


	/**
	 * @return the feedDetails
	 */
	public FeedVo getFeedDetails() {
		return feedDetails;
	}

	/**
	 * @param feedDetails the feedDetails to set
	 */
	public void setFeedDetails(FeedVo feedDetail) {
		feedDetails = feedDetail;
	}

	public int getResourceId() {
		return resourceId;
	}

	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}
	
	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}
	
}
