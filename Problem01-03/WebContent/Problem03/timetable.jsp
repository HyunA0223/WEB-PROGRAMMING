<!-- timetable : selectLecture 페이지에서 선택된 과목을 시간표에 출력하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<%!
//과목 타입, 연강 여부, 과목 명을 초기화
//가로 줄(dayIndex) : 월 화 수 목 금, 세로 줄(timeIndex) : 1교시 ~ 6교시
int [][]lectureType = { 
   { 0, 0, 0, 0, 0},//0 수업 없음
   { 0, 0, 0, 0, 0},//1 전필(노)
   { 0, 0, 0, 0, 0},//2 전선(파)
   { 0, 0, 0, 0, 0},//3 교양(회)
   { 0, 0, 0, 0, 0},//4 자유선택(무색)
   { 0, 0, 0, 0, 0}
};
int [][]consecutive = {//연강 여부 : 1로 초기화
   { 1, 1, 1, 1, 1},  
   { 1, 1, 1, 1, 1},
   { 1, 1, 1, 1, 1},
   { 1, 1, 1, 1, 1},
   { 1, 1, 1, 1, 1},
   { 1, 1, 1, 1, 1}
};
int[][] lectureTitle = {//과목 이름 : -1로 초기화
   {-1,-1,-1,-1,-1},
   {-1,-1,-1,-1,-1},
   {-1,-1,-1,-1,-1},
   {-1,-1,-1,-1,-1},
   {-1,-1,-1,-1,-1},
   {-1,-1,-1,-1,-1}
};

//사용이 용이하도록 과목 명과 요일을 배열 형태로 정의
String[] titleNames = {
      "웹프로그래밍", "운영체제", "소프트웨어프로그래밍", "데이터베이스개론",
      "자료구조", "네트워크", "창의와 감성", "사회봉사"
};

String[] days = {"월", "화", "수", "목", "금"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Problem 02</title>
<head>
<style>
table {
   border-collapse:collapse;
   margin-left:auto;
   margin-right:auto;
}
table, td, th {
   border:solid 1px;   
   width:500px;
   height:50px;
   text-align:center;
}
caption {
   font-size:20px;
   line-height:45px;
   font-weight:bold;
}
td.yellow {
   background-color: #FBD85A;
}
td.skyblue {
   background-color: #8EB5ED;
}
td.gray {
   background-color: #B5B3B1;
}
td {
   font-size:13px;
}
th {
   font-size:20px;
}
</style>
</head>
<body>
<%
//arraylist에 문자열 timetable로 설정된 session 값을 추가
@SuppressWarnings("unchecked")
ArrayList<String> list = (ArrayList<String>)session.getAttribute("timetable");

out.println("<table>");
out.println("<caption>강의 시간표</caption>");
out.println("<tr>");
//시간표 요일 출력
out.println("<th>2학년</th>");
for(int i = 0; i < 5; i++)
	out.println("<th>" + days[i] + "</th>");
out.println("</tr>");

//session.getAttribute 반환 값이 null인 경우 : ArrayList 객체를 생성한 후 session.setAttribute를 사용하여 timetable에 속성을 등록
if (list == null) {
	list = new ArrayList<String>();
	session.setAttribute("timetable", list);
}

//request.getParameter 값 중 null 값이 있으면(과목 선택이 안되어있을 경우) : 비어있는 시간표를 출력
if(request.getParameter("lectureType") == null) {
	for(int i = 0; i < 6; i++) {
		   out.println("<tr>");
		   out.println("<th>" + (i + 1) + "</th>");
		   for(int j = 0; j < 5; j++) {
			   out.println("<td> </td>");
		   }
		   out.println("</tr>");
	}	
	out.println("</table>");
	out.println("<br>");
	out.println("<hr>");
}

//request.getParameter 값 중 null 값이 없을 때(과목 선택이 된 경우) : 선택된 과목을 시간표에 출력
if(request.getParameter("lectureType") != null) {
	//timeIndex는 시간에 대한 인덱스, dayIndex는  요일에 대한 인덱스, titleIndex는 titleNames[]에 대한 인덱스를 나타냄
	int timeIndex = 0, dayIndex = 0, titleIndex = -1;
	
	//시간표의 시간과 요일에 대한 인덱스 설정
	for(int i = 0; i < 5; i++) 
		//선택된 과목의 요일이 앞에 정의 된 요일 배열의 i번째 요일과 같을 경우, dayIndex = i
		if (days[i].equals(request.getParameter("day")))
			dayIndex = i;
	//선택된 과목의 시간에서 1을 뺀 값을 timeIndex로 설정(1을 뺀 이유는 배열의 인덱스이기 때문)
	timeIndex = Integer.parseInt(request.getParameter("time")) - 1;
	
	//과목 타입 설정
	String type = request.getParameter("lectureType"); //선택된 과목 타입을 type에 저장
	//type이 전공 필수일 경우에는 선택된 시간과 요일의 lectureType의 값을 1로 설정
	if(type.equals("전공필수"))
		lectureType[timeIndex][dayIndex] = 1;
	//type이 전공 선택일 경우 2로 설정
	else if(type.equals("전공선택"))
		lectureType[timeIndex][dayIndex] = 2;
	//type이 교양일 경우 3으로 설정
	else if(type.equals("교양"))
		lectureType[timeIndex][dayIndex] = 3;
	//type이 자유선택일 경우 4로 설정
	else
		lectureType[timeIndex][dayIndex] = 4;
	
	//연강 설정
	int cons = Integer.parseInt(request.getParameter("consecutive")); //선택된 연강 시간을 cons에 저장(int로 형변환)
	//선택된 시간과 요일의 consecutive에 선택된 연강시간(== cons) 저장 
	consecutive[timeIndex][dayIndex] = cons;
	//같은 요일의 (선택된 시간 + 1)~ (선택된 시간 + cons(연강 시간) - 1)까지의 consecutive 배열을 0으로 설정
	//ex. cons = 3 & timeIndex = 2로 선택된 경우, consecutive[2 + 1][dayIndex]부터 consecutive[2 + 2]까지 0으로 설정
	for(int i = timeIndex + 1; i < timeIndex + cons; i++)
		consecutive[i][dayIndex] = 0;
	
	//과목명 설정
	String title = request.getParameter("lectureTitle"); //선택된 과목명을 title에 저장
	//앞에 정의된 과목명 배열의 i번째 값과 선택된 과목 명이 같을 경우, titleIndex = i;
	for(int i = 0; i < 8; i++) {
		if (titleNames[i].equals(title))
			titleIndex = i;
	}
	//선택된 시간과 요일의 lectureTitle을 titleIndex로 설정
	lectureTitle[timeIndex][dayIndex] = titleIndex;
	
	//시간표 출력
	String color;
	
	for(int i = 0; i < 6; i++) {
	   out.println("<tr>");
	   out.println("<th>" + (i + 1) + "</th>");
	   for(int j = 0; j < 5; j++) {
		   //lecutureType의 값이 1일 경우 노란색으로 시간표 출력(전공 필수)
			if (lectureType[i][j] == 1)
				color = "yellow";
		   //2일 경우 하늘색(전공 선택)
			else if (lectureType[i][j] == 2)
				color = "skyblue";
		   //3일 경우 회색(교양)
			else if (lectureType[i][j] == 3)
				color = "gray";
		   //4일 경우 무색(자유 선택)
			else
				color = "none";
	      
		  //consecutive값이 0이 아니고 lecutreTitle값이 -1이 아닌 경우(해당하는 과목명이 존재할 경우), consecutive의 값만큼 세로셀을 합치고 과목 명 출력
	      if(consecutive[i][j] != 0)
	         out.println("<td rowspan=\"" + consecutive[i][j] + "\" class=\"" + color + "\">");
	      if (lectureTitle[i][j] != -1)
	         out.println(titleNames[lectureTitle[i][j]]);
	      out.println("</td>");
	   }
	   out.println("</tr>");
	}   
	out.println("</table>");
	out.println("<br>");
	out.println("<hr>");
}

%>
</body>
</html>