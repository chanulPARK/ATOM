package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;
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
 * Servlet implementation class SearchDayListServlet
 */
@WebServlet("/attendance/searchAttDay")
public class SearchAttDayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAttDayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchDate = request.getParameter("searchdate");
		
		DateFormat df = new DateFormat();
		String dayofweek ="";
		try {
			dayofweek = df.dayOfWeek(searchDate);
			request.setAttribute("dayofweek", dayofweek);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String view="";
		
		if(!searchDate.trim().equals("")) {
			List<Attendance> list = new AttendanceService().searchDayList(searchDate);
			for(Attendance a : list) {
				if(a!=null && a.getWorkTime()!=null)
					a.setWorkTime(df.timeType(a.getWorkTime()));
			}

			request.setAttribute("todate", searchDate);
			request.setAttribute("list",list);
			view="/views/attendance/att_day.jsp";
		} else {
			// 검색어 입력 x
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
