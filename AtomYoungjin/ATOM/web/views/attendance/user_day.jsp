<%@page import="java.text.SimpleDateFormat"%>
<%@page import="atom.attendance.model.vo.Attendance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>

<%
	String today = (String)request.getAttribute("today"); // 오늘 날짜
	String todate = (String)request.getAttribute("todate"); // 입력 날짜
	String day = (String)request.getAttribute("dayofweek"); // 입력 요일
	String dday = (String)request.getAttribute("dday"); // 오늘 요일
	Attendance att = (Attendance)request.getAttribute("attendance");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
// 정상/지각/조퇴/결근/휴가..
%>

    <script>
    $(function(){
        $('.dateday').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
    });
    </script>
    <script>
    $(function(){
        $('.startdate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $('.enddate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
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
           <div class='col-lg-12'>
                <h3 class="page-header">일일근태등록</h3>
                <!-- 일자 검색 -->
                <div class='col-md-12 well'>
                	<form action="<%=request.getContextPath()%>/attendance/searchUserDay">
	                   <div class='col-md-8'>
	                        <h5 class='col-md-4'>날짜 조회</h5>
	                        <!-- 날짜 선택 -->
	                        <div class='input-group col-md-4'>
	                            <span class='input-group-addon' id='basic-addon2'>
	                                <i class="fa fa-calendar" aria-hidden="true"></i>
	                            </span>
	                            <!-- 날짜 입력 -->
	                            <input type="text" name='searchDay' id='searchDay' class='input-date dateday form-control' placeholder="조회할 날짜 선택">
	                        </div>
	                   </div>
	                   <!-- 조회 버튼 -->
	                   <div class='col-md-4' >
	                       <button type='submit' id='searchDate' class='btn btn-color5' style='float: right'>
	                           <i class='fa fa-search fa-fw'></i>검색
	                       </button>
	                   </div>
                   </form>
                </div>
                <!-- 조회 화면 -->
                <div class='row'></div>
                <div class="panel panel-default">
                    <!-- 모달 버튼 -->
                    <div class='panel-heading'>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">출근</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">퇴근</button>
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal3">부재등록</button>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-hover">
                        <% if(att==null){ %>
                        	<h5>[<%=empLoggedIn.getEmpName() %>]님의 <%=todate %>(<%=day %>) 일자 출근 데이터가 입력되지 않았습니다.</h5>
                        <% } else { %>
                        	<colgroup>
                        		<col style='width:20%'>
                        		<col style='width:10%'>
                        		<col style='width:10%'>
                        		<col style='width:10%'>
                        		<col style='width:10%'>
                        		<col style='width:10%'>
                        		<col style='width:10%'>
                        		<col style='width:20%'>
                        	</colgroup>
                            <thead>
                                <tr>
                                    <th>날짜</th>
                                    <th>출근시간</th>
                                    <th>퇴근시간</th>
                                    <th>근무시간</th>
                                    <th>상태</th>
                                    <th>지각시간</th>
                                    <th>연장시간</th>
                                    <th>비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=att.getAttDate() %> (<%=day %>)</td>
                                    <td><%=att.getAttTime()==null?"-":att.getAttTime() %></td>
                                    <td><%=att.getLeaveTime()==null?"-":att.getLeaveTime() %></td>
                                    <td><%=att.getWorkTime()==null?"-":att.getWorkTime() %></td>
                                    <td><%=att.getAttType() %></td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td><%=att.getAttNote()==null?"":att.getAttNote() %></td>
                                </tr>
                            </tbody>
                            <% } %>
                        </table>
                    </div>
                    <div class="panel-footer"></div>
                </div>
    <!-- 모달 2 (부재) -->
    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">부재 작성</h3>
                </div>
                <form action="<%=request.getContextPath()%>/attendance/abRecode">
	                <div class="modal-body">
	                    <div class="panel panel-default">
	                        <div class="table-responsive">
	                            <table class="table table-hover">
	                            	<colgroup>
	                            		<col style="width:20%">
	                            	</colgroup>
	                                <tr>
	                                    <th>부서</th>
	                                    <td><%=empLoggedIn.getDeptCode() %></td>
	                                </tr>
	                                <tr>
	                                    <th>사원명</th>
	                                    <td><%=empLoggedIn.getEmpName() %></td>
	                                </tr>
	                                <tr>
	                                    <th>날짜</th>
	                                    <td class='input-group'>
	                                        <span class='input-group-addon' id='basic-addon2'>
	                                            <i class="fa fa-calendar" aria-hidden="true"></i>
	                                        </span>
	                                        <input type="text" name='startdate' id='startdate' class='input-date startdate form-control' placeholder="시작 날짜 선택">
	                                        <span class='input-group-addon' style="background-color: #fff;border: none">~</span>
	                                        <span class='input-group-addon' id='basic-addon2'>
	                                            <i class="fa fa-calendar" aria-hidden="true"></i>
	                                        </span>
	                                        <input type="text" name='enddate' id='enddate' class='input-date enddate form-control' placeholder="끝 날짜 선택">
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>유형</th>
	                                    <td>
	                                        <select class='form-control' name="atttype" id="atttype">
	                                            <option value="출장">출장</option>
	                                            <option value="외근">외근</option>
	                                            <option value="휴가">휴가</option>
	                                            <option value="포상">포상</option>
	                                        </select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>비고</th>
	                                    <td><textarea name="attnote" id="attnote" cols="67" rows="3" style="resize: none;width:100%"></textarea></td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="submit" class="btn btn-primary">등록</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
            </div>
        </div>
    </section>       
              
    <!-- 모달 1 (출근) -->
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">출근 작성</h3>
                </div>
                <form action="<%=request.getContextPath()%>/attendance/attRecode">
	                <div class="modal-body">
	                    <div class="panel panel-default">
	                        <div class="table-responsive">
	                            <table class="table table-hover">
	                            	<colgroup>
	                            		<col style="width:20%">
	                            	</colgroup>
	                                <tr>
	                                    <th>부서</th>
	                                    <td><%=empLoggedIn.getDeptCode() %></td>
	                                </tr>
	                                <tr>
	                                    <th>사원명</th>
	                                    <td><%=empLoggedIn.getEmpName() %></td>
	                                </tr>
	                                <tr>
	                                    <th>날짜</th>
	                                    <td><%=today%> (<%=dday %>)</td>
	                                </tr>
	                                <tr>
	                                    <th>유형</th>
	                                    <td>
	                                        <select class='form-control' name="atttype" id="atttype">
	                                            <option value="출근">출근</option>
	                                            <option value="지각">지각</option>
	                                            <!-- <option value="조퇴">조퇴</option>
	                                            <option value="퇴근">퇴근</option> -->
	                                        </select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>비고</th>
	                                    <td><textarea name="attnote" id="attnote" cols='100' rows="3" style="resize: none;width:100%"></textarea></td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="submit" class="btn btn-primary">등록</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- 모달 1 (퇴근) -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">퇴근 작성</h3>
                </div>
                <form action="<%=request.getContextPath()%>/attendance/endRecode">
	                <div class="modal-body">
	                    <div class="panel panel-default">
	                        <div class="table-responsive">
	                            <table class="table table-hover">
	                            	<colgroup>
	                            		<col style="width:20%">
	                            	</colgroup>
	                                <tr>
	                                    <th>부서</th>
	                                    <td><%=empLoggedIn.getDeptCode() %></td>
	                                </tr>
	                                <tr>
	                                    <th>사원명</th>
	                                    <td><%=empLoggedIn.getEmpName() %></td>
	                                </tr>
	                                <tr>
	                                    <th>날짜</th>
	                                    <td><%=today%> (<%=dday %>)</td>
	                                </tr>
	                                <tr>
	                                    <th>유형</th>
	                                    <td>
	                                        <select class='form-control' name="atttype" id="atttype">
	                                            <!-- <option value="출근">출근</option>
	                                            <option value="지각">지각</option> -->
	                                            <option value="퇴근">퇴근</option>
	                                            <option value="조퇴">조퇴</option>
	                                        </select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>비고</th>
	                                    <td><textarea name="attnote" id="attnote" cols='100' rows="3" style="resize: none;width:100%"></textarea></td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="submit" class="btn btn-primary">등록</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    
 

	<%@ include file="/views/common/footer.jsp" %>
<!--     
	+jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다)
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요
    <script src="../dist/js/bootstrap.min.js"></script>
 -->