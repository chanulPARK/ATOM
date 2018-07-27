<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/boardAside.jsp"%>
<div class="content">
            <div class="col-md-8">
                <h3>여기는 기본 페이지입니다</h3>
                <p>항목별로 들어가 보실 수 있습니다.</p>
                <table class="table table-hover">
                    <colgroup>
                        <col style="width: 50px;"/>
                        <col style="min-width: 200px;"/>
                        <col style="width: 90px;"/>
                        <col style="width: 120px;"/>
                        <col style="width: 60px;"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">번호</th>
                            <th scope="col" class="text-center">제목</th>
                            <th scope="col" class="text-center">작성일</th>
                            <th scope="col" class="text-center">작성자</th>
                            <th scope="col" class="text-center">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="table-condensed">
                        <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                            <td class="text-center">1</td>
                        </tr>
                    </tbody>
                </table>
                <nav style="text-align: center">
                    <ul class="pagination pagination-sm">
                        <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
</section>
<%@ include file="/views/common/footer.jsp" %>