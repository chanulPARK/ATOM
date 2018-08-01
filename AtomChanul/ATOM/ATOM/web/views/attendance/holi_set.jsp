<%@page import="atom.attendance.model.vo.Holiday"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/attendanceAdminAside.jsp" %>

<%-- <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script> --%>
<link href="<%=request.getContextPath() %>/dist/css/datepicker.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>

<%
	List<Holiday> list = (List)request.getAttribute("list");
%>

    <script>
    $(function(){
        $('.startholi').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $('.endholi').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $('.searchDate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm",
            language: "kr"
        });
    });
    </script>
    <script>
	    function onedaycheck(){
	    	var date=$('#searchmonth').val().trim();
	    	var chk=/^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])$/;
			if(!chk.test(date)) {
				alert("날짜는 YYYY-MM 형식으로 입력해야합니다.");
				return false;
			} 
			return true;
	    }
	    function twodaycheck(){
	    	var sdate=$('#startdate').val().trim();
	    	var edate=$('#enddate').val().trim();
	    	var chk=/^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			if(!chk.test(sdate)) {
				alert("날짜는 YYYY-MM-DD 형식으로 입력해야합니다.");
				return false;
			} else if(!chk.test(edate)) {
				alert("날짜는 YYYY-MM-DD 형식으로 입력해야합니다.");
				return false;
			}

			var c1=sdate.split("-");
			var c2=edate.split("-");
			var d1=new Date(c1[0],c1[1],c1[2]).getTime();
			var d2=new Date(c2[0],c2[1],c2[2]).getTime();
			if(d1>d2){
				alert("시작 날짜보다 끝 날짜가 빠를 수 없습니다.");
				return false;
			}
			
			return true;
	    }
    </script>

    <section>
        <div class="content">
           <div class='col-lg-12'>
                <h3 class="page-header">휴일 설정</h3>
                <!-- 설정 화면 -->
                <div class='row'></div>
                <form action='<%=request.getContextPath() %>/attendance/holidaySet' onsubmit='return twodaycheck()'>
	                <div class="panel panel-default">
	                    <div class='panel-heading'>
	                        <!-- <i class="fas fa-users"></i> -->
	                        <h4>휴일/공휴일 설정</h4>
	                    </div>
	                    <div class="panel panel-body table-responsive form-group">
	                        <table class="table table-hover">
		                        <colgroup>
		                        	<col style='width:15%'>
		                        </colgroup>
	                            <tr>
	                                <th>날짜</th>
	                                <td class='input-group'>
	                                    <span class='input-group-addon' id='basic-addon2'>
	                                        <i class="fa fa-calendar" aria-hidden="true"></i>
	                                    </span>
	                                    <input type="text" id='startdate' name='startdate' class='startholi form-control' placeholder="시작 날짜 선택">
	                                    <span class='input-group-addon' style="background-color: #fff;border: none">~</span>
	                                    <span class='input-group-addon' id='basic-addon2'>
	                                        <i class="fa fa-calendar" aria-hidden="true"></i>
	                                    </span>
	                                    <input type="text" id='enddate' name='enddate' class='endholi form-control' placeholder="끝 날짜 선택">
	                                </td>
	                            </tr>
	                            <tr>
	                            	<th>휴일여부</th>
	                            	<td>
	                            		<input type="radio" name='holiyn' value='Y' checked> Ｏ &nbsp;&nbsp;&nbsp;
	                            		<input type="radio" name='holiyn' value='N'> Ｘ 
	                            	</td>
	                            </tr>
	                            <tr>
	                                <th>명칭</th>
	                                <td><input type="text" id='holiname' name='holiname' class="form-control" placeholder="휴일이름 설정"></td>
	                            </tr>
	                            <tr>
	                                <th>내용</th>
	                                <td><textarea name="holinote" id="holinote" cols="100" rows="5" style="resize: none;width:100%"></textarea></td>
	                            </tr>
	                        </table>
	                    </div>
	                    <div class="panel-footer">
	                        <button type="submit" class="btn btn-primary">등록</button>
	                        <button type="reset" class="btn btn-default">취소</button>
	                    </div>
	                </div>
                </form>
            </div>
            
            <div class='col-lg-12'>
                <!-- 목록 화면 -->
                <div class='row'></div>
                <div class="panel panel-default">
                    <div class='panel-heading' style="display: inline-flex;">
                        <!-- <i class="fas fa-users"></i> -->
                        <h4>휴일/공휴일 목록</h4>
                        <form action='<%=request.getContextPath()%>/attendance/searchHoliday' style='width:55%' onclick='onedaycheck()'>
	                        <!-- 년 월 입력받아 조회 -->
	                        <div class='col-md-12' style='float:right'>
                			<div class='col-md-6'>
		                        <div class='input-group'>
		                            <span class='input-group-addon' id='basic-addon2'>
		                                <i class="fa fa-calendar" aria-hidden="true"></i>
		                            </span>
		                            <!-- 날짜 입력 -->
		                            <input type="text" id='searchmonth' name='searchmonth' class='input-date searchDate form-control' placeholder="조회할 날짜 선택">
		                        </div>
	                        </div>
	                        <div class='col-md-2'>
	                            <button type='submit' id='searchDate' class='btn btn-color5'>
	                                <i class='fa fa-search fa-fw'></i>검색
	                            </button>
	                        </div>
	                        </div>
                   		</form>
                    </div>
                    <div class="panel panel-body table-responsive form-group">
                        <table class="table table-hover">
                        	<colgroup>
	                        	<col style='width:20%'>
	                        	<col style='width:20%'>
	                        	<col style='width:55%'>
	                        	<col style='width:5%'>
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th>날짜</th>
	                                <th>명칭</th>
	                                <th>내용</th>
	                                <th></th>
	                            </tr>
                            </thead>
                            <tbody>
	                            <% for(Holiday h : list) { %>
								<tr>
									<td><%=h.getHoliDate() %></td>
									<td><%=h.getHoliName() %></td>
									<td><%=h.getHoliNote() %></td>
									<td>
										<button type='button' id='deleteBtn' class="btn btn-default" onclick="location.href='<%=request.getContextPath() %>/attendance/holiDelete?holiDate=<%=h.getHoliDate() %>'">
											<i class="fa fa-trash"></i>
										</button>
									</td>
								</tr>
								<%} %>
							</tbody>
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
