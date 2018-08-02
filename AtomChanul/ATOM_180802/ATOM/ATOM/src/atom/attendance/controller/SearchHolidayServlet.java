package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.HolidayService;
import atom.attendance.model.vo.Holiday;
import common.DateFormat;

/**
 * Servlet implementation class SearchHolidayServlet
 */
@WebServlet("/attendance/searchHoliday")
public class SearchHolidayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHolidayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String month = request.getParameter("searchmonth");
		String view="";
		
		if(!month.trim().equals("")) {
			List<Holiday> list = new HolidayService().searchHoliMonth(month);
			
			DateFormat df = new DateFormat();
			for(Holiday h : list) {
				String date = "";
				try {
					date = df.date(h.getHoliDate());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				h.setHoliDate(date);
			}
			
			request.setAttribute("list", list);
			view="/views/attendance/holi_set.jsp";
		} else {
			view="/attendance/holiday";
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
