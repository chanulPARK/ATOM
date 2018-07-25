<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, com.kh.mvc.board.vo.Board'%>
<%
	List<Board> list = (List<Board>)request.getAttribute("list");
	int cPage = (int)request.getAttribute("cPage");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>
	<div class="content">
		<div class='col-md-10'>
			<h3>공지사항</h3>
			<div class='floatleft form-group'>
        		<button type='button' class='btn btn-default'>
            		<a href='boardForm.jsp'>새 글 쓰기</a>
        		</button>
        	</div>
        	<div class='floatleft form-group'>
        		<p style='font-size:20px;'>&nbsp;전체(0)&nbsp;</p>
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
					<tr>
						<th>
							<input type='checkbox' style='width:10px;' class='checked'/>
						</th>
						<th class='text-center'>
							<span style='font-size:15px;'>
								1
							</span>
						</th>
						<th>
							<span style='font-size:15px;'>
								<a href='<%=request.getContextPath()%>/board/boardView?board_no=1'>
									관리자 첫 게시글(임시)
								</a>
							</span>
						</th>
						<th>
							<img src='' class='glyphicon glyphicon-file'>
						</th>
						<th class='text-center'>
							<span style='font-size:15px;'>
								관리자
							</span>
						</th>
						<th class='text-center'>
							<span style='font-size:15px;'>
								2018-07-25
							</span>
						</th>
						<th class='text-center'>
							<span style='font-size:15px;'>
								0
							</span>
						</th>
					</tr>
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
		        <ul class="pagination pagination-sm">
		           <%=pageBar%>
		        </ul>
		    </nav>
		</div>
    </div>
<%@ include file='/views/common/footer.jsp'%>