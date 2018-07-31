<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
    <style>
        * {box-sizing: border-box; font-family: 'Nanum Gothic', sans-serif;}
        body ,header{margin: 0px;}
        header{
            color: #fff!important;
            /* border-bottom: 1px solid rgb(153, 153, 153); */
            height: 52px;
            position: relative;
            display: block;
        }
        aside{
        	margin-top:0;
            left: 0px;
            width: 250px;
            height: 300px;
            display: block;
            position: absolute;
            border-bottom: solid 1px rgb(222, 226, 230);
            /* aside역영 확인을 위한 배경색 */
            /* background: rgb(247, 247, 247); */
        }
        section{
            padding: 20px;
            /* padding-left: 20px;
            padding-right: 20px; */
            background: rgb(255, 255, 255);
            border-left: 1px solid rgb(222, 226, 230);
            width: 100%-250px;
            /* height: 500px; */
            margin-left: 250px;
            min-height: 675px;
            display: block;
            /* aside역영 확인을 위한 배경색 */
            /* background : palegreen; */
        }
        footer{
            width: 100%;
            height: 40px;
            border-top: 1px solid rgb(222, 226, 230);
            display: block;
        }
        footer > p{
            font-size: 12px;
            text-align: end;
            color: rgb(153, 153, 153);
        }

        aside div.leftmenu_top {
            background: #353b47;
            color: #fff;
            text-align: center;
            height: 50px;
        }
        aside div.leftmenu_top h3{
            padding-top: 10px;
            margin: 0;
        }
        aside div.leftmenu_top h3 a{
            font-size: 20px;
            text-decoration: none;
            padding: 0 10px;
        }
        aside div.leftmenu_top h3 a:hover{
            text-decoration: none;
            color: #fff;
        }
        aside div.leftmenu_top h3 a:active{
            text-decoration: none;
            color: #fff;
        }
        aside div.leftmenu_top h3 a:visited{
            text-decoration: none;
            color: #fff;
        }
        aside div.leftmenu_top h3 a:link{
            text-decoration: none;
            color: #fff;
        }
        .leftmenu-btn{
            padding: 10px;
        }
        /* .a_default:hover{
            text-decoration: none;
            color: #000;
        }
        .a_default:active{
            text-decoration: none;
            color: #000;
        }
        .a_default:visited{
            text-decoration: none;
            color: #000;
        }
        .a_default:link{
            text-decoration: none;
            color: #000;
        } */
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
    
<%-- <aside>
      <div class="sidenav">
        <div class="sidemenu">
          <button class="dropdown-btn">기안
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="<%=request.getContextPath()%>/electronic/electronicApprovalForm">기안문작성</a>
            <a href="<%=request.getContextPath()%>/electronic/electronicRequestBox">결재요청함</a> <!-- 내가 기안한 문서  -->
          </div>
        </div>
        <div class="sidemenu">
          <button class="dropdown-btn">결재
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-container">
            <a href="<%=request.getContextPath()%>/electronic/electronicWaitingBox">결재대기함</a> <!-- 내가 결재자이고 현재 결재해야할 단계 -->
            <a href="<%=request.getContextPath()%>/electronic/electronicProgressBox">결재진행함</a> <!-- 내가 결재한 문서이고 문서가 진행중 일 때 -->
            <a href="<%=request.getContextPath()%>/electronic/electronicCompletionBox">완료문서함</a> <!-- 내가 기안한문서 or 결재한 문서가 종결 되었을 때 -->
            <a href="<%=request.getContextPath()%>/electronic/electronicReturnBox">반려문서함</a> <!-- 내가 기안한문서 or 내가 결재한 문서가 반려 되었을 때 -->
          </div>
        </div>
      </div>
    </aside> --%>
    
      <aside>
        <div class="leftmenu_top">
            <h3>
               	 전자결재
            </h3>
        </div>
        <div class="leftmenu-btn">
            <a class="btn btn-default btn-block" href="<%=request.getContextPath()%>/electronic/electronicApprovalForm" role="button">기안문 작성</a>
        </div>
        <div class="leftmenu_area">
            <div class="list-group">
                <a class="list-group-item" data-toggle="collapse" href="#collapse1" aria-expanded="true">기안</a>
                    <div id="collapse1" class="panel-collapse collapse in list-group">
                        <a href="<%=request.getContextPath()%>/electronic/electronicApprovalForm" class="list-group-item">- 기안문 작성
                        </a>
                        <a href="<%=request.getContextPath()%>/electronic/electronicRequestBox" class="list-group-item">- 결재요청함
                            <span id="requestCount" class="badge"></span>
                        </a>
                    </div>
                <a class="list-group-item" data-toggle="collapse" href="#collapse4" aria-expanded="true">결재</a>
                    <div id="collapse4" class="panel-collapse collapse in list-group">
                        <a href="<%=request.getContextPath()%>/electronic/electronicWaitingBox" class="list-group-item">- 결재대기함
                            <span id="waitCount" class="badge"></span>
                        </a>
                        <a href="<%=request.getContextPath()%>/electronic/electronicProgressBox" class="list-group-item">- 결재진행함
                            <span id="progressCount" class="badge"></span>
                        </a>
                        <a href="<%=request.getContextPath()%>/electronic/electronicCompletionBox" class="list-group-item">- 완료문서함
                            <span id="completionCount" class="badge"></span>
                        </a>
                        <a href="<%=request.getContextPath()%>/electronic/electronicReturnBox" class="list-group-item">- 반려문서함
                            <span id="returnCount" class="badge"></span>
                        </a>
                    </div>

            </div>
        </div>
    </aside>
    
    <script type="text/javascript" language="javascript">
 
    $(document).ready(function(){
         
         
        $.ajax({
             
            type : "GET",
            url : "<%=request.getContextPath()%>/electronic/approvalCountServlet",
            dataType : "text",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
            	var temp = data.split(" ");
            	$('#requestCount').text(temp[0]);
            	$('#waitCount').text(temp[1]);
            	$('#progressCount').text(temp[2]);
            	$('#completionCount').text(temp[3]);
            	$('#returnCount').text(temp[4]);
            }
             
        });
         
 
    });
 
	</script>
