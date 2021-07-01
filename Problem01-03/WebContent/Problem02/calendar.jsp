<!-- 컴퓨터학과 20191003 이현아 -->
<!-- 크롬에 최적화됨(window용) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%!
	public String parseDay(int cnt, String day)
	{
		String str = "null";
		
		if(cnt % 7 == 1)
			str = "<tr id=\"tr\"><td id=\"td\"><font color=\"red\">" +day+ "</font></td>";
		else if(cnt % 7 == 0)
			str = "<td id=\"td\"><font color=\"blue\">" +day+ "</font></td></tr>";
		else
			str = "<td id=\"td\">" +day+ "</td>";
		
		return str;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>

<style>
#table {
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}
#table, #tr, #td {
	border: solid 1px;
	border-color: #808080;
	text-align: center;
	width: 650px;
	height: 30px;
}
#td {
	width: 130px;
}

#daytable, #daytr, #daytd1, #daytd2, #daytd3{
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	width: 650px;
}
#daytd2 {
	
}
#daytd2 {
	text-align: center;
	
}
#daytd3 {
	text-align: right;
}
p {text-align:center;}
</style>
</head>
<body>

<%
	Calendar today = Calendar.getInstance();

	int tYear = today.get(Calendar.YEAR);
	int tMonth = today.get(Calendar.MONTH);
	int tDate = today.get(Calendar.DATE);
	today.set(tYear, tMonth, tDate);
	//int year = 2020;
	//int month = 8;
	
	String sYear = request.getParameter("YEAR");
	String sMonth = request.getParameter("MONTH");
	
	int year, month;
	if(sYear == null && sMonth == null)
	{
		year = tYear;
		month = tMonth;
	}
	else
	{
		year = Integer.parseInt(sYear);
		month = Integer.parseInt(sMonth);
	}
	
	if(month < 0)
	{
		month = 11;
		year -= 1;
	}
	else if(month > 11)	
	{
		month = 0;
		year += 1;
	}
	
	out.println("<table id=\"daytable\">");
	out.println("<tr id=\"daytr\">");
	out.println("<td id=\"daytd1\">");
	out.println("<a href=\"calendar.jsp?YEAR=" +(year-1)+ "&MONTH=" +month+ "\">◀</a>");
	out.println("<b> " +year+ "년  </b>");
	out.println("<a href=\"calendar.jsp?YEAR=" +(year+1)+ "&MONTH=" +month+ "\">▶</a>");
	out.println("</td>");
	out.println("<td id=\"daytd2\">");
	out.println("<a href=\"calendar.jsp?YEAR=" +year+ "&MONTH=" +(month - 1)+ "\">◀</a>");
	out.println("<b> " +(month + 1)+ "월  </b>");
	out.println("<a href=\"calendar.jsp?YEAR=" +year+ "&MONTH=" +(month + 1)+ "\">▶</a>");
	out.println("</td>");
	out.println("<td id=\"daytd3\">");
	out.println("<h4>" +tYear+ "-" +(tMonth + 1)+ "-" +tDate+ "</h4><p>");
	out.println("</td>");
	out.println("</tr>");
	out.println("<table>");
	
	out.println("<table id=\"table\">");
	
	Calendar cal = Calendar.getInstance();
	cal.set(year, month, 1);
	int startDay = cal.get(Calendar.DAY_OF_WEEK);
	int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	String day[] = {"일", "월", "화", "수","목", "금", "토"};
	int cnt = 1 ;
	for(int i = 0; i < 7; i++)
	{
		out.println(parseDay(cnt, "<b>" +day[i]));
		cnt++;
	}
	
	for(int i = 1; i < startDay; i++)
	{
		out.println("<td id=\"td\">&nbsp;</td>");
		cnt++;
	}
	
	for(int i = 1; i <= end; i++)
	{
		String d = Integer.toString(i);
		out.println(parseDay(cnt, d));
		cnt++;
	}
	
	while(cnt % 7 != 1)
	{
		out.println("<td id=\"td\">&nbsp;</td>");
		cnt++;
	}
	
	out.println("</table>");
%>
<p><a href="../Problem00/combine.jsp">home</a></p>
</body>
</html>