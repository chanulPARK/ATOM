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
                                    <option value="searchTContents">업무내용</option>
                                </select>
                                <input type="text" class="form-control input-sm" placeholder="검색어">
                                <button type="submit" class="btn btn-primary btn-sm floa">검색</button>
                            </div>
                        </form>
                    </div> 
                </div>

                <table class="table table-striped">
	                <colgroup>
	                    <col style="width: 40px;">
	                    <col style="width: 50px;">
	                    <col style="width: 120px;">
	                    <col style="min-width: 200px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col"><input id="checkAll" name="" type="checkbox" value="" title="checkAll" aria-invalid="false"></th>
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
	                            <a data-sortcolumn="DUEDATE" href="#">마감일<i class="glyphicon glyphicon-triangle-top"></i></a>
	                        </th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<%for(Task t : list) {%>
	                    <tr>
	                        <td><input type="checkbox" title="checkbox" value="" ></td>
	                        <td><%=t.getTaskNo() %></td>
	                        <td><%=t.getCategory() %></td>
	                        <td class="text-left"><%=t.getTitle() %></td>
	                        <td><a href="#" data-toggle="modal" data-target="#myModal"><%=t.getEmpName() %></a></td>
	                        <td><%=t.getEnrollDate() %></td>
	                        <td><%=t.getReportDate() %></td>
	                    </tr>
	                   	<%} %>
	                </tbody>
                </table>
                
                <nav class="pagination_wrap"><%=pageBar %></nav>
                <!-- /.pagination_wrap -->
                <div class="btn-wrap">
                    <button class="btn btn-primary btn-sm" onclick="location='write.html'">업무 등록</button>
                    <button class="btn btn-primary btn-sm">업무 삭제</button>
                </div>
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.content -->
    </section>


<%@ include file="/views/common/footer.jsp" %>
