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

import com.slms.app.domain.utility.GetJsonObject;
import com.slms.app.domain.utility.PostJsonObject;
import com.slms.app.domain.utility.Utility;
import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.SchoolReportDao;
import com.slms.persistance.factory.LmsDaoAbstract;

/**
 *
 * @author admin
 */
public class SchoolReportDaoImpl extends LmsDaoAbstract implements SchoolReportDao {

	
	Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs ;
	   String baseUrl=Utility.getProperties("application.properties").getProperty("loginbaseUrl");
		String baseTeacherUrl=Utility.getProperties("application.properties").getProperty("loginTeacherbaseUrl");
		
		String response;
	@Override
	public List<DashBoardReportVo> getSchoolDetailList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> showDeail = new ArrayList<DashBoardReportVo>();
		String sql = "";
        //1 . jdbc code start
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            if(dashBoardReportVo.getClassId() != 0 && dashBoardReportVo.getClassId() != -1 || dashBoardReportVo.getSchoolId() != 0 && dashBoardReportVo.getSchoolId() != -1 || dashBoardReportVo.getHomeRoomId() != 0 &&  dashBoardReportVo.getHomeRoomId() != -1 )
            {
           /* sql = "select cm.COURSE_NAME, mm.MODULE_NAME, mm.MODULE_ID from school_cls_map scm, clas_course_map ccm, hrm_course_map hcm," +
            		" course_mstr cm,  course_module_map cmm, module_mstr mm where scm.CLASS_ID=ccm.CLASS_ID and " +
            		"scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and  scm.CLASS_ID='"+dashBoardReportVo.getClassId()+"' and cm.COURSE_ID=ccm.COURSE_ID and " +
            		"cm.COURSE_ID=cmm.COURSE_ID and cmm.MODULE_ID=mm.MODULE_ID and hcm.COURSE_ID=cm.COURSE_ID and " +
            		"hcm.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' group by mm.MODULE_ID";*/
            	
            	sql="select cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID, mm.MODULE_NAME, tcsd.IS_COMPLETED from school_cls_map scm, clas_course_map ccm, course_mstr cm, " +
    			"course_module_map cmm, module_mstr mm , teacher_course_session_dtls tcsd,class_hrm_map chm where scm.CLASS_ID=ccm.CLASS_ID and cm.COURSE_ID=ccm.COURSE_ID " +
    			"and cm.COURSE_ID=cmm.COURSE_ID and chm.CLASS_ID = ccm.CLASS_ID and  cmm.MODULE_ID=mm.MODULE_ID and  tcsd.MODULE_ID=cmm.MODULE_ID" +
    			" and scm.SCHOOL_ID='"+dashBoardReportVo.getSchoolId()+"' and ccm.CLASS_ID='"+dashBoardReportVo.getClassId()+"'  and chm.HRM_ID='"+dashBoardReportVo.getHomeRoomId()+"' group by mm.MODULE_ID , tcsd.IS_COMPLETED";
    		
            	 
            	
            		 rs= stmt.executeQuery(sql);
            
            }
            else{ 
            	
            	/*sql="select cm.COURSE_NAME, mm.MODULE_NAME from school_cls_map scm, clas_course_map ccm, course_mstr cm, course_module_map cmm, module_mstr mm where " +
            			"scm.CLASS_ID=ccm.CLASS_ID and cm.COURSE_ID=ccm.COURSE_ID and cm.COURSE_ID=cmm.COURSE_ID and cmm.MODULE_ID=mm.MODULE_ID group by mm.MODULE_ID";*/
            	
            	sql="select cm.COURSE_ID, cm.COURSE_NAME, mm.MODULE_ID, mm.MODULE_NAME, tcsd.IS_COMPLETED from school_cls_map scm," +
            			" clas_course_map ccm, course_mstr cm, course_module_map cmm, module_mstr mm , " +
            			"teacher_course_session_dtls tcsd where scm.CLASS_ID=ccm.CLASS_ID and cm.COURSE_ID=ccm.COURSE_ID " +
            			"and cm.COURSE_ID=cmm.COURSE_ID and cmm.MODULE_ID=mm.MODULE_ID and  tcsd.MODULE_ID=cmm.MODULE_ID group by  mm.MODULE_ID";
            	rs= stmt.executeQuery(sql);
            	
            }
            
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setCourseName(rs.getString("COURSE_NAME"));
            	dashBoardReportVo.setModuleName(rs.getString("MODULE_NAME"));
            	String temp=rs.getString("IS_COMPLETED");
				if( temp.equalsIgnoreCase("1")){
					 dashBoardReportVo.setStatus("Completed"); 
				}
				else if( temp.equalsIgnoreCase("0")){
					 dashBoardReportVo.setStatus("In Progress"); 
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
	public List<DashBoardReportVo> getSchoolNameList(
			DashBoardReportVo dashBoardReportVo) {
 		List<DashBoardReportVo> showSchoolName = new ArrayList<DashBoardReportVo>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            String sql = "select SCHOOL_ID, SCHOOL_NAME  from school_mstr";
             rs = stmt.executeQuery(sql);
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setSchoolId(rs.getInt("SCHOOL_ID"));
            	dashBoardReportVo.setSchoolName(rs.getString("SCHOOL_NAME"));
            	showSchoolName.add(dashBoardReportVo);
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
        return showSchoolName;
	}

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
	public String getModuleDetail(DashBoardReportVo dashBoardReportVo) {
		try {
			String url=baseUrl+"rest/course/getCourses/teacher";
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
 
    
    
}//end of class
