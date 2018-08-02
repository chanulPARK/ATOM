<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="atom.job.model.vo.Job" %>
<%@page import="java.util.*" %>

<%
	List<Job>job = (List)request.getAttribute("Job");
%>


<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/deptAside.jsp" %>


  
     <div class="col-sm-8 text-left"> <!-- container 영역  --> 

     <div class="container">
		 <div style="margin-bottom: 1%;">

   <h2>

    직급관리<small>ATOM</small>

   </h2>

   <div>

    <ul class="nav nav-pills nav-justified">

     <li class="active"><a href="<%=request.getContextPath()%>/jobList">직급목록</a></li>
     <li ><a href="<%=request.getContextPath() %>/jobInsertEnd">직급추가</a></li>
     

    

    </ul>

   </div>

  </div>
	
	<div class="row">
 


  <div class="panel panel-default">

   <div class="panel-heading">직위 출력</div>

   <div class="panel-body">

    <table class="table">

     <thead>

      <tr>

       <th>직위번호</th>
       <th>직위명</th>
       <th>직위수정</th>
       <th>직위삭제</th>

      </tr>

     </thead>

     <tbody>

	<%for(Job j: job) {%>
      <tr>

       <td><%=j.getJobCode() %></td>

       <td><%=j.getJobName() %></td>

    	<td><button type="button" class="btn btn-default btn-sm">수정</button></td>
       <td><button type="button" class="btn btn-default btn-sm">삭제</button></td>
	
	
      </tr>
	<%} %>

     </tbody>

    </table>

	<hr/>
	
		<!--페이징 -->
<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

   </div>

  </div>

 </div>

</div>	<!-- 추가 -->
</div>   <!-- 추가 -->


   

      <%@ include file="/views/common/footer.jsp" %>


  