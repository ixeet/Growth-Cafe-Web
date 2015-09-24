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

import com.slms.domain.vo.DashBoardReportVo;
import com.slms.persistance.dao.iface.LeaderBoardReportDao;
import com.slms.persistance.factory.LmsDaoAbstract;

/**
 *
 * @author admin
 */
public class LeaderBoardReportDaoImpl extends LmsDaoAbstract implements LeaderBoardReportDao {
	
	Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs;

	@Override
	public List<DashBoardReportVo> getLeaderBoardDetailList(
			DashBoardReportVo dashBoardReportVo) {
		List<DashBoardReportVo> showDeail = new ArrayList<DashBoardReportVo>();
        //1 . jdbc code start
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = getConnection();

            /*String sql = "";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            */
            dashBoardReportVo = new DashBoardReportVo();
            dashBoardReportVo.setStudentName("Antonella");
            dashBoardReportVo.setSocialShare(150);
            dashBoardReportVo.setAssignments(100); 
            dashBoardReportVo.setAttendance(60);
            dashBoardReportVo.setTotalPoints(50);
            dashBoardReportVo.setDetailView(5);
            
            showDeail.add(dashBoardReportVo); 
            
            dashBoardReportVo = new DashBoardReportVo();
            dashBoardReportVo.setStudentName("Luz niamh");
            dashBoardReportVo.setSocialShare(200);
            dashBoardReportVo.setAssignments(100); 
            dashBoardReportVo.setAttendance(60);
            dashBoardReportVo.setTotalPoints(70);
            dashBoardReportVo.setDetailView(7);
            showDeail.add(dashBoardReportVo);
            
            dashBoardReportVo = new DashBoardReportVo();
            dashBoardReportVo.setStudentName("Danica");
            dashBoardReportVo.setSocialShare(176);
            dashBoardReportVo.setAssignments(100); 
            dashBoardReportVo.setAttendance(75);
            dashBoardReportVo.setTotalPoints(59);
            dashBoardReportVo.setDetailView(3);
            showDeail.add(dashBoardReportVo); 
            
            dashBoardReportVo = new DashBoardReportVo();
            dashBoardReportVo.setStudentName("Cosima pilar");
            dashBoardReportVo.setSocialShare(150);
            dashBoardReportVo.setAssignments(100); 
            dashBoardReportVo.setAttendance(50);
            dashBoardReportVo.setTotalPoints(80);
            dashBoardReportVo.setDetailView(6);
            showDeail.add(dashBoardReportVo);
            
            dashBoardReportVo = new DashBoardReportVo();
            dashBoardReportVo.setStudentName("Jocasta");
            dashBoardReportVo.setSocialShare(169);
            dashBoardReportVo.setAssignments(100); 
            dashBoardReportVo.setAttendance(58);
            dashBoardReportVo.setTotalPoints(50);
            dashBoardReportVo.setDetailView(5);
            
            showDeail.add(dashBoardReportVo);

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
            rs = stmt.executeQuery();
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
            rs = stmt.executeQuery();
            while(rs.next()){
            	dashBoardReportVo = new DashBoardReportVo();
            	dashBoardReportVo.setClassId(rs.getInt("CLASS_ID"));
            	dashBoardReportVo.setClassName(rs.getString("CLASS_NAME"));
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
            rs = stmt.executeQuery();
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

	  
	
}//end of class
