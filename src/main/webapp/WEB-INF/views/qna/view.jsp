<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&amp;A 글보기</title>


<script type="text/javascript">
	$(document).ready(function(){
		
		var no = ${dto.no};
		
		// 버튼 이벤트 처리
		// 수정 버튼
		$("#answerBtn").click(function(){
			$("#dataForm").attr("action","answer.do");
			// form.submit() 넘긴다.
			$("#dataForm").submit();
		});
		
		// 수정 버튼
		$("#updateBtn").click(function(){
// 			location = "update.do?no=${dto.no}";
			$("#dataForm").attr("action","update.do");
			// form.submit() 넘긴다.
			$("#dataForm").submit();
		});
		
		// 삭제 버튼
		$("#deleteBtn").click(function(){
			if(confirm("정말 삭제하시겠습니까?"))
				location="delete.do?no=${dto.no}";
		});
		
		// 리스트 버튼
		$("#listBtn").click(function(){
// 			location="list.do";
			// 폼에서 글번호 제거
			$("#no").attr("disabled","disabled");
			$("#dataForm").attr("action", "list.do");
			$("#dataForm").submit();
		});
		
		//글 수정 후 경고
		${msg == "updateOK"?"alert('수정이 완료되었습니다.')":""}
		
		
	}); // end of document.ready()
	
</script>

</head>
<body>
<!-- 넘겨야할 데이터를 uri 뒤에 붙이지 않고 form 태그 사용해서 넘기기 :update, list
		update : 글번호, 한페이지의 데이터 갯수, 페이지, 검색 타입, 검색어
		list : 한페이지의 데이터 갯수, 페이지, 검색 타입, 검색어
-->
<form id="dataForm">
	<input name="no" value="${param.no }" type="hidden" id="no">
	<input name="page" value="${param.page }" type="hidden">
	<input name="perPageNum" value="${param.perPageNum }" type="hidden">
	<input name="searchType" value="${param.searchType }" type="hidden">
	<input name="keyword" value="${param.keyword }" type="hidden">
</form>
<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading">게시판 글보기</div>
    <div class="panel-body">
      <table class="table">
	    <tbody>
	      <tr>
	      	<th>글번호</th>
	        <td>${dto.no }</td>
	      </tr>
	      <tr>
	      	<th>제목</th>
	        <td>${dto.title }</td>
	      </tr>
	      <tr>
	      	<th>내용</th>
	        <td>${dto.content }</td>
	      </tr>
	      <tr>
	      	<th>작성자</th>
	        <td>${dto.writer }</td>
	      </tr>
	      <tr>
	      	<th>작성일</th>
	        <td><fmt:formatDate value="${dto.writeDate }" 
	        pattern="yyyy-MM-dd HH:mm:ss"/></td>
	      </tr>
	      <tr>
	      	<th>조회수</th>
	        <td>${dto.hit }</td>
	      </tr>
	    </tbody>
	    <tfoot>
	    	<tr>
	    		<td colspan="2">
	    			<button id="answerBtn">답변</button>
	    			<button id="updateBtn">수정</button>
	    			<button id="deleteBtn">삭제</button>
	    			<button id="listBtn">리스트</button>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
   </div>
  </div>
</div>
</body>
</html>