<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<style type="text/css">
    .table-bordered th,
    .table-bordered td {
        border: 1px solid black;
    }

    .number, .title, .assign, .startDate, .endDate, .prog, th, td 
    {
        text-align: center;
        border: 1px solid black;
    }

    .number {
        width: 70px;
    }

    .title {
        width: 300px;
    }

    .assign {
        width: 100px;
    }

    .startDate {
        width: 200px;
    }

    .endDate {
        width: 200px;
    }

    .prog {
        width: 120px;
    }
    .tr1
    {
    	background-color: gray;
    }
    
    .fixBtn-container
    {
        position: fixed;
        bottom: 40px;
        right: 100px;
        z-index: 1000;
    }
    
    #indi 
    {
        margin-left: 20px;
    }
</style>
<body>


<div>
	<h1>WorkManage</h1>
	<hr>
</div>



<div id="work">
  <label class="form-check-label" for="total">
  	<input class="form-check-input" type="radio" name="work" id="total" checked="checked">
    전체업무 
  </label>
  <label class="form-check-label" for="indi">
  	<input class="form-check-input" type="radio" name="work" id="indi">
    개인업무
  </label>
</div>
<br>

<div class="fixBtn-container">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addTaskModal">
        +
    </button>
</div>

<div>
	<table border="1" width="1900" height="30">
		<tr class="tr1">
           <th class="number">업무 순서</th>
           <th class="title">업무 제목</th>
            <th class="assign">담당자</th>
            <th class="startDate">시작일</th>
            <th class="endDate">종료일</th>
            <th class="prog">진척여부</th>
		</tr>
		<tr>
			<td>분석</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>요구사항 수집 및 분석</td>
			<td>오수경</td>
			<td>2024/02/01</td>
			<td>2024/02/15</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>의사소통 및 협상</td>
			<td>엄재용</td>
			<td>2024/01/01</td>
			<td>2024/01/20</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>설계</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>프로세스 설계</td>
			<td>박나영</td>
			<td>2024/02/15</td>
			<td>2024/02/25</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>데이터베이스 설계</td>
			<td>이주형</td>
			<td>2024/02/20</td>
			<td>2024/03/01</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>인터페이스 설계</td>
			<td>문정환</td>
			<td>2024/02/20</td>
			<td>2024/02/28</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>구현</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>환경구성</td>
			<td>임하성</td>
			<td>2024/03/01</td>
			<td>2024/03/05</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>프론트엔드</td>
			<td>오수경</td>
			<td>2024/03/06</td>
			<td>2024/03/10</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>백엔드</td>
			<td>엄재용</td>
			<td>2024/03/11</td>
			<td>2024/03/18</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>테스트</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>테스트 시나리오</td>
			<td>박나영</td>
			<td>2024/03/19</td>
			<td>2024/03/22</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>테스트중</td>
			<td>이주형</td>
			<td>2024/03/23</td>
			<td>2024/03/30</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>테스트 완료</td>
			<td>문정환</td>
			<td>2024/03/22</td>
			<td>2024/03/22</td>
			<td>
				<select class="ingControl">
					<option>진행예정</option>
					<option>진행중</option>
					<option>진행완료</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div>

</body>
</html>