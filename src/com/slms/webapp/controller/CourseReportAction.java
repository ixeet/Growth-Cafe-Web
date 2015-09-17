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

public class CourseReportAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	CourseReportDao courseReportDao;
	DashBoardReportVo dashBoardReportVo;
	HttpServletResponse servletResponse;
	AssignmentReportDao assignmentReportDao;
	ArrayList<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> courseReportList;
	List<DashBoardReportVo> saleCourseList;
	List<DashBoardReportVo> courseDataList;
	List<DashBoardReportVo> viewList;
	List<DashBoardReportVo> classNameList;
	List<DashBoardReportVo> homeRoomList;
	ArrayList<DashBoardReportVo> selectResourceDetail;
	
	String response;
	
	HttpServletRequest servletRequest;
	HttpServletRequest request= ServletActionContext.getRequest();
	
	public String execute(){
		try{

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}


	public String courseDetail(){
		
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		HttpServletRequest request = ServletActionContext.getRequest();
		courseReportDao = new  CourseReportDaoImpl();
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
				dashBoardReportVo.setSchoolId(-1);
				dashBoardReportVo.setClassId(-1);
				dashBoardReportVo.setHomeRoomId(-1);
				dashBoardReportVo.setCourseId(-1);
				dashBoardReportVo.setModuleId(-1);
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				/*schoolNameList = courseReportDao.getSchoolNameList(dashBoardReportVo);*/
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
						JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
						ArrayList<DashBoardReportVo> modules = new ArrayList<DashBoardReportVo>();
						if(jsonModuleArr.length()>0){
							int check=jsonModuleArr.length();
							for(int j=0;j<check;j++){
								DashBoardReportVo module = new DashBoardReportVo();
								JSONObject josnModuleObj = jsonModuleArr.getJSONObject(j);
								JSONObject jsonresourceObj = jsonModuleArr.getJSONObject(j);
								
								if(jsonresourceObj.length()>0){
									
									JSONArray jsonResouArr = jsonresourceObj.getJSONArray("resourceList");
									int check1=jsonResouArr.length();
									ArrayList<DashBoardReportVo> resoVo = new ArrayList<DashBoardReportVo>();
									for(int k=0;k<check1;k++){
										DashBoardReportVo resource = new DashBoardReportVo();
										JSONObject josnResourObj = jsonResouArr.getJSONObject(k);
										resource.setResourseName(josnResourObj.getString("resourceName"));
										resource.setResourseDesc(josnResourObj.getString("resourceDesc"));
										resource.setResourceUrl(josnResourObj.getString("resourceUrl"));
										resource.setThumbImg(josnResourObj.getString("thumbImg"));
										resource.setAuthorName(josnResourObj.getString("authorName"));
										resource.setAuthorImage(josnResourObj.getString("authorImg"));
										resource.setResourceId(josnResourObj.getInt("resourceId"));
										resource.setTcsMainId(josnResourObj.getInt("resourceSessionId"));
										resource.setCompletedStatus(josnResourObj.getInt("completedStatus"));
										resoVo.add(resource);
										//
									}
									module.setResourceList(resoVo);
									}
								
								module.setModuleName(josnModuleObj.getString("moduleName"));
								if(josnModuleObj.has("startedOn")){ 
									String[] starton = josnModuleObj.getString("startedOn").split(" ");
									if(Utility.isValidDate(starton[0])){
										module.setStartedOn(Utility.getDisplayDate(starton[0]));
									}
								}
								if(josnModuleObj.has("completedOn")){
										String[] completeon = josnModuleObj.getString("completedOn").split(" ");
										if(Utility.isValidDate(completeon[0])){
											module.setCompletedOn(Utility.getDisplayDate(completeon[0]));
										}
								}
								module.setModuleId(josnModuleObj.getInt("moduleId"));
								module.setModuleStatuId(josnModuleObj.getInt("completedStatus"));
								module.setModuleSessionId(josnModuleObj.getInt("moduleSessionId"));
								Double d1 = josnModuleObj.getDouble("completedPercentStatus");
								int completPera = d1.intValue();
								module.setCompletedPerStatus(""+completPera);
								module.setResourceSize(module.getResourceList().size());
								modules.add(module);
							}
						}
						dashBoardReportVo.setModulesList(modules);
						courseReportList.add(dashBoardReportVo);
					}
				}
				request.getSession().setAttribute("courseReportList", courseReportList);
				request.setAttribute("selectedTab", "coursesTabId"); 
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
				
			}
			servletResponse.getWriter().print(jsonArray);
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
				
			}
			servletResponse.getWriter().print(jsonArray);
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	
	
 
	public String viewListDetail(){
		courseReportDao = new  CourseReportDaoImpl();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		HttpServletRequest request = ServletActionContext.getRequest();
		try{
			courseReportList = (List<DashBoardReportVo>) request.getSession().getAttribute("courseReportList");
			for(int i=0;i<courseReportList.size();i++){
				DashBoardReportVo course = courseReportList.get(i);
				if(course.getCourseId()==dashBoardReportVo.getCourseId()){
					for(int j=0;j<course.getModulesList().size();j++){
						DashBoardReportVo module = course.getModulesList().get(j);
						if(module.getModuleId()==dashBoardReportVo.getModuleId()){
							selectResourceDetail = module.getResourceList();
							dashBoardReportVo = module;
							module.setCourseId(course.getCourseId());
							break;
						}
					}
					
				}
				
			}
			
			/*if(loginTeacherDetail !=null){
				int modId=dashBoardReportVo.getId();
				int courId = dashBoardReportVo.getTcsMainId();
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				dashBoardReportVo.setCourseId(courId);
			response = courseReportDao.getCourse(dashBoardReportVo);
			
			System.out.println(response);
			JSONObject jsonResObject = new JSONObject(response);
			if(jsonResObject !=null && jsonResObject.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonCourseArray = jsonResObject.getJSONArray("courseList");
				courseReportList= new ArrayList<DashBoardReportVo>();
				
				for(int i=0;i<jsonCourseArray.length();i++){
					JSONObject jsonCourseObj = jsonCourseArray.getJSONObject(i);
					DashBoardReportVo dashBoardReportVo = new DashBoardReportVo();
					selectResourceDetail= new ArrayList<DashBoardReportVo>();
					if(jsonCourseObj.getInt("courseId")== courId){
					
					dashBoardReportVo.setCourseName(jsonCourseObj.getString("courseName"));
					Double d = jsonCourseObj.getDouble("completedPercentStatus");
					int completPer = d.intValue();
					dashBoardReportVo.setCompletedPerStatus(""+completPer);
					dashBoardReportVo.setCourseId(jsonCourseObj.getInt("courseId"));
					JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
					
					ArrayList<DashBoardReportVo> modules = new ArrayList<DashBoardReportVo>();
					if(jsonModuleArr.length()>0){
						int check=jsonModuleArr.length();
						
						for(int j=0;j<check;j++){
							
							DashBoardReportVo module = new DashBoardReportVo();
							JSONObject josnModuleObj = jsonModuleArr.getJSONObject(j);
							if(josnModuleObj.getInt("moduleId") == modId){
							module.setModuleName(josnModuleObj.getString("moduleName"));
							module.setModuleId(josnModuleObj.getInt("moduleId"));
							module.setModuleStatuId(josnModuleObj.getInt("completedStatus"));
							Double d1 = josnModuleObj.getDouble("completedPercentStatus");
							int completPera = d1.intValue();
							module.setCompletedPerStatus(""+completPera);
							JSONObject jsonresourceObj = jsonModuleArr.getJSONObject(j);
							if(jsonresourceObj.length()>0){
							
							JSONArray jsonResouArr = jsonresourceObj.getJSONArray("resourceList");
							int check1=jsonResouArr.length();
							ArrayList<DashBoardReportVo> resoVo = new ArrayList<DashBoardReportVo>();
							for(int k=0;k<check1;k++){
								DashBoardReportVo resource = new DashBoardReportVo();
								JSONObject josnResourObj = jsonResouArr.getJSONObject(k);
								resource.setResourseName(josnResourObj.getString("resourceName"));
								resource.setResourseDesc(josnResourObj.getString("resourceDesc"));
								resource.setResourceUrl(josnResourObj.getString("resourceUrl"));
								resource.setThumbImg(josnResourObj.getString("thumbImg"));
								resource.setAuthorName(josnResourObj.getString("authorName"));
								resource.setAuthorImage(josnResourObj.getString("authorImg"));
								if(josnResourObj.has("startedOn")){
								resource.setStartedOn(Utility.getDisplayDate(josnResourObj.getString("startedOn")));
								}else{
									resource.setStartedOn("");
								}
								resource.setResourceId(josnResourObj.getInt("resourceId"));
								resource.setCompletedStatus(josnResourObj.getInt("completedStatus"));
								int statudIds = josnResourObj.getInt("completedStatus");
								if(statudIds == 0){
									resource.setStatus("In Process");
								}
								else if(statudIds == 1){
									resource.setStatus("Complete");
									if(josnResourObj.has("completedOn")){
									resource.setCompletedOn(Utility.getDisplayDate(josnResourObj.getString("completedOn")));
									}else{
										resource.setCompletedOn("");
									}
								}
								else if(statudIds == 2){
									resource.setStatus("Start");
								}
								resoVo.add(resource);
								//
							}
							module.setResourceList(resoVo);
							}
							modules.add(module);
							}
							
						}
						//dashBoardReportVo.setResourceList(modules);
						//
					}
					
					dashBoardReportVo.setModulesList(modules);
					selectResourceDetail.add(dashBoardReportVo);
				}
				}
			}
			
			}*/
			request.setAttribute("selectedTab", "coursesTabId"); 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String changeWorkStatus(){
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		courseReportDao = new  CourseReportDaoImpl();
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
		try{
			
			//viewList = courseReportDao.getShowChangeStatus(dashBoardReportVo);
			response = courseReportDao.getShowList(dashBoardReportVo);
			DashBoardReportVo stateValue =dashBoardReportVo;
			dashBoardReportVo = new DashBoardReportVo();
			courseDetail();
			dashBoardReportVo =stateValue;
			viewListDetail();
			request.setAttribute("selectedTab", "coursesTabId"); 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String changeDetailTeach(){
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		courseReportDao = new  CourseReportDaoImpl();
		dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
			try{
				if(loginTeacherDetail!=null){
					if(dashBoardReportVo.getStatusCode()==0){
						dashBoardReportVo.setStatusCode(1);
					}
					else if(dashBoardReportVo.getStatusCode()==2){
						dashBoardReportVo.setStatusCode(1);
					}
					response = courseReportDao.getChangeStatus(dashBoardReportVo);
				request.setAttribute("selectedTab", "coursesTabId"); 
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		return SUCCESS;
	}

	public String courseFilterList(){
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		courseReportDao = new  CourseReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			/*dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
			courseReportList = courseReportDao.getCourseDetailList(dashBoardReportVo);*/
				//schoolNameList = assignmentReportDao.getSchoolNameList(dashBoardReportVo);
				//courseReportList = courseReportDao.getCourseDetailList(dashBoardReportVo);
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				
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
						JSONArray jsonModuleArr = jsonCourseObj.getJSONArray("moduleList");
						ArrayList<DashBoardReportVo> modules = new ArrayList<DashBoardReportVo>();
						if(jsonModuleArr.length()>0){
							int check=jsonModuleArr.length();
							for(int j=0;j<check;j++){
								DashBoardReportVo module = new DashBoardReportVo();
								JSONObject josnModuleObj = jsonModuleArr.getJSONObject(j);
								JSONObject jsonresourceObj = jsonModuleArr.getJSONObject(j);
								
								if(jsonresourceObj.length()>0){
									
									JSONArray jsonResouArr = jsonresourceObj.getJSONArray("resourceList");
									int check1=jsonResouArr.length();
									ArrayList<DashBoardReportVo> resoVo = new ArrayList<DashBoardReportVo>();
									for(int k=0;k<check1;k++){
										DashBoardReportVo resource = new DashBoardReportVo();
										JSONObject josnResourObj = jsonResouArr.getJSONObject(k);
										resource.setResourseName(josnResourObj.getString("resourceName"));
										resource.setTcsMainId(josnResourObj.getInt("resourceSessionId"));
										resource.setResourceId(josnResourObj.getInt("resourceId"));
										resource.setResourseDesc(josnResourObj.getString("resourceDesc"));
										resource.setResourceUrl(josnResourObj.getString("resourceUrl"));
										resource.setThumbImg(josnResourObj.getString("thumbImg"));
										resource.setAuthorName(josnResourObj.getString("authorName"));
										resource.setAuthorImage(josnResourObj.getString("authorImg"));
										resource.setCompletedStatus(josnResourObj.getInt("completedStatus"));
										resoVo.add(resource);
										//
									}
									module.setResourceList(resoVo);
									}
								
								module.setModuleName(josnModuleObj.getString("moduleName"));
								module.setModuleId(josnModuleObj.getInt("moduleId"));
								module.setModuleSessionId(josnModuleObj.getInt("moduleSessionId"));
								module.setModuleStatuId(josnModuleObj.getInt("completedStatus"));
								Double d1 = josnModuleObj.getDouble("completedPercentStatus");
								module.setModuleName(josnModuleObj.getString("moduleName"));
								if(josnModuleObj.has("startedOn")){ 
									String[] starton = josnModuleObj.getString("startedOn").split(" ");
									if(Utility.isValidDate(starton[0])){
										module.setStartedOn(Utility.getDisplayDate(starton[0]));
									}
								}
								if(josnModuleObj.has("completedOn")){
										String[] completeon = josnModuleObj.getString("completedOn").split(" ");
										if(Utility.isValidDate(completeon[0])){
											module.setCompletedOn(Utility.getDisplayDate(completeon[0]));
										}
								}
								int completPera = d1.intValue();
								module.setCompletedPerStatus(""+completPera);
								module.setResourceSize(module.getResourceList().size());
								
								modules.add(module);
							}
						}
						dashBoardReportVo.setModulesList(modules);
						courseReportList.add(dashBoardReportVo);
					}
				}
				request.getSession().setAttribute("courseReportList", courseReportList);
			request.setAttribute("selectedTab", "coursesTabId"); 
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

	public String courseDetailList(){
		courseReportDao = new  CourseReportDaoImpl();
		try{
			courseDataList = courseReportDao.getcourseDataList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(courseDataList!= null){

				for(DashBoardReportVo dashBoardReportVo : courseDataList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getModuleId());
					jsonObject.put("ModName", dashBoardReportVo.getModuleName());
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



	public CourseReportDao getCourseReportDao() {
		return courseReportDao;
	}


	public void setCourseReportDao(CourseReportDao courseReportDao) {
		this.courseReportDao = courseReportDao;
	}


	public List<DashBoardReportVo> getCourseReportList() {
		return courseReportList;
	}


	public void setCourseReportList(List<DashBoardReportVo> courseReportList) {
		this.courseReportList = courseReportList;
	}


	public List<DashBoardReportVo> getSaleCourseList() {
		return saleCourseList;
	}


	public void setSaleCourseList(List<DashBoardReportVo> saleCourseList) {
		this.saleCourseList = saleCourseList;
	}


	public List<DashBoardReportVo> getCourseDataList() {
		return courseDataList;
	}


	public void setCourseDataList(List<DashBoardReportVo> courseDataList) {
		this.courseDataList = courseDataList;
	}



	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;

	}


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}


	public List<DashBoardReportVo> getViewList() {
		return viewList;
	}


	public void setViewList(List<DashBoardReportVo> viewList) {
		this.viewList = viewList;
	}


	public List<DashBoardReportVo> getSchoolNameList() {
		return schoolNameList;
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


	public AssignmentReportDao getAssignmentReportDao() {
		return assignmentReportDao;
	}


	public void setAssignmentReportDao(AssignmentReportDao assignmentReportDao) {
		this.assignmentReportDao = assignmentReportDao;
	}


 

	 

	public String getResponse() {
		return response;
	}


	public void setResponse(String response) {
		this.response = response;
	}


	public HttpServletRequest getRequest() {
		return request;
	}


	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}


	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}


	public ArrayList<DashBoardReportVo> getSelectResourceDetail() {
		return selectResourceDetail;
	}


	public void setSelectResourceDetail(
			ArrayList<DashBoardReportVo> selectResourceDetail) {
		this.selectResourceDetail = selectResourceDetail;
	}


	public void setSchoolNameList(ArrayList<DashBoardReportVo> schoolNameList) {
		this.schoolNameList = schoolNameList;
	}


	 

}
