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
     <li ><a href="<%=request.getContextPath() %>/views/orgchat/admin/jobInsert.jsp">직급추가</a></li>
     <li><a href="PositionList.jsp">직급수정</a></li>
     <li><a href="PositionList.jsp">직원삭제</a></li>

    

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


       <th></th>

      </tr>

     </thead>

     <tbody>

	<%for(Job j: job) {%>
      <tr>

       <td><%=j.getJobCode() %></td>

       <td><%=j.getJobName() %></td>

  

       <td><button type="button" class="btn btn-default btn-sm">Delete</button></td>

      </tr>
	<%} %>

     </tbody>

    </table>



   </div>

  </div>

 </div>

</div>	<!-- 추가 -->
</div>   <!-- 추가 -->


   

      <%@ include file="/views/common/footer.jsp" %>


  