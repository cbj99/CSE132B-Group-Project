<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        table,table tr th, table tr td { border:1px solid rgb(92 112 128 / 60%); }
        table { min-height: 25px; line-height: 25px; text-align: center; border-collapse: collapse; padding:2px;}   
</style>

</head>
<body>
	<jsp:include page="menu.html"/>
			
	<%-- Open connection code --%>
    <%-- Set the scripting language to java and --%>
    <%-- import the java.sql package --%>
	<%@ page language="java" import="java.sql.*" %>
	<%
	try {
		DriverManager.registerDriver(new org.postgresql.Driver());
		String strCBJ = "jdbc:postgresql:milestone_2?user=postgres&password=cbj991112";
		String StrD = "jdbc:postgresql:Test?user=postgres&password=vhgjhbgibiyy1234";
		Connection conn = DriverManager.getConnection(StrD);
	%>

	<%-- Query Code --%>
	<%
	int year = 2018;
	String quarter = "spring";
	String class_query = "SELECT * FROM classes where classes.course_number = ?;";
	String roster_query = "SELECT enrollment.student_id, student.first_name, student.last_name, enrollment.course_number, enrollment.year_, enrollment.quarter, enrollment.section_id, enrollment.faculty_name, courses.unit, courses.grading_option FROM enrollment, courses, student WHERE enrollment.course_number = ? and enrollment.year_ = ? and enrollment.quarter=? and courses.course_number = enrollment.course_number and student.student_id = enrollment.student_id;";

	PreparedStatement class_state = conn.prepareStatement(class_query);
	PreparedStatement roster_state = conn.prepareStatement(roster_query);

	ResultSet class_RS = null;
	ResultSet roster_RS = null;

	String action = request.getParameter("action");

	if (action != null && action.equals("query")) {
		conn.setAutoCommit(false);
		class_state.setString(1, request.getParameter("COURSENUMBER")); 
		class_RS = class_state.executeQuery(); 
		
		roster_state.setString(1, request.getParameter("COURSENUMBER")); 
		roster_state.setInt(2, year);
		roster_state.setString(3, quarter);
		roster_RS = roster_state.executeQuery(); 
		
		conn.commit();
		conn.setAutoCommit(true);
	}
	%>

	<%-- Statement code --%>
	<%
	Statement classState = conn.createStatement();
	String classQuery = "select distinct(course_number) from classes order by course_number";
	ResultSet classRS = classState.executeQuery(classQuery);
	%>

	<%-- query form code --%>
	<table>
		<tr>
			<th>Course Number</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="1_b.jsp" method="get">
				<input type="hidden" value="query" name="action">
				<td><select name="COURSENUMBER" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (classRS.next()) {
						%>
						<option value=<%=classRS.getString("course_number")%>>
							<%=classRS.getString("course_number")%>
						</option>
						<%
						}
						%>
				</select></td>
				<td>
				<input style="width: 60px;" type="submit" value="Input"></td>
			</form>
		</tr>
	</table>
	<div style="height: 20px"></div>
	
	<%-- report code --%>
	<b>Report: </b>
	<p>Classes Info:</p>
	<table>
		<tr>
			<th>Course Number</th>
			<th>Year</th>
			<th>Quarter</th>
			<th>Section</th>
		</tr>
		<%-- Iteration code for part 1 of this report--%>
		<%
		while (class_RS != null && class_RS.next()) {
		%>
		<tr>
			<td><%=class_RS.getString("course_number").trim()%></td>
			<td><%=class_RS.getInt("year_")%></td>
			<td><%=class_RS.getString("quarter").trim()%></td>
			<td><%=class_RS.getInt("section_id")%></td>
		</tr>
		<%
		}
		%>
	</table>

	<div style="height: 20px"></div>
	<p>Roster</p>
	<table>
		<tr>
			<th>Student ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Course Number</th>
			<th>Year</th>
			<th>Quarter</th>
			<th>Faculty</th>
			<th>Units</th>
			<th>Grading Option</th>
		</tr>
		
		<%-- Iteration code for part 2 of this report--%>
		<%
		while (roster_RS != null && roster_RS.next()) {
		%>

		<tr>
			<td><%=roster_RS.getInt("student_id")%></td>
			<td><%=roster_RS.getString("first_name").trim()%></td>
			<td><%=roster_RS.getString("last_name").trim()%></td>
			<td><%=roster_RS.getString("course_number").trim()%></td>
			<td><%=roster_RS.getInt("year_")%></td>
			<td><%=roster_RS.getString("quarter").trim()%></td>
			<td><%=roster_RS.getInt("section_id")%></td>
			<td><%=roster_RS.getString("faculty_name").trim()%></td>
			<td><%=roster_RS.getInt("unit")%></td>
			<td><%=roster_RS.getString("grading_option").trim()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<%-- Close connection code --%>
	<%
	// close Resultset 
	roster_RS.close(); 
	class_RS.close(); 
	classRS.close(); 
	
	// close Statement 
	classState.close(); 
	roster_state.close(); 
	class_state.close(); 
	
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