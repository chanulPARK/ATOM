package atom.task.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.task.model.vo.Task;
import atom.task.model.vo.TaskProcess;

public class TaskDAO {
	
	private Properties prop;
	
	public TaskDAO () {
		prop=new Properties();
		 try {
			 String file = TaskDAO.class.getResource("/sql/task/task-sql.properties").getPath();
			 prop.load(new FileReader(file));
		 }
		 catch(IOException e) {
			 e.printStackTrace();
		 }
		
	}
	
	public List<Task> selectTaskList(Connection conn, String userId, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectTaskList");
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
				
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	
	public int selectTaskCount(Connection conn, String empId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectTaskCount");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			
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
	
	public List<Task> selectTaskList(Connection conn, String userId, int cPage, int numPerPage, String taskType){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectTaskListType");
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, taskType);
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
				
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	
	public int selectTaskCount(Connection conn, String empId, String taskType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectTaskCountType");
		
		int result = 0;
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, taskType);
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = rs.getInt("cnt");		
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return result;
	}
	
	// 수신자인 경우
	public List<Task> selectTaskListReceiver(Connection conn, String userId, int cPage, int numPerPage, String taskType){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectTaskListTypeReceiver");
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, taskType);
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
				
				list.add(t);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	
	public int selectTaskCountReceiver(Connection conn, String empId, String taskType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = prop.getProperty("selectTaskCountTypeReceiver");
		
		int result = 0;
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, empId);
			pstmt.setString(2, taskType);
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = rs.getInt("cnt");		
			}	
		}
		catch (Exception e) {
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
			pstmt.setString(4, t.getJobName());
			
			pstmt.setString(5, t.getTaskType());
			pstmt.setString(6, t.getTaskTitle());
			pstmt.setString(7, t.getTaskContent());
			pstmt.setString(8, t.getReceiver());
			pstmt.setString(9, t.getOriginalFile());
			pstmt.setString(10, t.getRenamedFile());
			
			pstmt.setDate(11, t.getDeadline());
			
			result = pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
		
	}
	
	public Task selectTask(Connection conn, int no){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectTask");
		Task t = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return t;
	}
	
	public int deleteTask(Connection conn, int taskNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteTask");
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, taskNo);
			result = pstmt.executeUpdate();
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	
	public List<Task> searchTask(Connection conn, Date searchFrom, Date searchTo, String empId, String taskType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = prop.getProperty("searchTask");
		System.out.println("sql:"+sql);
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, searchFrom);
			pstmt.setDate(2, searchTo);
			pstmt.setString(3, empId);
			pstmt.setString(4, taskType);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
				list.add(t);			
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	public List<Task> searchTaskUser(Connection conn, Date searchFrom, Date searchTo, String searchKeyword, String empId, String taskType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = prop.getProperty("searchUser");
		System.out.println("sql:"+sql);
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, searchFrom);
			pstmt.setDate(2, searchTo);
			pstmt.setString(3, "%"+searchKeyword+"%");
			pstmt.setString(4, empId);
			pstmt.setString(5, taskType);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
				list.add(t);			
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	public List<Task> searchTaskTitle(Connection conn, Date searchFrom, Date searchTo, String searchKeyword, String empId, String taskType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = prop.getProperty("searchTitle");
		System.out.println("sql:"+sql);
		Task t = null;
		ArrayList<Task> list = new ArrayList();
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, searchFrom);
			pstmt.setDate(2, searchTo);
			pstmt.setString(3, "%"+searchKeyword+"%");
			pstmt.setString(4, empId);
			pstmt.setString(5, taskType);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				t = new Task();
				t.setEmpId(rs.getString("EMP_ID"));
				t.setEmpName(rs.getString("EMP_NAME"));
				t.setDeptName(rs.getString("DEPT_NAME"));
				t.setJobName(rs.getString("JOB_NAME"));
				
				t.setTaskNo(rs.getInt("TASK_NO"));
				t.setTaskType(rs.getString("TASK_TYPE"));
				t.setTaskTitle(rs.getString("TASK_TITLE"));
				t.setTaskContent(rs.getString("TASK_CONTENT"));
				t.setReceiver(rs.getString("RECEIVER"));
				t.setOriginalFile(rs.getString("ORIGINAL_FILE"));
				t.setRenamedFile(rs.getString("RENAMED_FILE"));
				t.setEnrollDate(rs.getDate("ENROLL_DATE"));
				t.setDeadline(rs.getDate("DEADLINE"));
				t.setTaskStatus(rs.getString("TASK_STATUS"));
				t.setTaskCheck(rs.getString("TASK_CHECK"));
				list.add(t);			
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	// 이후 TaskProcess
	public int processInsert(Connection conn, TaskProcess tp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("processInsert");
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tp.getTaskNo());
			pstmt.setString(2, tp.getProcessWriter());
			pstmt.setString(3, tp.getProcessContent());
			pstmt.setString(4, tp.getProgress());
			result = pstmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		 
		close(pstmt);
		return result;
	}
	
	public List<TaskProcess> processList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("processList");
		ArrayList<TaskProcess> list = new ArrayList();
		TaskProcess tp = null;
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				tp = new TaskProcess();
				tp.setTaskNo(rs.getInt("TASK_NO"));
				tp.setProcessNo(rs.getInt("PROCESS_NO"));
				tp.setProcessWriter(rs.getString("PROCESS_WRITER"));
				tp.setProcessContent(rs.getString("PROCESS_CONTENT"));
				tp.setProgress(rs.getString("PROGRESS"));
				tp.setLastReformDate(rs.getDate("LAST_REFORM_DATE"));
				list.add(tp);
			}	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
}