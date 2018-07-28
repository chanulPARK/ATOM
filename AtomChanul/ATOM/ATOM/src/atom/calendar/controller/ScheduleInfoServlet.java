package atom.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atom.calendar.model.service.CalendarService;
import atom.calendar.model.vo.Calendar;

/**
 * Servlet implementation class ScheduleInfoServlet
 */
@WebServlet("/calendar/calendarInfo")
public class ScheduleInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
		Calendar s = new CalendarService().selectScheduleId(scheduleId);
		String view="";
		if(s!=null)
		{
			if(s.getContent()==null){
				s.setContent("");
			}
			if(s.getPlace()==null) {
				s.setPlace("");
			}
			request.setAttribute("calendar", s);
			view="/views/ScheduleManagement/scheduleView.jsp";
		}
		else
		{
			request.setAttribute("msg", "조회한 일정이 없습니다.");
			request.setAttribute("loc", "/schedule/scheduleList");
			view="/views/common/msg.jsp";
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
	
	public Date transformDate(String date)
    {
        SimpleDateFormat beforeFormat = new SimpleDateFormat("MM/dd/yyyy");
        
        // Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
        SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        java.util.Date tempDate = null;
        
        try {
            // 현재 yyyy/mm/dd로된 날짜 형식으로 java.util.Date객체를 만든다.
            tempDate = beforeFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        // java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
        String transDate = afterFormat.format(tempDate);
        
        // 반환된 String 값을 Date로 변경한다.
        Date d = Date.valueOf(transDate);
        
        return d;
    }

}
