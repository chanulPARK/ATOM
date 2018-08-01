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
	String sortchk = (String)request.getAttribute("sortchk");
	if(sortchk == null){
		sortchk = "1";
	}
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
                <h4>결재요청함</h4>
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
	                        <form class="form-inline pull-right" style="margin-right:15px" action="<%=request.getContextPath()%>/electronic/electonicRequesetFinder">
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
                
                <table class="tableTL table table-striped">
                <colgroup>
                   <col width="1%"/>
                      <col width="3%"/>
                      <col width="10%"/>
                      <col width="3%"/>
                      <col width="25%"/>
                      <col width="4%"/>
                      <col width="5%"/>
                      <col width="7%"/>
                      <col width="4%"/>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll" aria-invalid="false"></th>
                        <th scope="col">번호</th>
                        <th scope="col">
                            	문서번호
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
                        <th scope="col">
                         	 <a data-sortcolumn="DUEDATE" href="<%=request.getContextPath()%>/electronic/approvalStateSort?sortchk=<%=sortchk%>">문서상태<%if(sortchk.equals("1")){%><i class="fa fa-caret-down"><%}else{%><i class="fa fa-caret-up"><%}%></i></a>
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
		                <%if(ea.getDraftState().equals("진행")){%>
		               	 <td><a href="<%=request.getContextPath()%>/electronic/electronicProgressView?draftNo=<%=ea.getDraftNo()%>"><%=ea.getDraftName() %></a></td>
		                <%}else{%>
		                 <td><a href="<%=request.getContextPath()%>/electronic/electronicCompletionView?draftNo=<%=ea.getDraftNo()%>"><%=ea.getDraftName() %></a></td>
		                <%}%>
						<td><%=ea.getEmpName() %></td>
		                <td><%=ea.getDraftDept() %></td>
		                <td><%=sd.format(ea.getDraftDate()) %></td>  
		                <td><%=ea.getDraftState() %></td>   <!-- 반려, 진행 -->           	
		            </tr>
	                    <!-- <tr>
	                      <td colspan="10" class="emptyRecord">검색 결과가 존재하지 않습니다.</td>
	                    </tr> -->
	                <%}
		             }else{%>
		             	<td colspan="9" class="emptyRecord">검색 결과가 존재하지 않습니다.</td>
		             <%} %>
                </tbody>
                </table>
                <nav class="pagination_wrap">
				  <ul class="pagination pagination-sm">
				  	<%=pageBar %>
				  </ul>
				</nav>		
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
    	$('#searchSelectBox').val('<%=request.getParameter("searchType")%>').attr('selected',true);
    });
    
    $('#searchSelectBox').change(function(){
    	$('#searchWord').val('');
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
	  location.href='<%=request.getContextPath()%>/electronic/electronicRequestBox?cPage=1&numPerPage='+$('#numperPage').val();
	  console.log($('#numperPage').val());
  });
  
  
    </script>
    <script src="<%=request.getContextPath()%>/dist/js/datepicker.js"></script>
    

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 -->    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
  	
<%-- <%@ include file="/views/common/footer.jsp"%> --%>