<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

    <script src="<%=request.getContextPath() %>/dist/lib/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/dist/js/fullcalendar.min.js"></script>
    <link href="<%=request.getContextPath() %>/dist/css/fullcalendar.min.css" rel="stylesheet" >
    <link href="<%=request.getContextPath() %>/dist/css/fullcalendar.print.css" rel="stylesheet" media="print">
    <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
    <link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
	<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>

    <script>
    $(function(){
        $('.dateday').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm",
            language: "kr",
            /* 기본값 설정 */
        });
    });
    </script>
    
       <aside>
        <div class='sidebar-nav navbar-default'>
            <ul class="nav" id="side-menu">
                <li>
                    <a href="<%=request.getContextPath() %>/attendance/userDay" style="font-size: 17px">일일근태등록</a>
                </li>
                <li>    
                    <a href="<%=request.getContextPath() %>/views/attendance/user_month.jsp" style="font-size: 17px">월별근태현황</a>
                </li>
            </ul>
        </div>
    </aside>

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
                        <h5>날짜 조회</h5>&nbsp;&nbsp;&nbsp;&nbsp;
                        <!-- 년 월 입력받아 조회 -->
                        <div class='input-group col-md-2'>
                            <span class='input-group-addon' id='basic-addon2'>
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                            </span>
                            <!-- 날짜 입력 -->
                            <input type="text" id='dateday' class='input-date dateday form-control' placeholder="조회할 날짜 선택">
                        </div>
                        <div class='col-md-4'>
                            <button type='button' id='searchDate' class='btn btn-color5'>
                                <i class='fa fa-search fa-fw'></i>검색
                            </button>
                        </div>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>사원명</th>
                                    <th>날짜</th>
                                    <th>실 근무일수</th>
                                    <th>출근일수</th>
                                    <th>지각횟수</th>
                                    <th>조퇴횟수</th>
                                    <th>결근일수</th>
                                    <th>총 근무시간</th>
                                    <th>출근률</th>
                                    <th>남은 휴가 수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>영진</td>
                                    <td>2018년 7월</td>
                                    <td>20일</td>
                                    <td>19일</td>
                                    <td>1일</td>
                                    <td>0일</td>
                                    <td>0일</td>
                                    <td>50:21</td>
                                    <td>98.2%</td>
                                    <td>13일</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer"></div>
                </div>
            </div>
        </div>
    </section>



    <footer>
        <p>COPYRIGHT @ ATOM ALL RIGHTS RESERVED</p>
    </footer>





    <script>
        $(function(){
            $('#calendar').fullCalendar({
            header    : {
                left  : 'prev,next, today',
                center: 'title',
                right : 'month'
            },
            buttonText: {
                today: '오늘',
                month: '월간',
            },
            lang : 'ko',
            defaultDate: new Date(), // 디폴트 날짜 설정
            navLinks : false, // 날짜 클릭시 일간목록 설정
            editable : false, // 일정 드래그 설정
            events: [
                
                
            ]

        });
    });
    </script>
    




<%@ include file="/views/common/footer.jsp" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
