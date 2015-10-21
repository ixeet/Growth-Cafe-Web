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
import com.slms.app.service.iface.UpdatesServiceIface;
import com.slms.app.service.impl.UpdatesServiceImpl;
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
	ArrayList<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> classNameList;
	
	String response="";
	
	String responsePai="";
	 
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
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
				dashBoardReportVo.setSchoolId(0);
				dashBoardReportVo.setClassId(0);
				dashBoardReportVo.setHomeRoomId(0);
				responsePai = dashBoardMasterDao.getPieChartDetail(dashBoardReportVo);
				System.out.println(responsePai);
				JSONObject jsonPaiChartObject = new JSONObject(responsePai);
				if(jsonPaiChartObject!=null && jsonPaiChartObject.getString("statusMessage").equalsIgnoreCase("success")){
					
					JSONObject jsonPercentage = jsonPaiChartObject.getJSONObject("percentage");
					
						if(jsonPercentage.has("courseProgress")){
						dashBoardReportVo.setCourseProgress(jsonPercentage.getString("courseProgress"));
					}
					else{
						dashBoardReportVo.setCourseProgress("0");
					}
					
					if(jsonPercentage.has("courseComplete")){
						dashBoardReportVo.setCourseComplete(jsonPercentage.getString("courseComplete"));
					}
					else{
						dashBoardReportVo.setCourseComplete("0");
					}
					if(jsonPercentage.has("courseNotStarted")){
						dashBoardReportVo.setCourseNotStarted(jsonPercentage.getString("courseNotStarted"));
					}
					else{
					dashBoardReportVo.setCourseNotStarted("0");
					}
					
					if(jsonPercentage.has("assReviewed")){
						dashBoardReportVo.setAssignmentComplete(jsonPercentage.getString("assReviewed"));
					}
					else{
					dashBoardReportVo.setAssignmentComplete("0");
					}
					if(jsonPercentage.has("assSubmitted")){
						dashBoardReportVo.setAssignmentOpen(jsonPercentage.getString("assSubmitted"));
					}
					else{
					dashBoardReportVo.setAssignmentOpen("0");
					}
					if(jsonPercentage.has("assNotSubmit")){
						dashBoardReportVo.setAssignmentNotEnabled(jsonPercentage.getString("assNotSubmit"));
					}
					else{
					dashBoardReportVo.setAssignmentNotEnabled("0");
					}
					
				}
				
				
				response = dashBoardMasterDao.getSchoolDetail(dashBoardReportVo);
				System.out.println(response);
				JSONObject jsonMasterObject = new JSONObject(response);
				if(jsonMasterObject!=null && jsonMasterObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonMasterArray=jsonMasterObject.getJSONArray("schoolList");
					schoolNameList = new ArrayList<DashBoardReportVo>();
					for(int i=0; i<jsonMasterArray.length(); i++){
						DashBoardReportVo schoolVo = new DashBoardReportVo();
						JSONObject  jsonbj = jsonMasterArray.getJSONObject(i);
						
						JSONArray jsonClassArray = jsonbj.getJSONArray("classList");
						ArrayList<DashBoardReportVo> classNameList = new ArrayList<DashBoardReportVo>();
						if(jsonClassArray.length()>0){
							for(int j=0; j<jsonClassArray.length(); j++){
								DashBoardReportVo classVo = new DashBoardReportVo();
								JSONObject jsonClassObj = jsonClassArray.getJSONObject(j);
								
								JSONArray jsonhomeArray = jsonClassObj.getJSONArray("homeRoomList");
								if(jsonhomeArray.length()>0){
									ArrayList<DashBoardReportVo> homeList = new ArrayList<DashBoardReportVo>();
									for(int k=0; k<jsonhomeArray.length(); k++){
										DashBoardReportVo homeVo = new DashBoardReportVo();
										JSONObject jsonHomeObj = jsonhomeArray.getJSONObject(k);
										
										JSONArray jsonCourseArray = jsonHomeObj.getJSONArray("courseList");
										if(jsonCourseArray.length()>0){
											ArrayList<DashBoardReportVo> courseList = new ArrayList<DashBoardReportVo>();
											for(int l=0; l<jsonCourseArray.length(); l++){
												DashBoardReportVo courseVo = new DashBoardReportVo();
												JSONObject jsonCourseObj = jsonCourseArray.getJSONObject(l);
													JSONArray jsonModuleArray = jsonCourseObj.getJSONArray("moduleList");
													if(jsonModuleArray.length()>0){
														ArrayList<DashBoardReportVo> moduleList = new ArrayList<DashBoardReportVo>();
														for(int m=0; m<jsonModuleArray.length(); m++){
															DashBoardReportVo moduleVo = new DashBoardReportVo();
															JSONObject jsonModuleObj = jsonModuleArray.getJSONObject(m);
															moduleVo.setModuleId(jsonModuleObj.getInt("moduleId"));
															moduleVo.setModuleName(jsonModuleObj.getString("moduleName"));
															moduleList.add(moduleVo);
														}
														courseVo.setModulesList(moduleList);
													}
												courseVo.setCourseId(jsonCourseObj.getInt("courseId"));
												courseVo.setCourseName(jsonCourseObj.getString("courseName"));
												courseList.add(courseVo);
											}
											homeVo.setCourseList(courseList);
										}
										homeVo.setHomeRoomId(jsonHomeObj.getInt("homeRoomId"));
										homeVo.setHomeRoomName(jsonHomeObj.getString("homeRoomName"));
										homeList.add(homeVo);
									}
									classVo.setHomeRoomList(homeList);
								}
								classVo.setClassId(jsonClassObj.getInt("classId"));
								classVo.setClassName(jsonClassObj.getString("className"));
								classNameList.add(classVo);
							}
							schoolVo.setClassList(classNameList);
						}
						schoolVo.setSchoolId(jsonbj.getInt("schoolId"));
						schoolVo.setSchoolName(jsonbj.getString("schoolName"));
						schoolNameList.add(schoolVo);
						
					}
					request.getSession().setAttribute("schoolNameList", schoolNameList);
					System.out.println("complete");
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
		catch (Exception e) {	
			e.printStackTrace();
		}
		return SUCCESS;
	}

public void viewNotification() {
		
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo registrationVo = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
			if(registrationVo !=null){
				JSONArray notificationArr = new JSONArray();
				UpdatesServiceIface updatesServiceIface = new UpdatesServiceImpl();
				response = updatesServiceIface.viewNotification(registrationVo,3,0);
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
						
						feedList.add(feedObj);
						
						JSONObject jsonNotificationObj = new JSONObject();
						jsonNotificationObj.put("feedText", feedObj.getFeedTextPost());
						jsonNotificationObj.put("feedOn", feedObj.getFeedOn());
						jsonNotificationObj.put("profileImage", feedObj.getUser().getProfilePhotoFileName());
						jsonNotificationObj.put("feedId", feedObj.getFeedId());
						notificationArr.put(jsonNotificationObj);
					 }
						
					}
				getServletResponse().getWriter().print(notificationArr);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	public String loadDashboardClassMethod(){
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		 dashBoardMasterDao = new  DashBoardMasterDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			int selectSchoolId=dashBoardReportVo.getSchoolId();
			dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
			classNameList = new ArrayList<DashBoardReportVo>();
			schoolNameList = (ArrayList<DashBoardReportVo>) request.getSession().getAttribute("schoolNameList");
			System.out.println(schoolNameList.size());
				JSONArray jsonMasterArray=new JSONArray(schoolNameList);
				for(int i=0; i<jsonMasterArray.length(); i++){
					JSONObject  jsonbj = jsonMasterArray.getJSONObject(i);
					int schoolId=jsonbj.getInt("schoolId");
					if(schoolId == selectSchoolId){
						JSONArray jsonclassArray=jsonbj.getJSONArray("classList");
							if(jsonclassArray.length()>0){
								for(int j=0; j<jsonclassArray.length();j++){
								DashBoardReportVo dashvo = new DashBoardReportVo();
								JSONObject jsonClass = jsonclassArray.getJSONObject(j);
								dashvo.setClassId(jsonClass.getInt("classId"));
								dashvo.setClassName(jsonClass.getString("className"));
								classNameList.add(dashvo);
								}
							}
						}
					}
			}
			
			JSONArray jsonArray = new JSONArray();
			if(classNameList!= null && ! classNameList.isEmpty()){
				for(DashBoardReportVo dashBoardVo : classNameList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardVo.getClassId());
					jsonObject.put("cName", dashBoardVo.getClassName());
					jsonArray.put(jsonObject);
				}
				
			}
			servletResponse.getWriter().print(jsonArray);
			 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public String dashboardHomeRoom(){
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		 dashBoardMasterDao = new  DashBoardMasterDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			int selectSchoolId=dashBoardReportVo.getSchoolId();
			int selectClassId=dashBoardReportVo.getClassId();
			dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
			classNameList = new ArrayList<DashBoardReportVo>();
			 schoolNameList = (ArrayList<DashBoardReportVo>) request.getSession().getAttribute("schoolNameList");
				System.out.println(schoolNameList.size());
					JSONArray jsonMasterArray=new JSONArray(schoolNameList);
				for(int i=0; i<jsonMasterArray.length(); i++){
					JSONObject  jsonbj = jsonMasterArray.getJSONObject(i);
					int schoolId=jsonbj.getInt("schoolId");
					if(schoolId == selectSchoolId){
						JSONArray jsonclassArray=jsonbj.getJSONArray("classList");
							if(jsonclassArray.length()>0){
								for(int j=0; j<jsonclassArray.length();j++){
								JSONObject jsonClass = jsonclassArray.getJSONObject(j);
								int classId=jsonClass.getInt("classId");
									if(schoolId == selectSchoolId && classId== selectClassId){
										JSONArray jsonHomeArray = jsonClass.getJSONArray("homeRoomList");
										if(jsonHomeArray.length()>0){
											for(int k=0; k<jsonHomeArray.length(); k++){
												DashBoardReportVo dashvo = new DashBoardReportVo();
												JSONObject jsonHomeRoom = jsonHomeArray.getJSONObject(k);
												dashvo.setHomeRoomId(jsonHomeRoom.getInt("homeRoomId"));
												dashvo.setHomeRoomName(jsonHomeRoom.getString("homeRoomName"));
												classNameList.add(dashvo);
											}
											
										}
										
									}
								}
							}
						}
					}
			}
			JSONArray jsonArray = new JSONArray();
			if(classNameList!= null && ! classNameList.isEmpty()){
				for(DashBoardReportVo dashBoardReportVo : classNameList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getHomeRoomId());
					jsonObject.put("hrName", dashBoardReportVo.getHomeRoomName());
					jsonArray.put(jsonObject);
				}
			}
			servletResponse.getWriter().print(jsonArray);
			 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

	public String filterCourseData(){
		
		HttpServletRequest request= ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		 dashBoardMasterDao = new  DashBoardMasterDaoImpl();
		try{
			if(loginTeacherDetail!=null){
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
				responsePai = dashBoardMasterDao.getPieChartDetail(dashBoardReportVo);	
				System.out.println(responsePai);
				JSONObject jsonPaiChartObject = new JSONObject(responsePai);
				if(jsonPaiChartObject!=null && jsonPaiChartObject.getString("statusMessage").equalsIgnoreCase("success")){
					
					JSONObject jsonPercentage = jsonPaiChartObject.getJSONObject("percentage");
					
						if(jsonPercentage.has("courseProgress")){
						dashBoardReportVo.setCourseProgress(jsonPercentage.getString("courseProgress"));
					}
					else{
						dashBoardReportVo.setCourseProgress("0");
					}
					
					if(jsonPercentage.has("courseComplete")){
						dashBoardReportVo.setCourseComplete(jsonPercentage.getString("courseComplete"));
					}
					else{
						dashBoardReportVo.setCourseComplete("0");
					}
					if(jsonPercentage.has("courseNotStarted")){
						dashBoardReportVo.setCourseNotStarted(jsonPercentage.getString("courseNotStarted"));
					}
					else{
					dashBoardReportVo.setCourseNotStarted("0");
					}
					
					if(jsonPercentage.has("assReviewed")){
						dashBoardReportVo.setAssignmentComplete(jsonPercentage.getString("assReviewed"));
					}
					else{
					dashBoardReportVo.setAssignmentComplete("0");
					}
					if(jsonPercentage.has("assSubmitted")){
						dashBoardReportVo.setAssignmentOpen(jsonPercentage.getString("assSubmitted"));
					}
					else{
					dashBoardReportVo.setAssignmentOpen("0");
					}
					if(jsonPercentage.has("assNotSubmit")){
						dashBoardReportVo.setAssignmentNotEnabled(jsonPercentage.getString("assNotSubmit"));
					}
					else{
					dashBoardReportVo.setAssignmentNotEnabled("0");
					}
					
				}
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


	public ArrayList<DashBoardReportVo> getSchoolNameList() {
		return schoolNameList;
	}


	public void setSchoolNameList(ArrayList<DashBoardReportVo> schoolNameList) {
		this.schoolNameList = schoolNameList;
	}


	public List<DashBoardReportVo> getClassNameList() {
		return classNameList;
	}


	public void setClassNameList(List<DashBoardReportVo> classNameList) {
		this.classNameList = classNameList;
	}


	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;

	}


	public String getResponsePai() {
		return responsePai;
	}


	public void setResponsePai(String responsePai) {
		this.responsePai = responsePai;
	}
 
 
 
	 
 
}
