package com.slms.persistance.dao.impl;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.SearchVo;
import com.slms.app.service.impl.UpdatesServiceImpl;
import com.slms.persistance.dao.iface.TeacherSearchDao;

public class TeacherSearchDaoImpl implements TeacherSearchDao{

	Logger logger = LoggerFactory.getLogger(UpdatesServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	
	@Override
	public String getCategory(SearchVo searchVo, int userId) {
		try {
			
			String url = baseUrl+"rest/common/search";
			if(searchVo.getCategory()!=null){
				url=url+"/"+searchVo.getCategory();
			}
			JSONObject jsonRequestObj = new JSONObject();
			jsonRequestObj.put("userId", userId);
			jsonRequestObj.put("searchText", searchVo.getSearchText());
			jsonRequestObj.put("offset", searchVo.getOffset());
			jsonRequestObj.put("noOfRecords", 10);
			response = PostJsonObject.postJson(jsonRequestObj,url);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
}
