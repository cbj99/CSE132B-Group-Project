<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table, table tr th, table tr td {
	border: 1px solid rgb(92 112 128/ 60%);
}

table {
	min-height: 25px;
	line-height: 25px;
	text-align: center;
	border-collapse: collapse;
	padding: 2px;
}
</style>
</head>
<body>

	<jsp:include page="menu.html" />


	<%-- Open connection code --%>
	<%-- Set the scripting language to java and --%>
	<%-- import the java.sql package --%>
	<%@ page language="java" import="java.sql.*"%>
	<%
	try {
		DriverManager.registerDriver(new org.postgresql.Driver());
		String strCBJ = "jdbc:postgresql:milestone_2?user=postgres&password=cbj991112";
		String StrD = "jdbc:postgresql:Test?user=postgres&password=vhgjhbgibiyy1234";
		Connection conn = DriverManager.getConnection(strCBJ);
	%>

	<%-- Query Code --%>
	<%
	int year = 2018;
	String quarter = "spring";

	String section_taught_by_faculty_query = "select distinct course_number, section_id from meetings where faculty_name = ? and quarter = ? and year_ = ? order by course_number;";
	
	String schedule_query = "WITH student_in_this_section as( select student_id from enrollment where year_= ? and quarter = ? and course_number = ? and section_id = ? ), all_section_of_all_student_in_this_section as (select distinct m.date_, m.begin_time, m.end_time from meetings m where m.year_= ? and m.quarter = ? and exists( select * from enrollment e where m.year_=e.year_ and m.quarter = e.quarter and m.course_number = e.course_number and m.section_id = e.section_id and e.student_id in (select * from student_in_this_section)) ), date_choice as (SELECT t.day::date FROM generate_series(?::date, ?::date, interval '1 day') AS t(day) order by t.day::date ), time_choice as (SELECT distinct t.time::time FROM generate_series(?::date, ?::date, interval '1 hour') AS t(time) order by t.time::time ), date_time_choice as ( select distinct date_choice.day, time_choice.time as begin_time, time_choice.time+interval '1 hour' as end_time from date_choice, time_choice order by date_choice.day, time_choice.time ) select d.day, d.begin_time, d.end_time from date_time_choice d where d.begin_time >= '08:00:00' and d.end_time <= '20:00:00' and d.begin_time <> '23:00:00' and d.end_time <> '00:00:00' and not exists( select a.date_, a.begin_time, a.end_time from all_section_of_all_student_in_this_section a where a.date_ = d.day and (a.begin_time, a.end_time) overlaps (d.begin_time, d.end_time) );";
	/* String schedule_query = "WITH student_in_this_section as(";
	schedule_query += " select student_id";
	schedule_query += " from enrollment";
	schedule_query += " where year_= ? and quarter = ? and course_number = ? and section_id = ? ";
	schedule_query += " ),";
	schedule_query += " all_section_of_all_student_in_this_section as (select distinct m.date_, m.begin_time, m.end_time"; 
	schedule_query += " from meetings m";
	schedule_query += " where m.year_= ? and m.quarter = ?"; 
	schedule_query += " and exists(";
	schedule_query += " select * from enrollment e";
	schedule_query += " where m.year_=e.year_ and m.quarter = e.quarter";
	schedule_query += " and m.course_number = e.course_number and m.section_id = e.section_id";
	schedule_query += " and e.student_id in (select * from student_in_this_section))";
	schedule_query += " ),";
	schedule_query += " date_choice as (SELECT t.day::date";
	schedule_query += " FROM generate_series(timestamp ?::date, timestamp ?::date, interval  '1 day') AS t(day)"; 
	schedule_query += " order by t.day::date";
	schedule_query += " ),";
	schedule_query += " time_choice as (SELECT distinct t.time::time"; 
	schedule_query += " FROM generate_series(timestamp ?::date, timestamp ?::date, interval  '1 hour') AS t(time)"; 
	schedule_query += " order by t.time::time";
	schedule_query += " ),";
	schedule_query += " date_time_choice as ( select distinct date_choice.day, time_choice.time as begin_time, time_choice.time+interval '1 hour' as end_time"; 
	schedule_query += " from date_choice, time_choice"; 
	schedule_query += " order by date_choice.day, time_choice.time";
	schedule_query += " )";
	schedule_query += " select d.day, d.begin_time, d.end_time";
	schedule_query += " from date_time_choice d";
	schedule_query += " where d.begin_time >= '08:00:00' and d.end_time <= '20:00:00'";
	schedule_query += " and d.begin_time <> '23:00:00' and d.end_time <> '00:00:00'"; 
	schedule_query += " and not exists(";
	schedule_query += " select a.date_, a.begin_time, a.end_time";
	schedule_query += " from all_section_of_all_student_in_this_section a";
	schedule_query += " where a.date_ = d.day";
	schedule_query += " and (a.begin_time, a.end_time) overlaps (d.begin_time, d.end_time)";
	schedule_query += " );"; */
	
	PreparedStatement section_state = conn.prepareStatement(section_taught_by_faculty_query);
	PreparedStatement schedule_state = conn.prepareStatement(schedule_query);
	
	ResultSet section_RS = null;

	String action = request.getParameter("action");
	String faculty = "";

	if (action != null && action.equals("input_faculty")) {
		conn.setAutoCommit(false);
        faculty = request.getParameter("FACULTYNAME");
		section_state.setString(1, request.getParameter("FACULTYNAME"));
		section_state.setString(2, quarter);
		section_state.setInt(3, year);
		section_RS = section_state.executeQuery();


		conn.commit();
		conn.setAutoCommit(true);
	}
	
	ResultSet schedule_RS = null;
	String begin_date = "";
	String end_date = "";
	String course_number = "";
	String section_id = "";
	String text;
	String[] result;
	
	
	if (action != null && action.equals("input")) {
		conn.setAutoCommit(false);
		
		begin_date = request.getParameter("BEGINDATE");
		end_date = request.getParameter("ENDDATE");
		// course_number = "CSE1";
		// section_id = 2;
		text = request.getParameter("SECTIONINFO");
		result = text.split(",");
		course_number = result[0];
		section_id = result[1];

		schedule_state.setInt(1, year);
		schedule_state.setString(2, quarter);
		schedule_state.setString(3, course_number);
		schedule_state.setString(4, section_id);
		schedule_state.setInt(5, year);
		schedule_state.setString(6, quarter);
		schedule_state.setString(7, begin_date);
		schedule_state.setString(8, end_date);
		schedule_state.setString(9, begin_date);
		schedule_state.setString(10, end_date);
		
		schedule_RS = schedule_state.executeQuery();


		conn.commit();
		conn.setAutoCommit(true);
	}
	%>
     
	<%-- Statement code --%>
	<%
	
	String faculty_query = "select distinct faculty_name from meetings where quarter = ? and year_ = ?;";
	PreparedStatement faculty_query_state = conn.prepareStatement(faculty_query);
	faculty_query_state.setString(1, quarter);
	faculty_query_state.setInt(2, year);

	ResultSet facultyRS = faculty_query_state.executeQuery();
	%>

	<%-- query form 1 code --%>
	<b>Enter the name you used when you registered as a faculty</b>
	<div style="height: 20px"></div>
	<table>
		<tr>
			<th>Faculty Name</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="2_b.jsp" method="get">
				<input type="hidden" value="input_faculty" name="action">
				<td><select name="FACULTYNAME" style="width: 130px;">
						<option value="" disabled selected hidden>Please
							Choose...</option>
						<%
						while (facultyRS.next()) {
						%>
						<option value=<%=facultyRS.getString("faculty_name")%>>
							<%=facultyRS.getString("faculty_name")%></option>
						<%
						}
						%>
				</select></td>
				<td><input style="width: 60px;" type="submit" value="Input"></td>
			</form>
		</tr>
	</table>
	<div style="height: 20px"></div>
	
	<%! String section_info; %>
	<%-- query form 2 code --%>
	<b>Your Name: <%=faculty %></b>
	<div style="height: 20px"></div>
	<b>Please select the course and section for which you want to schedule a review session in the current quarter</b>
	<br />
	<b>Then enter the period of time: [begin date, end date] you want to schedule the review course</b>
	<div style="height: 20px"></div>
	<table>
		<tr>
			<th>Section</th>
			<th>Begin Date</th>
			<th>End Date</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="2_b.jsp" method="get">
				<input type="hidden" value="input" name="action">
				<td><select name="SECTIONINFO" style="width: 130px;">
						<option value="" disabled selected hidden>Please
							Choose...</option>
						<%
						while (section_RS != null && section_RS.next()) {
						%>
						<% section_info = section_RS.getString("course_number").trim()+","+section_RS.getString("section_id").trim();%>
						<option value=<%=section_info%>><%=section_info%></option>
						<%
						}
						%>
				</select></td>
				<td><input value="" name="BEGINDATE" size="10"></td>
				<td><input value="" name="ENDDATE" size="10"></td>
				<td><input style="width: 60px;" type="submit" value="Input"></td>
			</form>
		</tr>
	</table>
	<div style="height: 20px"></div>


	<b>Report: </b>
	<%-- report code --%>
	<%if (section_id!=""){ %>
	<p>Available times for a review session of <%=course_number%>, <%=section_id%>, between <%=begin_date%> and <%=end_date%></p>
	<%} %>
	<table>
		<tr>
			<th>Date</th>
			<th>Begin Time</th>
			<th>End time</th>
		</tr>
		<%-- Iteration code for part 1 of this report--%>
		<%
		while (schedule_RS != null && schedule_RS.next()) {
		%>

		<tr>
			<td><%=schedule_RS.getDate("day")%></td>
			<td><%=schedule_RS.getTime("begin_time")%></td>
			<td><%=schedule_RS.getTime("end_time")%></td>
		</tr>
		<%
		}
		%>
	</table>

	


	<%-- Close connection code --%>
	<%
	// close Resultset 
	if (section_RS != null) {
		section_RS.close();
		// close Statement 
	}
	section_state.close();
	
	if (schedule_RS != null) {
		schedule_RS.close();
		// close Statement 
	}
	schedule_state.close();

	facultyRS.close();
	faculty_query_state.close();
	// close Connection
	conn.close();
	} catch (SQLException sqle) {
	out.println(sqle.getMessage());
	} catch (Exception e) {
	out.println("second exception\n");
	out.println(e.getMessage());
	}
	%>

</body>
</html>