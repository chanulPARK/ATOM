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

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.vo.Attendance;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class AbRecodeServlet
 */
@WebServlet("/attendance/abRecode")
public class AbRecodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AbRecodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		DateFormat df = new DateFormat();
		String startDay="";
		String endDay="";
		Date start=null;
		Date end=null;
		
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		String type = request.getParameter("atttype");
		String note = request.getParameter("attnote");
		try {
			startDay = df.dayOfWeek(startDate);
			endDay = df.dayOfWeek(endDate);
			start = df.dateType(startDate);
			end = df.dateType(endDate);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		Calendar startcal = Calendar.getInstance();
		startcal.setTime(start);
		Calendar endcal = Calendar.getInstance();
		endcal.setTime(end);

		String msg="";
		String loc="/attendance/userDay";
		String view="/views/common/msg.jsp";
		
		while(startcal.compareTo(endcal)!=1) {
			String date = df.calStr(startcal);
			Attendance a = new AttendanceService().searchUserAtt(e.getEmpId(),date);
			if(a==null) {
				Attendance att = new Attendance(e.getEmpId(), note, type);
				
				int result = new AttendanceService().insertAbAtt(date, att);
				
				if(result>0) {
					msg=e.getEmpName()+"님의 "+startDate+" ("+startDay+") ~ "+endDate+" ("+endDay+") 의 출근부 작성이 완료되었습니다.";
				} else {
					msg=e.getEmpName()+"님의 "+startDate+" ("+startDay+") ~ "+endDate+" ("+endDay+") 의 출근부 작성이 실패하였습니다.";
				}
			}
			startcal.add(Calendar.DATE, 1);
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
