package com.slms.persistance.dao.impl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.CourseReportDao;
import com.slms.persistance.factory.LmsDaoAbstract;


public class CourseReportDaoImpl extends LmsDaoAbstract implements CourseReportDao {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs ;
	@Override
	public List<DashBoardReportVo> getCourseDetailList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> showDeail = new ArrayList<DashBoardReportVo>();
		try {
			conn = getConnection();

			String sql = "";
			if(dashBoardReportVo.getCourseId() != 0 && dashBoardReportVo.getModuleId()!=0 && dashBoardReportVo.getDetailView() != -1){

					sql="select sms.SCHOOL_NAME,cm.CLASS_NAME, cms.COURSE_NAME, hmm.HRM_NAME, mom.MODULE_NAME, mom.MODULE_ID, tcsd.IS_COMPLETED from school_mstr sms, " +
						"school_cls_map scm, class_mstr cm, clas_course_map ccm, course_mstr cms, class_hrm_map chm, homeroom_mstr hmm,  course_module_map ccmm," +
						" module_mstr mom , teacher_courses tc, teacher_course_sessions tcse,teacher_course_session_dtls tcsd where sms.SCHOOL_ID=scm.SCHOOL_ID " +
						"and scm.CLASS_ID=cm.CLASS_ID and cm.CLASS_ID=ccm.CLASS_ID and ccm.COURSE_ID=cms.COURSE_ID and chm.HRM_ID=hmm.HRM_ID and " +
						"ccmm.MODULE_ID=mom.MODULE_ID and tc.COURSE_ID=ccm.COURSE_ID and tc.CLASS_ID=cm.CLASS_ID and tc.HRM_ID=hmm.HRM_ID and " +
						"tc.SCHOOL_ID=scm.SCHOOL_ID and tcse.TEACHER_COURSE_ID=tc.TEACHER_COURSE_ID  and tcse.COURSE_SESSION_ID=tcsd.COURSE_SESSION_ID " +
						"and tcsd.MODULE_ID=mom.MODULE_ID  and cms.COURSE_ID='"+dashBoardReportVo.getCourseId()+"' and mom.MODULE_ID='"+dashBoardReportVo.getModuleId()+"'" +
								" and tcsd.IS_COMPLETED='"+dashBoardReportVo.getDetailView()+"' group by sms.SCHOOL_NAME,cm.CLASS_NAME, cms.COURSE_NAME, hmm.HRM_NAME, mom.MODULE_NAME," +
						" mom.MODULE_ID, tcsd.IS_COMPLETED";
			}
			else{
				sql="select sms.SCHOOL_NAME,cm.CLASS_NAME, cms.COURSE_NAME, hmm.HRM_NAME, mom.MODULE_NAME, mom.MODULE_ID, tcsd.IS_COMPLETED from school_mstr sms, " +
						"school_cls_map scm, class_mstr cm, clas_course_map ccm, course_mstr cms, class_hrm_map chm, homeroom_mstr hmm,  course_module_map ccmm," +
						" module_mstr mom , teacher_courses tc, teacher_course_sessions tcse,teacher_course_session_dtls tcsd where sms.SCHOOL_ID=scm.SCHOOL_ID " +
						"and scm.CLASS_ID=cm.CLASS_ID and cm.CLASS_ID=ccm.CLASS_ID and ccm.COURSE_ID=cms.COURSE_ID and chm.HRM_ID=hmm.HRM_ID and " +
						"ccmm.MODULE_ID=mom.MODULE_ID and tc.COURSE_ID=ccm.COURSE_ID and tc.CLASS_ID=cm.CLASS_ID and tc.HRM_ID=hmm.HRM_ID and " +
						"tc.SCHOOL_ID=scm.SCHOOL_ID and tcse.TEACHER_COURSE_ID=tc.TEACHER_COURSE_ID  and tcse.COURSE_SESSION_ID=tcsd.COURSE_SESSION_ID " +
						"and tcsd.MODULE_ID=mom.MODULE_ID  group by sms.SCHOOL_NAME,cm.CLASS_NAME, cms.COURSE_NAME, hmm.HRM_NAME, mom.MODULE_NAME," +
						" mom.MODULE_ID, tcsd.IS_COMPLETED";
			}
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
				dashBoardReportVo = new DashBoardReportVo();
				dashBoardReportVo.setSchoolName(rs.getString("SCHOOL_NAME"));
				dashBoardReportVo.setClassName(rs.getString("CLASS_NAME"));
				dashBoardReportVo.setHomeRoomName(rs.getString("HRM_NAME"));
				dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
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
	public List<DashBoardReportVo> getSaleCourseList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> saleCourseDeail = new ArrayList<DashBoardReportVo>();
		String sql = "";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			sql = "select cm.COURSE_ID, cm.COURSE_NAME from course_mstr cm";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				dashBoardReportVo= new DashBoardReportVo();
				dashBoardReportVo.setCourseId(rs.getInt("COURSE_ID"));
				dashBoardReportVo.setCourseName(rs.getString("COURSE_NAME"));
				saleCourseDeail.add(dashBoardReportVo);
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
		return saleCourseDeail;
	}

	@Override
	public List<DashBoardReportVo> getcourseDataList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> courseDeail = new ArrayList<DashBoardReportVo>();
		String sql = "";
		try {
			conn = getConnection();
			stmt = conn.createStatement();

			sql = "select mom.MODULE_ID, mom.MODULE_NAME from module_mstr mom, course_module_map cmm " +
					"where cmm.COURSE_ID='"+dashBoardReportVo.getCourseId()+"' and cmm.MODULE_ID=mom.MODULE_ID";

			rs = stmt.executeQuery(sql);
			while(rs.next()){
				dashBoardReportVo= new DashBoardReportVo();
				dashBoardReportVo.setModuleId(rs.getInt("MODULE_ID"));
				dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
				courseDeail.add(dashBoardReportVo);
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
		return courseDeail;
	}

	@Override
	public List<DashBoardReportVo> getShowList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> courseDeail = new ArrayList<DashBoardReportVo>();
		String sql = "";
		try {
			conn = getConnection();
			stmt = conn.createStatement();

			/*sql = "select tcsd.START_SESSION_TM, tcsd.END_SESSION_TM from teacher_course_session_dtls tcsd where tcsd.MODULE_ID=2 and tcsd.COURSE_SESSION_DTLS_ID=2 and tcsd.IS_COMPLETED=1";*/

			sql="select tcsd.START_SESSION_TM, tcsd.END_SESSION_TM,mm.MODULE_NAME, tcsd.COURSE_SESSION_ID ,tcsd.LAST_UPDT_TM, tcsd.IS_COMPLETED from teacher_course_session_dtls tcsd ,module_mstr mm  where " +
					"tcsd.IS_COMPLETED='"+dashBoardReportVo.getId()+"' and tcsd.MODULE_ID='"+dashBoardReportVo.getView()+"' and mm.MODULE_ID=tcsd.MODULE_ID";

			rs = stmt.executeQuery(sql);
			while(rs.next()){
				dashBoardReportVo= new DashBoardReportVo();
				dashBoardReportVo.setStartAssDate(rs.getString("START_SESSION_TM"));
				dashBoardReportVo.setEndAssDate(rs.getString("END_SESSION_TM"));
				dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
				String temp=rs.getString("IS_COMPLETED");
				if( temp.equalsIgnoreCase("1")){
					dashBoardReportVo.setStatus("Completed"); 
					dashBoardReportVo.setSubmissionDate(rs.getString("LAST_UPDT_TM"));
					dashBoardReportVo.setId(1);
				}
				else if( temp.equalsIgnoreCase("0")){
					dashBoardReportVo.setStatus("In Progress"); 
				}
				courseDeail.add(dashBoardReportVo);
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
		return courseDeail;
	}



}//end of class
