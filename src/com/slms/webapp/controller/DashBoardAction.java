package com.slms.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.CommentVo;
import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.FeedVo;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.CourseReportDao;
import com.slms.persistance.dao.iface.DashBoardMasterDao;
import com.slms.persistance.dao.impl.CourseReportDaoImpl;
import com.slms.persistance.dao.impl.DashBoardMasterDaoImpl;

public class DashBoardAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	DashBoardReportVo dashBoardReportVo;
	DashBoardMasterDao dashBoardMasterDao;
	HttpServletResponse servletResponse;
	ArrayList<FeedVo> feedList =null;
	List<DashBoardReportVo> courseReportList;
	CourseReportDao courseReportDao;
	List<DashBoardReportVo> dashBoardReportList;
	String response="";
	 
	public String execute(){
		try{
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
 
	public String showDashboardData(){
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		courseReportDao = new  CourseReportDaoImpl();
		 dashBoardMasterDao = new  DashBoardMasterDaoImpl();
		 int offset =0;
		try{
			if(loginTeacherDetail!=null){
				
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				dashBoardReportVo.setCourseId(0);
				dashBoardReportVo.setSchoolId(0);
				dashBoardReportVo.setClassId(0);
				dashBoardReportVo.setHomeRoomId(0);
				response = courseReportDao.getCourse(dashBoardReportVo);
				System.out.println(response);
				JSONObject jsonResObject = new JSONObject(response);
				if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonCourseArray = jsonResObject.getJSONArray("courseList");
					courseReportList= new ArrayList<DashBoardReportVo>();
					
					for(int i=0;i<jsonCourseArray.length();i++){
						JSONObject jsonCourseObj = jsonCourseArray.getJSONObject(i);
						DashBoardReportVo dashBoardReportVo = new DashBoardReportVo();
						
						dashBoardReportVo.setCourseName(jsonCourseObj.getString("courseName"));
						dashBoardReportVo.setSchoolId(jsonCourseObj.getInt("schoolId"));
						dashBoardReportVo.setSchoolName(jsonCourseObj.getString("schoolName"));
						dashBoardReportVo.setClassId(jsonCourseObj.getInt("classId"));
						dashBoardReportVo.setClassName(jsonCourseObj.getString("classeName"));
						dashBoardReportVo.setHomeRoomId(jsonCourseObj.getInt("hrmId"));
						dashBoardReportVo.setHomeRoomName(jsonCourseObj.getString("hrmName"));
						
						Double d = jsonCourseObj.getDouble("completedPercentStatus");
						int completPer = d.intValue();
						dashBoardReportVo.setCompletedPerStatus(""+completPer);
						dashBoardReportVo.setCourseId(jsonCourseObj.getInt("courseId"));
						courseReportList.add(dashBoardReportVo);
					}
				}
				
				
				
			dashBoardReportList = dashBoardMasterDao.getDashBoardDetailList(dashBoardReportVo);
			request.setAttribute("selectedTab", "dashboardTabId");
			response = dashBoardMasterDao.updates(loginTeacherDetail, offset);
			
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
				request.getSession().setAttribute("feedList", feedList);
			}
			
			
			
			}
			else{
				return "noLogin";
			}
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}



	 

	@Override
	public DashBoardReportVo getModel() {
		dashBoardReportVo = new DashBoardReportVo();
		return dashBoardReportVo;
	}



	public DashBoardReportVo getDashBoardReportVo() {
		return dashBoardReportVo;
	}



	public void setDashBoardReportVo(DashBoardReportVo dashBoardReportVo) {
		this.dashBoardReportVo = dashBoardReportVo;
	}

 

	 


	public DashBoardMasterDao getDashBoardMasterDao() {
		return dashBoardMasterDao;
	}



	public void setDashBoardMasterDao(DashBoardMasterDao dashBoardMasterDao) {
		this.dashBoardMasterDao = dashBoardMasterDao;
	}



	public List<DashBoardReportVo> getDashBoardReportList() {
		return dashBoardReportList;
	}



	public void setDashBoardReportList(List<DashBoardReportVo> dashBoardReportList) {
		this.dashBoardReportList = dashBoardReportList;
	}


	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		
	}


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}


	public ArrayList<FeedVo> getFeedList() {
		return feedList;
	}


	public void setFeedList(ArrayList<FeedVo> feedList) {
		this.feedList = feedList;
	}


	public List<DashBoardReportVo> getCourseReportList() {
		return courseReportList;
	}


	public void setCourseReportList(List<DashBoardReportVo> courseReportList) {
		this.courseReportList = courseReportList;
	}


	public CourseReportDao getCourseReportDao() {
		return courseReportDao;
	}


	public void setCourseReportDao(CourseReportDao courseReportDao) {
		this.courseReportDao = courseReportDao;
	}


	public String getResponse() {
		return response;
	}


	public void setResponse(String response) {
		this.response = response;
	}


 
	 
 
}
