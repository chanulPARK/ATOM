package atom.job.model.service;

import java.sql.Connection;
import java.util.List;

import static common.JDBCTemplate.*;

import atom.job.model.dao.JobDAO;
import atom.job.model.vo.Job;

public class JobService {

	public int insertJob(String jobName) {
		// TODO Auto-generated method stub
		
		Connection conn = getConnection();
		int result = new JobDAO().insertJob(conn, jobName);
		
		if (result>0) commit(conn);
		 else rollback(conn);
		close(conn);
		return result;
	}

	
	//부서정보 가져오기
	public List<Job> jobList() {
		Connection conn = getConnection();
		List<Job> jobList = new JobDAO().selectJobList(conn);
		close(conn);
		
		return jobList;
	}

}
