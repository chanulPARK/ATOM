package atom.attendance.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.service.EmployeeService;
import atom.employee.model.vo.Employee;


/**
 * Servlet implementation class AttUpdateServlet
 */
@WebServlet("/attendance/attUpdate")
public class AttUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empName = request.getParameter("empname");
		String attDate = request.getParameter("attdate");
		String attTime = request.getParameter("atttime");
		String leaveTime = request.getParameter("leavetime");
		String type = request.getParameter("atttype");
		String note = request.getParameter("attnote");
		
		Employee e = new EmployeeService().selectName(empName);
		
		int result = new AttendanceService().updateUserAtt(e.getEmpId(), attDate, attTime, leaveTime, type, note);
		
		String msg="";
		String loc="/attendance/dayList";
		String view="/views/common/msg.jsp";
		
		if(result>0) {
			msg=empName+"의 근태 정보가 수정되었습니다.";
		} else {
			msg="근태 정보 수정에 실패하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
