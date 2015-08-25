package com.slms.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.DashBoardMasterDao;
import com.slms.persistance.dao.impl.DashBoardMasterDaoImpl;

public class DashBoardAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	DashBoardReportVo dashBoardReportVo;
	DashBoardMasterDao dashBoardMasterDao;
	HttpServletResponse servletResponse;
	 
	 
	List<DashBoardReportVo> dashBoardReportList;
	 
	 
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
		
		 dashBoardMasterDao = new  DashBoardMasterDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			dashBoardReportList = dashBoardMasterDao.getDashBoardDetailList(dashBoardReportVo);
			request.setAttribute("selectedTab", "dashboardTabId");
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


 
	 
 
}
