package atom.electronic.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import atom.electronic.model.dao.ElectronicDAO;
import atom.electronic.model.vo.ElectronicApproval;
import atom.electronic.model.vo.MaterialLine;

public class ElectronicService {

	public int insertApproval(ElectronicApproval ea) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().insertApproval(conn,ea);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertMaterialLine(MaterialLine m) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().insertMaterialLine(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<ElectronicApproval> selectWaitApproval(String empId, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<ElectronicApproval> list = new ElectronicDAO().selectWaitApproval(conn,empId,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectApproavalCount(String empId) {
		Connection conn = getConnection();
		int approvalCnt= new ElectronicDAO().selectApproavalCount(conn,empId);
		close(conn);
		return approvalCnt;
	}

}
