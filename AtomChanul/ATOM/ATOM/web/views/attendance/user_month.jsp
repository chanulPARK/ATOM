<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="atom.attendance.model.vo.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/attendanceAside.jsp" %>

    <script src="<%=request.getContextPath() %>/dist/lib/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/dist/js/fullcalendar.min.js"></script>
    <link href="<%=request.getContextPath() %>/dist/css/fullcalendar.min.css" rel="stylesheet" >
    <link href="<%=request.getContextPath() %>/dist/css/fullcalendar.print.css" rel="stylesheet" media="print">
<%--     <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script> --%>
    <link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
	<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>

<%
	String month = (String)request.getAttribute("month"); // 이번 달
	String totalTime = (String)request.getAttribute("totalTime"); // 총 근무시간
	int attcnt = (int)request.getAttribute("attcnt");
	int latecnt = (int)request.getAttribute("latecnt");
	int earlycnt = (int)request.getAttribute("earlycnt");
	int abcnt = (int)request.getAttribute("abcnt");
	int nocnt = (int)request.getAttribute("nocnt");
	Attendance att = (Attendance)request.getAttribute("attendance");
	List<Attendance> list = (List)request.getAttribute("aList");
	int count = (int)request.getAttribute("count");
	String totalavg = (String)request.getAttribute("totalavg");
	System.out.println(list);
%>

    <script>
    $(function(){
        $('.dateday').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm",
            language: "kr",
            /* 기본값 설정 */
        });
    });
    function onedaycheck(){
    	var date=$('#searchMonth').val().trim();
    	var chk=/^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])$/;
		if(!chk.test(date)) {
			alert("날짜는 YYYY-MM 형식으로 입력해야합니다.");
			return false;
		} 
		return true;
    }
    </script>
    



    <section>
        <div class="content">
            <h3 class="page-header">월별근태현황</h3>
            <!-- 월별 현황(달력) -->
            <div class=' container-fluid'>
                <div class="col-lg-1"></div>
                <div class='row'>
                    <div id='calendar' class="col-lg-8"></div>
                </div>
            </div>
            <div class='col-lg-12' style="margin-top: 20px">
                <!-- 월별 출석 통계 조회 -->
                <div class="panel panel-default">
                    <div class='panel-heading' style="display: inline-flex">
                        <form action='<%=request.getContextPath() %>/attendance/searchUserMonth' onsubmit='return onedaycheck()'>
                        	<div class='col-md-8'>
		                        <h5 class='col-md-2'>날짜 조회</h5>
		                        <!-- 년 월 입력받아 조회 -->
		                        <div class='input-group col-md-4'>
		                            <span class='input-group-addon' id='basic-addon2'>
		                                <i class="fa fa-calendar" aria-hidden="true"></i>
		                            </span>
		                            <!-- 날짜 입력 -->
		                            <input type="text" id='searchMonth' name='searchMonth' class='input-date dateday form-control' placeholder="조회할 날짜 선택">
		                        </div>
	                        </div>
	                        <div class='col-md-4'>
	                            <button type='submit' id='searchDate' class='btn btn-color5' style='float: left'>
	                                <i class='fa fa-search fa-fw'></i>검색
	                            </button>
	                        </div>
                        </form>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>사원명</th>
                                    <th>날짜</th>
                                    <th>총 근무일수</th>
                                    <th>출근일수</th>
                                    <th>지각횟수</th>
                                    <th>조퇴횟수</th>
                                    <th>부재횟수</th>
                                    <th>결근일수</th>
                                    <th>총 근무시간</th>
                                    <th>출근률</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=empLoggedIn.getEmpName() %></td>
                                    <td><%=month %></td>
                                    <td><%=count %>일</td>
                                    <td><%=attcnt %>일</td>
                                    <td><%=latecnt %>일</td>
                                    <td><%=earlycnt %>일</td>
                                    <td><%=abcnt %>일</td>
                                    <td><%=nocnt %>일</td>
                                    <td><%=totalTime %></td>
                                    <td><%=totalavg %>%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>



<style>
	.fc-sun {color:#e31b23;}
	.fc-sat {color:#007dc3;}
</style>

    <script>
        $(function(){
            $('#calendar').fullCalendar({
            header    : {
                left  : 'prev, next',
                center: 'title',
                right : 'today'
            },
            lang : 'ko',
            defaultDate: new Date('<%=month%>'), // 디폴트 날짜 설정
            /* weekends:false, */
            navLinks : false, // 날짜 클릭시 일간목록 설정
            editable : false, // 일정 드래그 설정
            events: [
            	<% for(Attendance a : list) { %>
	            	<% if(a.getAttType()!=null){ %>
	            	{
		                title:'<%=a.getAttType()%>',
		                start:'<%=a.getAttDate()%>',
		                color:'rgba(0, 0, 0, 0)',
		                textColor:'black',
		                
	            	},
	            	<%}%>
	            	<% if(a.getAttTime()!=null){ %>
	            	{
		                title:'출근 : <%=a.getAttTime()%>',
		                start:'<%=a.getAttDate()%>',
		                backgroundColor : "rgba(0, 0, 0, 0)",
		                borderColor : "rgba(0, 0, 0, 0)",
		                textColor:'black'
	            	},
	            	<%}%>
	            	<% if(a.getLeaveTime()!=null){ %>
	            	{
		                title:'퇴근 : <%=a.getLeaveTime()%>',
		                start:'<%=a.getAttDate()%>',
		                backgroundColor : "rgba(0, 0, 0, 0)",
		                borderColor : "rgba(0, 0, 0, 0)",
		                textColor:'black'
	            	},
	            	<%}%>
	                <% if(a.getAttType().equals("정상")) { %>
	                {
	                	backgroundColor : "#B2CCFF", 
	                	rendering : "background",
	                	start:'<%=a.getAttDate()%>'
	                },
	                <%} else if(a.getAttType().contains("조퇴")||a.getAttType().contains("지각")) { %>
	                {
	                	backgroundColor : "#FFA7A7", 
	                	rendering : "background",
	                	start:'<%=a.getAttDate()%>'
	                },
	                <%} else { %>
	                {
	                	backgroundColor : "#CEF279", 
	                	rendering : "background",
	                	start:'<%=a.getAttDate()%>'
	                },
	                <%}%>
	        	<%}%>
            ]

        });
    });
    </script>
    




<%@ include file="/views/common/footer.jsp" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
