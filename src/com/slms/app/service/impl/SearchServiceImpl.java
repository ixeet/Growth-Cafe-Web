package com.slms.app.service.impl;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.SearchVo;
import com.slms.app.service.iface.SearchServiceIface;

public class SearchServiceImpl implements SearchServiceIface{

	Logger logger = LoggerFactory.getLogger(UpdatesServiceImpl.class);
	String baseUrl=Utility.getProperties("application.properties").getProperty("baseUrl");
	String response;
	
	
	@Override
	public String getCategory(SearchVo searchVo, int userId) {
		try {
			
			String url = baseUrl+"rest/common/search";
			System.out.println(url);
			if(searchVo.getCategory()!=null){
				url=url+"/"+searchVo.getCategory();
			}
			JSONObject jsonRequestObj = new JSONObject();
			jsonRequestObj.put("userId", userId);
			if(searchVo.getSearchText() != null){
			jsonRequestObj.put("searchText", searchVo.getSearchText());
			}
			else{
					jsonRequestObj.put("searchText", "");
				}
			jsonRequestObj.put("offset", searchVo.getOffset());
			jsonRequestObj.put("noOfRecords", 5);
			System.out.println(jsonRequestObj);
			response = PostJsonObject.postJson(jsonRequestObj,url);
			System.out.println(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}
}
