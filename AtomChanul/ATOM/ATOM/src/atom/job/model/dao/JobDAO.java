package atom.job.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import atom.job.model.vo.Job;

import static common.JDBCTemplate.*;

public class JobDAO {
	private Properties prop;

	//디폴트 생성자
	public  JobDAO() 
	{
		prop = new Properties();
		
		try 
		{
			String file=JobDAO.class.getResource("/sql/job/job-sql.properties").getPath();
			prop.load(new FileReader(file));
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
			System.out.println("sql문 점검");
		}
	}
	
	
	
	
	
	
	
	public int insertJob(Connection conn, String jobName) {
		
		PreparedStatement pstmt = null;
		int result=0;
		String sql= prop.getProperty("jobInsert");
		
		try 
		{
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, jobName);
			result=pstmt.executeUpdate();
		}
		
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		
		finally {
			close(pstmt);	//성공 실패 상관 없이 무조건 실행
		}
		
		
		return result;
	}







	public List<Job> selectJobList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Job> jobList= new ArrayList<Job>();
		String sql = prop.getProperty("jobselectAll");
		
		try 
		{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) 
			{
				Job j= new Job();
				j.setJobCode(rs.getString("job_Code"));
				j.setJobName(rs.getString("job_Name"));
				jobList.add(j);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			
		}
		
		finally 
		{
			close(rs);
			close(pstmt);
			
		}
		
		
		return jobList;
	}

}
