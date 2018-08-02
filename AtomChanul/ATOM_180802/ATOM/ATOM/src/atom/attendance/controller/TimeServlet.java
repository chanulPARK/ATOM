package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.TimeService;
import atom.attendance.model.vo.Time;
import common.DateFormat;

/**
 * Servlet implementation class TimesetServlet
 */
@WebServlet("/attendance/time")
public class TimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Time t = new TimeService().selectTime();
		List<Time> list = new TimeService().selectTimeList();
		
		DateFormat df = new DateFormat();
		for(Time time : list) {
			String date = "";
			try {
				date = df.date(time.getStDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			time.setStDate(date);
		}
		
		request.setAttribute("time", t);
		request.setAttribute("list", list);
		String view="/views/attendance/time_set.jsp";
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
