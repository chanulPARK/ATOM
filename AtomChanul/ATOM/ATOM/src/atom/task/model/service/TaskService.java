package atom.task.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import atom.electronic.model.dao.ElectronicDAO;
import atom.task.model.dao.TaskDAO;
import atom.task.model.vo.Task;
import atom.task.model.vo.TaskProcess;

public class TaskService {
	public List<Task> selectTaskList(String empId, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().selectTaskList(conn, empId, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<Task> mainTaskList(String empId, String taskType){
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().mainTaskList(conn, empId, taskType);
		close(conn);
		return list;
	}
	
	public int selectTaskCount(String empId) {
		Connection conn = getConnection();
		int result = new TaskDAO().selectTaskCount(conn, empId);
		close(conn);
		return result;
	}
	
	public List<Task> selectTaskList(String empId, int cPage, int numPerPage, String taskType){
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().selectTaskList(conn, empId, cPage, numPerPage, taskType);
		close(conn);
		return list;
	}
	
	public int selectTaskCount(String empId, String taskType) {
		Connection conn = getConnection();
		int result = new TaskDAO().selectTaskCount(conn, empId, taskType);
		close(conn);
		return result;
	}
	
	public List<Task> selectTaskListTypeReceiver(String empId, int cPage, int numPerPage, String taskType){
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().selectTaskListTypeReceiver(conn, empId, cPage, numPerPage, taskType);
		close(conn);
		return list;
	}
	
	public int selectTaskCountReceiver(String empId, String taskType) {
		Connection conn = getConnection();
		int result = new TaskDAO().selectTaskCountReceiver(conn, empId, taskType);
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
	
	public int deleteTask(int taskNo) {
		Connection conn = getConnection();
		int result = new TaskDAO().deleteTask(conn, taskNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}
	
	public int updateTask(Task t) {
		Connection conn = getConnection();
		int result = new TaskDAO().updateTask(conn, t);
		
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return result;
	}
	
	public List<Task> searchTask(Date searchFrom, Date searchTo, String empId, String taskType) {
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().searchTask(conn, searchFrom, searchTo, empId, taskType);
		close(conn);
		return list;
	}
	
	public List<Task> searchTaskUser(Date searchFrom, Date searchTo, String searchKeyword, String empId, String taskType) {
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().searchTaskUser(conn, searchFrom, searchTo, searchKeyword, empId, taskType);
		close(conn);
		return list;
	}
	
	public List<Task> searchTaskTitle(Date searchFrom, Date searchTo, String searchKeyword, String empId, String taskType) {
		Connection conn = getConnection();
		List<Task> list = new TaskDAO().searchTaskTitle(conn, searchFrom, searchTo, searchKeyword, empId, taskType);
		close(conn);
		return list;
	}
	
	// 이후로 TaskProcess
	public int processInsert(TaskProcess tp) {
		Connection conn = getConnection();
		int result = new TaskDAO().processInsert(conn, tp);
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
	public List<TaskProcess> processList(int n) {
		Connection conn = getConnection();
		List<TaskProcess> list = new TaskDAO().processList(conn, n);
		
		close(conn);
		return list;
	}
	
	public int requestCount(String empId) {
		Connection conn = getConnection();
		int cnt = new TaskDAO().requestCount(conn, empId);
		close(conn);
		return cnt;
	}
	
	/*public int requestReceiveCount(String empId) {
		Connection conn = getConnection();
		int cnt = new TaskDAO().requestReceiveCount(conn, empId);
		close(conn);
		return cnt;
	}
	
	public int reportCount(String empId) {
		Connection conn = getConnection();
		int cnt = new TaskDAO().reportCount(conn, empId);
		close(conn);
		return cnt;
	}
	
	public int reportReceiveCount(String empId) {
		Connection conn = getConnection();
		int cnt = new TaskDAO().reportReceiveCount(conn, empId);
		close(conn);
		return cnt;
	}*/
}