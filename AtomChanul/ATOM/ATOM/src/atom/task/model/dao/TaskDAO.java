package atom.task.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.task.model.vo.Task;

public class TaskDAO {
	
	private Properties prop;
	
	public TaskDAO () {
		prop=new Properties();
		 try {
			 String file = TaskDAO.class.getResource("/sql/task-sql.properties").getPath();
			 prop.load(new FileReader(file));
		 }
		 catch(IOException e) {
			 e.printStackTrace();
		 }
		
	}
	
	public List<Task> selectTaskList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectTaskList");
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setCategoryName(rs.getString("CATEGORY_NAME"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	
	public int selectTaskCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectTaskCount");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = rs.getInt("cnt");		
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return result;
	}
	
	public int insertTask(Connection conn, Task t) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertTask");
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getEmpId());
			pstmt.setString(2, t.getEmpName());
			pstmt.setString(3, t.getDeptName());
			pstmt.setString(4, t.getCategoryName());
			pstmt.setString(5, t.getTaskTitle());
			pstmt.setString(6, t.getTaskContent());
			
//			pstmt.setString(4, t.getOriginalFileName());
//			pstmt.setString(5, t.getRenamedFileName());
			
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
}