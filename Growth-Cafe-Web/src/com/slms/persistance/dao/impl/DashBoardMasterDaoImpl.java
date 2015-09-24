/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.slms.persistance.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.app.domain.vo.RegistrationVo;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.DashBoardMasterDao;
import com.slms.persistance.factory.LmsDaoAbstract;

/**
 *
 * @author admin
 */
public class DashBoardMasterDaoImpl extends LmsDaoAbstract implements DashBoardMasterDao {

	String baseUrl=Utility.getProperties("application.properties").getProperty("loginbaseUrl");
	String response=null;
	
	@Override
	public List<DashBoardReportVo> getDashBoardDetailList(
			DashBoardReportVo dashBoardReportVo) {
		 List<DashBoardReportVo> showDeail = new ArrayList<DashBoardReportVo>();
	        //1 . jdbc code start
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        try {
	            conn = getConnection();

	           String sql="select sms.SCHOOL_NAME,cm.CLASS_NAME, cms.COURSE_NAME, hmm.HRM_NAME, mom.MODULE_NAME, mom.MODULE_ID, tcsd.IS_COMPLETED from school_mstr sms, " +
						"school_cls_map scm, class_mstr cm, clas_course_map ccm, course_mstr cms, class_hrm_map chm, homeroom_mstr hmm,  course_module_map ccmm," +
						" module_mstr mom , teacher_courses tc, teacher_course_sessions tcse,teacher_course_session_dtls tcsd where sms.SCHOOL_ID=scm.SCHOOL_ID " +
						"and scm.CLASS_ID=cm.CLASS_ID and cm.CLASS_ID=ccm.CLASS_ID and ccm.COURSE_ID=cms.COURSE_ID and chm.HRM_ID=hmm.HRM_ID and " +
						"ccmm.MODULE_ID=mom.MODULE_ID and tc.COURSE_ID=ccm.COURSE_ID and tc.CLASS_ID=cm.CLASS_ID and tc.HRM_ID=hmm.HRM_ID and " +
						"tc.SCHOOL_ID=scm.SCHOOL_ID and tcse.TEACHER_COURSE_ID=tc.TEACHER_COURSE_ID  and tcse.COURSE_SESSION_ID=tcsd.COURSE_SESSION_ID " +
						"and tcsd.MODULE_ID=mom.MODULE_ID  group by sms.SCHOOL_NAME,cm.CLASS_NAME, cms.COURSE_NAME, hmm.HRM_NAME, mom.MODULE_NAME," +
						" mom.MODULE_ID, tcsd.IS_COMPLETED";
	           
	           
	           stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery(sql);

				while(rs.next()){
					dashBoardReportVo = new DashBoardReportVo();
					dashBoardReportVo.setSchoolName(rs.getString("SCHOOL_NAME"));
					dashBoardReportVo.setClassName(rs.getString("CLASS_NAME"));
					dashBoardReportVo.setHomeRoomName(rs.getString("HRM_NAME"));
					dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
					dashBoardReportVo.setSalesCourse(rs.getString("COURSE_NAME"));
					dashBoardReportVo.setId(rs.getInt("MODULE_ID"));
					String temp=rs.getString("IS_COMPLETED");
					if( temp.equalsIgnoreCase("1")){
						dashBoardReportVo.setStatus("Completed"); 
						dashBoardReportVo.setView(temp); 
					}
					else if( temp.equalsIgnoreCase("0")){
						dashBoardReportVo.setStatus("In Progress"); 
						dashBoardReportVo.setView(temp);
					}
					showDeail.add(dashBoardReportVo);
				}
	           
	           
	           
	            /*
	            for(int i=0; i<=2; i++){
	            dashBoardReportVo.setSchoolName("Jagran Public School");
	            dashBoardReportVo.setClassName("X");
	            dashBoardReportVo.setSalesCourse("X");
	            dashBoardReportVo.setHomeRoomName("B");
	          //  dashBoardReportVo.setModule(10);
	            
	            	showDeail.add(dashBoardReportVo);
	            }
*/
	            System.out.println("get records into the table...");

	        } catch (SQLException se) {
	            System.out.println("getDashBoardDetail # " + se);
	            se.printStackTrace();
	        } catch (Exception e) {
	            System.out.println("getDashBoardDetail # " + e);
	            e.printStackTrace();
	        } finally {
	            closeResources(conn, stmt, null);
	        }
	        return showDeail;
	}

	 
	@Override
	public String updates(RegistrationVo loginDetail , int offset) {
		try {
			String url=baseUrl+"rest/common/getFeeds";
			
			JSONObject regJsonObject = new JSONObject();
			regJsonObject.put("userId", 22);
			regJsonObject.put("searchText", "");
			regJsonObject.put("offset", offset);
			regJsonObject.put("noOfRecords", 10);
			System.out.println("DashBoardMasterDaoImpl method:-updates Request:-"+regJsonObject);
			response = PostJsonObject.postJson(regJsonObject, url);
		} catch (Exception e) {
			System.out.println("UpdatesServiceImpl method:-updates "+e.getMessage());
		}
		System.out.println("DashBoardMasterDaoImpl method:-updates Response:-"+response);
		return response;
	}

	
	/*  Data Come From Service */
	

	@Override
	public String getSchoolDetail(DashBoardReportVo dashBoardReportVo) {
		try {
			/*String url=baseUrl+"rest/common/getFeeds"; */
			
				String url= baseUrl+"rest/common/getMasterData/teacherId/"+dashBoardReportVo.getUserId(); 
				
				System.out.println("DashboardMasterDaoImpl method : - master data Request "+url);
				response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			System.out.println("UpdatesServiceImpl method:-updates "+e.getMessage());
		}
		System.out.println("DashBoardMasterDaoImpl method:-updates Response:-"+response);
		return response;
	}
    
    
}//end of class
