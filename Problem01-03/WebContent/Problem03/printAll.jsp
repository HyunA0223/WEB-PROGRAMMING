<!-- printAll : 세개의 페이지를 하나로 합치는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<style>
p {text-align:center;}
</style>
</head>
<body>
<jsp:include page="selectLecture.jsp" />
<jsp:include page="timetable.jsp" />
<jsp:include page="printLecture.jsp" />
<p><a href="../Problem00/combine.jsp">home</a></p>
</body>
</html>