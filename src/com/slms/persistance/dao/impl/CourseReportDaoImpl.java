package com.slms.persistance.dao.impl;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;

import sun.reflect.ReflectionFactory.GetReflectionFactoryAction;

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.CourseReportDao;
import com.slms.persistance.factory.LmsDaoAbstract;


public class CourseReportDaoImpl extends LmsDaoAbstract implements CourseReportDao {

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs ;
	
	String baseUrl=Utility.getProperties("application.properties").getProperty("loginbaseUrl");
	String baseTeacherUrl=Utility.getProperties("application.properties").getProperty("loginTeacherbaseUrl");
	
	String response;
	
	@Override
	public List<DashBoardReportVo> getCourseDetailList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> showDeail = new ArrayList<DashBoardReportVo>();
		try {
			conn = getConnection();

			String sql = "";
			if(dashBoardReportVo.getSchoolId() == -1 && dashBoardReportVo.getClassId() == -1 && dashBoardReportVo.getHomeRoomId() == -1 && dashBoardReportVo.getCourseId() == -1 && dashBoardReportVo.getModuleId() == -1 && dashBoardReportVo.getStatusId() == -1){

				
					sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME, tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, course_mstr ccmm ,class_mstr cmstr where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID  and tc.CLASS_ID=cmstr.CLASS_ID";
			}
			else if(dashBoardReportVo.getSchoolId() != -1 && dashBoardReportVo.getClassId() == -1 && dashBoardReportVo.getHomeRoomId() == -1 && dashBoardReportVo.getCourseId() == -1 && dashBoardReportVo.getModuleId() == -1 && dashBoardReportVo.getStatusId() == -1){

				sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME,  tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, course_mstr ccmm ,class_mstr cmstr   where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID  and tc.CLASS_ID=cmstr.CLASS_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID";
			}
			
			else if(dashBoardReportVo.getSchoolId() != -1 && dashBoardReportVo.getClassId() != -1 && dashBoardReportVo.getHomeRoomId() ==-1 && dashBoardReportVo.getCourseId() == -1 && dashBoardReportVo.getModuleId() == -1 && dashBoardReportVo.getStatusId() == -1){

				sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME,  tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, course_mstr ccmm ,class_mstr cmstr   where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID  and tc.CLASS_ID=cmstr.CLASS_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and  tc.CLASS_ID='"+dashBoardReportVo.getClassId()+"'  and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID";
			}
			
			else if(dashBoardReportVo.getSchoolId() != -1 && dashBoardReportVo.getClassId() != -1 && dashBoardReportVo.getHomeRoomId() !=-1 && dashBoardReportVo.getCourseId() == -1 && dashBoardReportVo.getModuleId() == -1 && dashBoardReportVo.getStatusId() == -1){

				sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME,  tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, course_mstr ccmm ,class_mstr cmstr   where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID  and tc.CLASS_ID=cmstr.CLASS_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and  " +
									"tc.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and tc.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"'  and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID";
			}
			
			else if(dashBoardReportVo.getSchoolId() != -1 && dashBoardReportVo.getClassId() != -1 && dashBoardReportVo.getHomeRoomId() !=-1 && dashBoardReportVo.getCourseId() != -1 && dashBoardReportVo.getModuleId() == -1 && dashBoardReportVo.getStatusId() == -1){

				sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME,  tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, course_mstr ccmm  ,class_mstr cmstr  where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID  and tc.CLASS_ID=cmstr.CLASS_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and  " +
									"tc.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and tc.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' and tc.COURSE_ID='"+dashBoardReportVo.getCourseId()+"' and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID";
			}
			
			else if(dashBoardReportVo.getSchoolId() != -1 && dashBoardReportVo.getClassId() != -1 && dashBoardReportVo.getHomeRoomId() !=-1 && dashBoardReportVo.getCourseId() != -1 && dashBoardReportVo.getModuleId() != -1  && dashBoardReportVo.getStatusId() == -1){

				sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME,  tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm , course_mstr ccmm  ,class_mstr cmstr where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID  and tc.CLASS_ID=cmstr.CLASS_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and  " +
							"tc.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and tc.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' and tc.COURSE_ID='"+dashBoardReportVo.getCourseId()+"'  and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID " +
									"and tcsd.MODULE_ID='"+dashBoardReportVo.getModuleId()+"'";
			}
			else if(dashBoardReportVo.getSchoolId() != -1 && dashBoardReportVo.getClassId() != -1 && dashBoardReportVo.getHomeRoomId() !=-1 && dashBoardReportVo.getCourseId() != -1 && dashBoardReportVo.getModuleId() != -1 && dashBoardReportVo.getStatusId() != -1){

				sql="select cmstr.CLASS_NAME,sm.SCHOOL_NAME,  tcsd.COURSE_SESSION_DTLS_ID, cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID,mm.MODULE_NAME,tcsd.IS_COMPLETED from teacher_courses tc,course_mstr cm , " +
							"teacher_course_sessions tcss, teacher_course_session_dtls tcsd,module_mstr mm ,school_mstr sm, course_mstr ccmm  ,class_mstr cmstr  where tc.TEACHER_ID='"+dashBoardReportVo.getUserName()+"' and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID " +
							"and  cm.COURSE_ID=tc.COURSE_ID and tc.TEACHER_COURSE_ID=tcss.TEACHER_COURSE_ID and tcsd.COURSE_SESSION_ID=tcss.COURSE_SESSION_ID and " +
							"tcsd.MODULE_ID=mm.MODULE_ID  and tc.CLASS_ID=cmstr.CLASS_ID and sm.SCHOOL_ID=tc.SCHOOL_ID and sm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and  " +
							"tc.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and tc.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' and tc.COURSE_ID='"+dashBoardReportVo.getCourseId()+"'  " +
									"and tcsd.MODULE_ID='"+dashBoardReportVo.getModuleId()+"' and tcsd.IS_COMPLETED='"+dashBoardReportVo.getStatusId()+"' and sm.SCHOOL_ID=tc.SCHOOL_ID and ccmm.COURSE_ID=tc.COURSE_ID ";
			}
			
			
			
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
				dashBoardReportVo = new DashBoardReportVo();
				dashBoardReportVo.setCourseName(rs.getString("COURSE_NAME"));
				dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
				dashBoardReportVo.setModuleId(rs.getInt("MODULE_ID"));
				dashBoardReportVo.setTcsMainId(rs.getInt("COURSE_SESSION_DTLS_ID"));
				dashBoardReportVo.setSchoolName(rs.getString("SCHOOL_NAME"));
				dashBoardReportVo.setCourseName(rs.getString("COURSE_NAME"));
				dashBoardReportVo.setCourseId(rs.getInt("COURSE_ID"));
				dashBoardReportVo.setClassName(rs.getString("CLASS_NAME"));
				String temp=rs.getString("IS_COMPLETED");
				if( temp.equalsIgnoreCase("3")){
					dashBoardReportVo.setStatus("Completed"); 
					dashBoardReportVo.setView(temp); 
				}
				else if( temp.equalsIgnoreCase("2")){
					dashBoardReportVo.setStatus("In Progress"); 
					dashBoardReportVo.setView(temp);
				}
				else if( temp.equalsIgnoreCase("1")){
					dashBoardReportVo.setStatus("Schedule"); 
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
			ResultSet rs = stmt.executeQuery(sql);
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

			ResultSet rs = stmt.executeQuery(sql);
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
	public String getShowList( DashBoardReportVo dashBoardReportVo) {
		String response="";
		try {
			/*String url=baseUrl+"rest/teacher/updateResourseStatus/id/"+dashBoardReportVo.getTcsMainId()+"/statusCode/"+dashBoardReportVo.getCompletedStatus();*/
			String url=baseUrl+"rest/teacher/updateResourseStatus/id/"+dashBoardReportVo.getTcsMainId()+"/statusCode/"+dashBoardReportVo.getCompletedStatus();
			System.out.println(url);
			
			System.out.println("CoursesServiceImpl method:-courses Request:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			System.out.println("CoursesServiceImpl method:-courses "+e.getMessage());
		}
		System.out.println("CoursesServiceImpl method:-courses Response:-"+response);
		return response;
		
		
		
		
		/*List<DashBoardReportVo> courseDeail = new ArrayList<DashBoardReportVo>();
		String sql = "";
		try {
			conn = getConnection();
			stmt = conn.createStatement();

			sql="select tcsd.START_SESSION_TM, tcsd.IS_COMPLETED, tcsd.END_SESSION_TM, tcsd.COURSE_SESSION_DTLS_ID, rm.RESOURSE_NAME, rm.DESC_TXT, rm.RESOURCE_URL ," +
					" mm.MODULE_NAME,rm.RESOURSE_ID,rm.THUMB_IMG from " +
					"teacher_course_session_dtls tcsd, module_mstr mm, module_resource_map mrmap, resourse_mstr rm " +
					"where  tcsd.COURSE_SESSION_DTLS_ID='"+dashBoardReportVo.getTcsMainId()+"' and mm.MODULE_ID=tcsd.MODULE_ID and " +
							"mrmap.MODULE_ID=mm.MODULE_ID and rm.RESOURSE_ID=mrmap.RESOURCE_ID";
			
			
			sql="select tcsd.COURSE_SESSION_DTLS_ID,tmsd.IS_COMPLETED ,mms.MODULE_NAME,rm.THUMB_IMG,rm.RESOURCE_URL,rm.RESOURSE_ID,rm.RESOURSE_NAME,rm.DESC_TXT ,tmsd.START_SESSION_TM,tmsd.END_SESSION_TM " +
					"from teacher_course_session_dtls tcsd ,teacher_module_session_dtls tmsd, resourse_mstr rm , module_mstr mms where" +
					" tcsd.COURSE_SESSION_DTLS_ID='"+dashBoardReportVo.getTcsMainId()+"' and " +
					"tmsd.COURSE_SESSION_DTLS_ID=tcsd.COURSE_SESSION_DTLS_ID and tmsd.CONTENT_ID=rm.RESOURSE_ID and mms.MODULE_ID=tcsd.MODULE_ID";

			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				dashBoardReportVo= new DashBoardReportVo();
				dashBoardReportVo.setStartAssDate(rs.getString("START_SESSION_TM"));
				dashBoardReportVo.setEndAssDate(rs.getString("END_SESSION_TM"));
				dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
				dashBoardReportVo.setTcsMainId(rs.getInt("COURSE_SESSION_DTLS_ID"));
				dashBoardReportVo.setResourseName(rs.getString("RESOURSE_NAME"));
				dashBoardReportVo.setResourseDesc(rs.getString("DESC_TXT"));
				dashBoardReportVo.setResourceUrl(rs.getString("RESOURCE_URL"));
				dashBoardReportVo.setThumbImg(rs.getString("THUMB_IMG"));
				dashBoardReportVo.setResourceId(rs.getInt("RESOURSE_ID"));
				
				String temp=rs.getString("IS_COMPLETED");
				if( temp.equalsIgnoreCase("3")){
					dashBoardReportVo.setStatus("Completed"); 
					//dashBoardReportVo.setSubmissionDate(rs.getString("LAST_UPDT_TM"));
					dashBoardReportVo.setId(3);
				}
				else if( temp.equalsIgnoreCase("2")){
					dashBoardReportVo.setStatus("In Progress"); 
					dashBoardReportVo.setId(2);
				}
				else if( temp.equalsIgnoreCase("1")){
					dashBoardReportVo.setStatus("Schedule"); 
					dashBoardReportVo.setId(1);
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
		return courseDeail;*/
	}

	/*@Override
	public List<DashBoardReportVo> getShowChangeStatus(
			DashBoardReportVo dashBoardReportVo) {
		 
		List<DashBoardReportVo> courseDeail = new ArrayList<DashBoardReportVo>();
		String sql = "";
		try {
			Date date=new Date();
			conn = getConnection();
			 stmt = conn.createStatement();
			if(dashBoardReportVo.getId() == 1){
				sql="update teacher_module_session_dtls tmsd set tmsd.IS_COMPLETED='2'  where tmsd.COURSE_SESSION_DTLS_ID='"+dashBoardReportVo.getTcsMainId()+"' ";
				 stmt.executeUpdate(sql);
				 
				 sql="update teacher_course_session_dtls tcsd set tcsd.IS_COMPLETED='2' where tcsd.COURSE_SESSION_DTLS_ID='"+dashBoardReportVo.getTcsMainId()+"' ";
				 stmt.executeUpdate(sql);
			}
			else if(dashBoardReportVo.getId() == 2){
				sql="update teacher_module_session_dtls tmsd set tmsd.IS_COMPLETED='3'  where tmsd.COURSE_SESSION_DTLS_ID='"+dashBoardReportVo.getTcsMainId()+"'   ";
				 stmt.executeUpdate(sql);
				 
				 sql="update teacher_course_session_dtls tcsd set tcsd.IS_COMPLETED='3'  where tcsd.COURSE_SESSION_DTLS_ID='"+dashBoardReportVo.getTcsMainId()+"' ";
				 stmt.executeUpdate(sql);
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
	}*/

	
	@Override
	public List<DashBoardReportVo> getClassNameList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> showClassName = new ArrayList<DashBoardReportVo>();
        //1 . jdbc code start
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            String sql = "select c.CLASS_ID, c.CLASS_NAME from school_cls_map s ,class_mstr c where s.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and s.CLASS_ID = c.CLASS_ID ";
             rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setClassId(rs.getInt("CLASS_ID"));
            	dashBoardReportVo.setClassName(rs.getString("CLASS_NAME"));
            	showClassName.add(dashBoardReportVo);
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
        return showClassName;
	}

	@Override
	public List<DashBoardReportVo> getHomeRoomList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> homeRoomList = new ArrayList<DashBoardReportVo>();
        //1 . jdbc code start
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            String sql = "select hrm.HRM_ID, hrm.HRM_NAME from class_hrm_map chm, homeroom_mstr hrm, school_cls_map scm where " +
            		" chm.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and chm.HRM_ID = hrm.HRM_ID and  scm.CLASS_ID=chm.CLASS_ID and scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"'";
             
            rs = stmt.executeQuery(sql);
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
	public String getCourse(DashBoardReportVo dashBoardReportVo) {
		try {
			String url=baseUrl+"rest/course/getCourseDetail/teacher";
			
			//String url = "http://192.168.0.19:8080/SLMS/rest/course/getCourseDetail/teacher";
			System.out.println(url);
			
			JSONObject logingJsonObject = new JSONObject();
			logingJsonObject.put("userId", dashBoardReportVo.getUserId());
			logingJsonObject.put("courseId",dashBoardReportVo.getCourseId());
			logingJsonObject.put("schoolId",dashBoardReportVo.getSchoolId());
			logingJsonObject.put("classId",dashBoardReportVo.getClassId());
			logingJsonObject.put("hrmId",dashBoardReportVo.getHomeRoomId());
			System.out.println("CoursesServiceImpl method:-courses Request:-"+logingJsonObject);
			response = PostJsonObject.postJson(logingJsonObject, url);
		} catch (Exception e) {
			System.out.println("CoursesServiceImpl method:-courses "+e.getMessage());
		}
		System.out.println("CoursesServiceImpl method:-courses Response:-"+response);
		return response;
	}

	 
	@Override
	public String getChangeStatus(DashBoardReportVo dashBoardReportVo) {
		try {
			String url=baseUrl+"rest/teacher/updateModuleStatus"+"/"+"id/"+dashBoardReportVo.getModuleSessionId()+"/"+"statusCode/"+dashBoardReportVo.getStatusCode();
			System.out.println("CoursesServiceImpl method:-change Status Request:-"+url);
			response = GetJsonObject.getWebServceObj(url);
		} catch (Exception e) {
			System.out.println("CoursesServiceImpl method:-module update request  "+e.getMessage());
		}
		System.out.println("CoursesServiceImpl method:-module update Response:-"+response);
		return response;
	}

	@Override
	public String getSchoolList(DashBoardReportVo dashBoardReportVo) {
		try{
			String url=baseUrl+"rest/common/getMasterData";
			System.out.println("CoursesServiceImpl method : - master data Request"+url);
			response = GetJsonObject.getWebServceObj(url);
		}
		catch (Exception e) {
			System.out.println("CoursesServiceImpl method : - master data Request"+e.getMessage());
			e.printStackTrace();
		}
		System.out.println("CoursesServiceImpl method : - master data Response:-"+response);
		return response;
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

	@Override
	public String getChangeCourseStatus(DashBoardReportVo dashBoardReportVo) {
		try{
			String url=baseUrl+"rest/teacher/updateCourseStatus/id/"+dashBoardReportVo.getCourseSessionId()+"/statusCode/"+dashBoardReportVo.getStatusCode()+"";
			System.out.println("CoursesServiceImpl method : - master data Request"+url);
			response = GetJsonObject.getWebServceObj(url);
		}
		catch (Exception e) {
			System.out.println("CoursesServiceImpl method : - master data Request"+e.getMessage());
			e.printStackTrace();
		}
		System.out.println("CoursesServiceImpl method : - master data Response:-"+response);
		return response;
	}

	@Override
	public String getChangeAssignmentStatus(DashBoardReportVo dashBoardReportVo) {
		try{
			String url="";
			
			Date myDate = new Date();
			if(dashBoardReportVo.getAsignmentEnableStatus()!=null){
				
				String temp[]=dashBoardReportVo.getAsignmentEnableStatus().split("/");
				String selectedDate = temp[2]+"-"+temp[0]+"-"+temp[1];
				url=baseUrl+"rest/teacher/updateAssignmentStatus/"+dashBoardReportVo.getUserName()+"/"+dashBoardReportVo.getSchoolId()+"/"+dashBoardReportVo.getClassId()+"/"+dashBoardReportVo.getHomeRoomId()+"/"+dashBoardReportVo.getCourseId()+"/"+dashBoardReportVo.getModuleId()+"/statusCode/"+1+"/"+selectedDate+"";
				
			}
			else if(dashBoardReportVo.getAsignmentEnableStatus()==null){
				url=baseUrl+"rest/teacher/updateAssignmentStatus/"+dashBoardReportVo.getUserName()+"/"+dashBoardReportVo.getSchoolId()+"/"+dashBoardReportVo.getClassId()+"/"+dashBoardReportVo.getHomeRoomId()+"/"+dashBoardReportVo.getCourseId()+"/"+dashBoardReportVo.getModuleId()+"/statusCode/"+0+"/"+new SimpleDateFormat("yyyy-MM-dd").format(myDate)+"";
				
			}
			
			System.out.println("CoursesServiceImpl method : - master data Request = "+url);
			response = GetJsonObject.getWebServceObj(url);
			System.out.println(response);
		}
		catch (Exception e) {
			System.out.println("CoursesServiceImpl method : - master data Request"+e.getMessage());
			e.printStackTrace();
		}
		System.out.println("CoursesServiceImpl method : - master data Response:-"+response);
		return response;
	}

	



}//end of class
