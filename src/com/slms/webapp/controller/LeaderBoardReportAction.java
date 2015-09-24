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
import com.slms.persistance.dao.iface.LeaderBoardReportDao;
import com.slms.persistance.dao.impl.LeaderBoardReportDaoImpl;

public class LeaderBoardReportAction extends ActionSupport implements ModelDriven<DashBoardReportVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	LeaderBoardReportDao leaderBoardReportDao;
	DashBoardReportVo dashBoardReportVo;
	HttpServletResponse servletResponse;
	 
	 
	List<DashBoardReportVo> leaderBoardReportList;
	List<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> classNameList;
	List<DashBoardReportVo> homeRoomList;
	 
	public List<DashBoardReportVo> getSchoolNameList() {
		return schoolNameList;
	}


	public void setSchoolNameList(List<DashBoardReportVo> schoolNameList) {
		this.schoolNameList = schoolNameList;
	}


	public String execute(){
		try{
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
 
	public String leaderBoardDetail(){
		HttpServletRequest request= ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		leaderBoardReportDao = new  LeaderBoardReportDaoImpl();
		try{
			if(loginTeacherDetail!=null){
			leaderBoardReportList = leaderBoardReportDao.getLeaderBoardDetailList(dashBoardReportVo);
			schoolNameList = leaderBoardReportDao.getSchoolNameList(dashBoardReportVo);
			request.setAttribute("selectedTab", "leaderboardTabId");
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



	public String leaderClassMethod(){
		leaderBoardReportDao = new  LeaderBoardReportDaoImpl();
		try{
			classNameList = leaderBoardReportDao.getClassNamList(dashBoardReportVo);
			JSONArray jsonArray = new JSONArray();
			if(classNameList!= null){
				for(DashBoardReportVo dashBoardReportVo : classNameList){
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("id", dashBoardReportVo.getClassId());
					jsonObject.put("scName", dashBoardReportVo.getClassName());
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
	
	public String leaderhomeRoom(){
		leaderBoardReportDao = new  LeaderBoardReportDaoImpl();
		try{
			homeRoomList = leaderBoardReportDao.getHomeRoomList(dashBoardReportVo);
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
	
	
	
	
	public String leaderShowDetails(){
		leaderBoardReportDao = new  LeaderBoardReportDaoImpl();
		try{
			leaderBoardReportList = leaderBoardReportDao.getLeaderBoardDetailList(dashBoardReportVo);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
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

 
 

	public LeaderBoardReportDao getLeaderBoardReportDao() {
		return leaderBoardReportDao;
	}


	public void setLeaderBoardReportDao(LeaderBoardReportDao leaderBoardReportDao) {
		this.leaderBoardReportDao = leaderBoardReportDao;
	}


	public List<DashBoardReportVo> getLeaderBoardReportList() {
		return leaderBoardReportList;
	}


	public void setLeaderBoardReportList(
			List<DashBoardReportVo> leaderBoardReportList) {
		this.leaderBoardReportList = leaderBoardReportList;
	}


	@Override
	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
		
	}


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}
 
}
