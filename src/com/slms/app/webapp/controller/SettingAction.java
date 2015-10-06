package com.slms.app.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.SettingServiceIface;
import com.slms.app.service.impl.SettingServiceImpl;

public class SettingAction extends ActionSupport implements ModelDriven<RegistrationVo>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String response;
	RegistrationVo registrationVo;
	List<RegistrationVo> userList;
	int userAccessTypeId;
	@Override
	public RegistrationVo getModel() {
		registrationVo = new RegistrationVo();
		return registrationVo;
	}
	
	
	public String execute(){
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
		SettingServiceIface settingService = new SettingServiceImpl();
		try{
		response = settingService.getFeedUser(loginDetail.getUserId());
		JSONObject jsonResponse = new JSONObject(response);
		if(jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
			userList = new ArrayList<RegistrationVo>();
			JSONArray jsonUserArr = jsonResponse.getJSONArray("usersList");
			for(int i=0; i<jsonUserArr.length();i++){
				RegistrationVo user = new RegistrationVo();
				JSONObject jsonUser = jsonUserArr.getJSONObject(i);
				user.setUserId(jsonUser.getInt("userId"));
				user.setUserName(jsonUser.getString("userName"));
				user.setIsFollowUpAllowed(jsonUser.getInt("isFollowUpAllowed"));
				userList.add(user);
			}
		}
		
		response = settingService.getFeedAccessType(loginDetail.getUserId());
		jsonResponse = new JSONObject(response);
		if(jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
			userAccessTypeId = jsonResponse.getInt("userAccessTypeId");
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return SUCCESS;
	}

	
	public void setFollowerStatus(){
		
		SettingServiceIface settingService = new SettingServiceImpl();
		HttpServletRequest request = ServletActionContext.getRequest();
		RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
		try{
			if(loginDetail !=null){
				registrationVo.setUserId(loginDetail.getUserId());
				response = settingService.setFollowerStatus(registrationVo);
			}
		JSONObject jsonResponse = new JSONObject(response);
		if(jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
			
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	public String setFeedAccessType(){
			
			SettingServiceIface settingService = new SettingServiceImpl();
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			try{
				if(loginDetail !=null){
					registrationVo.setUserId(loginDetail.getUserId());
					response = settingService.setFeedAccessType(registrationVo,userAccessTypeId);
				}
			JSONObject jsonResponse = new JSONObject(response);
			if(jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
				execute();
			}
			}catch (Exception e) {
				// TODO: handle exception
			}
			return SUCCESS;
		}
	
	public List<RegistrationVo> getUserList() {
		return userList;
	}


	public void setUserList(List<RegistrationVo> userList) {
		this.userList = userList;
	}


	public int getUserAccessTypeId() {
		return userAccessTypeId;
	}


	public void setUserAccessTypeId(int userAccessTypeId) {
		this.userAccessTypeId = userAccessTypeId;
	}

	

}
