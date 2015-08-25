package com.slms.app.service.iface;

import com.slms.app.domain.vo.RegistrationVo;

public interface HomeServiceIface {
	
	public String registration(RegistrationVo registrationVo);
	public String login(RegistrationVo registrationVo);
	public String setFacebookId(RegistrationVo registrationVo);
	public String forgetPassword(RegistrationVo registrationVo);
	public String getByFBId(RegistrationVo registrationVo);
	public String getSchoolMasterData();
	public String personalProfile(int userId);
}
