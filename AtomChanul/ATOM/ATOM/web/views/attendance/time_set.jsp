<%@page import="java.util.List"%>
<%@page import="atom.attendance.model.vo.Time"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/attendanceAdminAside.jsp" %>

<%-- <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script> --%>
<link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>
<link href="<%=request.getContextPath() %>/dist/css/bootstrap-timepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/bootstrap-timepicker.js"></script>

<%
	Time t = (Time)request.getAttribute("time");
	List<Time> list = (List)request.getAttribute("list");
%>

    <script>
    $(function(){
        $('.dateset').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $(".atttime").timepicker({
        	minuteStep:1,
        	defaultTime:'<%=t.getStAtt()%>',
        	showMeridian:false /* 24시모드 */
        });
        $(".leavetime").timepicker({
        	minuteStep:1,
        	defaultTime:'<%=t.getStLeave()%>',
        	showMeridian:false /* 24시모드 */
        });
        $(".lunchtime").timepicker({
        	minuteStep:1,
        	defaultTime:'<%=t.getStLunch()%>',
        	showMeridian:false /* 24시모드 */
        });
    });
    function onedaycheck(){
    	var date=$('#timeset').val().trim();
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
           <div class='col-lg-12'>
                <h3 class="page-header">기준시간 설정</h3>
                <!-- 설정 화면 -->
                <div class='row'></div>
                <form action='<%=request.getContextPath()%>/attendance/timeSet' onclick='return onedaycheck()'>
                	<div class="panel panel-default">
	                    <div class='panel-heading'>
	                        <!-- <i class="fas fa-users"></i> -->
	                        <h4>기준시간 설정</h4>
	                    </div>
	                    <div class="panel panel-body table-responsive form-group">
	                        <table class="table table-hover">
	                            <tr>
	                                <th>날짜</th>
	                                <td class='input-group'>
	                                    <span class='input-group-addon' id='basic-addon2'>
	                                        <i class="fa fa-calendar" aria-hidden="true"></i>
	                                    </span>
	                                    <input type="text" id='timeset' name='timeset' class='input-date dateset form-control' placeholder="시작 날짜 선택">
	                                    <span class='input-group-addon' style="background-color: #fff;border: none">부터 적용</span>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>출근시간</th>
	                                <td><input type="text" id='starttime' name='starttime' class="atttime form-control"></td>
	                            </tr>
	                            <tr>
	                                <th>퇴근시간</th>
	                                <td><input type="text" id='endtime' name='endtime' class="leavetime form-control"></td>
	                            </tr>
	                            <tr>
	                                <th>점심시간</th>
	                                <td><input type="text" id='lunchtime' name='lunchtime' class="lunchtime form-control"></td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div class="panel-footer">
	                        <button type="submit" class="btn btn-primary">저장</button>
	                        <button type="reset" class="btn btn-default">취소</button>
	                    </div>
                	</div>
            	</form>
            </div>
            
            <div class='col-lg-12'>
                <!-- 목록 화면 -->
                <div class='row'></div>
               	<div class="panel panel-default">
                    <div class='panel-heading'>
                        <!-- <i class="fas fa-users"></i> -->
                        <h4>기준시간 목록</h4>
                    </div>
                    <div class="panel panel-body table-responsive form-group">
                        <table class="table table-hover">
	                        <colgroup>
	                        	<col style='width:30%'>
	                        	<col><col><col>
	                        	<col style='width:5%'>
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th>적용날짜</th>
	                                <th>출근시간</th>
	                                <th>퇴근시간</th>
	                                <th>점심시간</th>
	                                <th></th>
	                            </tr>
                            </thead>
                            <% for(Time time : list) { %>
                            <tr>
                                <td><%=time.getStDate() %></td>
                                <td><%=time.getStAtt() %></td>
                                <td><%=time.getStLeave() %></td>
                                <td><%=time.getStLunch() %></td>
                                <td>
                                	<button type="button" id='deleteBtn' class="btn btn-default" onclick="location.href='<%=request.getContextPath()%>/attendance/timeDelete?stDate=<%=time.getStDate()%>'">
										<i class="fa fa-trash"></i>
									</button>
                                </td>
                            </tr>
                            <% } %>
                        </table>
                    </div>
                    <div class="panel-footer"></div>
               	</div>
            </div>
        </div>
    </section>  



<%@ include file="/views/common/footer.jsp" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
