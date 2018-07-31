package atom.dept.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import atom.dept.model.vo.Dept;

import static common.JDBCTemplate.*;

public class DeptDAO {
	   private Properties prop;
	   public DeptDAO() {
	      prop=new Properties();
	      try {
	         String file=DeptDAO.class.getResource("/sql/dept-sql.properties").getPath();
	         prop.load(new FileReader(file));
	      } catch(IOException e) {
	         e.printStackTrace();
	      }
	   }

	   
	   public int insertDept(Connection conn, String deptName) 
	   {
		   PreparedStatement pstmt =null;
		   int result= 0;
		   String sql= prop.getProperty("deptInsert");
		   
		   try 
			{
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, deptName);
				result=pstmt.executeUpdate();	//추가 할떄
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			close(pstmt);
			
			return result;
		}
		
		
		   
		   
		   
	   }
	   
	   
	   
	   
	