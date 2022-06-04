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
    // first display
    String course_faculty_quarter_str = "SELECT * FROM CPQG where course_number=? and faculty_name=? and quarter=? and year_ = ? order by CPQG.course_number;"; 
    PreparedStatement course_faculty_quarter_state = conn.prepareStatement(course_faculty_quarter_str);
    ResultSet course_faculty_quarter_RS = null;

    // second display 
    String course_faculty_str = "SELECT * FROM CPG where course_number=? and faculty_name=? order by CPG.course_number "; 
    PreparedStatement course_faculty_state = conn.prepareStatement(course_faculty_str);
    ResultSet course_faculty_RS = null;

    String course_grade_str = "with info3 as ( (SELECT past_enrollment.course_number, past_enrollment.year_, past_enrollment.grade, count(*) FROM past_enrollment, GRADE_CONVERSION WHERE past_enrollment.grade = GRADE_CONVERSION.grade GROUP BY past_enrollment.course_number, past_enrollment.grade, past_enrollment.year_) union (SELECT past_enrollment.course_number, past_enrollment.year_, 'other' as grade, count(*) FROM past_enrollment WHERE past_enrollment.grade not in (select grade from GRADE_CONVERSION) GROUP BY past_enrollment.course_number, past_enrollment.year_) ) SELECT * FROM info3 WHERE course_number=? order by info3.course_number "; 
    PreparedStatement course_grade_state = conn.prepareStatement(course_grade_str);
    ResultSet course_grade_RS = null;

    String course_faculty_grade_str="with convert_grade_value as ( SELECT past_enrollment.student_id, past_enrollment.course_number, past_enrollment.year_, past_enrollment.quarter, past_enrollment.section_id, past_enrollment.section_id, past_enrollment.faculty_name, GRADE_CONVERSION.number_grade, courses.unit FROM past_enrollment, GRADE_CONVERSION, courses WHERE past_enrollment.grade = GRADE_CONVERSION.grade and courses.course_number = past_enrollment.course_number ) SELECT convert_grade_value.course_number, convert_grade_value.faculty_name, convert_grade_value.year_, sum(convert_grade_value.number_grade * convert_grade_value.unit) / sum(convert_grade_value.unit) as gpa FROM convert_grade_value where course_number=? and faculty_name=? GROUP BY convert_grade_value.course_number, convert_grade_value.faculty_name, convert_grade_value.year_"; 
    PreparedStatement course_faculty_grade_state = conn.prepareStatement(course_faculty_grade_str);
    ResultSet course_faculty_grade_RS = null;


	String action = request.getParameter("action");
	if (action != null && action.equals("query")) {
		conn.setAutoCommit(false);
        
        course_faculty_quarter_state.setString(1, request.getParameter("COURSENUMBER")); 
        course_faculty_quarter_state.setString(2, request.getParameter("FACULTY")); 
        course_faculty_quarter_state.setString(3, request.getParameter("QUARTER"));
		course_faculty_quarter_state.setInt(4, Integer.parseInt(request.getParameter("YEAR")));
        course_faculty_quarter_RS = course_faculty_quarter_state.executeQuery(); 

        course_faculty_state.setString(1, request.getParameter("COURSENUMBER")); 
        course_faculty_state.setString(2, request.getParameter("FACULTY")); 
        course_faculty_RS = course_faculty_state.executeQuery(); 

        course_grade_state.setString(1, request.getParameter("COURSENUMBER"));
        course_grade_RS = course_grade_state.executeQuery(); 

        course_faculty_grade_state.setString(1, request.getParameter("COURSENUMBER")); 
        course_faculty_grade_state.setString(2, request.getParameter("FACULTY"));  
        course_faculty_grade_RS = course_faculty_grade_state.executeQuery(); 

		conn.commit();
		conn.setAutoCommit(true);
	}

	%>

	<%-- Statement code --%>
	<%
	Statement course_number = conn.createStatement();
	Statement faculty_state = conn.createStatement();
	Statement quarter_state = conn.createStatement();
	Statement year_state = conn.createStatement();

	String course_number_str = "select distinct(course_number) from past_enrollment order by course_number;";
	String faculty_str = "select distinct(faculty_name) from past_enrollment"; 
    String quarter_str = "select distinct(quarter) from past_enrollment;"; 
	String year_str = "select distinct(year_) from past_enrollment;"; 
	
	ResultSet course_number_RS = course_number.executeQuery(course_number_str);
	ResultSet faculty_RS = faculty_state.executeQuery(faculty_str);
    ResultSet quarter_RS = quarter_state.executeQuery(quarter_str);
	ResultSet year_RS = year_state.executeQuery(year_str);
	%>

	<%-- query form code --%>
	<table>
		<tr>
			<th>Course Number</th>
			<th>Faculty</th>
            <th>Quarter</th>
			<th>Year</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="3_a.jsp" method="get">
				<input type="hidden" value="query" name="action">
				<td><select name="COURSENUMBER" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (course_number_RS.next()) {
						%>
						<option value=<%=course_number_RS.getString("course_number")%>>
							<%=course_number_RS.getString("course_number")%>
						</option>
						<%
						}
						%>
				</select></td>
				<td><select name="FACULTY" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (faculty_RS.next()) {
						%>
						<option value=<%=faculty_RS.getString("faculty_name")%>>
							<%=faculty_RS.getString("faculty_name")%>
						</option>
						<%
						}
						%>
				</select></td>
                <td><select name="QUARTER" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (quarter_RS.next()) {
						%>
						<option value=<%=quarter_RS.getString("quarter")%>>
							<%=quarter_RS.getString("quarter")%>
						</option>
						<%
						}
						%>
				</select></td>
				<td><select name="YEAR" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (year_RS.next()) {
						%>
						<option value=<%=year_RS.getInt("year_")%>>
							<%=year_RS.getInt("year_")%>
						</option>
						<%
						}
						%>
				</select></td>
				<td><input style="width: 60px;" type="submit" value="Input"></td>
			</form>
		</tr>
	</table>
	<div style="height: 20px"></div>
	
	<%-- report code --%>
	<b>Report: </b>
	<p>Course Faculty Quarter</p>
	<table>
		<tr>
			<th>Course Number</th>
            <th>Faculty</th>
            <th>Year</th>
            <th>Quarter</th>
			<th>Grade</th>
			<th>Count</th>
		</tr>
		<%
		while (course_faculty_quarter_RS != null && course_faculty_quarter_RS.next()) {
		%>
		<tr>
			<td><%=course_faculty_quarter_RS.getString("course_number")%></td>
			<td><%=course_faculty_quarter_RS.getString("faculty_name")%></td>
			<td><%=course_faculty_quarter_RS.getInt("year_")%></td>
            <td><%=course_faculty_quarter_RS.getString("quarter")%></td>
            <td><%=course_faculty_quarter_RS.getString("grade")%></td>
            <td><%=course_faculty_quarter_RS.getInt("count")%></td>
		</tr>
		<%
		}
		%>
	</table>

    <p>Course by Faculty over all Years</p>
	<table>
		<tr>
			<th>Course Number</th>
            <th>Faculty</th>
			<th>Grade</th>
			<th>Count</th>
		</tr>
		<%
		while (course_faculty_RS != null && course_faculty_RS.next()) {
		%>
		<tr>
			<td><%=course_faculty_RS.getString("course_number")%></td>
			<td><%=course_faculty_RS.getString("faculty_name")%></td>
            <td><%=course_faculty_RS.getString("grade")%></td>
            <td><%=course_faculty_RS.getInt("count")%></td>
		</tr>
		<%
		}
		%>
	</table>

    <p>Course Grade over Years</p>
	<table>
		<tr>
			<th>Course Number</th>
            <th>Year</th>
			<th>Grade</th>
			<th>Count</th>
		</tr>
		<%
		while (course_grade_RS != null && course_grade_RS.next()) {
		%>
		<tr>
			<td><%=course_grade_RS.getString("course_number")%></td>
            <td><%=course_grade_RS.getInt("year_")%></td>
            <td><%=course_grade_RS.getString("grade")%></td>
            <td><%=course_grade_RS.getInt("count")%></td>
		</tr>
		<%
		}
		%>
	</table>

    <p>Course GPA by Faculty over Years</p>
	<table>
		<tr>
			<th>Course Number</th>
            <th>Faculty</th>
            <th>Year</th>
			<th>GPA</th>
		</tr>
		<%
		while (course_faculty_grade_RS != null && course_faculty_grade_RS.next()) {
		%>
		<tr>
			<td><%=course_faculty_grade_RS.getString("course_number")%></td>
            <td><%=course_faculty_grade_RS.getString("faculty_name")%></td>
            <td><%=course_faculty_grade_RS.getInt("year_")%></td>
            <td><%=course_faculty_grade_RS.getString("gpa").trim()%></td>
		</tr>
		<%
		}
		%>
	</table>


	<%-- Close connection code --%>
	<%
	// close Resultset 
	
	// close Statement 

	// close Connection
	conn.close();
	
	} catch (SQLException sqle) {
	String s = sqle.getMessage(); 
	out.println(sqle.getMessage());
	} catch (Exception e) {
	out.println("second exception\n");
	out.println(e.getMessage());
	}
	%>
</body>
</html>