package atom.attendance.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.service.TimeService;
import atom.attendance.model.vo.Attendance;
import atom.attendance.model.vo.Time;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class MainAttBtnServlet
 */
@WebServlet("/attendance/mainStartBtn")
public class MainStartBtnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainStartBtnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		// 정상 출근인지 지각인지 확인하기 위한 기준시간
		Time t = new TimeService().selectTime();
		
		DateFormat df = new DateFormat();
		String time = df.time();
		String today = df.today();
		String day="";
		String type="";
		try {
			day = df.dayOfWeek(today);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		// 입력 시간과 기준 출근시간 비교 (1이면 정상출근, -1이면 지각)
		int comp = df.timeCompare(time, t.getStAtt());

		String msg="";
		String loc="/views/main.jsp";
		String view="/views/common/msg.jsp";
		
		// 오늘 날짜의 사용자 근태 현황 확인
		Attendance a = new AttendanceService().selectUserAtt(e.getEmpId());
		// 오늘 날짜의 근태가 등록되지 않은 경우
		if(a==null) {
			// 비교한 시간으로 정상인지 지각인지 확인
			// 지각일 경우 기준출근시간에 대해 지각한 시간을 계산
			if(comp>0) {
				type="정상";
			} else {
				type="지각";
			}
			// 객체에 값을 저장해줌
			Attendance att = new Attendance(e.getEmpId(), time, "", type);
			
			// 저장한 값을 DB에 삽입하기 위해 값을 넘김
			int result = new AttendanceService().insertAtt(att);
			
			if(result>0) {
				msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 완료되었습니다.";
			} else {
				msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 실패하였습니다.";
			}
		} else {
			// 이미 사용자의 오늘 날짜 근태가 저장된 경우
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
