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
<title>자표실 리스트</title>


<style type="text/css">
.data:hover {
	background: #eee; cursor: pointer;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 버튼 이벤트 처리
		// 글쓰기 버튼
		$("#writeBtn").click(function(){
			location = "write";
		});
		
		// 새로고침 버튼
		$("#reloadBtn").click(function(){
			location.reload();
		});
		
		// 게시글에 대한 tr 이벤트 처리
		$(".data").click(function(){
			var no = $(this).find("td:first").text();
			location = "view?no="+no // 글번호 전달
					+"&page=${cri.page}" // 페이지 전달한다.
					+"&perPageNum=${cri.perPageNum}"
					+"&searchType=${cri.searchType}"
					+"&keyword=${cri.keyword}"
					; // 페이지 당 글수 전달
		});
		
		// 표시하는 글수를 바꾸면 이벤트 처리를 해서 다시 리스트를 불러온다.
		$("#perPageNum").change(function(){
// 			alert("select change!");
			location="list?"
				+"page=1" // 1페이지 전달한다.
				+"&perPageNum="+$("#perPageNum").val()
				+"&searchType=${cri.searchType}"
				+"&keyword=${cri.keyword}"
				; // 페이지 당 글수 전달
		});
		
		// 글등록 후 경고
		${(msg == "writeOK")?"alert('글등록이 완료되었습니다.');":""}
		// 글삭제 후 경고
		${msg == "deleteOK"?"alert('글삭제가 완료되었습니다.');":""}
	});
</script>
</head>
<body>
<!-- <div class="container"> -->
  <div class="panel panel-default">
    <div class="panel-heading">
    	<span>자료실 리스트</span>
    	<select name="perPageNum" id="perPageNum">
    		<option ${cri.perPageNum == 10?"selected='selected'":"" }>10</option>
    		<option ${cri.perPageNum == 15?"selected='selected'":"" }>15</option>
    		<option ${cri.perPageNum == 20?"selected='selected'":"" }>20</option>
    	</select>
    	<form class="navbar-form" >
			 <div class="form-group navbar-left">
				 <select class="form-control navbar-left list-group"
				  name="searchType">
					 <option value="n">----</option>
					 <option value="t" 
					 ${cri.searchType == "t"?"selected='selected'":"" } 
					 >제목</option>
					 <option value="c"
					 ${cri.searchType == "c"?"selected='selected'":"" } 
					 >내용</option>
					 <option value="w"
					 ${cri.searchType == "w"?"selected='selected'":"" } 
					 >작성자</option>
					 <option value="tc"
					 ${cri.searchType == "tc"?"selected='selected'":"" } 
					 >제목+내용</option>
					 <option value="cw"
					 ${cri.searchType == "cw"?"selected='selected'":"" } 
					 >내용+작성자</option>
					 <option value="tcw"
					 ${cri.searchType == "tcw"?"selected='selected'":"" } 
					 >제목+내용+작성자</option>
				 </select> 
				 <input type="text" class="form-control navbar-left "
				  placeholder="Search" name="keyword"
				  value="${cri.keyword }">
			 </div>
			 <button type="submit" class="btn btn-default">
			 <i class="glyphicon glyphicon-search"></i>
			 </button>
		</form>
    </div>
    <div class="panel-body">
      <table class="table">
	    <thead>
	      <tr>
	        <th>글번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	        <th>조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	    <!-- 데이터 만큼 반복 시작 -->
	    <c:forEach items="${list }" var="dto">
	      <tr class="data">
	        <td>${dto.no }</td>
	        <td>${dto.title } <span class="badge">${dto.filecnt }</span></td>
	        <td>${dto.writer }</td>
	        <td><fmt:formatDate value="${dto.writeDate }" 
	        pattern="yyyy-MM-dd HH:mm:ss"/></td>
	        <td>${dto.hit }</td>
	      </tr>
	    </c:forEach>
	    <!-- 데이터 만큼 반복 끝 -->
	    </tbody>
	    <tfoot>
	    	<tr>
	    		<td colspan="5">
		    		<ul class="pagination">
		    		<c:if test="${cri.prev }">
					  <li>
					  	<a href="list.do?page=${cri.startPage-1 }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
					  		<i class="glyphicon glyphicon-step-backward"></i>
					  	</a>
					  </li>
					</c:if>
		    		<c:forEach begin="${cri.startPage }"
		    		 end="${cri.endPage }" var="idx">
					  <li ${cri.page==idx?" class='active' ":"" }>
					  	<a href="list.do?page=${idx }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
					  </li>
					</c:forEach>
					<c:if test="${cri.next }">
					  <li>
					  	<a href="list.do?page=${cri.endPage+1 }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
					  		<i class="glyphicon glyphicon-step-forward"></i>
					  	</a>
					  </li>
					 </c:if>
					</ul>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="5">
	    			<button id="writeBtn">글쓰기</button>
	    			<button id="reloadBtn">새로고침</button>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
    </div>
  </div>
<!-- </div> -->

</body>
</html>