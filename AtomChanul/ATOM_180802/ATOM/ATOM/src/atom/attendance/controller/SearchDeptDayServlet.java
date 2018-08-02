package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.vo.Attendance;
import common.DateFormat;

/**
 * Servlet implementation class SearchDeptDayServlet
 */
@WebServlet("/attendance/searchDeptDay")
public class SearchDeptDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDeptDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchDept = request.getParameter("searchdept");

		DateFormat df = new DateFormat();
		String today = df.today();

		List<Attendance> list = new ArrayList<>();
		String view="";
		
		if(!searchDept.trim().equals("")) {
			Attendance a = new AttendanceService().searchDeptAtt(searchDept);
			if(a!=null) {
				list.add(a);
				request.setAttribute("list", list);
				view="/views/attendance/att_day.jsp";
			} else {
				String msg= "부서명 ["+searchDept + "]의 출근 기록이 존재하지 않습니다.";
				String loc="/attendance/dayList";
				view="/views/common/msg.jsp";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
			}
			
			String dayofweek ="";
			try {
				dayofweek = df.dayOfWeek(today);
				request.setAttribute("dayofweek", dayofweek);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			request.setAttribute("todate", today);
		} else {
			view = "/attendance/dayList";
		}
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
