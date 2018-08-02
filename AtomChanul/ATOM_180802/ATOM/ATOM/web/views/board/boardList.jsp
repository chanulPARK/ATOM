<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.board.model.vo.Board'%>
<%@ include file="/views/common/taskAside.jsp" %>
<%
	List<Board> list = (List<Board>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	int totalContent = (int)request.getAttribute("totalContent");
%>
<script>
	var doc = document.getElementById("h3Id");
	var text = $('h4.panel-title').children().text();
	var col1 = $('div#collapse1>div.panel1').children().text();
	var col2 = $('div#collapse1>div.panel2').children().text();
	if(text=='공지사항'){
		doc.innerHTML = "공지사항";
	}
	if(col1=='부서 1팀'){
		doc.innerHTML = '부서 1팀 게시판';
	}
	if(col2=='부서 2팀'){
		doc.innerHTML = '부서 2팀 게시판';
	}
	if(text=='자료실'){
		doc.innerHTML = '자료실';
	}
	if(text=='설문조사'){
		doc.innerHTML = '설문조사';
	}
</script>
<section>
	<div class="content">
		<div class='col-md-10'>
			<h3 id='h3Id'>게시판</h3>
			<div class='floatleft form-group'>
        		<button type='button' class='btn btn-default'>
            		<a href='<%=request.getContextPath()%>/boardForm.jsp'>새 글 쓰기</a>
        		</button>
        	</div>
        	<div class='floatleft form-group'>
        		<p style='font-size:20px;'>&nbsp;전체(<%=totalContent%>)&nbsp;</p>
        	</div>
        	<div class='floatleft form-group'>
        		<select class='form-control'>
            		<option>10</option>
            		<option>15</option>
            		<option>20</option>
        		</select>
    		</div>
		    <div class='floatright form-group'>
		        <button type='button' class='btn btn-primary'>검색</button>
		    </div>
		    <div class='floatright form-group'>
		        <input type='text' class='form-control'>
		    </div>
		    <div class='floatright form-group'>
		        <select class='form-control'>
		             <option>제목</option>
		             <option>작성일</option>
		             <option>작성자</option>
		        </select>
		    </div>
			<table class='table table-hover'>
				<colgroup>
		            <col style="width:10px;"/>
		            <col style="width:50px;"/>
		            <col style="min-width:180px;"/>
		            <col style="width:10px;"/>
		            <col style="width:120px;"/>
		            <col style="width:120px;"/>
		            <col style="width:60px;"/>
		        </colgroup>
		        <thead>
					<tr>
						<th scope='col' class='text-center'>
							<input type='checkbox' style='width:10px;' id='allCheck'/>
							<script>
								
							</script>
						</th>
						<th scope='col' class='text-center'>
							<span style='font-size:15px;'>
								번호
							</span>
						</th>
						<th scope='col' class='text-center'>
							<span style='font-size:15px;'>
								제목
							</span>
						</th>
						<th scope='col' class='text-center'>
							<img src='' class='glyphicon glyphicon-file'>
						</th>
						<th scope='col' class='text-center'>
							<span style='font-size:15px;'>
								작성자
							</span>
						</th>
						<th scope='col' class='text-center'>
							<span style='font-size:15px;'>
								작성일
							</span>
						</th>
						<th scope='col' class='text-center'>
							<span style='font-size:15px;'>
								조회수
							</span>
						</th>
					</tr>
				</thead>
				<tbody class='table-condensed'>
					<%for(Board b : list) {%>
						<tr>
							<td><input type='checkbox' style='width:10px;'/></td>
							<td class='text-center'><%=b.getBoardNo()%></td>
							<td>
								<a href='<%=request.getContextPath()%>/board/boardView?board_no=<%=b.getBoardNo()%>'>
									<%=b.getTitle()%>
								</a>
							</td>
							<td>
			<%--  					<%if(b.getOriginalFileName()!=null){%> --%>
									<img src='<%=request.getContextPath()%>/dist/images/file.org'
									alt='첨부파일' width='16px'/>
			<%-- 					<%} %> --%>
							</td>
							<td class='text-center'><%=b.getWriter() %></td>
							<td class='text-center'><%=b.getWriteDate() %></td>
							<td class='text-center'><%=b.getVisits()%></td>
						</tr>
					<%} %>
				</tbody>
			</table>
			<nav style="text-align: center">
		        <div class="pagination pagination-sm btn-group">
		           <%=pageBar%>
		        </div>
		    </nav>
		</div>
    </div>
</section>
<%@ include file='/views/common/footer.jsp'%>