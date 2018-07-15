<%@page import="atom.calendar.model.vo.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp" %>
<%
	ArrayList<Calendar> lists = (ArrayList)request.getAttribute("list");
%>
	<!-- fullCalendar 3.9.0 -->
    <script src="<%=request.getContextPath()%>\dist\lib\moment.min.js"></script>
    <script src="<%=request.getContextPath()%>\dist\js\fullcalendar.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>\dist\css\fullcalendar.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>\dist\css\fullcalendar.print.css" media="print">

    <aside>

      <div class="sidebar" style="margin: 0px 10px">
        <div class="create-schedule">
          <a href="<%=request.getContextPath()%>/calendar/calendarRegistrationForm" class="btn btn-primary btn-block ">일정 등록</a>
        </div>
        <br>
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="form">
              <p>일정 선택</p>
            </div>
            <div class="form-checks">
              <div class="form-check">
                <label for="schedule-group-check1" class="label label-danger schedule-group"><input type="checkbox" name="schedule-group" id="schedule-group-check1"> 공지사항</label>
              </div>
              <div class="form-check">
                <label for="schedule-group-check2" class="label label-success schedule-group"><input type="checkbox" name="schedule-group" id="schedule-group-check2"> 국내개발팀 </label>
              </div>
              <div class="form-check">
                <label for="schedule-group-check3" class="label label-info schedule-group"><input type="checkbox" name="schedule-group" id="schedule-group-check3"> 내 일정 </label>
              </div>
              <div class="input-group">
                <input id="new-event" type="text" class="form-control" placeholder="일정 추가" style="width:73%">

                <div class="input-group-append">
                  <button id="add-new-event" type="button" class="btn btn-primary" >추가</button>
                </div>
                <!-- /btn-group -->
              </div>
              <!-- /input-group -->
            </div>
          </div>
        </div>

        <div class="form-group">

        </div>

      </div>

    </aside>



    <section>
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-2"></div>
          <div id='calendar' class="col-lg-8"></div>
        </div>
      </div>

    </section>

    <footer>
        <p>COPYRIGHT @ ATOM ALL RIGHTS RESERVED</p>
    </footer>

<!-- jQuery -->
    <script>
      $(function(){
        $('#calendar').fullCalendar({
          header    : {
            left  : 'prev,next today',
            center: 'title',
            right : 'month,agendaWeek,agendaDay,listWeek'
          },
          buttonText: {
            today: '오늘',
            month: '월간',
            week : '주간',
            day  : '일간',
            listWeek : '목록보기'
          },
          lang : 'ko',
          defaultDate: new Date(), // 디폴트 날짜 설정
          navLinks : false, // 날짜 클릭시 일간목록 설정
          editable : false, // 일정 드래그 설정
          eventLimit : true, // 칸을 넘어가는 일정은 more로 표시 설정
          events: [
            /* {
              title: '홈페이지 이동',
              start: '2018-07-08T08:00:00',
              end : '2018-07-08T10:00:00',
              url : '../default.jsp'
            },
            {
              title: '뭐지',
              start: '2018-07-10',
              end : '2018-07-20'
            }, */
            <%for(Calendar s : lists)
            {%>
	            {
	            	title : '<%=s.getScheduleName()%>',
	            	start : '<%=s.getStartDate()%>',
	            	end : '<%=s.getEndDate()%>'
	            },
            <%}%>
            	
            
          ]
          

        });
      });
    </script>








    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- <script src="../datepicker-master\src\js\daterangepicker.js"></script> <!-- 데이트피커 --> -->

  </body>
</html>
