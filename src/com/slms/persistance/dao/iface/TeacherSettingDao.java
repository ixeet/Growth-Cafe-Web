package com.slms.persistance.dao.iface;

import com.slms.app.domain.vo.RegistrationVo;

public interface TeacherSettingDao {

	public String getFeedUser(int userId);

	public String setFollowerStatus(RegistrationVo registrationVo);

	public String getFeedAccessType(int userId);

	public String setFeedAccessType(RegistrationVo registrationVo,int userAccessTypeId);
}
