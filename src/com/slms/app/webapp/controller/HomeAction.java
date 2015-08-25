package com.slms.app.webapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.HomeServiceIface;
import com.slms.app.service.impl.HomeServiceImpl;

public class HomeAction extends ActionSupport implements ModelDriven<RegistrationVo>, ServletResponseAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	RegistrationVo registrationVo;
	HomeServiceIface homeServiceIface;
	HttpServletResponse servletResponse;
	String response;
	private ArrayList<RegistrationVo> schoolsList;
	private ArrayList<RegistrationVo> classesList;
	private ArrayList<RegistrationVo> homesList;
	//public ArrayList<FeedVo> feedList;

	@Override
	public RegistrationVo getModel() {
		registrationVo = new RegistrationVo();
		return registrationVo;
	}
	
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		servletResponse=arg0;
	}
	
	/**
	 * @return the servletResponse
	 */
	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}
	
	public String execute(){
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail == null){
				RegistrationVo schoolMasterData = null;
				String response = getSchoolMasterData();
				JSONObject resJsonObject = new JSONObject(response);
				if(resJsonObject.getString("statusMessage").equalsIgnoreCase("success")){
					schoolMasterData = new RegistrationVo();
					JSONArray jsonSchoolList = resJsonObject.getJSONArray("schoolList");
					schoolsList = new ArrayList<RegistrationVo>();
					for(int i=0;i<jsonSchoolList.length();i++){
						JSONObject jsonSchool = (JSONObject) jsonSchoolList.get(i);
						RegistrationVo school = new RegistrationVo();
						school.setSchoolId(jsonSchool.getInt("schoolId"));
						school.setSchoolName(jsonSchool.getString("schoolName"));
						schoolsList.add(school);
						JSONArray jsonClassList = jsonSchool.getJSONArray("classList");
						classesList= new ArrayList<RegistrationVo>();
						for(int j=0;j<jsonClassList.length();j++){
							JSONObject jsonclass = (JSONObject) jsonClassList.get(j);
							RegistrationVo classObj = new RegistrationVo();
							classObj.setClassId(jsonclass.getInt("classId"));
							classObj.setClassName(jsonclass.getString("className"));
							classesList.add(classObj);
							JSONArray jsonHomeArr = jsonclass.getJSONArray("homeRoomList");
							homesList = new ArrayList<RegistrationVo>();
							for (int k = 0; k < jsonHomeArr.length(); k++) {
								JSONObject jsonHomeObj = (JSONObject) jsonHomeArr.get(k);
								RegistrationVo home = new RegistrationVo();
								home.setHomeRoomId(jsonHomeObj.getInt("homeRoomId"));
								home.setHomeRoomName(jsonHomeObj.getString("homeRoomName"));
								homesList.add(home);
							}
							classObj.setHomeList(homesList);
						}
						school.setClassList(classesList);
					}
					schoolMasterData.setSchoolList(schoolsList);
				}
				classesList = schoolMasterData.getSchoolList().get(0).getClassList();
				homesList = classesList.get(0).getHomeList();
				return SUCCESS;
			}
			else{
				return LOGIN;
			}
		}catch (Exception e) {
			e.printStackTrace();
			return SUCCESS;
		}
	}
	
	/**
	 * This method register to user
	 * @return
	 */
	public void registration(){
		try {
			homeServiceIface = new HomeServiceImpl();
			response = homeServiceIface.registration(registrationVo);
			this.getServletResponse().getWriter().print(response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	 /**
		 * This method used to login user
		 * @return
		 */
		public void setFacebookId(){
			try {
				HttpServletRequest request = ServletActionContext.getRequest();
				RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
				if(loginDetail!=null){
					loginDetail.setUserFbId(registrationVo.getUserFbId());
				homeServiceIface = new HomeServiceImpl();
				response = homeServiceIface.setFacebookId(loginDetail);
				this.getServletResponse().getWriter().print(response);
				JSONObject jsonResponse = new JSONObject(response);
				if(jsonResponse.has("statusMessage")&& jsonResponse.getString("statusMessage").equals("success")){
					this.getServletResponse().getWriter().print(jsonResponse);
				}
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			
		}
		
		

		/**
		 * This method used to login user
		 * @return
		 */
		public void login(){
			try {
				HttpServletRequest request = ServletActionContext.getRequest();
				HomeServiceIface homeServiceIface = new HomeServiceImpl();
				RegistrationVo registrationVo = new RegistrationVo();
				registrationVo.setUserName(request.getParameter("userName"));
				registrationVo.setUserPassword(request.getParameter("userPassword"));
				response = homeServiceIface.login(registrationVo);
				JSONObject resJsonObject = new JSONObject(response);
				if(resJsonObject.getString("statusMessage").equalsIgnoreCase("success")){
					
					registrationVo.setUserType(resJsonObject.getInt("userType"));
					
					switch (registrationVo.getUserType()) {
					  case 1:
					        break;
					  case 2: 
						  if(resJsonObject.getString("statusMessage").equalsIgnoreCase("success")){
								/*registrationVo.setUserName(resJsonObject.getString("userName"));*/
								registrationVo.setFirstName(resJsonObject.getString("firstName"));
								/*registrationVo.setStatusMessage(resJsonObject.getString("statusMessage"));
								registrationVo.setLastName(resJsonObject.getString("lastName"));
								registrationVo.setEmailId(resJsonObject.getString("emailId"));
								registrationVo.setSchoolId(resJsonObject.getInt("schoolId"));
								registrationVo.setUserId(resJsonObject.getInt("userId"));
								registrationVo.setTitle(resJsonObject.getString("title"));
								registrationVo.setSchoolName(resJsonObject.getString("schoolName"));
								//registrationVo.setAddress(resJsonObject.getString("address"));
								registrationVo.setClassId(resJsonObject.getInt("classId"));
								registrationVo.setClassName(resJsonObject.getString("className"));
								registrationVo.setHomeRoomId(resJsonObject.getInt("homeRoomId"));
								registrationVo.setHomeRoomName(resJsonObject.getString("homeRoomName"));*/
							  	registrationVo.setUserType(resJsonObject.getInt("userType"));
								request.getSession().setAttribute("teacherloginDetail", registrationVo);
							}
						  
					        break;
					  case 3: 
						  if(resJsonObject.getString("statusMessage").equalsIgnoreCase("success")){
								registrationVo.setUserName(resJsonObject.getString("userName"));
								registrationVo.setFirstName(resJsonObject.getString("firstName"));
								registrationVo.setStatusMessage(resJsonObject.getString("statusMessage"));
								registrationVo.setLastName(resJsonObject.getString("lastName"));
								registrationVo.setEmailId(resJsonObject.getString("emailId"));
								registrationVo.setSchoolId(resJsonObject.getInt("schoolId"));
								registrationVo.setUserId(resJsonObject.getInt("userId"));
								registrationVo.setTitle(resJsonObject.getString("title"));
								registrationVo.setSchoolName(resJsonObject.getString("schoolName"));
								registrationVo.setProfilePhotoFileName(resJsonObject.getString("profileImage"));
								registrationVo.setClassId(resJsonObject.getInt("classId"));
								registrationVo.setClassName(resJsonObject.getString("className"));
								registrationVo.setHomeRoomId(resJsonObject.getInt("homeRoomId"));
								registrationVo.setHomeRoomName(resJsonObject.getString("homeRoomName"));
								request.getSession().setAttribute("loginDetail", registrationVo);
							}
					        break;
					}
				}
				this.getServletResponse().getWriter().print(response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			//return SUCCESS;
		}
		
		
		public String logout() {
			try {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().removeAttribute("loginDetail");
			request.getSession().removeAttribute("feedList");
			request.getSession().removeAttribute("selectedTab");
			request.getSession().removeAttribute("courseList");
			request.getSession().removeAttribute("assignmentList");
			request.getSession().removeAttribute("teacherloginDetail");
			execute();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;
		}
		
		
		public void logoutTeacher() {
			try {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.getSession().removeAttribute("teacherloginDetail");
			execute();
			this.getServletResponse().getWriter().print("success");
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	
		
		
		public String forgetPassword() {
			try {
				/*homeServiceIface = new HomeServiceImpl();
				response = homeServiceIface.forgetPassword(registrationVo);
				this.getServletResponse().getWriter().print(response);*/
				} catch (Exception e) {
					e.printStackTrace();
				}
			return SUCCESS;
		}
		
		
		public void sendforgetPassword() {
			try {
				homeServiceIface = new HomeServiceImpl();
				response = homeServiceIface.forgetPassword(registrationVo);
				this.getServletResponse().getWriter().print(response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
		
		
		public String getByFBId() {
			try {
				homeServiceIface = new HomeServiceImpl();
				response = homeServiceIface.getByFBId(registrationVo);
				if(response !=null){
					JSONObject resJsonObject = new JSONObject(response);
					if(resJsonObject.getString("statusMessage").equalsIgnoreCase("success")){
						registrationVo.setUserId(resJsonObject.getInt("userId"));
						registrationVo.setUserName(resJsonObject.getString("userName"));
						registrationVo.setFirstName(resJsonObject.getString("firstName"));
						registrationVo.setStatusMessage(resJsonObject.getString("statusMessage"));
						registrationVo.setLastName(resJsonObject.getString("lastName"));
						registrationVo.setEmailId(resJsonObject.getString("emailId"));
						registrationVo.setSchoolId(resJsonObject.getInt("schoolId"));
						registrationVo.setSchoolName(resJsonObject.getString("schoolName"));
						registrationVo.setAddress(resJsonObject.getString("address"));
						registrationVo.setClassId(resJsonObject.getInt("classId"));
						registrationVo.setClassName(resJsonObject.getString("className"));
						registrationVo.setHomeRoomId(resJsonObject.getInt("homeRoomId"));
						registrationVo.setHomeRoomName(resJsonObject.getString("homeRoomName"));
						registrationVo.setProfilePhotoFileName(resJsonObject.getString("profileImage"));
						HttpServletRequest request = ServletActionContext.getRequest();
						request.getSession().setAttribute("loginDetail", registrationVo);
						return LOGIN;
					}
					this.getServletResponse().getWriter().print(response);
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			return SUCCESS;
		}
		
		
		public String getSchoolMasterData(){
			try {
				homeServiceIface = new HomeServiceImpl();
				response = homeServiceIface.getSchoolMasterData();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return response;
		}
		
		public void getClassDetails() {
			try{
			response =getSchoolMasterData();
			this.getServletResponse().getWriter().print(response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public String personalProfile() {
			HttpServletRequest request = ServletActionContext.getRequest();
			try{
				HomeServiceIface homeServiceIface = new HomeServiceImpl();
				response =homeServiceIface.personalProfile(registrationVo.getUserId());
				JSONObject resJsonObject = new JSONObject(response);
				if(resJsonObject.getString("statusMessage").equalsIgnoreCase("success")){
					JSONObject jsonPersonalProfileObj = resJsonObject.getJSONObject("userDetail");
					registrationVo.setFirstName(jsonPersonalProfileObj.getString("firstName"));
					registrationVo.setLastName(jsonPersonalProfileObj.getString("lastName"));
					registrationVo.setEmailId(jsonPersonalProfileObj.getString("emailId"));
					registrationVo.setSchoolName(jsonPersonalProfileObj.getString("schoolName"));
					registrationVo.setClassName(jsonPersonalProfileObj.getString("className"));
					registrationVo.setHomeRoomName(jsonPersonalProfileObj.getString("homeRoomName"));
					//feedList = (ArrayList<FeedVo>) request.getSession().getAttribute("feedList");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().removeAttribute("selectedTab");
			return SUCCESS;
		}

		/**
		 * @return the schoolsList
		 */
		public ArrayList<RegistrationVo> getSchoolsList() {
			return schoolsList;
		}

		/**
		 * @param schoolsList the schoolsList to set
		 */
		public void setSchoolsList(ArrayList<RegistrationVo> schoolsList) {
			this.schoolsList = schoolsList;
		}

		/**
		 * @return the classesList
		 */
		public ArrayList<RegistrationVo> getClassesList() {
			return classesList;
		}

		/**
		 * @param classesList the classesList to set
		 */
		public void setClassesList(ArrayList<RegistrationVo> classesList) {
			this.classesList = classesList;
		}

		/**
		 * @return the homesList
		 */
		public ArrayList<RegistrationVo> getHomesList() {
			return homesList;
		}

		/**
		 * @param homesList the homesList to set
		 */
		public void setHomesList(ArrayList<RegistrationVo> homesList) {
			this.homesList = homesList;
		}

		/**
		 * @return the feedList
		 *//*
		public ArrayList<FeedVo> getFeedList() {
			return feedList;
		}

		*//**
		 * @param feedList the feedList to set
		 *//*
		public void setFeedList(ArrayList<FeedVo> feedList) {
			this.feedList = feedList;
		}*/
		
}
