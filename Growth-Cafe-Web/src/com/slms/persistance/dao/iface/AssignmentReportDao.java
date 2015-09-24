/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.slms.persistance.dao.iface;

import java.util.List;

import com.slms.domain.vo.DashBoardReportVo;



/**
 *
 * @author admin
 */
public interface AssignmentReportDao {

	public List<DashBoardReportVo> getAssignmentDetailList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getSchoolNameList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getClassNamList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getHomeRoomList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getCourseList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getModuleList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getSubmitDetail(
			DashBoardReportVo dashBoardReportVo);

	
	public String getShowFilterData(DashBoardReportVo dashBoardReportVo);

}
