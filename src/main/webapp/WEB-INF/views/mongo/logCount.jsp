<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap 설정 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- highcharts 설정 -->  
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	// 항목 이름과 데이터가 함께 있는 데이터
	var data = ${data};
	// donet chart drow
	drowPI("통계","사용자가 자주 사용하는 메뉴 통계", 100, 65, data);
});
		
var drowPI = function (title, subtitle, innerSize, depth, data) {
    $('#container').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: title
        },
        subtitle: {
            text: subtitle
        },
        plotOptions: {
            pie: {
                innerSize: innerSize,
                depth: depth
            }
        },
        series: [{
            name: '타겟 카운트',
            data: data
        }]
    });
};
</script>
</head>
<body>
<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">통계 그래프</div>
		<div class="panel-body">
			<div id="container" style="height: 400px"></div>
			<div></div>
		</div>
	</div>
</div>
</body>
</html>