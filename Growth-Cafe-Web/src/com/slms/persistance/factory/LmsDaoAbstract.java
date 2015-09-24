/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.slms.persistance.factory;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author dell
 */
public abstract class LmsDaoAbstract extends JDBCDAOAbstract{
    
 public static String dataSource = "";
 
 /**
  * This method use to close JDBC resources.
  * @param Connection
  * @param Statement
  * @param ResultSet 
  */    
 public void closeResources(Connection conn,Statement stmt,ResultSet res)
  {
 	try{
 	if(res!=null) {
                 res.close();
             }
 	if(stmt!=null) {
                 stmt.close();
             }
 	if(conn!=null) {
                 conn.close();
             }
 	}catch(Exception e){
             System.out.println(e.getMessage());
         }

  }

 public void closeResources(Connection conn)
  {
 	try{
             
 	if(conn!=null) {
                 conn.close();
             }
 	}catch(Exception e){
             System.out.println(e.getMessage());
         }

  }    



 }
