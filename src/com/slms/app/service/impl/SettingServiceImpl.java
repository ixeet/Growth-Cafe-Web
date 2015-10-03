package com.slms.app.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.service.iface.SettingServiceIface;

public class SettingServiceImpl implements SettingServiceIface{
	
	Logger logger = LoggerFactory.getLogger(HomeServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;

	@Override
	public String getFeedUser(int userId) {
		try {
			String url=baseUrl+"rest/user/getFeedUsers/userId/"+userId;
			response = GetJsonObject.getWebServceObj(url);
			logger.debug("SettingServiceImpl method:-getFeedUser  url:-"+url);
			} catch (Exception e) {
				logger.error("SettingServiceImpl method:-getFeedUser "+e.getMessage());
			}
			logger.debug("SettingServiceImpl method:-getFeedUser Response:"+response);
			return response;
	}

}
