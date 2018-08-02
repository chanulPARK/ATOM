<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	aside div.leftmenu_top {
        background: #53b5e6;
        color: #fff;
        text-align: center;
        height: 50px;
    }
    aside div.leftmenu_top h3{
        padding-top: 12px;
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
</style>
<script>
    $(function () {
        $('#jstree').jstree();
        $('#jstree').on("changed.jstree", function (e, data) {
        console.log(data.selected);
        });
        $('button[id=create]').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
        });
    });
</script>

<aside>
    <div class="leftmenu_top">
        <h3>
            <a href="#">업무관리</a>
        </h3>
    </div>
    <!-- ./leftmenu_top -->
    <div class="leftmenu-btn">
        <a class="btn btn-default btn-block" href="<%=request.getContextPath()%>/task/taskWrite" role="button">업무 등록</a>
    </div>
    <!-- ./leftmenu-btn -->
    <div class="leftmenu_area">
	    <div class="list-group">
	        <a class="list-group-item" data-toggle="collapse" href="#collapse1" aria-expanded="true">업무 요청</a>
            <div id="collapse1" class="panel-collapse collapse in list-group">
                <a href="<%=request.getContextPath()%>/task/taskRequest" class="list-group-item">- 발신 업무 요청
                    <span id="requestCount" class="badge">2</span>
                </a>
                <a href="<%=request.getContextPath()%>/task/taskRequestReceive" class="list-group-item">- 수신 업무 요청
                    <span id="requestReceiveCount"  class="badge">1</span>
                </a>
            </div>
            <!-- ./list-item_1 -->
            <a class="list-group-item" data-toggle="collapse" href="#collapse2" aria-expanded="true">업무 보고</a>
            <div id="collapse2" class="panel-collapse collapse in list-group">
                <a href="<%=request.getContextPath()%>/task/taskReport" class="list-group-item">- 발신 업무 보고
                    <span id="reportCount"  class="badge">2</span>
                </a>
                <a href="<%=request.getContextPath()%>/task/taskReportReceive" class="list-group-item">- 수신 업무 보고
                    <span id="reportReceiveCount"  class="badge">1</span>
                </a>
            </div>
            <!-- ./list-item_2 -->
            <a class="list-group-item" href="<%=request.getContextPath()%>/task/taskRequest" aria-expanded="true">업무 일지</a>
            <!-- ./list-item_3 -->
            <!-- <a class="list-group-item" data-toggle="collapse" href="#collapse3" aria-expanded="true">업무 보관함</a>
            <div id="collapse3" class="panel-collapse collapse in">
	            <div class="panel-footer">
	                <div id="jstree">
	                    <ul>
	                        <li>영업부
	                        <ul>
	                            <li id="child_node_1">영업 1팀</li>
	                            <li>영업 2팀</li>
	                        </ul>
	                        </li>
	                        <li>생산부</li>
	                        <li>관리부</li>
	                        <ul>
	                            <li id="child_node_1">인사팀</li>
	                            <li>총무팀</li>
	                        </ul>
	                    </ul>
	                </div>
	            </div>
	        </div> -->
	        <!-- ./js-tree -->
        </div>
    </div>
    <!-- /.leftmenu_area -->
</aside>

<script>
	$(document).ready(function(){
	    $.ajax({
	        type : "GET",
	        url : "<%=request.getContextPath()%>/task/taskCount",
	        dataType : "text",
	        error : function(){
	            alert('실패');
	        },
	        success : function(data){
	        	var arr = data.split(" ");
	        	$('#requestCount').text(arr[0]);
	        	$('#requestReceiveCount').text(arr[1]);
	        	$('#reportCount').text(arr[2]);
	        	$('#reportReceiveCount').text(arr[3]);
	        }
	    });
	});
</script>