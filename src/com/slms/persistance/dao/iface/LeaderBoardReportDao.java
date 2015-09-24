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
public interface LeaderBoardReportDao {

	public List<DashBoardReportVo> getLeaderBoardDetailList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getSchoolNameList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getClassNamList(
			DashBoardReportVo dashBoardReportVo);

	public List<DashBoardReportVo> getHomeRoomList(
			DashBoardReportVo dashBoardReportVo);


	 

}
