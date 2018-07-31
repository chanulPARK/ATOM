<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="atom.dept.model.vo.Dept" %>
<%@page import="java.util.*" %>

<%
	List<Dept>dept = (List)request.getAttribute("Dept");
%>

<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/deptAside.jsp" %>






  <div class="col-sm-8 text-left"> <!-- container 영역  --> 

     <div class="container">
	
	 <div style="margin-bottom: 1%;">

   <h2>

    	부서관리<small>ATOM</small>

   </h2>

   <div>

    <ul class="nav nav-pills nav-justified">

	<%-- "<%=request.getContextPath() %>/deptInsert" --%>

     <li class="active"><a href="<%=request.getContextPath() %>/deptlist">부서목록</a></li>
     <li><a href="<%=request.getContextPath() %>/views/orgchat/admin/departmentInsert.jsp">부서추가</a></li>
     

    

    </ul>

   </div>

  </div>
	
	
	
	
	<div class="row">
 
 


 
 
 
  <div class="panel panel-default">

   <div class="panel-heading">부서 출력</div>

   <div class="panel-body">

    <table class="table">

     <thead>

      <tr>

       <th>부서 번호</th>

       <th>부서명</th>
     
       <th>부서수정</th>
      
       <th>부서삭제</th>

      </tr>

     </thead>

     <tbody>
     <%for(Dept d: dept) {%>

      <tr>

       <td><%=d.getDeptCode() %></td>

       <td><%=d.getDeptName() %></td>

       <td>
       <button id="btnDelete" type="button" class="btn btn-default btn-sm">수정</button>
       
       
       </td>

		<td>
       
       <button id="btnDelete" type="button" class="btn btn-default btn-sm">삭제</button>
       
       </td>
		


      </tr>
<%}%>
     </tbody>

    </table>



   </div>

  </div>


 </div>
 </div>



</div>


   

      <%@ include file="/views/common/footer.jsp" %>

