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
	List<String[]> list = (List)request.getAttribute("list");
	String month = (String)request.getAttribute("month");
	int count = (int)request.getAttribute("count");
%>

    <script>
    $(function(){
        $('.searchdate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm",
            language: "kr",
            /* 기본값 설정 */
        });
    });
    
    function onedaycheck(){
    	var date=$('#searchmonth').val().trim();
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
                <h3 class="page-header">월별근태조회</h3>
                <!-- 사원 검색 (부서별 검색, 직급별 검색) -->
                <form action='<%=request.getContextPath() %>/attendance/searchEmpMonth'>
	                <div class='col-md-12 well'>
	                    <div class='col-md-8'>
	                        <h5 class='col-md-2'>사원별 조회</h5>
	                        <!-- 날짜 선택 -->
	                        <div class='input-group col-md-4'>
	                            <span class='input-group-addon' id='basic-addon2'>
	                            <i class="fa fa-user"></i>
	                            </span>
	                            <!-- 날짜 입력 -->
	                            <input type="text" id='searchemp' name='searchemp' class='input-text form-control' placeholder="조회할 사원명 입력">
	                        </div>
	                    </div>
	                    <!-- 조회 버튼 -->
	                    <div class='col-md-2'>
	                        <button type='submit' id='searchEmp' class='btn btn-color5'>
	                            <i class='fa fa-search fa-fw'></i>검색
	                        </button>
	                    </div>
	                </div>
                </form>
                
                <!-- 부서 검색 -->
                <div class='col-md-12 well'>
	                <form action='<%=request.getContextPath()%>/attendance/searchDeptMonth'>
	                    <div class='col-md-8'>
	                         <h5 class='col-md-2'>부서별 조회</h5>
	                         <!-- 날짜 선택 -->
	                         <div class='input-group col-md-4'>
	                             <span class='input-group-addon' id='basic-addon2'>
	                                <i class="fa fa-briefcase"></i>
	                             </span>
	                             <!-- 날짜 입력 -->
	                             <input type="text" id='searchdept' name='searchdept' class='form-control' placeholder="조회할 부서명 입력">
	                         </div>
	                    </div>
	                    <!-- 조회 버튼 -->
	                    <div class='col-md-4'>
	                        <button type='submit' id='searchbtn' class='btn btn-color5'>
	                            <i class='fa fa-search fa-fw'></i>검색
	                        </button>
	                    </div>
                    </form>
                </div>
                
                <div class='row'></div>
                <!-- 월별 출석 통계 조회 -->
                <div class="panel panel-default">
	                    <div class='panel-heading' style="display: inline-flex;">
	                        <h5 class='col-md-2'>날짜별 조회</h5>
	                		<form action='<%=request.getContextPath()%>/attendance/searchAttMonth' style='width:55%' onsubmit='return onedaycheck()'>
		                        <!-- 년 월 입력받아 조회 -->
	                			<div class='col-md-6'>
			                        <div class='input-group'>
			                            <span class='input-group-addon' id='basic-addon2'>
			                                <i class="fa fa-calendar" aria-hidden="true"></i>
			                            </span>
			                            <!-- 날짜 입력 -->
			                            <input type="text" id='searchmonth' name='searchmonth' class='input-date searchdate form-control' placeholder="조회할 날짜 선택">
			                        </div>
		                        </div>
		                        <div class='col-md-2'>
		                            <button type='submit' id='searchDate' class='btn btn-color5'>
		                                <i class='fa fa-search fa-fw'></i>검색
		                            </button>
		                        </div>
                    		</form>
	                        <div class='col-md-2' >
	                            <h5 style='float:right'><%=month %> 근무일 : <%=count %>일</h5>
	                        </div>
	                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-hover">
                        <%if(list.isEmpty()) { %>
                           	<h5> <%=month %>에 입력된 출근 데이터가 없습니다.</h5>
                        <%} else { %>
                            <thead>
                                <tr>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>사원명</th>
                                    <th>날짜</th>
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
                            <% for(String[] str : list) {%>
                                <tr>
                                    <td><%=str[0] %></td>
                                    <td><%=str[1] %></td>
                                    <td><%=str[2] %></td>
                                    <td><%=str[3] %></td>
                                    <td><%=str[4] %>일</td>
                                    <td><%=str[5] %>일</td>
                                    <td><%=str[6] %>일</td>
                                    <td><%=str[7] %>일</td>
                                    <td><%=str[8] %>일</td>
                                    <td><%=str[9] %></td>
                                    <td><%=str[10] %>%</td>
                                </tr>
                                <%} %>
                            </tbody>
                        	<%}%>
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
