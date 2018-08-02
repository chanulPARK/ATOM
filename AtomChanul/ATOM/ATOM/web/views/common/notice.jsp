<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.board.model.vo.*'%>
<%@ include file="/views/common/header.jsp" %>
<%
	List<Board> list = (List<Board>)request.getAttribute("list");
	int totalContent = (int)request.getAttribute("totalContent");
%>
<script>
</script>
<section>
	<div class="content">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a href='<%=request.getContextPath()%>/board/boardList?&menu=NOTICE&cPage=1'
						   style="color:black">
							공지사항 (전체 공짓글 : <%=totalContent%>개)
						</a>
					</div>
					<div class="panel-body">
                         	<%for(Board b : list){%>
                      		<div>
                       			<a style="color:black; background-color:beige;"
                      			href='<%=request.getContextPath()%>/board/boardView?board_no=<%=b.getBoardNo()%>'>
									<%=b.getTitle()%>		-- <%=b.getWriteDate()%>
								</a><br>
							</div>
                            <%} %>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>