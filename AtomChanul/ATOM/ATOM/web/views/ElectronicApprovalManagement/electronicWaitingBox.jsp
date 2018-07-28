<%@page import="atom.electronic.model.vo.ElectronicApproval"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/approvalAside.jsp"%>
<%
	ArrayList<ElectronicApproval> list = (ArrayList)request.getAttribute("list");
	int cPage=(int)request.getAttribute("cPage");
	int numPerPage=(int)request.getAttribute("numPerPage");
	int totalContent=(int)request.getAttribute("totalContent");
	String pageBar=(String)request.getAttribute("pageBar");
%>

<head>
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
	                        <form class="form-inline pull-right" style="margin-right:15px" action="">
                                <input class="form-control input-sm" placeholder="From" value=""><button type="button" class="btn btn-default"><i class="glyphicon glyphicon-calendar"></i></button>
                                &nbsp;~&nbsp;
                                <input class="form-control input-sm" placeholder="To"><button type="button" class="btn btn-default"><i class="glyphicon glyphicon-calendar"></i></button>
                                <select class="form-control input-sm" style="padding: 0">
                                    <option value="searchUser">기안자</option>
                                    <option value="searchTitle">제목</option>
                                    <option value="searchTContents">기안내용</option>
                                </select>
                                <input type="text" class="form-control input-sm" placeholder="검색어">
                                <button type="submit" class="btn btn-primary btn-sm floa">검색</button>
	                        </form>
                        </div>
                    </div> 
                </div>
                
                <table class="tableTL table table-striped">
                <colgroup>
                   <col width="1%"/>
                      <col width="2%"/>
                      <col width="5%"/>
                      <col width="2%"/>
                      <col width="25%"/>
                      <col width="4%"/>
                      <col width="5%"/>
                      <col width="5%"/>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll" aria-invalid="false"></th>
                        <th scope="col">번호</th>
                        <th scope="col">
                            <a data-sortcolumn="FOLDER" href="#">문서 번호<i class="glyphicon glyphicon-triangle-top"></i></a>
                        </th>
                        <th scope="col">유형</th>
                        <th scope="col">
                            <a data-sortcolumn="REGISTERNAME" href="#">제목<i class="glyphicon glyphicon-triangle-top"></i></a>
                        </th>
                        <th scope="col">
                            <a data-sortcolumn="INSERTDATE" href="#">기안자<i class="glyphicon glyphicon-triangle-top"></i></a>
                        </th>
                        <th scope="col">
                            <a data-sortcolumn="DUEDATE" href="#">기안부서<i class="glyphicon glyphicon-triangle-top"></i></a>
                        </th>
                        <th scope="col">
                            <a data-sortcolumn="DUEDATE" href="#">기안날짜<i class="glyphicon glyphicon-triangle-top"></i></a>
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
			                <td><%=ea.getDraftDate() %></td>                	
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
				            <button type="button" class="btn btn-primary pull-right" id="allApproval" style="margin-top:15px;">일괄 결재 </button>
						
				
                
            </div>
            <!-- /.col-md-12 -->
        </div>
        <!-- /.content -->
       

    </section>
    <script>
    $(function(){
    	$('#numperPage').val('<%=numPerPage%>');
    });
    
    
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
  
    </script>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 -->    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
  	
<%-- <%@ include file="/views/common/footer.jsp"%> --%>