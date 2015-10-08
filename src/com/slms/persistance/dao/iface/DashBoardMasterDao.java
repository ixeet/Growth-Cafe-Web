/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.slms.persistance.dao.iface;

import com.slms.app.domain.vo.RegistrationVo;
import com.slms.domain.vo.DashBoardReportVo;

import java.util.List;

/**
 *
 * @author admin
 */
public interface DashBoardMasterDao {


	public List<DashBoardReportVo> getDashBoardDetailList(
			DashBoardReportVo dashBoardReportVo);

	String updates(RegistrationVo loginDetail, int offset);

	public String getSchoolDetail(DashBoardReportVo dashBoardReportVo);

	public String getPieChartDetail(DashBoardReportVo dashBoardReportVo);

}
