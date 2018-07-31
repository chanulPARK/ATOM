package atom.dept.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.dept.model.vo.Dept;

import static common.JDBCTemplete.*;

public class DeptDAO {
	   private Properties prop;
	   public DeptDAO() {
	      prop=new Properties();
	      try {
	         String file=DeptDAO.class.getResource("/sql/dept-sql.properties").getPath();
	         prop.load(new FileReader(file));
	      } catch(IOException e) {
	         e.printStackTrace();
	         System.out.println("sql문 점검요망");
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


	public List<Dept> selectAll(Connection conn) {
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			List<Dept> deptList= new ArrayList<Dept>();
			String sql = prop.getProperty("selectAll");
			
			try {
				pstmt =conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
				Dept d = new Dept();
				d.setDeptCode(rs.getInt("dept_Code"));	//rs 붙여야함
				d.setDeptName(rs.getString("dept_Name"));
				deptList.add(d);
				}
			}
			catch(Exception ee) 
			{
				ee.printStackTrace();
				System.out.println("DeptDAO에서 에러발생");
			}
		
			//역순으로 닫아줌
			close(rs);
			close(pstmt);
			System.out.println(deptList);	
		return deptList; //리스트를 가지고 로출한곳으로 돌아감
	}
		
		
		  
		   
		   
	   }
	   
	   
	   
	   
	