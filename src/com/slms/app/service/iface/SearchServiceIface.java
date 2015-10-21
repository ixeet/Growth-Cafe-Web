package com.slms.app.service.iface;

import com.slms.app.domain.vo.SearchVo;

public interface SearchServiceIface {

	String getCategory(SearchVo searchVo, int userId);

}
