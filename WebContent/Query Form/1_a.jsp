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
		Connection conn = DriverManager.getConnection(StrD);
	%>

	<%-- Query Code --%>
	<%
	int year = 2018;
	String quarter = "SPRING";

	String student_id_query = "select * from student where student_id = ?";
	String enrollment_query = "SELECT enrollment.student_id, enrollment.course_number, enrollment.year_, enrollment.quarter, enrollment.section_id, enrollment.faculty_name, enrollment.status, enrollment.grade, enrollment.unit_taken, courses.department, courses.lab_required FROM enrollment, courses where enrollment.student_id = ? and enrollment.year_ = ? and enrollment.quarter = ? and courses.course_number =  enrollment.course_number";

	PreparedStatement student_id_state = conn.prepareStatement(student_id_query);
	PreparedStatement enrollment_state = conn.prepareStatement(enrollment_query);

	ResultSet student_id_RS = null;
	ResultSet enrollment_RS = null;

	String action = request.getParameter("action");

	if (action != null && action.equals("input")) {
		conn.setAutoCommit(false);

		student_id_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
		student_id_RS = student_id_state.executeQuery();

		enrollment_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
		enrollment_state.setInt(2, year);
		enrollment_state.setString(3, quarter);
		enrollment_RS = enrollment_state.executeQuery();

		conn.commit();
		conn.setAutoCommit(true);
	}
	%>

	<%-- Statement code --%>
	<%
	Statement studentState = conn.createStatement();
	String student_query_by_year_quarter = "select distinct student_id from enrollment where quarter = ? and year_ = ?;";
	PreparedStatement student_query_by_year_quarter_state = conn.prepareStatement(student_query_by_year_quarter);
	student_query_by_year_quarter_state.setString(1, quarter);
	student_query_by_year_quarter_state.setInt(2, year);

	ResultSet studentRS = student_query_by_year_quarter_state.executeQuery();
	%>

	<%-- query form code --%>
	<table>
		<tr>
			<th>Student ID</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="1_a.jsp" method="get">
				<input type="hidden" value="input" name="action">
				<td><select name="STUDENTID" style="width: 130px;">
						<option value="" disabled selected hidden>Please
							Choose...</option>
						<%
						while (studentRS.next()) {
						%>
						<option value=<%=studentRS.getInt("student_id")%>>
							<%=studentRS.getInt("student_id")%></option>
						<%
						}
						%>
				</select></td>
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
	<p>Classes taken in the current quarter:</p>
	<table>
		<tr>
			<th>student id</th>
			<th>course_number</th>
			<th>year</th>
			<th>quarter</th>
			<th>section_id</th>
			<th>faculty_name</th>
			<th>status</th>
			<th>grade</th>
			<th>units</th>
			<th>department</th>
			<th>lab required</th>
		</tr>
		<%-- Iteration code for part 2 of this report--%>
		<%
		while (enrollment_RS != null && enrollment_RS.next()) {
		%>

		<tr>
			<td><%=enrollment_RS.getInt("student_id")%></td>
			<td><%=enrollment_RS.getString("course_number").trim()%></td>
			<td><%=enrollment_RS.getInt("year_")%></td>
			<td><%=enrollment_RS.getString("quarter").trim()%></td>
			<td><%=enrollment_RS.getString("section_id").trim()%></td>
			<td><%=enrollment_RS.getString("faculty_name").trim()%></td>
			<td><%=enrollment_RS.getString("status").trim()%></td>
			<td><%=enrollment_RS.getString("grade").trim()%></td>
			<td><%=enrollment_RS.getInt("unit_taken")%></td>
			<td><%=enrollment_RS.getString("department").trim()%></td>
			<td><%=enrollment_RS.getInt("lab_required")%></td>
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
	if (enrollment_RS != null) {
		enrollment_RS.close();
		// close Statement 
	}
	enrollment_state.close();
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