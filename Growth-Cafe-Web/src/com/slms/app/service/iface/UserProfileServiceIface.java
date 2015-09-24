package com.slms.app.service.iface;

import com.slms.app.domain.vo.RegistrationVo;

public interface UserProfileServiceIface {
	
	public String updateProfile(RegistrationVo registrationVo);

	public String changePassword(RegistrationVo registrationVo);

	public String updateProfileImg(RegistrationVo registrationVo);

}
