<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div class="content">
    <div class="col-md-6">
        <h3>새 게시판 생성</h3>
        <p>아래의 메뉴로 게시판을 생성할 수 있습니다.</p>
        <table class="table table-hover">
                            <!-- <colgroup>
                                <col style="width: 50px; border:1px solid black"/>
                                <col style="width: 200px;"/>
                            </colgroup> -->
             <tbody class="table-condensed">
                   <tr>
                       <th scope="col" id="row" class="text-center">
                                                             게시판 이름
                       </th>
                       <td class="text-center">
                           <input type="text" class="form-control input-sm">
                       </td>
                   </tr>
                   <tr>
                       <th scope="col" id="row" class="text-center">
                                                              분류
                       </th>
                       <td class="text-center">
                       		<button class="btn btn-primary left btn-sm">
                                                                    게시판 분류
                       		</button>
                       </td>
                   </tr>
             </tbody>
        </table>
        <div id='showD' style='border:1px solid black;height:332px;' class='col-md-12'>

        </div>
        <script>
            var doc = document.getElementById("showD");
            $('button').click(function(){
                 doc.innerHTML = "<p class='glyphicon glyphicon-folder-close'>"
                 doc.innerHTML += "&nbsp;게시판&nbsp;</p>";
            });
            $('p.glyphicon.glyphicon-folder-close').click(function(){
                 $('p.glyphicon.glyphicon-folder-close').add();
            });
        </script>
    </div>
</div>
<%@ include file="/views/common/footer.jsp" %>