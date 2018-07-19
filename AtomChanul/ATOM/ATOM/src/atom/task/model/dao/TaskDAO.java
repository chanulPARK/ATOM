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
				t.setCategory(rs.getString("CATEGORY"));
				t.setTitle(rs.getString("TITLE"));
				t.setContents(rs.getString("CONTENT"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setReportDate(rs.getDate("REPORT_DATE"));
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
}