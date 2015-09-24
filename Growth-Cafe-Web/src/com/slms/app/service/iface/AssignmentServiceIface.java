package com.slms.app.service.iface;

import com.slms.app.domain.vo.AssignmentVo;
import com.slms.app.domain.vo.RegistrationVo;

public interface AssignmentServiceIface {

	public String assignments(RegistrationVo registrationVo);

	public String uploadAssignment(AssignmentVo assignmentVo,
			RegistrationVo loginDetail);

}
