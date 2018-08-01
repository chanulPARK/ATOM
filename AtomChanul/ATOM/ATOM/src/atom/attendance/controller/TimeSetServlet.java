package atom.attendance.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.TimeService;
import atom.attendance.model.vo.Time;

/**
 * Servlet implementation class TimeSetServlet
 */
@WebServlet("/attendance/timeSet")
public class TimeSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("timeset");
		String start = request.getParameter("starttime");
		String end = request.getParameter("endtime");
		String lunch = request.getParameter("lunchtime");
		
		String msg="";
		String loc="/attendance/time";
		String view="/views/common/msg.jsp";
		
		Time t = new Time(date, start, end, lunch);
		
		int result = new TimeService().insertTime(t);
		if(result>0) {
			msg="기준시간 설정이 완료되었습니다.";
		} else {
			msg="기준시간 설정이 실패하였습니다.";
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
