<%@page import="atom.attendance.model.vo.*"%>
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
	String todate = (String)request.getAttribute("todate"); // 입력 날짜
	String day = (String)request.getAttribute("dayofweek"); // 입력 요일
	List<Attendance> list = (List)request.getAttribute("list");
%>

    <script>
    $(function(){
        $('.searchdate').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
            /* 기본값 설정 */
        });
        
        $(function(){
        	$(".updateBtn").click("on",function(){
        		var name = $(this).attr('name');
        		var data = $(this).attr('value');
        		var datasplit = data.split("/");
        		console.log(data);
        		var list=new Array();
        		list[0]=datasplit[0];
        		list[1]=datasplit[1];
        		list[2]=datasplit[2];
        		list[3]=datasplit[3];
        		list[4]=datasplit[4];
        		list[5]=datasplit[5];
        		$('[name=empname]').val(name);
        		$('[name=empdept]').val(list[0]);
        		$('[name=empjob]').val(list[1]);
        		$('[name=attdate]').val(list[2]);
        		$('[name=atttime]').val(list[3]);
       			$('[name=leavetime]').val(list[4]);
        		$('[name=atttype]').val(list[5]);
        		$(this).attr("data-toggle","modal");
        		$(this).attr("data-target","#myModal");
        	});
        });
    });
    
    function onedaycheck(){
    	var date=$('#searchdate').val().trim();
    	var chk=/^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if(!chk.test(date)) {
			alert("날짜는 YYYY-MM-DD 형식으로 입력해야합니다.");
			return false;
		} 
		return true;
    }
    </script>

 

    <section>
        <div class="content">
           <div class='col-lg-12'>
                <h3 class="page-header">일별근태조회</h3>
                <!-- 일자 검색 -->
                <div class='col-md-12 well'>
	                <form action='<%=request.getContextPath()%>/attendance/searchAttDay' onsubmit='return onedaycheck()'>
	                   <div class='col-md-8'>
	                        <h5 class='col-md-2'>날짜별 조회</h5>
	                        <!-- 날짜 선택 -->
	                        <div class='input-group col-md-4'>
	                            <span class='input-group-addon' id='basic-addon2'>
	                                <i class="fa fa-calendar" aria-hidden="true"></i>
	                            </span>
	                            <!-- 날짜 입력 -->
	                            <input type="text" id='searchdate' name='searchdate' class='input-date searchdate form-control' placeholder="조회할 날짜 선택">
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
                <!-- 사원 검색 -->
                <div class='col-md-12 well'>
	                <form action='<%=request.getContextPath()%>/attendance/searchEmpDay'>
	                    <div class='col-md-8'>
	                         <h5 class='col-md-2'>사원별 조회</h5>
	                         <!-- 날짜 선택 -->
	                         <div class='input-group col-md-4'>
	                             <span class='input-group-addon' id='basic-addon2'>
	                                <i class="fa fa-user"></i>
	                             </span>
	                             <!-- 날짜 입력 -->
	                             <input type="text" id='searchemp' name='searchemp' class='form-control' placeholder="조회할 사원명 입력">
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
                
                <!-- 부서 검색 -->
                <div class='col-md-12 well'>
	                <form action='<%=request.getContextPath()%>/attendance/searchDeptDay'>
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
                
                <!-- 목록 화면 -->
                <div class='row'></div>
                <div class="panel panel-default">
                    <div class='panel-heading'>
                        <!-- <i class="fas fa-users"></i> -->
                        <h4>사원 목록</h4>
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-hover">
                        	<colgroup>
                        		<col style='width:9%'>
                        		<col style='width:8%'>
                        		<col style='width:8%'>
                        		<col style='width:15%'>
                        		<col style='width:10%'>
                        		<col style='width:10%'>
                        		<col style='width:13%'>
                        		<col style='width:7%'>
                        		<col style='width:15%'>
                        		<col style='width:5%'>
                        	</colgroup>
                        	<% if(list.isEmpty()) { %>
                                	<h5> <%=todate %>(<%=day %>) 일자에 입력된 출근 데이터가 없습니다.</h5>
                            <%} else {%>
                            <thead>
                                <tr>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>사원명</th>
                                    <th>날짜</th>
                                    <th>출근시간</th>
                                    <th>퇴근시간</th>
                                    <th>근무시간</th>
                                    <th>상태</th>
                                    <th>비고</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <%} 
							 for(Attendance a : list) { %>
                            <tr>
                                <td><%=a.getDeptName() %></td>
                                <td><%=a.getJobName() %></td>
                                <td><%=a.getEmpName() %></td>
                                <td><%=a.getAttDate() %> (<%=day %>)</td>
                                <td><%=a.getAttTime()==null?"-":a.getAttTime() %></td>
                                <td><%=a.getLeaveTime()==null?"-":a.getLeaveTime() %></td>
                                <td><%=a.getWorkTime()==null?"-":a.getWorkTime() %></td>
                                <td><%=a.getAttType() %></td>
                                <td><%=a.getAttNote()==null?"":a.getAttNote() %></td>
                                <td> <!-- 데이터 수정 -->
                                    <button type="button" id='updateBtn' class="btn btn-default updateBtn" data-toggle="" data-target=""
                                    name='<%=a.getEmpName() %>' 
                                    value="<%=a.getDeptName()%>/<%=a.getJobName()%>/<%=a.getAttDate()%>/<%=a.getAttTime()%>/<%=a.getLeaveTime()%>/<%=a.getAttType()%>">
                                    	<i class="fa fa-edit"></i>
                                    </button>
                                </td>
                            </tr>
                            <%	} %>
                        </table>
                    </div>
                    <div class="panel-footer"></div>
                </div>
            </div>
        </div>
    </section>                 

    <!-- 모달 1 (사원 근태정보 수정) -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">사원 근태 수정</h3>
                </div>
                <form action="<%=request.getContextPath()%>/attendance/attUpdate">
	                <div class="modal-body">
	                    <div class="panel panel-default">
	                        <div class="table-responsive">
	                            <table class="table table-hover">
	                            	<colgroup>
	                            		<col style='width:20%'>
	                            	</colgroup>
	                                <tr>
	                                    <th>부서</th>
	                                    <td><input type='text' name='empdept' class='form-control' value="" readonly></td>
	                                </tr>
	                                <tr>
	                                    <th>직급</th>
	                                    <td><input type='text' name='empjob' class='form-control' value="" readonly></td>
	                                </tr>
	                                <tr>
	                                    <th>사원명</th>
	                                    <td><input type='text' name='empname' class='form-control' value="" readonly></td>
	                                </tr>
	                                <tr>
	                                    <th>날짜</th>
	                                    <td><input type='text' name='attdate' class='form-control' value="" readonly></td>
	                                </tr>
	                                <tr>
	                                    <th>출근시간</th>
	                                    <td><input type="text" class='form-control' name='atttime' value=""></td>
	                                </tr>
	                                <tr>
	                                    <th>퇴근시간</th>
	                                    <td><input type="text" class='form-control' name='leavetime' value=""></td>
	                                </tr>
	                                <tr>
	                                    <th>상태</th>
	                                    <td>
	                                        <select class='form-control' name="atttype" id="atttype">
	                                            <option value="정상">정상</option>
	                                            <option value="지각">지각</option>
	                                            <option value="조퇴">조퇴</option>
	                                            <option value="결근">결근</option>
	                                            <option value="휴가">휴가</option>
	                                            <option value="외근">외근</option>
	                                            <option value="출장">출장</option>
	                                            <option value="포상">포상</option>
	                                        </select>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>비고</th>
	                                    <td><textarea name="attnote" id="attnote" rows="3" style="resize: none;width:100%"></textarea></td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="submit" class="btn btn-primary">수정</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                </div>
                </form>
            </div>
        </div>
    </div>

<%@ include file="/views/common/footer.jsp" %>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
