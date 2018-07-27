<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*, atom.board.model.vo.Board'%>

<style>
	aside{
	    text-decoration: none;
	    color:black;
	}
</style>
<script type="text/javascript">
<% 
	String[] items = {"공지사항", "자유게시판", "자료실", "설문조사", "게시판 관리"};
	String[] homes = {"notice", "collapse1", "data", "question", "collapse2"};
	List<Board> lBoard = (List<Board>)request.getAttribute("board");
	/* 	Employee e= (Employee)request.getAttribute("empLoggedIn"); */
%>
</script>
<aside id='show'>
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
            					<a href='<%=request.getContextPath()%>/board/boardList.jsp?<%=homes[i]%>'>
            						<%=items[i]%>
            					</a>
            				<%}%>
            			</h4>
            		</div>
            		<%if(i==1){%>
              	<div id='<%=homes[i]%>' class='panel-collapse collapse'>
              		<div class='panel1'>
              			<a href='<%=request.getContextPath()%>/board/boardList.jsp?dept1'>
              				부서 1팀
              			</a>
              		</div>
              		<div class='panel2'>
              			<a href='<%=request.getContextPath()%>/board/boardList.jsp?dept2'>
              				부서 2팀
              			</a>
              		</div>
              	</div>
              <%}else if(i==4){%>
              	<div id='<%=homes[i]%>' class='panel-collapse collapse'>
              		<div class='panel1'>
              			<a href='<%=request.getContextPath()%>/board/createboard.jsp'>
              				게시판 생성
              			</a>
              		</div>
              		<div class='panel2'>
              			<a href='<%=request.getContextPath()%>/board/dropboard.jsp'>
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