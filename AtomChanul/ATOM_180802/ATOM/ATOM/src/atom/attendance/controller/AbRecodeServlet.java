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
		String startDay=""; // 시작날짜 요일
		String endDay=""; // 끝날짜 요일
		// 시작날짜와 끝날짜 사이의 날짜를 비교하기 위한 값
		Date start=null;
		Date end=null;
		// 시작날짜에서 끝날짜 까지 증가될 날짜 값
		String date="";
		
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		String type = request.getParameter("atttype");
		String note = request.getParameter("attnote");
		try {
			startDay = df.dayOfWeek(startDate);
			endDay = df.dayOfWeek(endDate);
			// 입력한 날짜를 Date형태로 변경
			start = df.dateType(startDate);
			end = df.dateType(endDate);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		// Date형태의 날짜를 Calendar형태로 변경
		Calendar startcal = Calendar.getInstance();
		startcal.setTime(start);
		Calendar endcal = Calendar.getInstance();
		endcal.setTime(end);

		String msg="";
		String loc="/attendance/userDay";
		String view="/views/common/msg.jsp";
		
		// 시작 날짜와 끝 날짜 비교(사이 값)
		while(startcal.compareTo(endcal)!=1) {
			// 처리할 날짜 값에 변경되는 날짜 값 대입(startcal은 while문 마지막에서 증가)
			date = df.calStr(startcal);
			
			// 사용자의 추가하려는 날짜에 대한 근태정보 불러옴
			Attendance a = new AttendanceService().searchUserAtt(e.getEmpId(),date);
			// 해당 날짜에 근태 등록이 되어있지 않은 경우
			if(a==null) {
				// 객체에 값을 대입
				Attendance att = new Attendance(e.getEmpId(), note, type);
				
				// 부재 정보를 추가해줌
				int result = new AttendanceService().insertAbAtt(date, att);
				
				if(result>0) {
					msg=e.getEmpName()+"님의 "+startDate+" ("+startDay+") ~ "+endDate+" ("+endDay+") 의 출근부 작성이 완료되었습니다.";
				} else {
					msg=e.getEmpName()+"님의 "+startDate+" ("+startDay+") ~ "+endDate+" ("+endDay+") 의 출근부 작성이 실패하였습니다.";
				}
			}
			// 시작 날짜에서 끝날짜가 될 때까지 날짜에 1일을 더해줌
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
