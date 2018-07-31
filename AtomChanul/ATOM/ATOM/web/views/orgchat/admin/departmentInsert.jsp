<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %> <!-- 정적 처리방식 -->
 <%@ include file="/views/common/deptAside.jsp" %>

<!-- <script type="text/javascript">

$(function() {
 //부서 입력 액션 -> 부서명 빈 항목 검사
 $("#deptAdd").click(function(){
  if($("#departmentName").val()=="") {
   $("#errorMsg").html("부서명을 입력하세요.");
  } else {
   $("#myForm").attr("action", "/deptinsert");
   $("#myForm").submit();
  }
 });
 
 
 //부서 수정 액션 -> 부서번호(기존), 부서명(신규) 빈 항목 검사
 $("#btnModify").click(function(){
  if($("#departmentName").val()=="" || $("#departmentId").val()=="") {
   $("#errorMsg").html("부서번호, 부서명을 입력하세요.");
  } else {
   $("#myForm").attr("action", "DepartmentUpdate.it");
   $("#myForm").submit();
  }
 });
 
 //삭제버튼 액션 추가
 $(".btnDelete").click(function(){
  var text = $(this).parent().parent().find("td:first").text();
  if(confirm(text+"번 부서를 삭제할까요?")){
   /* 요청 주소에서 .jsp 사용 금지 */
   $(location).attr("href","DepartmentDelete.it?departmentId="+text);
  }
 });
});
</script>


 -->


 
    <div class="col-sm-8 text-left"> <!-- container 영역  --> 

     <div class="container">
	
	 <div style="margin-bottom: 1%;">

   <h2>

    	부서관리<small>ATOM</small>

   </h2>

   <div>

    <ul class="nav nav-pills nav-justified">

     <li class="active"><a href="departmentList.jsp">부서목록</a></li>
     <li><a href="departmentInsert.jsp">부서추가</a></li>
     <li><a href="#">부서수정</a></li>
     <li><a href="#">부서삭제</a></li>


    

    </ul>

   </div>

  </div>
	
	
	
	
	<div class="row">
 
 

  <div class="panel panel-default">

   <div class="panel-heading">부서 입력</div>

   <div class="panel-body" id="demo">

    <form role="form" action="<%=request.getContextPath() %>/deptInsert" method="post">

     <div class="form-group">

      <input type="text" class="form-control" id="deptName" name="deptName"
      
       placeholder="부서명 (30자 이내)" maxlength="30" required="required">

     </div>

     <button type="submit" class="btn btn-default">Submit</button>

    </form>



   </div>

  </div>

 
 
<!--  
  <div class="panel panel-default">

   <div class="panel-heading">부서 출력</div>

   <div class="panel-body">

    <table class="table">

     <thead>

      <tr>

       <th>부서 번호</th>

       <th>부서명</th>
		
       <th>부서삭제</th>

      </tr>

     </thead>

     <tbody>

      <tr>

       <td>1</td>

       <td>개발부</td>

       <td><button type="button" class="btn btn-default btn-sm">Delete</button></td>

      </tr>

     </tbody>

    </table>



   </div>

  </div> -->


 </div>
 </div>



</div>


   

      <%@ include file="/views/common/footer.jsp" %>


