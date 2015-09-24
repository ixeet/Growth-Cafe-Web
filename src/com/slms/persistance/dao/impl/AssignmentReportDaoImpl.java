/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.slms.persistance.dao.impl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.AssignmentReportDao;
import com.slms.persistance.factory.LmsDaoAbstract;

/**
 *
 * @author admin
 */
public class AssignmentReportDaoImpl extends LmsDaoAbstract implements AssignmentReportDao {

	Connection conn = null;
	Statement stmt = null;
	String baseUrl=Utility.getProperties("application.properties").getProperty("loginbaseUrl");
	String baseTeacherUrl=Utility.getProperties("application.properties").getProperty("loginTeacherbaseUrl");
	String response="";
	@Override
	public List<DashBoardReportVo> getAssignmentDetailList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> showDeail = new ArrayList<DashBoardReportVo>();
        //1 . jdbc code start
       
        try {
            conn = getConnection();
            String sql ="";
          /*  String sql = "SELECT sd.FNAME, sd.LNAME,ccm.COURSE_NAME,mmss.MODULE_NAME, art.UPLOADED_ON FROM course_module_map ccmm, module_mstr mmss, " +
            		"school_mstr sm, school_cls_map scm, assignment_resource_txn art, class_mstr cm, assignment_resource_txn artxn, student_dtls sd," +
            		" class_hrm_map chm, homeroom_mstr hhm, hrm_course_map hcm, course_mstr ccm, module_assignment_map maap where scm.CLASS_ID = cm.CLASS_ID " +
            		"and chm.CLASS_ID=cm.CLASS_ID and chm.HRM_ID=hhm.HRM_ID and hcm.COURSE_ID=ccm.COURSE_ID and ccmm.MODULE_ID = mmss.MODULE_ID and " +
            		"maap.ASSIGNMENT_ID=art.ASSIGNMENT_ID group by  ccm.COURSE_NAME";*/
            
            sql="select cmstr.CLASS_NAME, tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from " +
            		"teacher_courses tc,course_mstr cm , teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, " +
            		"course_mstr ccmm ,class_mstr cmstr where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' and  cm.COURSE_ID=tc.COURSE_ID and" +
            				" tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and tcsd.MODULE_ID=mm.MODULE_ID " +
            				"and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID  and tc.CLASS_ID=cmstr.CLASS_ID";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            
            
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
          /*  dashBoardReportVo.setStudentName(rs.getString("FNAME"));*/
            dashBoardReportVo.setCourseName(rs.getString("COURSE_NAME"));
            dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
            dashBoardReportVo.setStatus("Completed");
           /* dashBoardReportVo.setSubmissionDate(rs.getString("UPLOADED_ON"));*/
            dashBoardReportVo.setDetailView(1);
            
            showDeail.add(dashBoardReportVo);
            }

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
	public List<DashBoardReportVo> getSchoolNameList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> schoolNameList = new ArrayList<DashBoardReportVo>();
        
        try {
            conn = getConnection();
            String sql = "select sm.SCHOOL_ID, sm.SCHOOL_NAME from school_mstr sm";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setSchoolId(rs.getInt("SCHOOL_ID"));
            	dashBoardReportVo.setSchoolName(rs.getString("SCHOOL_NAME"));
            	schoolNameList.add(dashBoardReportVo);
            }
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
        return schoolNameList;
	}

	@Override
	public List<DashBoardReportVo> getClassNamList(
			DashBoardReportVo dashBoardReportVo) {
			List<DashBoardReportVo> classNameList = new ArrayList<DashBoardReportVo>();
        try {
            conn = getConnection();
            String sql = "select cm.CLASS_ID, cm.CLASS_NAME from school_mstr sm,school_cls_map scm, class_mstr cm " +
            		"where sm.SCHOOL_ID=scm.SCHOOL_ID and scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and scm.CLASS_ID=cm.CLASS_ID ";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setSchoolId(rs.getInt("CLASS_ID"));
            	dashBoardReportVo.setSchoolName(rs.getString("CLASS_NAME"));
            	classNameList.add(dashBoardReportVo);
            }
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
        return classNameList;
	}

	@Override
	public List<DashBoardReportVo> getHomeRoomList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> homeRoomList = new ArrayList<DashBoardReportVo>();
        try {
            conn = getConnection();
            String sql = "select hm.HRM_ID, hm.HRM_NAME from school_cls_map scm, class_hrm_map chm,homeroom_mstr hm  where scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"'" +
            		" and chm.CLASS_ID=scm.CLASS_ID and hm.HRM_ID=chm.HRM_ID and chm.CLASS_ID='"+dashBoardReportVo.getClassId()+"'";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setHomeRoomId(rs.getInt("HRM_ID"));
            	dashBoardReportVo.setHomeRoomName(rs.getString("HRM_NAME"));
            	homeRoomList.add(dashBoardReportVo);
            }
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
        return homeRoomList;
	}

	@Override
	public List<DashBoardReportVo> getCourseList(
			DashBoardReportVo dashBoardReportVo) {
		
		List<DashBoardReportVo> courseList = new ArrayList<DashBoardReportVo>();
        try {
            conn = getConnection();
            String sql = "select cmm.COURSE_ID, cmm.COURSE_NAME from school_cls_map scm, class_hrm_map chm, hrm_course_map hcm, course_mstr cmm " +
            		"where scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and chm.CLASS_ID=scm.CLASS_ID and chm.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and chm.HRM_ID=hcm.HRM_ID " +
            		"and hcm.COURSE_ID=cmm.COURSE_ID and chm.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"'";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setCourseId(rs.getInt("COURSE_ID"));
            	dashBoardReportVo.setCourseName(rs.getString("COURSE_NAME"));
            	courseList.add(dashBoardReportVo);
            }
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
        return courseList;
	}

	@Override
	public List<DashBoardReportVo> getModuleList(
			DashBoardReportVo dashBoardReportVo) {
		
		List<DashBoardReportVo> moduleList = new ArrayList<DashBoardReportVo>();
        try {
            conn = getConnection();
            String sql = "select mm.MODULE_ID, mm.MODULE_NAME from school_cls_map scm, class_hrm_map chm, hrm_course_map hcm, course_module_map cmmap, module_mstr mm where " +
            		"scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and chm.CLASS_ID=scm.CLASS_ID and chm.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and " +
            		"chm.HRM_ID=hcm.HRM_ID and chm.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' and hcm.COURSE_ID= cmmap.COURSE_ID and " +
            		"cmmap.MODULE_ID= mm.MODULE_ID and  hcm.COURSE_ID='"+dashBoardReportVo.getCourseId()+"'";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setModuleId(rs.getInt("MODULE_ID"));
            	dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
            	moduleList.add(dashBoardReportVo);
            }
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
        return moduleList;
	}

	@Override
	public List<DashBoardReportVo> getSubmitDetail(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> moduleList = new ArrayList<DashBoardReportVo>();
        try {
            conn = getConnection();
            String sql = "SELECT  art.UPLOADED_ON,art.ASSIGNMENT_ID FROM course_module_map ccmm, " +
            		"module_mstr mmss, school_mstr sm, school_cls_map scm, assignment_resource_txn art, class_mstr cm, class_hrm_map chm, homeroom_mstr hhm, " +
            		"hrm_course_map hcm, course_mstr ccm, module_assignment_map maap where scm.CLASS_ID = cm.CLASS_ID and chm.CLASS_ID=cm.CLASS_ID and chm.HRM_ID=hhm.HRM_ID " +
            		"and hcm.COURSE_ID=ccm.COURSE_ID and ccmm.MODULE_ID = mmss.MODULE_ID and maap.ASSIGNMENT_ID=art.ASSIGNMENT_ID and" +
            		" sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and scm.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and chm.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' and hcm.COURSE_ID='"+dashBoardReportVo.getCourseId()+"' and mmss.MODULE_ID='"+dashBoardReportVo.getModuleId()+"' group by  ccm.COURSE_NAME";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setSubmissionDate(rs.getString("UPLOADED_ON"));
            	dashBoardReportVo.setAssignments(rs.getInt("ASSIGNMENT_ID"));
            	moduleList.add(dashBoardReportVo);
            }
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
        return moduleList;
	}

	@Override
	public String getShowFilterData(DashBoardReportVo dashBoardReportVo) {
		try{
		String url=baseTeacherUrl+"rest/course/getAssignments/teacher";
		System.out.println(url);
		
		JSONObject logingJsonObject = new JSONObject();
		logingJsonObject.put("userId", dashBoardReportVo.getUserId());
		logingJsonObject.put("courseId",dashBoardReportVo.getCourseId());
		logingJsonObject.put("schoolId",dashBoardReportVo.getSchoolId());
		logingJsonObject.put("classId",dashBoardReportVo.getClassId());
		logingJsonObject.put("hrmId",dashBoardReportVo.getHomeRoomId());
		logingJsonObject.put("moduleId",dashBoardReportVo.getModuleId());
		
		System.out.println("CoursesServiceImpl method:-courses Request:-"+logingJsonObject);
		response = PostJsonObject.postJson(logingJsonObject, url);
	} catch (Exception e) {
		System.out.println("CoursesServiceImpl method:-courses "+e.getMessage());
	}
	System.out.println("CoursesServiceImpl method:-courses Response:-"+response);
	return response;
	}

}//end of class
