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
	List<DashBoardReportVo> courseReportList;
	ArrayList<DashBoardReportVo> schoolNameList;
	List<DashBoardReportVo> schoolReportList;
	String response;

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
				dashBoardReportVo.setUserName(loginTeacherDetail.getUserName());
				dashBoardReportVo.setSchoolId(0);
				dashBoardReportVo.setClassId(0);
				dashBoardReportVo.setHomeRoomId(0);
				dashBoardReportVo.setCourseId(0);
				dashBoardReportVo.setModuleId(0);
				dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
				/*schoolNameList = courseReportDao.getSchoolNameList(dashBoardReportVo);*/
				response = schoolReportDao.getSchoolList(dashBoardReportVo);
				JSONObject jsonMasterObject = new JSONObject(response);
				if(jsonMasterObject!=null && jsonMasterObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONArray jsonMasterArray=jsonMasterObject.getJSONArray("schoolList");
					schoolNameList = new ArrayList<DashBoardReportVo>();
					for(int i=0; i<jsonMasterArray.length(); i++){
						DashBoardReportVo schoolVo = new DashBoardReportVo();
						JSONObject  jsonbj = jsonMasterArray.getJSONObject(i);

						JSONArray classArray = jsonbj.getJSONArray("classList");
						JSONObject classObject = classArray.getJSONObject(i);
						ArrayList<DashBoardReportVo> classList = new ArrayList<DashBoardReportVo>();
						if(classObject.length()>0){
							for(int j=0; j<classObject.length(); j++){
								DashBoardReportVo classvo = new DashBoardReportVo();
								JSONObject classObj = classArray.getJSONObject(j);

								JSONArray groupArray = classObj.getJSONArray("homeRoomList");
								JSONObject groupObj = groupArray.getJSONObject(j);
								ArrayList<DashBoardReportVo> homeroomList = new ArrayList<DashBoardReportVo>();
								if(groupObj.length()>0){
									for(int k=0; k<groupObj.length(); k++){
										DashBoardReportVo HomeRoomVo = new DashBoardReportVo();
										JSONObject homeObj = groupArray.getJSONObject(k);
										HomeRoomVo.setHomeRoomId(homeObj.getInt("homeRoomId"));
										HomeRoomVo.setHomeRoomName(homeObj.getString("homeRoomName"));
										homeroomList.add(HomeRoomVo);
									}
									classvo.setHomeRoomList(homeroomList);

								}
								classvo.setClassId(classObj.getInt("classId"));
								classvo.setClassName(classObj.getString("className"));
								classList.add(classvo);
							}
							schoolVo.setClassList(classList);
						}
						schoolVo.setSchoolId(jsonbj.getInt("schoolId"));
						schoolVo.setSchoolName(jsonbj.getString("schoolName"));
						schoolNameList.add(schoolVo);
					}

				}
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

	public String filterSchoolDetails(){
		int schoolId = dashBoardReportVo.getSchoolId();
		int classId = dashBoardReportVo.getClassId();
		int homeId = dashBoardReportVo.getHomeRoomId();

		HttpServletRequest request= ServletActionContext.getRequest();
		RegistrationVo loginTeacherDetail = (RegistrationVo) request.getSession().getAttribute("teacherloginDetail");
		schoolReportDao = new  SchoolReportDaoImpl();
		if(loginTeacherDetail!=null){
			dashBoardReportVo.setUserId(loginTeacherDetail.getUserId());
			response = schoolReportDao.getSchoolList(dashBoardReportVo);
			JSONObject jsonMasterObject = new JSONObject(response);
			if(jsonMasterObject!=null && jsonMasterObject.getString("statusMessage").equalsIgnoreCase("success")){
				JSONArray jsonMasterArray=jsonMasterObject.getJSONArray("schoolList");


				schoolNameList = new ArrayList<DashBoardReportVo>();
				for(int i=0; i<jsonMasterArray.length(); i++){
					DashBoardReportVo schoolVo = new DashBoardReportVo();
					JSONObject  jsonbj = jsonMasterArray.getJSONObject(i);
					if(jsonbj.getInt("schoolId") == schoolId){
						JSONArray classArray = jsonbj.getJSONArray("classList");
						JSONObject classObject = classArray.getJSONObject(i);
						ArrayList<DashBoardReportVo> classList = new ArrayList<DashBoardReportVo>();
						if(classObject.length()>0){
							for(int j=0; j<classObject.length(); j++){
								DashBoardReportVo classvo = new DashBoardReportVo();
								JSONObject classObj = classArray.getJSONObject(j);
								if(classObj.getInt("classId") == classId){
									JSONArray groupArray = classObj.getJSONArray("homeRoomList");
									JSONObject groupObj = groupArray.getJSONObject(j);
									ArrayList<DashBoardReportVo> homeroomList = new ArrayList<DashBoardReportVo>();
									if(groupObj.length()>0){
										for(int k=0; k<groupObj.length(); k++){
											DashBoardReportVo HomeRoomVo = new DashBoardReportVo();
											JSONObject homeObj = groupArray.getJSONObject(k);
											if(homeObj.getInt("homeRoomId") == homeId){

												HomeRoomVo.setHomeRoomId(homeObj.getInt("homeRoomId"));
												HomeRoomVo.setHomeRoomName(homeObj.getString("homeRoomName"));
												homeroomList.add(HomeRoomVo);
											}
											else if(homeId == 0){

												HomeRoomVo.setHomeRoomId(homeObj.getInt("homeRoomId"));
												HomeRoomVo.setHomeRoomName(homeObj.getString("homeRoomName"));
												homeroomList.add(HomeRoomVo);
											}
										}
										classvo.setHomeRoomList(homeroomList);

									}
									classvo.setClassId(classObj.getInt("classId"));
									classvo.setClassName(classObj.getString("className"));
									classList.add(classvo);
								}

								else if(classId == 0){

									JSONArray groupArray = classObj.getJSONArray("homeRoomList");
									JSONObject groupObj = groupArray.getJSONObject(j);
									ArrayList<DashBoardReportVo> homeroomList = new ArrayList<DashBoardReportVo>();
									if(groupObj.length()>0){
										for(int k=0; k<groupObj.length(); k++){
											DashBoardReportVo HomeRoomVo = new DashBoardReportVo();
											JSONObject homeObj = groupArray.getJSONObject(k);
											HomeRoomVo.setHomeRoomId(homeObj.getInt("homeRoomId"));
											HomeRoomVo.setHomeRoomName(homeObj.getString("homeRoomName"));
											homeroomList.add(HomeRoomVo);
										}
										classvo.setHomeRoomList(homeroomList);

									}
									classvo.setClassId(classObj.getInt("classId"));
									classvo.setClassName(classObj.getString("className"));
									classList.add(classvo);
								}


								schoolVo.setClassList(classList);
							}
							schoolVo.setSchoolId(jsonbj.getInt("schoolId"));
							schoolVo.setSchoolName(jsonbj.getString("schoolName"));
							schoolNameList.add(schoolVo);
						}


					}
					else if(schoolId == 0){
						JSONArray classArray1 = jsonbj.getJSONArray("classList");
						JSONObject classObject1 = classArray1.getJSONObject(i);
						ArrayList<DashBoardReportVo> classList1 = new ArrayList<DashBoardReportVo>();
						if(classObject1.length()>0){
							for(int j=0; j<classObject1.length(); j++){
								DashBoardReportVo classvo = new DashBoardReportVo();
								JSONObject classObj = classArray1.getJSONObject(j);

								JSONArray groupArray = classObj.getJSONArray("homeRoomList");
								JSONObject groupObj = groupArray.getJSONObject(j);
								ArrayList<DashBoardReportVo> homeroomList = new ArrayList<DashBoardReportVo>();
								if(groupObj.length()>0){
									for(int k=0; k<groupObj.length(); k++){
										DashBoardReportVo HomeRoomVo = new DashBoardReportVo();
										JSONObject homeObj = groupArray.getJSONObject(k);
										HomeRoomVo.setHomeRoomId(homeObj.getInt("homeRoomId"));
										HomeRoomVo.setHomeRoomName(homeObj.getString("homeRoomName"));
										homeroomList.add(HomeRoomVo);
									}
									classvo.setHomeRoomList(homeroomList);

								}
								classvo.setClassId(classObj.getInt("classId"));
								classvo.setClassName(classObj.getString("className"));
								classList1.add(classvo);
							}
							schoolVo.setClassList(classList1);
						}
						schoolVo.setSchoolId(jsonbj.getInt("schoolId"));
						schoolVo.setSchoolName(jsonbj.getString("schoolName"));
						schoolNameList.add(schoolVo);
					}
				}
				request.setAttribute("selectedTab", "coursesTabId"); 
			}
			else {
				return ERROR;
			}

		}
		return SUCCESS;
	}



	public List<DashBoardReportVo> getCourseReportList() {
		return courseReportList;
	}


	public void setCourseReportList(List<DashBoardReportVo> courseReportList) {
		this.courseReportList = courseReportList;
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


	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}


	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}



}
