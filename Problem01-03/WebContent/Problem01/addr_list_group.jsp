<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Middle.*"%>
<!DOCTYPE html>

<jsp:useBean id="am" class="Middle.AddrManager" scope="application" />

<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>

<style>
table {
	/*border-collapse: collapse;*/
	margin-left: auto;
	margin-right: auto;
}
table, tr, td, th {
	border: solid 1px;
	width: 600px;
	height: 25px;
	text-align: center;
}
#li {
	font-weight: bold;
}
</style>
</head>
<body>
<div align="center">
	<h2>주소록 (그룹별 보기)</h2>
	<hr>
	
	<a href="addr_form.jsp">주소 추가</a><p>
	
	<table>
		<tr id="li">
			<td>이름</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>성별</td>
			<td>그룹</td>
		</tr>
<%
	String[] groupN = {"가족", "친구", "직장"};
	
	for(AddrBean ab: am.getAddrList())
	{
		if((ab.getGroup()).equals(groupN[0]))
		{
			out.println("<tr>");
			out.println("<td>" +ab.getUsername()+ "</td>");
			out.println("<td>" +ab.getTel()+ "</td>");
			out.println("<td>" +ab.getEmail()+ "</td>");
			out.println("<td>" +ab.getSex()+ "</td>");
			out.println("<td>" +ab.getGroup()+ "</td>");
			out.println("</tr>");
		}
	}
	for(AddrBean ab: am.getAddrList())
	{
		if((ab.getGroup()).equals(groupN[1]))
		{
			out.println("<tr>");
			out.println("<td>" +ab.getUsername()+ "</td>");
			out.println("<td>" +ab.getTel()+ "</td>");
			out.println("<td>" +ab.getEmail()+ "</td>");
			out.println("<td>" +ab.getSex()+ "</td>");
			out.println("<td>" +ab.getGroup()+ "</td>");
			out.println("</tr>");
		}
	}
	for(AddrBean ab: am.getAddrList())
	{
		if((ab.getGroup()).equals(groupN[2]))
		{
			out.println("<tr>");
			out.println("<td>" +ab.getUsername()+ "</td>");
			out.println("<td>" +ab.getTel()+ "</td>");
			out.println("<td>" +ab.getEmail()+ "</td>");
			out.println("<td>" +ab.getSex()+ "</td>");
			out.println("<td>" +ab.getGroup()+ "</td>");
			out.println("</tr>");
		}
	}
	
%>
	</table>
</div>
</body>
</html>