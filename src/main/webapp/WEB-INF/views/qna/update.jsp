<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글수정</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		// 취소 버튼 이벤트 처리
		$("#cancelBtn").click(function(){
			history.back();
		});
	});
</script>
</head>
<body>

<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading">게시판 글수정</div>
    <div class="panel-body">
	    <form class="form-horizontal" method="post">
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="no">번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="no" name="no"
		      readonly="readonly" value="${dto.no }">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="title">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" name="title"
		       pattern=".{4,100}" placeholder="제목입력 4자이상"
		       value="${dto.title }">
		    </div>
		  </div>
		  <div class="form-group">
			 <label for="content"  class="control-label col-sm-2">내용:</label>
		     <div class="col-sm-10">
			   <textarea class="form-control" rows="5" id="content"
			   name="content">${dto.content }</textarea>
			 </div>
			</div>
		  <div class="form-group">
		    <label class="control-label col-sm-2" for="writer">작성자:</label>
		    <div class="col-sm-10"> 
		      <input type="text" class="form-control" id="writer" name="writer"
		       placeholder="작성자 2-10글자." pattern="[가-힣]{2,10}"
		       value="${dto.writer }">
		    </div>
		  </div>
		  <div class="form-group"> 
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">수정</button>
		      <button type="reset" class="btn btn-warning">새로입력</button>
		      <button type="button" class="btn btn-danger" id="cancelBtn">취소</button>
		    </div>
		  </div>
		</form>
    </div>
  </div>
</div>
</body>
</html>