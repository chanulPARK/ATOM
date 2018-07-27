<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/boardHeader.jsp" %>
<style>
	aside{
	    text-decoration: none;
	    color:black;
	}
</style>
<aside>
	        <div class="content-fluid">
	            <div class="panel-group">
	                <div class="panel panel-default">
	                	<%for(int i=0;i<items.length;i++){%>
	                		<div class='panel-heading'>
	                			<h4 class='panel-title'>
	                				<%if(i==1 || i==4){%>
	                					<a data-toggle='collapse' href='#<%=homes[i]%>'>
	                						<%=items[i]%>
	                					</a>
	                				<%}else{%>
	                					<a href='<%=request.getContextPath()%>/board/boardList?<%=homes[i]%>'>
	                						<%=items[i]%>
	                					</a>
	                				<%}%>
	                			</h4>
	                		</div>
	                		<%if(i==1){%>
			                	<div id='<%=homes[i]%>' class='panel-collapse collapse'>
			                		<div class='panel1'>
			                			<a href='<%=request.getContextPath()%>/board/boardList?dept1'>
			                				부서 1팀
			                			</a>
			                		</div>
			                		<div class='panel2'>
			                			<a href='<%=request.getContextPath()%>/board/boardList?dept2'>
			                				부서 2팀
			                			</a>
			                		</div>
			                	</div>
			                <%}else if(i==4){%>
			                	<div id='<%=homes[i]%>' class='panel-collapse collapse'>
			                		<div class='panel1'>
			                			<a href='<%=request.getContextPath()%>/board/createboard'>
			                				게시판 생성
			                			</a>
			                		</div>
			                		<div class='panel2'>
			                			<a href='<%=request.getContextPath()%>/board/dropboard'>
			                				게시판 삭제
			                			</a>
			                		</div>
			                	</div>
			                <%} %>
	                  <%} %>
	                  <script>
	                  	$('#collapse1').click(function(){
	                  		$('.panel1').toggle("slow");
	                  		$('.panel2').toggle("slow");
	                  	});
	                  	$('#collapse2').click(function(){
	                  		$('.panel1').toggle("slow");
	                  		$('.panel2').toggle("slow");
	                  	});
	                  </script>
	                </div>
	            </div>
	        </div>
</aside>
<section>