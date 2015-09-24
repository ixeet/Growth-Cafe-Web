package com.slms.app.webapp.controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.app.service.iface.UserProfileServiceIface;
import com.slms.app.service.impl.UserProfileServiceImpl;

public class UserProfileAction extends ActionSupport implements ModelDriven<RegistrationVo>, ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(UserProfileAction.class);
	RegistrationVo registrationVo;
	UserProfileServiceIface userProfileServiceIface;
	String response;
	HttpServletRequest request;
	@Override
	public RegistrationVo getModel() {
		registrationVo = new RegistrationVo();
		return registrationVo;
	}
	
	public String execute() {
		logger.debug("UserProfileAction method:-execute ");
		getRequest().getSession().removeAttribute("selectedTab");
		return SUCCESS;
	}
	
	public String updateProfile() {
		try {
			logger.debug("UserProfileAction method:-updateProfile ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				registrationVo.setUserName(loginDetail.getUserName());
				registrationVo.setUserId(loginDetail.getUserId());
				loginDetail.setFirstName(registrationVo.getFirstName());
				loginDetail.setLastName(registrationVo.getLastName());
				loginDetail.setTitle(registrationVo.getTitle());
				userProfileServiceIface = new UserProfileServiceImpl();
				response = userProfileServiceIface.updateProfile(registrationVo);
				request.getSession().setAttribute("loginDetail", loginDetail);
			}
		} catch (Exception e) {
			logger.error("UserProfileAction method:-updateProfile error:-"+e.getMessage());
		}
		return SUCCESS;
	}
	
	
	public String updateProfileImg() {
		logger.debug("UserProfileAction method:-updateProfileImg ");
		userProfileServiceIface = new UserProfileServiceImpl();
		response = userProfileServiceIface.updateProfileImg(registrationVo);
		return SUCCESS;
	}


	
	public String changePassword() {
		try {
			logger.debug("UserProfileAction method:-changePassword ");
			HttpServletRequest request = ServletActionContext.getRequest();
			RegistrationVo loginDetail = (RegistrationVo) request.getSession().getAttribute("loginDetail");
			if(loginDetail !=null){
				registrationVo.setUserName(loginDetail.getUserName());
			userProfileServiceIface = new UserProfileServiceImpl();
			response = userProfileServiceIface.changePassword(registrationVo);
			}
			} catch (Exception e) {
				logger.error("UserProfileAction method:-changePassword error:-"+e.getMessage());
			}
		return SUCCESS;
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
	public HttpServletRequest getServletRequest() {
		return request;
	}

	/**
	 * @return the request
	 */
	public HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * @param request the request to set
	 */
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
}
