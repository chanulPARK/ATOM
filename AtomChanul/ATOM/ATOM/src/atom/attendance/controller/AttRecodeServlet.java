package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.vo.Attendance;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class AttRecodeServlet
 */
@WebServlet("/attendance/attRecode")
public class AttRecodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttRecodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		DateFormat df = new DateFormat();
		String time = df.time();
		String today = df.today();
		String day="";
		try {
			day = df.dayOfWeek(today);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		String type = request.getParameter("atttype");
		String note = request.getParameter("attnote");

		String msg="";
		String loc="/attendance/userDay";
		String view="/views/common/msg.jsp";
		
		Attendance a = new AttendanceService().selectUserAtt(e.getEmpId());
		if(a==null) {
			if(type.equals("출근")) {
				type="정상";
			}
			Attendance att = new Attendance(e.getEmpId(), time, note, type);
			
			int result = new AttendanceService().insertAtt(att);
			
			if(result>0) {
				msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 완료되었습니다.";
			} else {
				msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 실패하였습니다.";
			}
		} else {
			msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 이미 완료되었습니다.";
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
