<!-- selectLecture : 시간표에 추가할 과목을 선택하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Problem 02</title>
</head>
<body>
<%
//과목 이름, 종류를 편하게 변경할 수 있도록 String 배열로 만듦
String[] typeNames = {"전공필수", "전공선택", "교양", "자유선택"};
String[] titleNames = {"웹프로그래밍", "운영체제", "소프트웨어프로그래밍", "데이터베이스개론", "자료구조", "네트워크", "창의와 감성", "사회봉사"};
String[] days = {"월", "화", "수", "목", "금"};

out.println("<div align=\"center\">");
//form 태그의 action을 printAll.jsp로 설정하여 form 태그 안의 내용을 printLecture.jsp와 timetalbe.jsp로 전달
out.println("<form name=selectLecture method=post action=printAll.jsp>");
//과목 타입 선택
out.println("과목타입: <select name=\"lectureType\">");
for(int i = 0; i < typeNames.length; i++) 
   out.println("<option value\"" + i + "\">" + typeNames[i] + "</option>");
out.println("</select>");

//과목 명 선택
out.println("과목명: <select name=\"lectureTitle\">");
for(int i = 0; i < titleNames.length; i++) 
   out.println("<option value\"" + i + "\">" + titleNames[i] + "</option>");
out.println("</select>");

//요일 선택
out.println("요일: <select name=\"day\">");
for(int i = 0; i < days.length; i++) 
   out.println("<option value\"" + i + "\">" + days[i] + "</option>");
out.println("</select>");

//시간 선택
out.println("시간: <select name=\"time\">");
for(int i = 1; i < 7; i++) 
   out.println("<option value\"" + i + "\">" + i + "</option>");
out.println("</select>");

//연강 여부 선택
out.println("연강여부: <select name=\"consecutive\">");
for(int i = 1; i < 7; i++) 
   out.println("<option value\"" + i + "\">" + i + "</option>");
out.println("</select>");

//등록 버튼(submit)을 누르면 printAll.jsp 페이지로 이동
out.println("<input type=\"submit\" value=\"등록\">");
out.println("</form>");
out.println("</div>");
out.println("<hr>");
%>
</body>
</html>