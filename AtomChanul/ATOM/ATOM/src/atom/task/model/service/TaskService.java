package atom.task.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import atom.task.model.dao.TaskDAO;
import atom.task.model.vo.Task;

public class TaskService {
	public List<Task> selectTaskList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().selectTaskList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int selectTaskCount() {
		Connection conn = getConnection();
		int result = new TaskDAO().selectTaskCount(conn);
		close(conn);
		return result;
	}
	
	public List<Task> selectTaskList(int cPage, int numPerPage, String taskType){
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().selectTaskList(conn, cPage, numPerPage, taskType);
		close(conn);
		return list;
	}
	
	public int selectTaskCount(String taskType) {
		Connection conn = getConnection();
		int result = new TaskDAO().selectTaskCount(conn, taskType);
		close(conn);
		return result;
	}
	
	public int insertTask(Task t) {
		Connection conn = getConnection();
		int result = new TaskDAO().insertTask(conn, t);
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
	public Task selectTask(int no) {
		Connection conn = getConnection();
		Task t = new TaskDAO().selectTask(conn, no);

		close(conn);
		return t;
	}
}