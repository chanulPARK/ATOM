package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.HolidayService;
import atom.attendance.model.vo.Holiday;
import common.DateFormat;

/**
 * Servlet implementation class HolidaySetServlet
 */
@WebServlet("/attendance/holidaySet")
public class HolidaySetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HolidaySetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sDate = request.getParameter("startdate");
		String eDate = request.getParameter("enddate");
		String yn = request.getParameter("holiyn");
		String name = request.getParameter("holiname");
		String note = request.getParameter("holinote");
		String date="";
		
		DateFormat df = new DateFormat();
		Date start=null;
		Date end=null;
		try {
			start = df.dateType(sDate);
			end = df.dateType(eDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar startdate = Calendar.getInstance();
		startdate.setTime(start);
		Calendar enddate = Calendar.getInstance();
		enddate.setTime(end);
		
		String msg="";
		String loc="/attendance/holiday";
		String view="/views/common/msg.jsp";
		
		while(startdate.compareTo(enddate)!=1) {
			date = df.calStr(startdate);
			
			Holiday h = new HolidayService().searchHoli(date);
			if(h==null) {
				Holiday holi = new Holiday(date,yn,name,note);
				int result = new HolidayService().insertHoli(holi);
				
				if(result>0) {
					msg="휴일 설정이 완료되었습니다.";
				} else {
					msg="휴일 설정이 실패하였습니다.";
				}
			}
			startdate.add(Calendar.DATE, 1);
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
