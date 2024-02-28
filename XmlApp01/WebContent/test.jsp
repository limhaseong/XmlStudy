<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>WorkManage</h1>
	<hr>
</div>

<div>
		<input type="radio" name="work" id="total" checked="checked"/>
			<label for="total">전체 업무</label>
		<input type="radio" name="work" id="indi"/>
			<label for="indi">개인 업무</label>
		<br><br>
</div>

<div>
	<table border="1" width="1900" height="800">
		<tr height="30">
			<th colspan="3">제목</th>
			<th colspan="1">담당자</th>
			<th colspan="3">시작일</th>
			<th colspan="3">종료일</th>			
			<th colspan="2">진척여부</th>			
		</tr>
		<tr>
			<td>분석</td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>


</body>
</html>
</body>
</html>