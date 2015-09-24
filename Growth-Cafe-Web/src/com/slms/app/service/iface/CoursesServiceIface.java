package com.slms.app.service.iface;

import com.slms.app.domain.vo.CoursesVo;
import com.slms.app.domain.vo.RegistrationVo;

public interface CoursesServiceIface {


	String courses(RegistrationVo registrationVo);


	String moduleDescription(RegistrationVo registrationVo, CoursesVo coursesVo);


	String likeResource(RegistrationVo registrationVo, CoursesVo coursesVo);


	String commentOnResource(RegistrationVo registrationVo, CoursesVo coursesVo);


	String commentOnComment(RegistrationVo registrationVo, CoursesVo coursesVo);


	String likeOnComment(RegistrationVo registrationVo, CoursesVo coursesVo);


}
