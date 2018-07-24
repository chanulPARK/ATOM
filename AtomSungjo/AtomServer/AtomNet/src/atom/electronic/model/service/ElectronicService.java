package atom.electronic.model.service;

import java.sql.Connection;
import static common.JDBCTemplate.*;

import atom.electronic.model.dao.ElectronicDAO;
import atom.electronic.model.vo.ElectronicApproval;

public class ElectronicService {

	public int insertApproval(ElectronicApproval ea) {
		Connection conn = getConnection();
		int result = new ElectronicDAO().insertApproval(conn,ea);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
