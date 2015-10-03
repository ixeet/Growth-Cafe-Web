package com.slms.app.webapp.controller;

import java.util.ArrayList;
import java.util.List;

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
	
	@Override
	public RegistrationVo getModel() {
		registrationVo = new RegistrationVo();
		return registrationVo;
	}
	
	
	public String execute(){
		SettingServiceIface settingService = new SettingServiceImpl();
		try{
		response = settingService.getFeedUser(registrationVo.getUserId());
		JSONObject jsonResponse = new JSONObject(response);
		if(jsonResponse.getString("statusMessage").equalsIgnoreCase("success")){
			userList = new ArrayList<RegistrationVo>();
			JSONArray jsonUserArr = jsonResponse.getJSONArray("usersList");
			for(int i=0; i<jsonUserArr.length();i++){
				RegistrationVo user = new RegistrationVo();
				JSONObject jsonUser = jsonUserArr.getJSONObject(i);
				user.setUserId(jsonUser.getInt("userId"));
				user.setUserName(jsonUser.getString("userName"));
				if(jsonUser.getInt("isFollowUpAllowed")==1)
				user.setFollowUpAllowed(true);
				userList.add(user);
			}
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

	

}
