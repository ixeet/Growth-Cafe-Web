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
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.AssignmentReportDao;
import com.slms.persistance.dao.iface.CourseReportDao;
import com.slms.persistance.dao.impl.AssignmentReportDaoImpl;
import com.slms.persistance.dao.impl.CourseReportDaoImpl;

public class AssignmentReportAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	AssignmentReportDao assignmentReportDao;
	DashBoardReportVo dashBoardReportVo;
	HttpServletResponse servletResponse;
	List<DashBoardReportVo> assignmentReportList;
	ArrayList<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> classNameList;
	List<DashBoardReportVo> homeRoomList;
	List<DashBoardReportVo> courseList;
	List<DashBoardReportVo> moduleList;
	List<DashBoardReportVo> courseListDetails =  new ArrayList<DashBoardReportVo>();
	HttpServletRequest servletRequest;
	String response="";
	CourseReportDao courseReportDao;
	
	public List<DashBoardReportVo> getSubmitDateList() {
		return submitDateList;
	}


	public void setSubmitDateList(List<DashBoardReportVo> submitDateList) {
		this.submitDateList = submitDateList;
	}


	List<DashBoardReportVo> submitDateList;
	/*List<DashBoardReportVo> schoolNameList;*/
	 
	 
	public String execute(){
		try{
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
 
	public String assignmentDetail(){
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		assignmentReportDao = new  AssignmentReportDaoImpl();
	    courseReportDao = new  CourseReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
				dashBoardReportVo.setSchoolId(0);
				dashBoardReportVo.setClassId(0);
				dashBoardReportVo.setHomeRoomId(0);
				dashBoardReportVo.setCourseId(0);
				dashBoardReportVo.setModuleId(0);
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
				response = courseReportDao.getSchoolList(dashBoardReportVo);
				JSONObject jsonMasterObject = new JSONObject(response);
				if(jsonMasterObject!=null && jsonMasterObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonMasterArray=jsonMasterObject.getJSONArray("schoolList");
					schoolNameList = new ArrayList<DashBoardReportVo>();
					for(int i=0; i<jsonMasterArray.length(); i++){
						DashBoardReportVo dashvo = new DashBoardReportVo();
						JSONObject  jsonbj = jsonMasterArray.getJSONObject(i);
						dashvo.setSchoolId(jsonbj.getInt("schoolId"));
						dashvo.setSchoolName(jsonbj.getString("schoolName"));
						schoolNameList.add(dashvo);
					}
					dashBoardReportVo.setSchoolList(schoolNameList);
				}
				
				
			/*assignmentReportList = assignmentReportDao.getAssignmentDetailList(dashBoardReportVo);*/
				
				response = courseReportDao.getShowFilterData(dashBoardReportVo);
				JSONObject jsonResponseObj= new JSONObject(response);
				if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonCouArray = jsonResponseObj.getJSONArray("courseList");
				ArrayList<DashBoardReportVo> course = new  ArrayList<DashBoardReportVo>();
					if(jsonCouArray.length()>0){
						for(int i=0; i <jsonCouArray.length(); i++){
							DashBoardReportVo courseObj= new DashBoardReportVo();
							JSONObject jsonCourseObject=jsonCouArray.getJSONObject(i);
							courseObj.setSchoolId(jsonCourseObject.getInt("schoolId"));
							courseObj.setSchoolName(jsonCourseObject.getString("schoolName"));
							courseObj.setCourseId(jsonCourseObject.getInt("courseId"));
							courseObj.setCourseName(jsonCourseObject.getString("courseName"));
							courseObj.setHomeRoomId(jsonCourseObject.getInt("hrmId"));
							courseObj.setHomeRoomName(jsonCourseObject.getString("hrmName"));
							courseObj.setClassId(jsonCourseObject.getInt("classId"));
							courseObj.setClassName(jsonCourseObject.getString("classeName"));
							
							JSONArray jsonModuleArray = jsonCourseObject.getJSONArray("moduleList");
							if(jsonModuleArray.length()>0){
								ArrayList<DashBoardReportVo> moduDetail = new ArrayList<DashBoardReportVo>();
								for(int j=0; j<jsonModuleArray.length(); j++){
								
									JSONObject jsonModObj = jsonModuleArray.getJSONObject(j);
									DashBoardReportVo moduListRes= new DashBoardReportVo();
									moduListRes.setModuleId(jsonModObj.getInt("moduleId"));
									moduListRes.setCompletedStatus(jsonModObj.getInt("completedStatus"));
									moduListRes.setModuleName(jsonModObj.getString("moduleName"));
									moduDetail.add(moduListRes);
									
									JSONArray jsonAssignListObj = jsonModObj.getJSONArray("assignmentList");
									
									if(jsonAssignListObj.length()>0){
										ArrayList<DashBoardReportVo> assignListSubmit = new ArrayList<DashBoardReportVo>();
										ArrayList<DashBoardReportVo> assignListNotSubmit = new ArrayList<DashBoardReportVo>();
										
										for(int k=0; k<jsonAssignListObj.length(); k++){
											DashBoardReportVo assignListRes= new DashBoardReportVo();
											JSONObject assignObj = jsonAssignListObj.getJSONObject(k);
											if(assignObj.getInt("assignmentStatus") == 1){
											assignListRes.setAssignmentId(assignObj.getInt("assignmentId"));
											assignListRes.setAssignmentStatus(assignObj.getInt("assignmentStatus"));
											assignListRes.setStudentName(assignObj.getString("assignmentSubmittedBy"));
											assignListNotSubmit.add(assignListRes);
											}
											
											if(assignObj.getInt("assignmentStatus") == 2){
											assignListRes.setAssignmentId(assignObj.getInt("assignmentId"));
											assignListRes.setAssignmentStatus(assignObj.getInt("assignmentStatus"));
											assignListRes.setStudentName(assignObj.getString("assignmentSubmittedBy"));
											assignListRes.setAssignmentSubmittedById(assignObj.getInt("assignmentSubmittedById"));
											assignListRes.setAssignmentSubmittedDate(Utility.getDisplayDate(assignObj.getString("assignmentSubmittedDate")));
											assignListSubmit.add(assignListRes);
											}

											/*
											
											assignDetail.add(assignListRes);*/
										}
										int totalsize=jsonAssignListObj.length();
										int submit=assignListSubmit.size();
										int percent=  (submit*100/totalsize);
										moduListRes.setAssignmentsunmittedPercent(percent);
										moduListRes.setAssignmentSubmitList(assignListSubmit);
										moduListRes.setAssigNotSubmitList(assignListNotSubmit);
									}
								}
								courseObj.setModulesList(moduDetail);
							}
							course.add(courseObj);
						}
					}
					courseListDetails.addAll(course);
					//dashBoardReportVo.setCourseList(course);
				}
			request.setAttribute("selectedTab", "assignmentTabId");
		}
			else {
				return ERROR;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	public String studentAssignmentViewDetail(){
		HttpServletRequest request = ServletActionContext.getRequest();
		assignmentReportDao = new  AssignmentReportDaoImpl();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		try{
			if(loginTeacherDetail!=null){
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
				response = assignmentReportDao.getShowFilterData(dashBoardReportVo);
				JSONObject jsonResponseObj= new JSONObject(response);
				if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
					int studentId=dashBoardReportVo.getAssignmentSubmittedById();
					
				JSONArray jsonCouArray = jsonResponseObj.getJSONArray("courseList");
				ArrayList<DashBoardReportVo> course = new  ArrayList<DashBoardReportVo>();
					if(jsonCouArray.length()>0){
						for(int i=0; i <jsonCouArray.length(); i++){
							DashBoardReportVo courseObj= new DashBoardReportVo();
							JSONObject jsonCourseObject=jsonCouArray.getJSONObject(i);
							courseObj.setSchoolId(jsonCourseObject.getInt("schoolId"));
							courseObj.setSchoolName(jsonCourseObject.getString("schoolName"));
							courseObj.setCourseId(jsonCourseObject.getInt("courseId"));
							courseObj.setCourseName(jsonCourseObject.getString("courseName"));
							courseObj.setHomeRoomId(jsonCourseObject.getInt("hrmId"));
							courseObj.setHomeRoomName(jsonCourseObject.getString("hrmName"));
							courseObj.setClassId(jsonCourseObject.getInt("classId"));
							courseObj.setClassName(jsonCourseObject.getString("classeName"));
							
							JSONArray jsonModuleArray = jsonCourseObject.getJSONArray("moduleList");
							if(jsonModuleArray.length()>0){
								ArrayList<DashBoardReportVo> moduDetail = new ArrayList<DashBoardReportVo>();
								for(int j=0; j<jsonModuleArray.length(); j++){
								
									JSONObject jsonModObj = jsonModuleArray.getJSONObject(j);
									DashBoardReportVo moduListRes= new DashBoardReportVo();
									moduListRes.setModuleId(jsonModObj.getInt("moduleId"));
									moduListRes.setModuleName(jsonModObj.getString("moduleName"));
									moduListRes.setStartedOn(Utility.getDisplayDate(jsonModObj.getString("startedOn")));
									moduListRes.setCompletedOn(Utility.getDisplayDate(jsonModObj.getString("completedOn")));
									
									moduDetail.add(moduListRes);
									
									JSONArray jsonAssignListObj = jsonModObj.getJSONArray("assignmentList");
									
									if(jsonAssignListObj.length()>0){
										ArrayList<DashBoardReportVo> assignListSubmit = new ArrayList<DashBoardReportVo>();
										for(int k=0; k<jsonAssignListObj.length(); k++){
											DashBoardReportVo assignListRes= new DashBoardReportVo();
											JSONObject assignObj = jsonAssignListObj.getJSONObject(k);
											
											if(assignObj.getInt("assignmentSubmittedById")==studentId){
											assignListRes.setAssignmentId(assignObj.getInt("assignmentId"));
											assignListRes.setAssignmentStatus(assignObj.getInt("assignmentStatus"));
											assignListRes.setStudentName(assignObj.getString("assignmentSubmittedBy"));
											assignListRes.setAssignmentName(assignObj.getString("assignmentName"));
											assignListRes.setAssignmentSubmittedById(assignObj.getInt("assignmentSubmittedById"));
											assignListRes.setAssignmentDesc(assignObj.getString("assignmentDesc"));
											assignListRes.setAssignmentDueDate(Utility.getDisplayDate(assignObj.getString("assignmentDueDate")));
											assignListRes.setAssignmentSubmittedDate(Utility.getDisplayDate(assignObj.getString("assignmentSubmittedDate")));
											JSONArray attachedResourcesObj=assignObj.getJSONArray("attachedResources");
											
											ArrayList<DashBoardReportVo> attachedResourcesList = new ArrayList<DashBoardReportVo>();
											if(attachedResourcesObj.length()>0){
												for(int l=0; l<attachedResourcesObj.length(); l++){
													JSONObject attachedResourcesArray = attachedResourcesObj.getJSONObject(l);
													DashBoardReportVo attachedResourcesVo= new DashBoardReportVo();
														attachedResourcesVo.setResourseName(attachedResourcesArray.getString("resourceName"));
														attachedResourcesVo.setResourceUrl(attachedResourcesArray.getString("resourceUrl"));
														attachedResourcesVo.setResourseDesc(attachedResourcesArray.getString("resourceDesc"));
														attachedResourcesVo.setUploadedDate(attachedResourcesArray.getString("uploadedDate"));
														attachedResourcesVo.setAuthorImage(attachedResourcesArray.getString("authorImg"));
														attachedResourcesVo.setThumbImg(attachedResourcesArray.getString("thumbImg"));
														attachedResourcesList.add(attachedResourcesVo);
												}
												assignListRes.setResourceList(attachedResourcesList);
											}
											assignListSubmit.add(assignListRes);
											}
										}
										moduListRes.setAssignmentSubmitList(assignListSubmit);
									}
								}
								courseObj.setModulesList(moduDetail);
							}
							course.add(courseObj);
						}
					}
					courseListDetails.addAll(course);
				}
				request.setAttribute("selectedTab", "assignmentTabId");
				
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return SUCCESS;
	}
	
	
	
	public String homeRoom(){
		courseReportDao = new  CourseReportDaoImpl();
		try{
			int selectSchoolId=dashBoardReportVo.getSchoolId();
			int selectClassId=dashBoardReportVo.getClassId();
			classNameList = new ArrayList<DashBoardReportVo>();
			response = courseReportDao.getSchoolList(dashBoardReportVo);
			JSONObject jsonMasterObject = new JSONObject(response);
			if(jsonMasterObject!=null && jsonMasterObject.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonMasterArray=jsonMasterObject.getJSONArray("schoolList");
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
				servletResponse.getWriter().print(jsonArray);
			}
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	
	
	public String loadClassMethod(){
		courseReportDao = new  CourseReportDaoImpl();
		try{
			int selectSchoolId=dashBoardReportVo.getSchoolId();
			classNameList = new ArrayList<DashBoardReportVo>();
			response = courseReportDao.getSchoolList(dashBoardReportVo);
			JSONObject jsonMasterObject = new JSONObject(response);
			if(jsonMasterObject!=null && jsonMasterObject.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonMasterArray=jsonMasterObject.getJSONArray("schoolList");
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
				for(DashBoardReportVo dashBoardReportVo : classNameList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getClassId());
					jsonObject.put("cName", dashBoardReportVo.getClassName());
					jsonArray.put(jsonObject);
				}
				servletResponse.getWriter().print(jsonArray);
			}
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public String showDateDetail(){
		HttpServletRequest request=ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
			/*assignmentReportList = assignmentReportDao.getShowDataDetail(dashBoardReportVo);*/
			response = assignmentReportDao.getShowFilterData(dashBoardReportVo);
			JSONObject jsonResponseObj= new JSONObject(response);
			if(jsonResponseObj.getString("statusMessage").equalsIgnoreCase("success")){
			JSONArray jsonCouArray = jsonResponseObj.getJSONArray("courseList");
			ArrayList<DashBoardReportVo> course = new  ArrayList<DashBoardReportVo>();
				if(jsonCouArray.length()>0){
					for(int i=0; i <jsonCouArray.length(); i++){
						DashBoardReportVo courseObj= new DashBoardReportVo();
						JSONObject jsonCourseObject=jsonCouArray.getJSONObject(i);
						courseObj.setSchoolId(jsonCourseObject.getInt("schoolId"));
						courseObj.setSchoolName(jsonCourseObject.getString("schoolName"));
						courseObj.setCourseId(jsonCourseObject.getInt("courseId"));
						courseObj.setCourseName(jsonCourseObject.getString("courseName"));
						courseObj.setHomeRoomId(jsonCourseObject.getInt("hrmId"));
						courseObj.setHomeRoomName(jsonCourseObject.getString("hrmName"));
						courseObj.setClassId(jsonCourseObject.getInt("classId"));
						courseObj.setClassName(jsonCourseObject.getString("classeName"));
						
						JSONArray jsonModuleArray = jsonCourseObject.getJSONArray("moduleList");
						if(jsonModuleArray.length()>0){
							ArrayList<DashBoardReportVo> moduDetail = new ArrayList<DashBoardReportVo>();
							for(int j=0; j<jsonModuleArray.length(); j++){
								JSONObject jsonModObj = jsonModuleArray.getJSONObject(j);
								DashBoardReportVo moduListRes= new DashBoardReportVo();
								moduListRes.setModuleId(jsonModObj.getInt("moduleId"));
								moduListRes.setCompletedStatus(jsonModObj.getInt("completedStatus"));
								moduListRes.setModuleName(jsonModObj.getString("moduleName"));
								moduDetail.add(moduListRes);
								
								JSONArray jsonAssignListObj = jsonModObj.getJSONArray("assignmentList");
								if(jsonAssignListObj.length()>0){
									ArrayList<DashBoardReportVo> assignListSubmit = new ArrayList<DashBoardReportVo>();
									ArrayList<DashBoardReportVo> assignListNotSubmit = new ArrayList<DashBoardReportVo>();
									
									for(int k=0; k<jsonAssignListObj.length(); k++){
										DashBoardReportVo assignListRes= new DashBoardReportVo();
										JSONObject assignObj = jsonAssignListObj.getJSONObject(k);
										if(assignObj.getInt("assignmentStatus") == 1){
										assignListRes.setAssignmentId(assignObj.getInt("assignmentId"));
										assignListRes.setAssignmentStatus(assignObj.getInt("assignmentStatus"));
										assignListRes.setStudentName(assignObj.getString("assignmentSubmittedBy"));
										assignListNotSubmit.add(assignListRes);
										}
										
										if(assignObj.getInt("assignmentStatus") == 2){
										assignListRes.setAssignmentId(assignObj.getInt("assignmentId"));
										assignListRes.setAssignmentStatus(assignObj.getInt("assignmentStatus"));
										assignListRes.setStudentName(assignObj.getString("assignmentSubmittedBy"));
										assignListRes.setAssignmentSubmittedDate(Utility.getDisplayDate(assignObj.getString("assignmentSubmittedDate")));
										assignListSubmit.add(assignListRes);
										}

										/*
										
										assignDetail.add(assignListRes);*/
									}
									int totalsize=jsonAssignListObj.length();
									int submit=assignListSubmit.size();
									int percent=  (submit*100/totalsize);
									moduListRes.setAssignmentsunmittedPercent(percent);
									
									moduListRes.setAssignmentSubmitList(assignListSubmit);
									moduListRes.setAssigNotSubmitList(assignListNotSubmit);
								}
						}
							courseObj.setModulesList(moduDetail);
						}
						course.add(courseObj);
					}
				}
				courseListDetails.addAll(course);
				//dashBoardReportVo.setCourseList(course);
			}
			}
			request.setAttribute("selectedTab", "assignmentTabId");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	
	public String courseDetailMethod(){
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			courseList = assignmentReportDao.getCourseList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(courseList!= null){
				for(DashBoardReportVo dashBoardReportVo : courseList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getCourseId());
					jsonObject.put("coName", dashBoardReportVo.getCourseName());
					jsonArray.put(jsonObject);
				}
				servletResponse.getWriter().print(jsonArray);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String moduleDetailMethod(){
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			moduleList = assignmentReportDao.getModuleList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(moduleList!= null){
				for(DashBoardReportVo dashBoardReportVo : moduleList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getModuleId());
					jsonObject.put("moName", dashBoardReportVo.getModuleName());
					jsonArray.put(jsonObject);
				}
				servletResponse.getWriter().print(jsonArray);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	public String submitDate(){
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			submitDateList = assignmentReportDao.getSubmitDetail(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(submitDateList!= null){
				for(DashBoardReportVo dashBoardReportVo : submitDateList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getAssignments());
					jsonObject.put("subDate", dashBoardReportVo.getSubmissionDate());
					jsonArray.put(jsonObject);
				}
				servletResponse.getWriter().print(jsonArray);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}


	public AssignmentReportDao getAssignmentReportDao() {
		return assignmentReportDao;
	}


	public void setAssignmentReportDao(AssignmentReportDao assignmentReportDao) {
		this.assignmentReportDao = assignmentReportDao;
	}


	public List<DashBoardReportVo> getAssignmentReportList() {
		return assignmentReportList;
	}


	public void setAssignmentReportList(List<DashBoardReportVo> assignmentReportList) {
		this.assignmentReportList = assignmentReportList;
	}


	public List<DashBoardReportVo> getSchoolNameList() {
		return schoolNameList;
	}
 
	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}


	public List<DashBoardReportVo> getClassNameList() {
		return classNameList;
	}


	public void setClassNameList(List<DashBoardReportVo> classNameList) {
		this.classNameList = classNameList;
	}


	public List<DashBoardReportVo> getHomeRoomList() {
		return homeRoomList;
	}


	public void setHomeRoomList(List<DashBoardReportVo> homeRoomList) {
		this.homeRoomList = homeRoomList;
	}


	public List<DashBoardReportVo> getCourseList() {
		return courseList;
	}


	public void setCourseList(List<DashBoardReportVo> courseList) {
		this.courseList = courseList;
	}


	public List<DashBoardReportVo> getModuleList() {
		return moduleList;
	}


	public void setModuleList(List<DashBoardReportVo> moduleList) {
		this.moduleList = moduleList;
	}


	public String getResponse() {
		return response;
	}


	public void setResponse(String response) {
		this.response = response;
	}


	public void setSchoolNameList(ArrayList<DashBoardReportVo> schoolNameList) {
		this.schoolNameList = schoolNameList;
	}


	public CourseReportDao getCourseReportDao() {
		return courseReportDao;
	}


	public void setCourseReportDao(CourseReportDao courseReportDao) {
		this.courseReportDao = courseReportDao;
	}


	public List<DashBoardReportVo> getCourseListDetails() {
		return courseListDetails;
	}


	public void setCourseListDetails(List<DashBoardReportVo> courseListDetails) {
		this.courseListDetails = courseListDetails;
	}


	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}


	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

 
 
}
