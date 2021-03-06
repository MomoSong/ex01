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
<title>자료실 보기</title>

<script type="text/javascript"
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		
// 		var no = ${dto.no};
		
		// 버튼 이벤트 처리
		// 수정 버튼
		$("#updateBtn").click(function(){
// 			location = "update.do?no=${dto.no}";
			$("#dataForm").attr("action","update");
			// form.submit() 넘긴다.
			$("#dataForm").submit();
		});
		
		// 삭제 버튼
		$("#deleteBtn").click(function(){
			if(confirm("정말 삭제하시겠습니까?"))
				location="delete?no=${dto.no}";
		});
		
		// 리스트 버튼
		$("#listBtn").click(function(){
// 			location="list.do";
			// 폼에서 글번호 제거
			$("#no").attr("disabled","disabled");
			$("#dataForm").attr("action", "list");
			$("#dataForm").submit();
		});
		
		// ajax를 이용한 댓글을 불러오기 위한 버튼 이벤트 처리
		$("#viewReply").click(function(){
			// 댓글을 가져와서 표시하는 함수 호출
			// displyReply(page) - 처음 호출하는 것이므로 1페이지를 넣는다.
			displyReply(1);
		});
		
		// 댓글 등록 이벤트 처리
//		$("#replyAddBtn").click(function(){});
		$("#replyAddBtn").on("click",function(){
// 			alert("add");
			// Ajax를 통해서 데이터를 서버에 보내기
			var writer = $("#writer").val();
			var content = $("#content").val();
			
			var data =  JSON.stringify({
				"no" : no,
				"writer" : writer,
				"content" : content});
			
// 			alert(data);
			
			$.ajax({
				// method 방식
				type: "post",
				// 요청주소 - 댓글쓰기
				url : "/replies/",
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				// 서버에서 돌려 받는 데이터의 형식
				dataType : "text",
				// 서버에 전달하는 데이터
				data : data,
				// 서버에서 정상적인 처리가 됐을 때 실행하는 함수
				success : function(result){
					if(result == "WRITE OK"){
						alert("댓글이 등록되었습니다.");
						// 댓글 리스트를 뿌린다.
						displyReply();
					}
				}
			});
		});
		
		// 댓글 수정 이벤트 처리(모달창에 수정버튼을 클릭하면)
		$("#modalUpdateBtn").on("click",function(){
			// alert("modal Update");
			// Ajax를 통해서 데이터를 서버에 보내기
			var rno = $(".modal-title").text();
			var content = $("#modalContent").val();
			
			var data =  JSON.stringify({
				"rno" : rno,
				"content" : content});
			
// 			alert(data);
			
			$.ajax({
				// method 방식
				type: "put",
				// 요청주소 - 댓글쓰기
				url : "/replies/"+rno,
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				// 서버에서 돌려 받는 데이터의 형식
				dataType : "text",
				// 서버에 전달하는 데이터
				data : data,
				// 서버에서 정상적인 처리가 됐을 때 실행하는 함수
				success : function(result){
					if(result == "UPDATE OK"){
						alert("댓글이 수정되었습니다.");
						// 댓글 리스트를 뿌린다.
						displyReply();
					}
				}
			});
		});
		
		// 댓글 삭제 이벤트 처리(모달창에 삭제버튼을 클릭하면)
		$("#modalDeleteBtn").on("click",function(){
			// alert("modal Delete");
			// 삭제 확인 후 삭제 진행
			if(confirm("정말 삭제 하시겠습니까?")){
				// Ajax를 통해서 데이터를 서버에 보내기
				var rno = $(".modal-title").text();
				
				$.ajax({
					// method 방식
					type: "delete",
					// 요청주소 - 댓글쓰기
					url : "/replies/"+rno,
					headers:{
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					// 서버에서 돌려 받는 데이터의 형식
					dataType : "text",
					// 서버에서 정상적인 처리가 됐을 때 실행하는 함수
					success : function(result){
						if(result == "DELETE OK"){
							alert("댓글이 삭제되었습니다.");
							// 댓글 리스트를 뿌린다.
							displyReply();
						}
					}
				});
			}
		});
		
		// 댓글의 수정 삭제 버튼에 이벤트 처리 
		// replies는 ready 객체로 나와 있다. 그러나 안에 있는 li tag는 Ajax를 이용해서 
		// 나중에 나타 나므로 바로 적용 되지 않는다. 그래서 이벤트의 전달하는 방식을 사용해서
		// replies를 먼저 선택하고 안으로 찾아 들어가는 방식을 사용해서 해결한다.
		$("#replies").on("click","li button",function(){
// 			alert("click li");
			var reply = $(this).parent().parent();
// 			var reply = $(this).parent();
			var content = reply.find(".content").text();
			var rno = reply.find(".rno").text();
			$("#modalContent").val(content);
			$(".modal-title").text(rno);
		});
	
		
		// 댓글 페이지 이벤트 처리 : a tag의 url 요청해서 이동시키는 이벤트 동작. 무시시키키 위해
		// event를 전달 받는다.
		$(".pagination").on("click","li a", function(event){
			// 이벤트 무시
			event.preventDefault();
			// 댓글의 페이지를 클릭한데서 찾는다. (a href로 저장)
			replyPage = $(this).attr("href");
			displyReply(replyPage);
		});
		
		//글 수정 후 경고
		${msg == "updateOK"?"alert('수정이 완료되었습니다.')":""}
		
		
	}); // end of document.ready()
	
	
	function displyReply(page){
		if(page == undefined) page = 1;
		alert(page);
// 		if(page ==)
		// ajax를 이용한 댓글을 불러오기 위한 버튼 이벤트 처리
		// ajax를 이용해서 서버에서 JSON 데이터를 받아온다.
		// $.getJSON(url,success_function(return data){});
		$.getJSON("/replies/${dto.no}/"+page, function(data) {
// 			var str = "";
// 			$(data).each(function() {
// 				str += "<li data-rno='"+this.rno+"'><span class='rno'>" 
// 				+ this.rno + "</span>:<span class='content'>"
// 				+ this.content + "</span>" 
// 				+ "<button class='updateBtn' data-toggle='modal' " 
// 				+ " data-target='#myModal' type='button'>"
// 				+ "수정/삭제</button></li>"
// 			});
// 			$("#replies").html(str);
			// 댓글 list 데이터를 출력하는 부분
			printData(data.list, $("#replies"), $("#template"));
			// 페이지를 출력하는 부분
			printPaging(data.cri);
		});
	}
	
	
	function printPaging(cri){
		var str = "";
		// 이전 페이지 출력
		if(cri.prev){
			str += "<li><a href='"+(cri.startPage -1)
			+"'><i class='glyphicon glyphicon-step-backward'></i>"
			+"</a></li>";
		}
		// 반복 페이지
		for(var i = cri.startPage ; i<= cri.endPage; i++){
			var strClass = (cri.page==i?" class='active' ":"");
			str += "<li "+strClass +"><a href='"+i+"' >"
			+i+"</a></li>";
		}
		// 다음 페이지 출력
		if (cri.next){
			str += "<li><a href='"+(cri.endPage+1)
			+"'><i class='glyphicon glyphicon-step-forward'></i>"
			+"</a></li>";	
		}
		// 작성된 str(li)를 pagination 에 넣자.
		$(".pagination").html(str);
	}
	
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
	    			<button id="updateBtn">수정</button>
	    			<button id="deleteBtn">삭제</button>
	    			<button id="listBtn">리스트</button>
	    		</td>
	    	</tr>
	    </tfoot>
	  </table>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading">첨부파일</div>
    <div class="panel-body">
	  <div>
	  	<c:forEach items="${list }" var="fileDto">
	  		<c:if test="${fileDto.image }">
	  			<img src="/displayFile?filename=${fileDto.fileName }" /><br/>
	  		</c:if>
	  		<c:if test="${!fileDto.image }">
	  			<a href="/displayFile?filename=${fileDto.fileName }" >다운로드</a>
	  			<br/>
	  		</c:if>
	  	</c:forEach>
	  </div>
	  </div>
	 </div>
</div>


</body>
</html>