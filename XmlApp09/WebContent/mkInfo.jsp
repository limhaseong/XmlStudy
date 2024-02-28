<%@page import="com.test.mkDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.mkDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 이전 페이지(mkInfo.jsp)로부터 넘어온 데이터 수신
	//-- mkId
	
	String mkId = request.getParameter("mkId");
	
	if (mkId==null)
		mkId="40300001";		//-- 전체 뉴스 정보
		
	StringBuffer sb = new StringBuffer();
		
	mkDAO dao = new mkDAO(mkId);
	
	ArrayList<String> mkList = dao.mkTitleList();
	
	for (int i=0; i<mkList.size(); i++)
	{
		ArrayList<mkDTO> mkLists = dao.mkList(String.valueOf(i+1));
		
		for (mkDTO mk : mkLists)
		{
			sb.append("<div class='col'>");
			sb.append("<table class='table'>");
			sb.append("<tr>");
			sb.append("<th> 카테고리 : ");
			sb.append(String.format("<td> 매일경제 - %s</td>", mk.getCategory()));
			sb.append("</th>");
			sb.append("</tr>");
			
			sb.append("<tr>");
			sb.append("<th> 제목 : ");
			sb.append(String.format("<td>%s</td>", mk.getTitle()));
			sb.append("</th>");
			sb.append("</tr>");
			
			sb.append("<tr>");
			sb.append("<th> 내용 : ");
			sb.append(String.format("<td>%s</td>", mk.getDescription()));
			sb.append("</th>");
			sb.append("</tr>");
			
			sb.append("<tr>");
			sb.append("<th> 날짜 : ");
			sb.append(String.format("<td>%s</td>", mk.getPubDate()));
			sb.append("</th>");
			sb.append("</tr>");
			
			sb.append("<tr>");
			sb.append("<th> 링크 : ");
			//sb.append(String.format("<td>%s</td>", mk.getLink()));
			sb.append("<td><a href=" + mk.getLink() + ">");
			sb.append(mk.getLink());
			sb.append("</a></td>");
			sb.append("</th>");
			sb.append("</tr>");
			
			sb.append("</table>");
			sb.append("</div>");
			
		}
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매일 경제 뉴스(mkInfo.jsp)</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<style type="text/css">

	.tbl-box .table th{min-width: 100px;}
	.tbl-box .col{padding: 10px;
    border-radius: 20px;
    margin: 20px;
    box-shadow: -1px 0px 11px 0px gray;}
    
    *{font-family: 'Single Day', cursive;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		//alert("확인");
		$(":radio[value='<%=mkId%>']").attr("checked", "checked");
		
		$(":radio").click(function()
		{
			$("#mkform").submit();
		});
	});
</script>

</head>
<body>

<div style="text-align: center; margin-top: 10px;">
	<h2>매일 경제 뉴스</h2>
	<hr>
</div>

<div>
	<div style="text-align: center;">
		<div style="margin-bottom: 10px; font-size: 20pt;">뉴스 선택~!!!</div>
		<form method="get" role="form" id="mkform">
		
			<input type="radio" class="btn-check" name="mkId" id="mkId1" value="40300001" checked>
			<label class="btn btn-outline-primary" for="mkId1" style="margin-bottom: 10px;">전체 뉴스</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId2" value="30000001">
			<label class="btn btn-outline-primary" for="mkId2" style="margin-bottom: 10px;">헤드라인</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId3" value="30100041">
			<label class="btn btn-outline-primary" for="mkId3" style="margin-bottom: 10px;">경제</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId4" value="30200030">
			<label class="btn btn-outline-primary" for="mkId4" style="margin-bottom: 10px;">정치</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId5" value="50400012">
			<label class="btn btn-outline-primary" for="mkId5" style="margin-bottom: 10px;">사회</label>
			
			
			<input type="radio" class="btn-check" name="mkId" id="mkId6" value="30300018">
			<label class="btn btn-outline-primary" for="mkId6" style="margin-bottom: 10px;">국제</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId7" value="50100032">
			<label class="btn btn-outline-primary" for="mkId7" style="margin-bottom: 10px;">기업/경영</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId8" value="50200011">
			<label class="btn btn-outline-primary" for="mkId8" style="margin-bottom: 10px;">증권</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId9" value="50300009">
			<label class="btn btn-outline-primary" for="mkId9" style="margin-bottom: 10px;">부동산</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId10" value="30000023">
			<label class="btn btn-outline-primary" for="mkId10" style="margin-bottom: 10px;">문화/연예</label>
			
			
			<input type="radio" class="btn-check" name="mkId" id="mkId11" value="71000001">
			<label class="btn btn-outline-primary" for="mkId11" style="margin-bottom: 10px;">스포츠</label>
			<br>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId12" value="50700001">
			<label class="btn btn-outline-primary" for="mkId12">게임</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId13" value="40200124">
			<label class="btn btn-outline-primary" for="mkId13">MBA(특집기사)</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId14" value="40200003">
			<label class="btn btn-outline-primary" for="mkId14">머니 앤 리치스</label>
			
			
			<input type="radio" class="btn-check" name="mkId" id="mkId15" value="30800011">
			<label class="btn btn-outline-primary" for="mkId15">Top Stories(English Edition)영문뉴스</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId16" value="50000001">
			<label class="btn btn-outline-primary" for="mkId16">이코노미</label>
			
			<input type="radio" class="btn-check" name="mkId" id="mkId17" value="60000007">
			<label class="btn btn-outline-primary" for="mkId17">시티라이프</label>
			
			<!-- <br>
			<button type="submit" class="btn btn-default">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-balloon-heart-fill" viewBox="0 0 16 16">
 		 			<path fill-rule="evenodd" d="M8.49 10.92C19.412 3.382 11.28-2.387 8 .986 4.719-2.387-3.413 3.382 7.51 10.92l-.234.468a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2.376 2.376 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224l-.235-.468ZM6.726 1.269c-1.167-.61-2.8-.142-3.454 1.135-.237.463-.36 1.08-.202 1.85.055.27.467.197.527-.071.285-1.256 1.177-2.462 2.989-2.528.234-.008.348-.278.14-.386Z"/>
				</svg>
			</button> -->
			
		</form>
	</div>
	
	<div>
		<div class="container">
			<div class="row tbl-box">
				<%=sb.toString() %>
			</div>
		</div>
	</div>
</div>

</body>
</html>