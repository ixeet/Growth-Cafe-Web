package com.slms.persistance.dao.iface;

import com.slms.app.domain.vo.SearchVo;

public interface TeacherSearchDao {

	String getCategory(SearchVo searchVo, int userId);
}
