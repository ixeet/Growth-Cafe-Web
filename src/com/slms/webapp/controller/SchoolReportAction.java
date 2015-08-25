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
import com.slms.persistance.dao.iface.SchoolReportDao;
import com.slms.persistance.dao.impl.SchoolReportDaoImpl;

public class SchoolReportAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	SchoolReportDao schoolReportDao;
	DashBoardReportVo dashBoardReportVo;
	HttpServletResponse servletResponse;
	 
	 
	List<DashBoardReportVo> schoolReportList;
	List<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> classNameList;
	List<DashBoardReportVo> homeRoomList;
	 
	public String execute(){
		try{
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
 
	public String schoolDetails(){
		HttpServletRequest request= ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		
		schoolReportDao = new  SchoolReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			schoolReportList	=	schoolReportDao.getSchoolDetailList(dashBoardReportVo);
			schoolNameList		=	schoolReportDao.getSchoolNameList(dashBoardReportVo);
			request.setAttribute("selectedTab", "schoolTabId"); 
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
	
	
	public String classDetail(){
		schoolReportDao = new  SchoolReportDaoImpl();
		try{
			classNameList		=	schoolReportDao.getClassNameList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(classNameList != null){
				for(DashBoardReportVo dashBoardReportVo : classNameList){
					JSONObject JObject = new JSONObject();
					JObject.put("id", dashBoardReportVo.getClassId());
					JObject.put("className", dashBoardReportVo.getClassName());
					jsonArray.put(JObject);
				}
				servletResponse.getWriter().print(jsonArray);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String homeRoomDetail(){
		schoolReportDao = new  SchoolReportDaoImpl();
		try{
			homeRoomList		=	schoolReportDao.getHomeRoomList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(homeRoomList != null){
				for(DashBoardReportVo dashBoardReportVo : homeRoomList){
					JSONObject JObject = new JSONObject();
					JObject.put("id", dashBoardReportVo.getHomeRoomId());
					JObject.put("homeRoomName", dashBoardReportVo.getHomeRoomName());
					jsonArray.put(JObject);
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

 
  


	 

	public SchoolReportDao getSchoolReportDao() {
		return schoolReportDao;
	}


	public void setSchoolReportDao(SchoolReportDao schoolReportDao) {
		this.schoolReportDao = schoolReportDao;
	}


	public List<DashBoardReportVo> getSchoolReportList() {
		return schoolReportList;
	}


	public void setSchoolReportList(List<DashBoardReportVo> schoolReportList) {
		this.schoolReportList = schoolReportList;
	}


	public List<DashBoardReportVo> getSchoolNameList() {
		return schoolNameList;
	}


	public void setSchoolNameList(List<DashBoardReportVo> schoolNameList) {
		this.schoolNameList = schoolNameList;
	}


	public List<DashBoardReportVo> getClassNameList() {
		return classNameList;
	}


	public void setClassNameList(List<DashBoardReportVo> classNameList) {
		this.classNameList = classNameList;
	}


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}


	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}


	public List<DashBoardReportVo> getHomeRoomList() {
		return homeRoomList;
	}


	public void setHomeRoomList(List<DashBoardReportVo> homeRoomList) {
		this.homeRoomList = homeRoomList;
	}

 
 
	 
 
}
