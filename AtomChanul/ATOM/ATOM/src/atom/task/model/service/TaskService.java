package atom.task.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

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
	
	public int selectTaskCount(){
		Connection conn = getConnection();
		int result = new TaskDAO().selectTaskCount(conn);
		close(conn);
		return result;
	}
}
