<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.board.model.vo.*'%>
<%
	Board board = (Board)request.getAttribute("board");
	String pageBar = (String)request.getAttribute("pageBar");
	List<Board> list = (List<Board>)request.getAttribute("list");
	System.out.print("llll"+list);
	int cPage = (int)request.getAttribute("cPage");
	int totalContent = (int)request.getAttribute("totalContent");
	int numPerPage = (int)request.getAttribute("numPerPage");
%>
<style>
	tr>th, tr>td:nth-child(1){
		width:30px;
	}
</style>
<script>
<%-- 	function fn_goBoard(){
		location.href="<%=request.getContextPath()%>/board/boardForm";
	} --%>
</script>
<%@ include file='/views/common/boardAside.jsp'%>
<section>
		<div class="content">
			<div class='col-md-10'>
				<h3>게시판</h3>
				<div class='form-group'>
					<div class='floatleft'>
					    <button type='button' class='btn btn-default'>
					       <a href='<%=request.getContextPath()%>/board/boardForm'>새 글 쓰기</a>
					    </button>
					</div>
					<div class='floatleft'>
					    <p style='font-size:20px;'>&nbsp;전체(<%=totalContent%>)&nbsp;</p>
					</div>
				</div>
				<div class='form-group'>
				    <div class='floatright'>
						<button type='submit' class='btn btn-primary'>검색</button>
					</div>
				    <div class='floatright'>
				    	<div id='search-title'>
						    <form action="<%=request.getContextPath()%>/boardFinder">
						    	<input type='hidden' name='searchType' value='title'/>
						    	<input type='text' name='searchKeyword' 
						    	size=25 placeholder="검색할 제목 입력" class='form-control'>
						    	<input type='hidden' name='cPage' value="<%=cPage%>"/>
						    	<input type='hidden' name='numPerPage' value="<%=numPerPage%>"/>
						    </form>
						</div>
					</div>
					<div class='floatright'>
						<select class='form-control' id='searchType'>
						    <option value='title'>제목</option>
						    <option value='writer'>작성자</option>
						</select>
					</div>
				</div>
					<table class='table table-hover'>
								<colgroup>
						            <col/>
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
										<input type='checkbox' style='width:10px;'
												  id='allCheck' name='allCheck'/>
										<script>
											$("#allCheck").click(function(){
												if($('#allCheck').prop("checked")){
													$("input[name=checked]").prop("checked", true);
												}
												else{
													$('input[name=checked]').prop("checked", false);
												}
											});
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
										<td><input type='checkbox' style='width:10px;'
													   name='checked'/></td>
										<td class='text-center'>
											<%=b.getBoardNo()%>
										</td>
										<td>
											<a href='<%=request.getContextPath()%>/board/boardView?board_no=<%=b.getBoardNo()%>'>
												<%=b.getTitle()%>
											</a>
										</td>
										<td>
				<%-- 			      				<%if(b.getOriginalFileName()!=null){%> --%>
												<img src='<%=request.getContextPath()%>/dist/images/file.org'
												alt='' width='16px'/>
				<%-- 			     				<%} %> --%>
										</td>
										<td class='text-center'><%=b.getWriter() %></td>
										<td class='text-center'><%=b.getWriteDate() %></td>
										<td class='text-center'><%=b.getVisits()%></td>
									</tr>
								<%} %>
							</tbody>
						 </table>
						 <nav style="text-align: center">
						     <div id='pageBar' class="pagination pagination-sm btn-group">
						        <%=pageBar%>
						     </div>
						 </nav>
			</div>
		</div>
</section>
<%@ include file='/views/common/footer.jsp'%>