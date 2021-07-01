<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Middle.*"%>
<!DOCTYPE html>

<jsp:useBean id="am" class="Middle.AddrManager" scope="application" />

<html>
<head>
<style>
table, td {
border:1px solid;
width:500px;
text-align:center;
}
</style>
<meta charset="UTF-8">
<title>주소록</title>
</head>
<body>
<div align="center">
<H2>주소록 (전체보기)</H2>
<HR>
<a href="addr_form.jsp">주소 추가</a><p>

<table>
	<tr id = "li">
		<td>이름 </td>
		<td>전화번호</td>
		<td>이메일</td>
		<td>성별</td>
		<td>그룹</td>
	</tr>
<%
int rpp = 2;
int currentPage; //현재 페이지
String sindex = request.getParameter("sindex");

if (sindex == null) 
   currentPage = 1;
else
   currentPage = Integer.parseInt(sindex);

//int addrCount = am.getAddrList().size();
int startIndex = (currentPage - 1) * rpp;
int lastIndex = startIndex + rpp - 1; //rpp값의 배수인 경우 마지막 인덱스

List<AddrBean> aList = am.getAddrList();
int size = aList.size();

int totalP; 
if (size % rpp == 0)
	totalP = size / rpp;
else 
	totalP = size / rpp + 1;

if (currentPage == totalP)
	lastIndex = size - 1;

for (int i = startIndex; i <= lastIndex; i++) {
	out.println("<tr>");
	out.println("<td>" + aList.get(i).getUsername()+ "</td>");
	out.println("<td>" + aList.get(i).getTel()+ "</td>");
	out.println("<td>" + aList.get(i).getEmail()+ "</td>");
	out.println("<td>" + aList.get(i).getSex()+ "</td>");
	out.println("<td>" + aList.get(i).getGroup()+ "</td>");
}
%>
</table>
<p>
<%
for(int i = 1; i <= totalP; i++) {
   if(i != currentPage) { %>
      <a href="addr_list.jsp?sindex=<%= i %>"><%= i %></a>   
<% }
   else
      out.println(i);
   
   if(i != totalP)
      out.println("| ");
}
%>

</div>
</body>
</html>