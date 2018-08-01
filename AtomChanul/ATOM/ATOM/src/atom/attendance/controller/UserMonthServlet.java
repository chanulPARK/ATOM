package atom.attendance.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.attendance.model.service.AttendanceService;
import atom.attendance.model.service.HolidayService;
import atom.attendance.model.vo.Attendance;
import atom.employee.model.vo.Employee;
import common.DateFormat;

/**
 * Servlet implementation class UserMonthServlet
 */
@WebServlet("/attendance/userMonth")
public class UserMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Employee e = (Employee)request.getSession().getAttribute("empLoggedIn");
		
		// 캘린더에 출력해 줄 사원 근태 값을 가져옴
		List<Attendance> aList = new AttendanceService().selectAtt(e.getEmpId());
		
		DateFormat df = new DateFormat();
		String month = df.curMonth();
		
		int attcnt=0; // 출근일 수
		int latecnt=0; // 지각횟수
		int earlycnt=0; // 조퇴횟수
		int abcnt=0; // 부재횟수
		int nocnt=0; // 결근일 수
		String totalTime="0:0"; // 총 근무시간 계산 값
		String total = "0시간 0분"; // 출력해줄 총 근무시간
		
		// 주말을 제외한 현재 월의 일 수
		int monthcnt = new HolidayService().getCnt();
		// 관리자가 지정한 휴일 일 수
		int holicnt = new HolidayService().holiCnt();
		int count = monthcnt-holicnt; // 출근일 수
		double avg = 0; // 출근률 계산 값
		String totalavg = "0"; // 출력해줄 출근률
		
		// 사용자의 현재 월 근태 정보 가져옴
		List<Attendance> list = new AttendanceService().selectUserMonthAtt(e.getEmpId());
		// 현재월 근태 정보를 읽어 근무일 수 저장
		for(Attendance a : list) {
			// 사원 근태 횟수 계산
			if(a.getAttType().equals("정상")) attcnt++;
			else if(a.getAttType().contains("지각")) latecnt++;
			else if(a.getAttType().contains("조퇴")) earlycnt++;
			else if(a.getAttType().equals("결근")) nocnt++;
			else abcnt++;
			
			// 근무시간을 모두 더해줌
			if(a!=null && a.getWorkTime()!=null)
				totalTime = df.timeSum(totalTime, a.getWorkTime());
		}
		// 더한 근무시간을 00시간00분 형태로 변경
		total = df.timeType(totalTime);
		
		// 결근일 수는 총 근무일 수에서 출근, 지각, 조퇴, 부재를 뺀 값
		nocnt=count-(attcnt+latecnt+earlycnt+abcnt);
		// 출근률 계산
		avg = ((double)(count-nocnt)/count)*100;
		// 소수점 둘째자리 까지 지정
		DecimalFormat fm = new DecimalFormat("#.##");
		
		// 출근률은 출근, 지각, 조퇴를 한번이라도 했을 경우 계산됨
		if(attcnt>0 || latecnt>0 || earlycnt>0)
			totalavg = fm.format(avg);

		request.setAttribute("month", month);
		request.setAttribute("attcnt", attcnt);
		request.setAttribute("latecnt", latecnt);
		request.setAttribute("earlycnt", earlycnt);
		request.setAttribute("abcnt", abcnt);
		request.setAttribute("nocnt", nocnt);
		request.setAttribute("totalTime", total);
		request.setAttribute("aList", aList);
		request.setAttribute("count", count);
		request.setAttribute("totalavg", totalavg);
		String view="/views/attendance/user_month.jsp";
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
