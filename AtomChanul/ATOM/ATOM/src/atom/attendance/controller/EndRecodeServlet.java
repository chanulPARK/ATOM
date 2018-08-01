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
 * Servlet implementation class EndRecodeServlet
 */
@WebServlet("/attendance/endRecode")
public class EndRecodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndRecodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		// 정상 퇴근인지 조퇴인지 확인하기 위한 기준시간
		Time t = new TimeService().selectTime();
		
		DateFormat df = new DateFormat();
		String time = df.time();
		String today = df.today();
		String day="";
		String type="";
		String late="00:00"; // 지각시간
		String add="00:00"; // 연장시간
		try {
			day = df.dayOfWeek(today);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		// 입력 시간과 기준 출근시간 비교 (1이면 조퇴, -1이면 정상퇴근)
		int comp = df.timeCompare(time, t.getStLeave());
		// 입력된 비고 데이터
		String note = request.getParameter("attnote");

		String msg="";
		String loc="/attendance/userDay";
		String view="/views/common/msg.jsp";
		
		// 오늘 날짜의 사용자 근태 현황 확인
		Attendance a = new AttendanceService().selectUserAtt(e.getEmpId());
		// 이미 출근이 작성된 경우
		if(a!=null) {
			String attNote="";
			// 지각 시간 구해줌
			late = df.timeGap(t.getStAtt(), a.getAttTime());
			
			// 입력받은 비고를 기존의 비고에 덮어쓰기 해줌
			if(a.getAttNote()!=null)
				attNote+=a.getAttNote()+"<br>"+note;
			else 
				attNote=note;

			// 상태 데이터 구분 : 정상, 지각, 조퇴, 지각/조퇴
			// 정상 퇴근의 경우 기준 퇴근시간괴 비교하여 연장근무시간 계산 
			if(a.getAttType().equals("정상")) {
				if(comp>0)
					type="조퇴";
				else
					add=df.timeGap(t.getStLeave(), time);
			} else if(a.getAttType().equals("지각")) {
				if(comp>0)
					type=a.getAttType()+"/조퇴";
				else {
					type=a.getAttType();
					add=df.timeGap(t.getStLeave(), time);
				}
			} else if(a.getAttType().contains("조퇴")) {
				if(comp>0)
					type=a.getAttType();
				else {
					if(a.getAttType().contains("지각"))
						type="지각";
					else {
						type="정상";
						add=df.timeGap(t.getStLeave(), time);
					}
				}
			}
			// 객체에 값 넣어주기. 근무 시간은 00시간00분 형태로 변경하여 넣어줌
			Attendance att = new Attendance(e.getEmpId(), time, df.timeGap(a.getAttTime(), time), attNote, type);
			
			// 기존의 근태 값을 수정해줌
			int result = new AttendanceService().updateAtt(att);
			
			if(result>0) {
				msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 완료되었습니다.";
			} else {
				msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근부 작성이 실패하였습니다.";
			}
		} else {
			msg=e.getEmpName()+"님의 "+today+" ("+day+") 출근이 아직 작성되지 않았습니다.";
		}
		request.setAttribute("late", df.timeType(late));
		request.setAttribute("add", df.timeType(add));
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
