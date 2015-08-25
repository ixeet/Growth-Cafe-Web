package com.slms.app.service.iface;

import com.slms.app.domain.vo.RegistrationVo;

public interface UpdatesServiceIface {

	public String updates(RegistrationVo loginDetail);

	public String commentOnFeed(RegistrationVo loginDetail, int feedId,
			String commentTxt);

	public String likeOnFeed(RegistrationVo loginDetail, int feedId);

	public String commentOnFeedComment(RegistrationVo loginDetail,
			int commentId, String commentTxt);

	public String getCourseFromFeed(int feedId);

	public String getModuleFromFeed(int feedId);

	public String likeOnFeedComment(RegistrationVo loginDetail, int commentId);

}
