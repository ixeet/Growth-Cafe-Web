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
public interface CourseReportDao {

	public List<DashBoardReportVo> getCourseDetailList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getSaleCourseList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getcourseDataList(
			DashBoardReportVo dashBoardReportVo);

	public String getShowList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getClassNameList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getHomeRoomList(
			DashBoardReportVo dashBoardReportVo);

	public String getCourse(DashBoardReportVo dashBoardReportVo);


	public String getChangeStatus(DashBoardReportVo dashBoardReportVo);

	public String getSchoolList(DashBoardReportVo dashBoardReportVo);

	public String getShowFilterData(DashBoardReportVo dashBoardReportVo);

	public String getChangeCourseStatus(DashBoardReportVo dashBoardReportVo);

	public String getChangeAssignmentStatus(DashBoardReportVo dashBoardReportVo);


}
