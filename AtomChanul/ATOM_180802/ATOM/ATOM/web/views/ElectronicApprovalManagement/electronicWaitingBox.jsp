<%@page import="java.text.SimpleDateFormat"%>
<%@page import="atom.electronic.model.vo.ElectronicApproval"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/approvalAside.jsp"%>
<%
	ArrayList<ElectronicApproval> list = (ArrayList)request.getAttribute("list");
SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-dd HH:mm");

	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	int totalContent=(int)request.getAttribute("totalContent");
	String pageBar=(String)request.getAttribute("pageBar");
%>

<head>
<!-- 데이트피커 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>\dist\css\datepicker.css">
	<style>
	/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width:100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover{
  background: rgb(222, 226, 230);
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
  /* background-color: green; */
  color: #818181;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  /* display: none; */
  background-color:  #f1f1f1;
  padding-left: 8px;
}

.sidemenu{
  border-top: 1px solid #fafafa;

}

/* Optional: Style the caret down icon */
aside .fa-caret-down {
  float: right;
  padding-right: 8px;
}

.row-header{
  margin : 0;
}

.search_btn{
  padding: 4% 0%;
}


.search-wrap th{
  padding-right: 1em;
  text-align: right;
}

.search-wrap{
  background-color: #f1f1f1;
}

#listTable th{
  text-align: center;
}
	
#listTable td{
 text-overflow:ellipsis;
 overflow:hidden;
  white-space:nowrap;
}

  .float-right{
            float: right;
        }
        .tableTL{
            margin: 0;
        }
        .tableTL thead tr th{
            font-weight: bold;
            font-size: 13px;
            text-align: center;
        }
        .tableTL tbody tr td{
            font-size: 13px;
            text-align: center;
        }
        .table-header{
            border-top: 1px solid rgb(192, 192, 192);
            padding-top: 8px;
            border-bottom: 2px solid rgb(192, 192, 192);
            padding-bottom: 8px;
        }
        .table-header div.row div{
            padding: 1px;
        }
        .pagination_wrap{
            text-align: center;
            border-top: 1px solid rgb(192, 192, 192);
            padding-top: 8px;
            border-bottom: 1px solid rgb(192, 192, 192);
            padding-bottom: 8px;
        }
        .pagination{
            margin: 0;
            vertical-align: middle;
        }
        .btn-wrap{
            margin: 10px 0;
        }

	
	</style>
</head>


	<section>
        <div class="content">
            <div class="col-md-12">
                <h4>결재대기함</h4>
                <div class="table-header">
                    <div class="row">
                        <div class="col-md-1" style="width: 45px; margin: 0 0 0 15px;">
                            <select id="numperPage" class="form-control input-sm" style="padding: 0">
                                <option value="10" selected="selected">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                                <option value="40">40</option>
                                <option value="50">50</option>
                            </select>
                        </div>
                        <div class="col-md-1" style="margin: 0 0 0 10px;"><p style="font-size: 12px; color: rgb(160, 160, 160); margin: 6px 0px;">전체 <%=totalContent%></p></div>
						<div class="col-md-10 pull-right">
	                        <form class="form-inline pull-right" style="margin-right:15px" action="<%=request.getContextPath()%>/electronic/electonicWaitingFinder">
                                <input id="FromDate" name="FromDate" class="form-control input-sm" placeholder="From" value=""><button  type="button" class="btn btn-default"><i class="glyphicon glyphicon-calendar"></i></button>
                                &nbsp;~&nbsp;
                                <input id="ToDate" name="ToDate" class="form-control input-sm" placeholder="To"><button type="button" class="btn btn-default"><i class="glyphicon glyphicon-calendar"></i></button>
                                <select id="searchSelectBox" name="searchType" class="form-control input-sm" style="padding: 0">
                                    <option value="searchUser">기안자</option>
                                    <option value="searchTitle">제목</option>
                                    <option value="searchTContents">기안내용</option>
                                </select>
                                <input id="searchWord" name="searchWord" type="text" class="form-control input-sm" value="<%if(request.getParameter("searchWord")!=null){%><%=request.getParameter("searchWord")%><%}%>" placeholder="검색어">
                                <button type="submit" class="btn btn-primary btn-sm floa">검색</button>
	                        </form>
                        </div>
                    </div> 
                </div>
         <form class="" action="<%=request.getContextPath()%>/electronic/selectApproval" method="post" style="margin:0">
                
                <table class="tableTL table table-striped">
                <colgroup>
                   <col width="1%"/>
                      <col width="2%"/>
                      <col width="10%"/>
                      <col width="2%"/>
                      <col width="25%"/>
                      <col width="4%"/>
                      <col width="5%"/>
                      <col width="6%"/>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll" aria-invalid="false"></th>
                        <th scope="col">번호</th>
                        <th scope="col">
                            	문서 번호
                        </th>
                        <th scope="col">유형</th>
                        <th scope="col">
                           	 제목
                        </th>
                        <th scope="col">
                          	 기안자
                        </th>
                        <th scope="col">
                         	   기안부서
                        </th>
                        <th scope="col">
                            	기안날짜
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%if(list.size()!=0){
	                    for(ElectronicApproval ea : list){ %>
		               	<tr>
		 					<td><input name="allCheck" id="allCheck" title="checkbox" type="checkbox" value="<%=ea.getDraftNo()%>" /></td>
			                <td><%=ea.getPageNo()%></td>
			                <td><%=ea.getDraftNo() %></td>
			                <td>결재</td>
			                <td><a href="<%=request.getContextPath()%>/electronic/electronicWaitingView?draftNo=<%=ea.getDraftNo()%>"><%=ea.getDraftName() %></a></td>
							<td><%=ea.getEmpName() %></td>
			                <td><%=ea.getDraftDept() %></td>
			                <td><%=sd.format(ea.getDraftDate()) %></td>                	
			            </tr>
		                    <!-- <tr>
		                      <td colspan="10" class="emptyRecord">검색 결과가 존재하지 않습니다.</td>
		                    </tr> -->
		                <%}
		             }else{%>
		             	<td colspan="8" class="emptyRecord">검색 결과가 존재하지 않습니다.</td>
		             <%} %>
                </tbody>
                </table>
                <nav class="pagination_wrap">
				  <ul class="pagination pagination-sm">
				  	<%=pageBar %>
				  </ul>
				</nav>		
				<button type="button" class="btn btn-primary pull-right" id="selectApproval" style="margin-top:15px;"  data-toggle="modal" data-target="#approvalModal">선택 결재 </button>
						
				<!-- approvalModal -->
             <div id="approvalModal" class="modal fade" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
<%-- 			<form class="" action="<%=request.getContextPath()%>/electronic/ellectonicApprovalSystem" method="post" style="margin:0">
 --%>                
                <div class="modal-content">
                  <div class="modal-header" style = "background-color:white;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">결재 처리</h4>
                  </div>

                  <div class="modal-body">
                  	<div class="row">
                      <div class="col-md-12">
                          <table class="table" style="font-size:1em;margin:0">
                            <colgroup>
        	      							<col style="width: 5%;"/>
        	      							<col style="width: 35%;"/>
        	      						</colgroup>
                      			<tr>
                      				<th style="background-color:#f9f9f9;">결재처리</th>
                              <td>
                                <label for="approve"><input id="approve" type="radio" name="appr" value="승인" style="margin-right:3px;" checked>승인</label>&nbsp;
                                <label for="reject"><input id="reject" type="radio" name="appr" value="반려" style="margin-right:3px;">반려</label>
                              </td>
                      			</tr>
                      			<tr>
                              <th style="vertical-align:middle;background-color:#f9f9f9;">결재의견</th>
                              <td>
                                <textarea style="resize: none;" name="apprComment" class="form-Control"rows="10" cols="60">At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies. </textarea>
                              </td>
                      			</tr>
                      		</table>
                  	</div>
                    	</div>
                  </div> <!-- modal-body -->
					
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-sm">결재</button>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
                  </div>
                </div>
                        </form>

              </div> <%-- modal-dialog --%>
            </div>
				
                
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.content -->
       

    </section>
    <script>
    $(function(){
    	$('#FromDate').datepicker();
    	$('#ToDate').datepicker();
    	$('#numperPage').val('<%=numPerPage%>');
    	if(<%=request.getParameter("searchType")%> != null)
    	$('#searchSelectBox').val('<%=request.getParameter("searchType")%>').attr('selected',true);    });
    
    
    var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
  }
  
  $('#numperPage').change(function(){
	  location.href='<%=request.getContextPath()%>/electronic/electronicWaitingBox?cPage=1&numPerPage='+$('#numperPage').val();
	  console.log($('#numperPage').val());
  });
  
  $("#checkAll").change(function(){
      if($("#checkAll").is(":checked")){
    	  $("input[type=checkbox]").prop("checked",true);
      }else{
    	  $("input[type=checkbox]").prop("checked",false);
      }
  });
  
  $('input[name="allCheck"]').change(function(){
	  if($('input[name="allCheck"]').is(":checked")){
		  console.log('dd');
	  }else{
		  console.log('ㅠㅠ');
		  $("#checkAll").attr("checked",false);
	  }
  });
  $('#selectApproval').click(function(){
	  var checklist = new Array();
	  $('input:checkbox[name=allCheck]').each(function() {
	         if($(this).is(':checked')){
	            checklist.push($(this).val());
	         }
	  });
	  if(checklist.length != 0){
	  }else{
		  alert("선택된 문서가 없습니다.");
		  location.href="";
	  }
  });
  
    </script>
        <script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>
    

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 -->    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
  	
<%-- <%@ include file="/views/common/footer.jsp"%> --%>