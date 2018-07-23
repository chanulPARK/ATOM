<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/aside.jsp" %>

<style>
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
</style>

<section>
    <div class="content">
        <div class="col-md-12">
            <h4>업무 등록</h4>
        	<form action="<%=request.getContextPath()%>/task/taskWriteEnd" method="post" enctype="multipart/form-data">
	            <table class="tableTR table table-condensed">
	                <tbody>
	                    <tr>
	                        <th>
	                            <span style="color: red">* </span>제목</th>
	                        <td>
	                            <div>
	                                <input type="text" class="form-control input-sm" name="title" placeholder="제목을 입력하세요." aria-required="true">
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>
	                            <span style="color: red">* </span>업무 형태</th>
	                        <td>
	                            <div class="label-group">
	                                <label class="radio-inline">
	                                    <input type="radio" class="fnone valid" id="type1" name="taskType" title="업무 요청" value="1"> 업무 요청</label>
	                                <label class="radio-inline">
	                                    <input type="radio" class="fnone valid" id="type2" name="taskType" title="업무 보고" value="2" checked="checked"> 업무 보고</label>
	                                <label class="radio-inline">
	                                    <input type="radio" class="fnone valid" id="type3" name="taskType" title="업무 일지" value="3"> 업무 일지</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr id="isTermlessTR">
	                        <th>
	                            <span style="color: red">* </span>업무 기한
	                        </th>
	                        <td>
	                            <div class="form-inline">
	                                <input type="text" class="form-control input-sm" placeholder="18/07/18" disabled>
	                                <span class="label-group ml10">
	                                    <input type="checkbox" id="isTermless" title="기한없음" name="isTermless" value="0" checked="checked">
	                                    <label>기한없음</label>
	                                </span>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr id="workerTR">
	                        <th id="workerTH1">담당자</th>
	                        <td>
	                            <div>
	                                <input type="text" class="form-control input-sm" placeholder="사용자" aria-required="true">
	                            </div>
	                        </td>
	                    </tr>
	                    <tr id="folderTR">
	                        <th>
	                            <label for="folderI">업무 보관함</label>
	                        </th>
	                        <td id="selectFolder">
	                            <input type="hidden" id="folderId" name="folderId" value="">
	                            <input type="hidden" id="folderNmae" name="folderName" value="">
	                            <button type="button" class="btn btn-default btn-sm">업무 보관함</button>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	            <div>
	                <textarea name="area2" style="width: 100%; height: 350px;">
	
	                </textarea>
	            </div>
            </form>
            <div class="btn-wrap float-right">
                <button type="submit" class="btn btn-sm btn-primary">저장</button>
                <button type="button" class="btn btn-sm btn-default">임시저장</button>
                <button type="reset" class="btn btn-sm btn-default">취소</button>
            </div>
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp" %>