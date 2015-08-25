package com.slms.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.AssignmentReportDao;
import com.slms.persistance.dao.impl.AssignmentReportDaoImpl;
import com.slms.persistance.dao.impl.DashBoardMasterDaoImpl;

public class AssignmentReportAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	AssignmentReportDao assignmentReportDao;
	DashBoardReportVo dashBoardReportVo;
	HttpServletResponse servletResponse;
	 
	List<DashBoardReportVo> assignmentReportList;
	List<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> classNameList;
	List<DashBoardReportVo> homeRoomList;
	List<DashBoardReportVo> courseList;
	List<DashBoardReportVo> moduleList;
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
		HttpServletRequest request=ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
			
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			assignmentReportList = assignmentReportDao.getAssignmentDetailList(dashBoardReportVo);
			schoolNameList = assignmentReportDao.getSchoolNameList(dashBoardReportVo);
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

	public String loadClassMethod(){
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			classNameList = assignmentReportDao.getClassNamList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(classNameList!= null){
				for(DashBoardReportVo dashBoardReportVo : classNameList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getSchoolId());
					jsonObject.put("scName", dashBoardReportVo.getSchoolName());
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
	
	public String homeRoom(){
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			homeRoomList = assignmentReportDao.getHomeRoomList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(homeRoomList!= null){
				for(DashBoardReportVo dashBoardReportVo : homeRoomList){
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

	public String showDateDetail(){
		assignmentReportDao = new  AssignmentReportDaoImpl();
		try{
			assignmentReportList = assignmentReportDao.getShowDataDetail(dashBoardReportVo);
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


	public void setSchoolNameList(List<DashBoardReportVo> schoolNameList) {
		this.schoolNameList = schoolNameList;
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

 
 
}
