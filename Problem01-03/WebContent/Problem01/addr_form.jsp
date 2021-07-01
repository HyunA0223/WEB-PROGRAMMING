<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 등록</title>

<style>
table {
	/*border-collapse: collapse;*/
	margin-left: auto;
	margin-right: auto;
}
table, tr, td, th {
	border: solid 1px;
	height: 30px;
}
#ltd {
	width: 70px;
	padding: 3px;
	font-weight: bold;
}
#rtd {
	width: 155px;
	padding: 4px;
}
#but {
	text-align: center;
}
</style>
</head>
<body>
<div align="center">
	<h2>주소록 등록</h2>
	<hr>
	
	<form method="POST" action="addr_add.jsp">
		<table>
			<tr>
				<td id="ltd">이름</td>
				<td id="rtd"><input type="text" size="20" name="username"></td>
			</tr>
			<tr>
				<td id="ltd">전화번호</td>
				<td id="rtd"><input type="text" size="20" name="tel"></td>
			</tr>
			<tr>
				<td id="ltd">이메일</td>
				<td id="rtd"><input type="text" size="20" name="email"></td>
			</tr>
			<tr>
				<td id="ltd">성별</td>
				<td id="rtd">
					<select name="sex">
						<option>남</option>
						<option selected>여</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="ltd">그룹</td>
				<td id="rtd">
					<select name="group">
						<option selected>가족</option>
						<option>친구</option>
						<option>직장</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="but" colspan="2">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<br><a href="../Problem00/combine.jsp">home</a>
</div>
</body>
</html>