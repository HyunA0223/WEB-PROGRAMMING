<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Middle.*"%>
<% request.setCharacterEncoding("UTF-8"); %> 

<jsp:useBean id="addr" class="Middle.AddrBean" />
<jsp:setProperty name="addr" property="*" />
<jsp:useBean id="am" class="Middle.AddrManager" scope="application" />

<%
	am.add(addr);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_add.jsp</title>
</head>
<body>
<div align="center">
	<h2>등록내용</h2>
	<hr>
	
	<b>이름</b>: <%= addr.getUsername() %> <p>
	<b>전화번호</b>: <%= addr.getTel() %> <p>
	<b>이메일</b>: <%= addr.getEmail() %> <p>
	<b>성별</b>: <%= addr.getSex() %> <p>
	<b>그룹</b>: <%= addr.getGroup() %> <p>
	
	<hr>
	<a href="addr_list.jsp">전체 목록 보기</a>
	<a>&nbsp;</a>
	<a href="addr_list_group.jsp">그룹별 목록 보기</a>
</div>
</body>
</html>