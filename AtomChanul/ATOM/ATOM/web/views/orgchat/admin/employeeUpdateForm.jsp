<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@page import="atom.employee.model.vo.Employee"%>
<%@page import="java.util.*"%>

<%
	List<Employee>emp = (List)request.getAttribute("Employee");
%>


<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/deptAside.jsp" %>

 
    
<%--   <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src='<%=request.getContextPath()%>/dist/js/bootstrap.min.js'></script>    --%>
    
    
    
 <div class="col-sm-8 text-left"> <!-- container 영역  --> 

     <div class="container">
		 <div style="margin-bottom: 1%;">

   <h2>

    	직원정보<small>ATOM</small>
	
   </h2>

   <div>

    <ul class="nav nav-pills nav-justified">
     
    <%-- <%=request.getContextPath() %> --%>
     
     <li id='emplist' class="active"><a href="<%=request.getContextPath() %>/emp/selectAll">전체직원정보</a></li>
 	 <li><a href="<%=request.getContextPath() %>/views/orgchat/admin/employeeInsertForm.jsp">직원 추가</a></li>
     <li><a href="#">직원수정</a></li>
     <li><a href="#">직원삭제</a></li>
    
    </ul>

   </div>

  </div>
	
	
	<div class="row">

   
   
    <!-- <section class="content"> -->
  <div class="panel-group">

   <div class="panel panel-default">

    <div class="panel-heading">직원 출력</div>

    <div class="panel-body">

     <form class="form-inline" role="form" method="post">

      <select class="form-control" id="searchKey" name="searchKey">

       <option value="0">사원번호</option>

       <option value="1">이름</option>


       <option value="2">부서</option>

       <option value="3">직위</option>

      </select> <label for="name"></label> <input type="text"

       class="form-control" id="searchValue" name="searchValue"

       required="required">

      <button type="submit" class="btn btn-default">

       <span class="glyphicon glyphicon-search"></span> Search

      </button>

     </form>



	



     <table id="mytable" class="table table-bordred table-striped">

      <thead>

       
       <th><input type="checkbox" id="checkall"/></th>
        <th>사원번호</th>
        
        <th>이름</th>
        
        <th>셍년월일</th>

        <th>이메일</th>

        <th>전화번호</th>

        <th>주소</th>

        <th>부서명</th>

        <th>직위명</th>

        <th>관리자번호</th>

        <th>입사일</th>

        <th>재직여부</th>

        <th>사진등록</th>

        <th>자기소개</th>
		
		<th>수정</th>
		<th>삭제</th>

      </thead>

      <tbody>

		<%for(Employee e: emp){%>
       
       <tr>
		<td><input type="checkbox" class="checkthis"></td>	
        <td><%=e.getEmpId()%></td>

        <td><%=e.getEmpName() %>

         <button type="button" class="btn btn-default btn-xs"

          data-toggle="modal" data-target="#myModal">사진</button>

        </td>

        <td><%=e.getEmpRrn() %></td>		<!-- 생년 월일 -->

        <td><%=e.getEmail() %></td>

        <td><%=e.getPhone() %></td>

        <td><%=e.getAddr() %></td>

        <td><%=e.getDeptCode() %></td>
		
        <td><%=e.getJobCode() %></td>

        <td><%=e.getAdminCode() %></td>

        <td><%=e.getHireDate() %></td>

        <td><%=e.getEntYn() %></td>

        <td><button type="button" class="btn btn-default btn-xs">사진등록</button></td>

       <td>

         <button type="button" class="btn btn-default btn-xs"

          data-toggle="modal" data-target="#PR" value="<%=e.getEmpRrn() %>">보기</button>
		
        </td>
       
       <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
       
       
       
       </tr>
<%}%>       


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



     <form class="form-inline" role="form" method="post">

      <a href="<%=request.getContextPath()%>/views/orgchat/admin/employeeInsertForm.jsp" class="btn btn-default">Add</a>
	

      <button type="button" class="btn btn-default">

       Count <span class="badge">1</span>

      </button>

     </form>



    </div>

   </div>

  </div>



<!-- </section> -->
</div>  <!-- 위에 두개 뭐지 -->

</div>
</div>


  <div id="myModal" class="modal fade" role="dialog">

   <div class="modal-dialog modal-sm">



    <!-- Modal content-->

    <div class="modal-content">

     <div class="modal-header">

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      <h4 class="modal-title"></h4>

     </div>

     <div class="modal-body">

      <div style="text-align: center;">

       <img src="images/hong.jpg" width="100%">

      </div>

     </div>

     <div class="modal-footer">

      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

     </div>

    </div>

   </div>

  </div>


<!-- 자기소개 모달 적용하기-->

  <div id="PR" class="modal fade" role="dialog">

   <div class="modal-dialog modal-sm">



    <!-- Modal content-->

    <div class="modal-content">

     <div class="modal-header">

      <button type="button" class="close" data-dismiss="modal">&times;</button>

      <h4 class="modal-title"></h4>

     </div>

     <div class="modal-body">

      <div style="text-align: center;">

      	<!-- 자기소개 양식 넣기 -->
      <!--  <img src="images/hong.jpg" width="100%"> -->
      <p><mark>자기 소개를 입력하세요</mark><br>
      	 이건 일단..
      </p>

      </div>

     </div>

     <div class="modal-footer">

      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

     </div>

    </div>
		
   </div>
  </div>


      <%@ include file="/views/common/footer.jsp" %>



 