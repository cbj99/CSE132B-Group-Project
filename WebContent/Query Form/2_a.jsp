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

	String student_id_query = "select * from student where student_id = ?";
	String class_enrolled_query = "SELECT e.course_number, c.course_title FROM enrollment e, courses c WHERE e.course_number = c.course_number AND e.student_id = ? AND e.year_ = ? AND e.quarter = ?";
	String class_conflict_query = "WITH class_enrolled AS(";
	class_conflict_query +=	" SELECT course_number"; 
	class_conflict_query +=	" FROM enrollment";
	class_conflict_query +=	" WHERE student_id = ? AND year_ = ? AND quarter = ?";
	class_conflict_query +=	" ), total_conflict AS(";
	class_conflict_query +=	" SELECT DISTINCT c.course_number, m2.type_, m1.begin_time, m1.end_time, e.course_number AS conflict_course";
	class_conflict_query +=	" FROM classes c, enrollment e, meetings m1, meetings m2";
	class_conflict_query +=	" WHERE c.year_ = ? AND c.quarter = ?";
	class_conflict_query +=	" AND c.course_number NOT IN (SELECT * FROM class_enrolled)";
	class_conflict_query +=	" AND e.course_number IN (SELECT * FROM class_enrolled)";
	class_conflict_query +=	" AND m1.type_ <> 'Review Session' AND m2.type_ <> 'Review Session'";
	class_conflict_query +=	" AND c.year_ = e.year_ AND c.quarter = e.quarter AND c.course_number <> e.course_number";
	class_conflict_query +=	" AND c.year_ = m1.year_ AND c.quarter = m1.quarter AND c.section_id = m1.section_id AND c.course_number = m1.course_number";
	class_conflict_query +=	" AND e.year_ = m2.year_ AND e.quarter = m2.quarter AND e.section_id = m2.section_id AND e.course_number = m2.course_number";
	class_conflict_query +=	" AND m1.date_ = m2.date_";
	class_conflict_query +=	" AND (m1.end_time > m2.begin_time OR m2.end_time > m1.begin_time"; 
	class_conflict_query +=	"	 OR (m1.end_time <= m2.end_time AND m1.begin_time >= m2.begin_time)";
	class_conflict_query +=	"	 OR (m2.end_time <= m1.end_time AND m2.begin_time >= m1.begin_time))";
	class_conflict_query +=	" )";
	class_conflict_query +=	" SELECT total_conflict.course_number, courses.course_title, type_, begin_time, end_time, string_agg(conflict_course, ', ' ORDER BY conflict_course) AS conflict_courses";
	class_conflict_query +=	" FROM total_conflict, courses";
	class_conflict_query +=	" WHERE total_conflict.course_number = courses.course_number";
	class_conflict_query +=	" GROUP BY total_conflict.course_number, courses.course_title, type_, begin_time, end_time;";


	PreparedStatement student_id_state = conn.prepareStatement(student_id_query);
	PreparedStatement class_enrolled_state = conn.prepareStatement(class_enrolled_query);
	PreparedStatement class_conflict_state = conn.prepareStatement(class_conflict_query);

	ResultSet student_id_RS = null;
	ResultSet class_enrolled_RS = null;
	ResultSet class_conflict_RS = null;

	String action = request.getParameter("action");

	if (action != null && action.equals("input")) {
		conn.setAutoCommit(false);

		student_id_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID").split(",|:")[0]));
		student_id_RS = student_id_state.executeQuery();
		
		class_enrolled_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID").split(",|:")[0]));
		class_enrolled_state.setInt(2, year);
		class_enrolled_state.setString(3, quarter);
		class_enrolled_RS = class_enrolled_state.executeQuery();

		class_conflict_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID").split(",|:")[0]));
		class_conflict_state.setInt(2, year);
		class_conflict_state.setString(3, quarter);
		class_conflict_state.setInt(4, year);
		class_conflict_state.setString(5, quarter);
		class_conflict_RS = class_conflict_state.executeQuery();

		conn.commit();
		conn.setAutoCommit(true);
	}
	%>

	<%-- Statement code --%>
	<%

	String student_query_by_year_quarter = "select distinct s.student_id, s.first_name, s.middle_name, s.last_name from enrollment e, student s where e.quarter = ? and e.year_ = ? and s.student_id = e.student_id;";
	PreparedStatement student_query_by_year_quarter_state = conn.prepareStatement(student_query_by_year_quarter);
	student_query_by_year_quarter_state.setString(1, quarter);
	student_query_by_year_quarter_state.setInt(2, year);

	ResultSet studentRS = student_query_by_year_quarter_state.executeQuery();
	%>

	<%-- query form code --%>
	<table>
		<tr>
			<th>Student ID: first name, middle name, last name</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="2_a.jsp" method="get">
				<input type="hidden" value="input" name="action">			
				<td><select name="STUDENTID" style="width: 170px;">
						<option value="" disabled selected hidden>Please
							Choose...</option>
						<%int pass_value = 0; %>
						<%
						while (studentRS.next()) {
						%>
						<%pass_value = studentRS.getInt("student_id"); %>
						<option value=<%=Integer.toString(studentRS.getInt("student_id"))+": "+studentRS.getString("first_name").trim()+", "+studentRS.getString("middle_name").trim()+", "+studentRS.getString("last_name").trim()%>>
							<%=Integer.toString(studentRS.getInt("student_id"))+": "+studentRS.getString("first_name").trim()+", "+studentRS.getString("middle_name").trim()+", "+studentRS.getString("last_name").trim()%></option>
						<%
						}
						%>
				</select></td>
				<input type="hidden" value=pass_value name="DATE" size="20">
				<td><input style="width: 60px;" type="submit" value="Input"></td>
			</form>
		</tr>
	</table>
	<div style="height: 20px"></div>


	<b>Report: </b>
	<%-- report code --%>
	<p>Personal Info:</p>
	<table>
		<tr>
			<th>ID</th>
			<th>SSN</th>
			<th>First Name</th>
			<th>Middle Name</th>
			<th>Last Name</th>
		</tr>
		<%-- Iteration code for part 1 of this report--%>
		<%
		while (student_id_RS != null && student_id_RS.next()) {
		%>

		<tr>
			<td><%=student_id_RS.getInt("student_id")%></td>
			<td><%=student_id_RS.getInt("SSN")%></td>
			<td><%=student_id_RS.getString("first_name").trim()%></td>
			<td><%=student_id_RS.getString("middle_name").trim()%></td>
			<td><%=student_id_RS.getString("last_name").trim()%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<div style="height: 20px"></div>
	<p>Classes offered in the current quarter that you already enrolled:</p>
	<table>
		<tr>
			<th>Course Number</th>
			<th>Course Title</th>
		</tr>
		<%-- Iteration code for part 2 of this report--%>
		<%
		while (class_enrolled_RS != null && class_enrolled_RS.next()) {
		%>

		<tr>
			<td><%=class_enrolled_RS.getString("course_number").trim()%></td>
			<td><%=class_enrolled_RS.getString("course_title").trim()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<div style="height: 20px"></div>
	<p>Classes offered in the current quarter that you cannot take:</p>
	<table>
		<tr>
			<th>Course Number</th>
			<th> Course Title </th>
			<th> Meeting Type </th>
			<th><b>Regular Meeting</b> Begin Time</th>
			<th><b>Regular Meeting</b> End Time</th>
			<th>Conflict Courses(which you already enrolled)</th>
		</tr>
		<%-- Iteration code for part 3 of this report--%>
		<%
		while (class_conflict_RS != null && class_conflict_RS.next()) {
		%>

		<tr>
			<td><%=class_conflict_RS.getString("course_number").trim()%></td>
			<td><%=class_conflict_RS.getString("course_title").trim()%></td>
			<td><%=class_conflict_RS.getString("type_").trim()%></td>
			<td><%=class_conflict_RS.getTime("begin_time")%></td>
			<td><%=class_conflict_RS.getTime("end_time")%></td>
			<td><%=class_conflict_RS.getString("conflict_courses").trim()%></td>
		</tr>
		<%
		}
		%>
	</table>


	<%-- Close connection code --%>
	<%
	// close Resultset 
	if (student_id_RS != null) {
		student_id_RS.close();
		// close Statement 
	}
	student_id_state.close();
	if (class_enrolled_RS != null) {
		class_enrolled_RS.close();
		// close Statement 
	}
	class_enrolled_state.close();
	if (class_conflict_RS != null) {
		class_conflict_RS.close();
		// close Statement 
	}
	class_conflict_state.close();
	studentRS.close();
	student_query_by_year_quarter_state.close();
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