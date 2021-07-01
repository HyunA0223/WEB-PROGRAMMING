<!-- printLecture : 선택된 과목의 정보를 출력하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Problem 02</title>
</head>
<body>
<%
//arraylist에 문자열 timetable로 설정된 session 값을 추가
@SuppressWarnings("unchecked")
ArrayList<String> list = (ArrayList<String>)session.getAttribute("timetable");

//session.getAttribute 반환 값이 null인 경우 : ArrayList 객체를 생성한 후 session.setAttribute를 사용하여 timetable에 속성을 등록
if (list == null) {
	list = new ArrayList<String>();
	session.setAttribute("timetable", list);
}

//request.getParameter 값 중 null 값이 없을 때만 문자열 생성, ArrayList에 추가
if(request.getParameter("lectureType") != null) {
	out.println("<div align=\"center\">");
	//문자열 생성
	String s = request.getParameter("lectureType") + "/" + request.getParameter("lectureTitle") + "/" + request.getParameter("day") + "/"
		+ request.getParameter("time") + "/" + request.getParameter("consecutive") + "/";
	//ArrayList에 추가
	list.add(s);
	session.setAttribute("timetable", list);
	
	//ArrayList에 저장되어있는 문자열(선택된 모든 과목에 대한 정보) 출력
	for(int i = 0; i < list.size(); i++)
		out.println(list.get(i) + "<br>");
	out.println("</div>");
}
%>
</body>
</html>