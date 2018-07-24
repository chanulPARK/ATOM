<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/aside.jsp" %>
<%@ page import='java.util.*, atom.task.model.vo.Task' %>
<%
	List<Task> list = (List<Task>)request.getAttribute("list");

	// 페이징 처리
	int cPage = (int)request.getAttribute("cPage");
	String pageBar = (String)request.getAttribute("pageBar");
	int totalContent = (int)request.getAttribute("totalContent");
	int numPerPage = (int)request.getAttribute("numPerPage");
%>
<script type="text/javascript">
	$(function() {
		$('#numPerPage').change(function() {
			document.numPerPageFrm.submit();
			});
	});
	
	function fn_goTaskWrite() {
		location.href="<%=request.getContextPath()%>/task/taskWrite";
	};
	
    function selectAll() {
   		if($('#checkAll').checked!=true)
   			$('input[name=chkid]').attr("checked", $('#checkAll').is(":checked"));
   		else
		/* if($('#checkAll').checked==true) */
       		$('input[name=chkid]').removeAttr("checked");
	};
	
	statusPopup = function(taskId, title, userStatus, isTermless, overDayCount) {
        var url = spro.getContextRoot() + "/groupware/todo/listTodoReadStatusViewPopup.do?taskId="+taskId+"&taskType=2&userStatus="+userStatus+"&isTermless="+isTermless+"&overDayCount="+overDayCount;
        spro.showModalFrame(url, "",
            function(result) {callback(result);}, 
                             {title:title, width:500, height:300}
        );
    }

</script>

    <section>
        <div class="content">
            <div class="col-md-12">
                <h4>업무관리</h4>
                <div class="table-header">
                    <div class="row">
                        <div class="col-md-1" style="width: 45px; margin: 0 0 0 15px;">
                            <form action="<%=request.getContextPath() %>/task/taskList" name="numPerPageFrm" id="numPerPageFrm">
                            <select class="form-control input-sm" id="numPerPage" style="padding: 0">
                                <option value="10" <%=numPerPage==10?"selected":"" %>>10</option>
                                <option value="15" <%=numPerPage==15?"selected":"" %>>15</option>
                                <option value="20" <%=numPerPage==20?"selected":"" %>>20</option>
                                <option value="30" <%=numPerPage==30?"selected":"" %>>30</option>
                            </select>
                            <input type="hidden" name="cPage" value="<%=cPage %>">
                            </form>
                        </div>
                        <div class="col-md-1" style="margin: 0 0 0 10px;"><p style="font-size: 12px; color: rgb(160, 160, 160); margin: 6px 0px;">전체 <%=totalContent %></p></div>

                        <form class="form-inline">
                            <div class="col-md-7" style="float: right;">
                                <input class="form-control input-sm" placeholder="From" value=""><button type="button" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-calendar"></i></button>
                                ~
                                <input class="form-control input-sm" placeholder="To"><button type="button" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-calendar"></i></button>
                                <select class="form-control input-sm" style="padding: 0">
                                    <option value="searchUser">요청자</option>
                                    <option value="searchTitle">제목</option>
                                </select>
                                <input type="text" class="form-control input-sm" placeholder="검색어">
                                <button type="submit" class="btn btn-primary btn-sm floa">검색</button>
                            </div>
                        </form>
                    </div> 
                </div>

                <table class="tableTL table table-striped">
	                <colgroup>
	                    <col style="width: 40px;">
	                    <col style="width: 50px;">
	                    <col style="width: 120px;">
	                    <col style="min-width: 200px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"><input id="checkAll" onclick="selectAll()" type="checkbox" value="" title="checkAll" aria-invalid="false"></th>
	                        <th scope="col">번호</th>
	                        <th scope="col">
	                            <a data-sortcolumn="FOLDER" href="#">업무 보관함<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                        <th scope="col">
	                            <a data-sortcolumn="TITLE" href="#">제목<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                        <th scope="col">
	                            <a data-sortcolumn="REGISTERNAME" href="#">요청자<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                        <th scope="col">
	                            <a data-sortcolumn="INSERTDATE" href="#">요청일<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                        <th scope="col">
	                            <a data-sortcolumn="INSERTDATE" href="#">마감일<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                        <th scope="col">
	                            <a data-sortcolumn="DUEDATE" href="#">상태<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                        <th scope="col">
	                            <a data-sortcolumn="DUEDATE" href="#">읽음확인<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<%for(Task t : list) {%>
	                    <tr>
	                        <td><input name="chkid" type="checkbox" title="checkbox" value="" ></td>
	                        <td><%=t.getTaskNo() %></td>
	                        <td><%=t.getCategoryName() %></td>
	                        <td class="text-left"><%=t.getTaskTitle() %></td>
	                        <td><a href="#" data-toggle="modal" data-target="#myModal"><%=t.getEmpName() %></a></td>
	                        <td><%=t.getEnrollDate() %></td>
	                        <td><%=t.getDeadline()==null?"기한없음":"" %></td>
	                        <td><%=t.getTaskStasus() ==null?"미완료":"" %></td>
	                        <td>
	                        <button class="btn btn-danger btn-xs"><%=t.getTaskCheck()==null?"읽지 않음":"읽음" %></button>
	                        </td>
	                    </tr>
	                   	<%} %>
	                </tbody>
                </table>
                
                <nav class="pagination_wrap"><%=pageBar %></nav>
                <!-- /.pagination_wrap -->
                <div class="btn-wrap">
                    <button class="btn btn-primary btn-sm" onclick="fn_goTaskWrite()">업무 등록</button>
                    <button class="btn btn-primary btn-sm">업무 삭제</button>
                </div>
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.content -->
        
        <!-- Modal -->
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="myModalLabel">사원 정보</h4>
	                </div>
	                <div class="modal-body">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle" src="<%=request.getContextPath()%>/dist/img/profile.jpg" alt="User profile picture">
                        </div>
                            <h3 class="profile-username text-center">한예슬</h3>
                            <p class="text-muted text-center">Software Engineer</p>
                
                            <table width="200px;">
                                <tr>
                                    <th scope="row">부서</th>
                                    <td>영업부 / 영업 2팀</td>
                                </tr>
                                <tr>
                                    <th scope="row">직책</th>
                                    <td>사원</td>
                                </tr>
                                <tr>
                                    <th scope="row">전화번호</th>
                                    <td>01000000006 / </td>
                                </tr>
                                <tr>
                                    <th scope="row">메일</th>
                                    <td>atom@naver.com</td>
                                </tr>
                            </table>
                </div>
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">자세히 보기</button>
                </div> -->
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
        
    </section>


<%@ include file="/views/common/footer.jsp" %>
