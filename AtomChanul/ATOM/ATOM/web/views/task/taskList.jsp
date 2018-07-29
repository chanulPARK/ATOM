<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/taskAside.jsp" %>
<%@ page import='java.util.*, atom.task.model.vo.Task' %>
<%
	List<Task> list = (List<Task>)request.getAttribute("list");

	String taskType = (String)request.getAttribute("taskType");

	// 페이징 처리
	int cPage = (int)request.getAttribute("cPage");
	int totalContent = (int)request.getAttribute("totalContent");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<style>
	.float-right {
		float: right;
	}
	.btn-task {
		background: #353b47;
        color: #fff;
	}
</style>


<script type="text/javascript">
	// numPerPage변경시 화면 리로딩
	$(function() {
		$('#numPerPage').change(function() {
			document.numPerPageFrm.submit();
			});
	});
	
	// searchType 분기 처리
	/* $(function() {
		var sid = document.querySelector("#searchUser");
		var stitle = document.querySelector('#searchTitle');
		$('#searchType').change(function() {
			sid.style.display='none';
			stitle.style.display='none';
			$('#search-'+this.value).css("display","inline-block");
		});
	}); */
	
	// 글쓰기 이동
	function fn_goTaskWrite() {
		location.href="<%=request.getContextPath()%>/task/taskWrite";
	};
	
	// 전체 체크박스
	function selectAll() {
   		if($('#checkAll').is(':checked')) $('input[name=chkid]').prop("checked", true);
   		else $('input[name=chkid]').prop("checked", false);
	};
	
	// 체크박스된 값 처리
	var chkid = "";
	function fn_del() {
		$("input[name=chkid]:checked").each(function() {
			console.log($(this))
			chkid = chkid + $(this).val()+",";
			});
		chkid = chkid.substring(0,chkid.lastIndexOf(","));
		// console.log(chkid)
	
		if(chkid=="") alert("삭제할 대상을 선택하세요.");
		
		if(confirm("정보를 삭제 하시겠습니까?")) {
			location.href="<%=request.getContextPath() %>/task/taskDelete?taskNos="+chkid;
		}
	};
	
	// datepicker
    $(function(){
        $('.reservation').datepicker({
        	format: 'yyyy-mm-dd',
        	yearFirst: true,
        	months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            days: ['일', '월', '화', '수', '목', '금', '토'],
            daysShort: ['일', '월', '화', '수', '목', '금', '토'],
            daysMin: ['일', '월', '화', '수', '목', '금', '토'],
            yearSuffix: '년',
            autoHide: true
        });
	});

	
	/* statusPopup = function(taskId, title, userStatus, isTermless, overDayCount) {
        var url = spro.getContextRoot() + "/groupware/todo/listTodoReadStatusViewPopup.do?taskId="+taskId+"&taskType=2&userStatus="+userStatus+"&isTermless="+isTermless+"&overDayCount="+overDayCount;
        spro.showModalFrame(url, "",
            function(result) {callback(result);}, 
                             {title:title, width:500, height:300}
        );
    } */
    
    // 테이블 정렬
    $(document).ready(function(){ 
    	$("#sorttable").tablesorter({
    		headers: {
                0: { sorter: false }
    		}
    	});
    }); 
    /* $("#sorttable").tablesorter( {sortList: [[1,0]]} ); */
	
</script>

<section>
    <div class="content task-content">
        <div class="col-md-12" style="min-width: 900px;">
           	<%--  <%
            String text = "";
            if(taskType=="1") text="발신 업무 요청";
            else if(taskType=="1-1") text="수신 업무 요청";
            else if(taskType=="2") text="발신 업무 보고";
            else if(taskType=="2-1") text="수신 업무 보고";
            else if(taskType=="3") text="업무 일지";
            %>
            <h5><%=text %></h5> --%>
            <h4>업무관리</h4>
            <div class="table-header">
                <div class="row">
                    <div class="col-md-1" style="width: 45px; margin: 0 0 0 15px;">
                        <form action="<%=request.getContextPath() %>/task/taskList" name="numPerPageFrm" id="numPerPageFrm" method="post" >
                        <select class="form-control input-sm" id="numPerPage" name="numPerPage" style="padding: 0">
                            <option value="10" <%=numPerPage==10?"selected":"" %>>10</option>
                            <option value="15" <%=numPerPage==15?"selected":"" %>>15</option>
                            <option value="20" <%=numPerPage==20?"selected":"" %>>20</option>
                            <option value="30" <%=numPerPage==30?"selected":"" %>>30</option>
                        </select>
                        <input type="hidden" name="cPage" value="<%=cPage %>">
                        </form>
                    </div>
                    <div class="col-md-1" style="margin: 0 0 0 10px;"><p style="font-size: 12px; color: rgb(160, 160, 160); margin: 6px 0px;">전체 <%=totalContent %></p></div>

                    <form action="<%=request.getContextPath() %>/task/taskSearch" class="search-form form-inline col-md-7 float-right" method="post" >
	                    <input type="hidden" name="cPage" value="<%=cPage %>"/>
						<input type="hidden" name="numPerPage" value="<%=numPerPage %>"/>
                        <div class="input-group">
                            <input type="text" class="form-control input-sm reservation" id="reservation1" name="searchFrom"  placeholder="From">
                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                        </div>
                        ~
                        <div class="input-group">
                            <input type="text" class="form-control input-sm reservation" id="reservation2" name="searchTo" placeholder="To">
                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                        </div>
                        
                        <select name="searchOption" class="form-control input-sm" style="padding: 0">
                            <option value="searchUser">요청자</option>
                            <option value="searchTitle">제목</option>
                        </select>
                        <input type="text" name="searchKeyword" class="form-control input-sm" placeholder="검색어">
                        <button type="submit" class="btn btn-task btn-sm">검색</button>
                    </form>
                    <!-- ./search-form -->
                </div> 
            </div>
            <!-- ./table-header -->

            <table class="tableTL table table-striped tablesorter" id="sorttable">
             <colgroup>
                 <col style="width: 40px;">
                 <col style="width: 60px;">
                 <col style="width: 100px;">
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
                     <th scope="col">업무 분류</th>
                     <th scope="col">제목</th>
                     <th scope="col">요청자</th>
                     <th scope="col">요청일</th>
                     <th scope="col">마감일</th>
                     <th scope="col">상태</th>
                     <th scope="col">읽음확인</th>
                 </tr>
             </thead>
             <tbody>
             	<%for(Task t : list) {%>
                 <tr>
                     <td><input name="chkid" type="checkbox" title="checkbox" value="<%=t.getTaskNo() %>" ></td>
                     <td><%=t.getTaskNo() %></td>
                     <% String temp = "";
                     if(t.getTaskType()=="1") temp="업무 요청";
                     if(t.getTaskType()=="2") temp="업무 보고";
                     else temp="업무 일지"; %>
                     <td><%=temp %></td>
                     <td class="text-left"><a href='<%=request.getContextPath()%>/task/taskView?taskNo=<%=t.getTaskNo() %>'>
                     	<%=t.getTaskTitle() %></a>
                     </td>
                     <td><a href="#" data-toggle="modal" data-target="#myModal"><%=t.getEmpName() %></a></td>
                     <td><%=t.getEnrollDate() %></td>
                     <td><%=t.getDeadline() %></td>
                     <td><%=t.getTaskStatus() %></td>
                     <td>
                     <button class="btn btn-danger btn-xs"><%=t.getTaskCheck()==null?"읽지 않음":"읽음" %></button>
                     </td>
                 </tr>
                	<%} %>
             </tbody>
            </table>
            
            <nav class="pagination_wrap"><%=pageBar %></nav>
            <!-- /.pagination_wrap -->
            <div class="btn-wrap float-right">
                <button class="btn btn-task btn-sm" onclick="fn_goTaskWrite()">업무 등록</button>
                <%-- <% if(taskType.equals("1")) { %> --%>
                <button class="btn btn-default btn-sm">보관함 지정</button>
                <%-- <%} %> --%>
                <button class="btn btn-default btn-sm" onclick="fn_del()">삭제</button>
                <button class="btn btn-default btn-sm">업무 완료</button>
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
                        <img class="profile-user-img img-fluid img-circle" src="<%=request.getContextPath() %>/dist/img/profile.jpg" alt="User profile picture">
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
