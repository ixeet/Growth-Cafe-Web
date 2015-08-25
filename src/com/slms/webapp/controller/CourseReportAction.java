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
import com.slms.persistance.dao.iface.CourseReportDao;
import com.slms.persistance.dao.impl.CourseReportDaoImpl;

public class CourseReportAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	CourseReportDao courseReportDao;
	DashBoardReportVo dashBoardReportVo;
	HttpServletResponse servletResponse;


	List<DashBoardReportVo> courseReportList;
	List<DashBoardReportVo> saleCourseList;
	List<DashBoardReportVo> courseDataList;
	List<DashBoardReportVo> viewList;

	public String execute(){
		try{

		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}


	public String courseDetail(){
		HttpServletRequest request= ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		courseReportDao = new  CourseReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			courseReportList = courseReportDao.getCourseDetailList(dashBoardReportVo);
			saleCourseList = courseReportDao.getSaleCourseList(dashBoardReportVo);
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

	public String viewListDetail(){
		courseReportDao = new  CourseReportDaoImpl();
		try{
			viewList = courseReportDao.getShowList(dashBoardReportVo);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String courseFilterList(){
		courseReportDao = new  CourseReportDaoImpl();
		try{
			courseReportList = courseReportDao.getCourseDetailList(dashBoardReportVo);
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




}
