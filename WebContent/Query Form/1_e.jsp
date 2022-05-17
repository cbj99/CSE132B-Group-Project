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
	// Display student info Degree info 
	String display_student_query_str = "SELECT student_id, SSN, first_name, last_name from MSStudent where student_id=?;"; 
	String display_degree_query_str = "SELECT degree_name, department, required_units from graduateDegree where degree_id=? and institution ='UCSD';";
	String display_concentration_str = "SELECT distinct(concentration) from gradudateDegreeRequiarment where degree_id=? and institution ='UCSD';";
	PreparedStatement display_student_query_state = conn.prepareStatement(display_student_query_str);
	PreparedStatement display_degree_query_state = conn.prepareStatement(display_degree_query_str);
	PreparedStatement display_concentration_state = conn.prepareStatement(display_concentration_str);
	ResultSet display_student_query_RS = null;
	ResultSet display_degree_query_RS = null;
	ResultSet display_concentration_RS = null;

	// Display completed concentration 
	int mininum_grade = 3;
	String concentration_str = 
	"with completed_courses AS(SELECT past_enrollment.course_number, GRADE_CONVERSION.NUMBER_GRADE FROM past_enrollment, GRADE_CONVERSION WHERE past_enrollment.student_id = ? and (SELECT GRADE_CONVERSION.NUMBER_GRADE WHERE GRADE_CONVERSION.GRADE = past_enrollment.grade) > ?), degree_sepcific_concentration AS(SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration from gradudateDegreeRequiarment WHERE degree_id = ?), completed_concentration AS(SELECT gradudateDegreeRequiarment.course_number, gradudateDegreeRequiarment.concentration FROM gradudateDegreeRequiarment, completed_courses, degree_sepcific_concentration WHERE gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration and gradudateDegreeRequiarment.course_number = completed_courses.course_number) SELECT distinct(GDR.concentration) FROM gradudateDegreeRequiarment as GDR WHERE GDR.degree_id = ? and not exists (SELECT * FROM gradudateDegreeRequiarment as GDR2 WHERE GDR2.concentration = GDR.concentration and not exists (SELECT * FROM completed_concentration WHERE completed_concentration.concentration = GDR2.concentration and completed_concentration.course_number = GDR2.course_number))"; 
	PreparedStatement concentration_state = conn.prepareStatement(concentration_str);
	ResultSet concentration_RS = null;

	// Display Concentration along with course offering closest time 
	String concentration_earliest_str = 
	"with all_classes_taken AS ((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)), un_completed_course AS( SELECT GDB2.course_number, GDB2.concentration FROM gradudateDegreeRequiarment as GDB2 where (GDB2.course_number, GDB2.concentration) not in ( SELECT GDB.course_number, GDB.concentration FROM all_classes_taken, gradudateDegreeRequiarment AS GDB WHERE GDB.course_number = all_classes_taken.course_number and all_classes_taken.student_id = ? and GDB.degree_id = ?) ), earliest_classes AS( SELECT ny.course_number, ny.year_, ny.quarter FROM course_offering_ny as ny, un_completed_course as un WHERE ny.course_number = un.course_number and not exists( SELECT * FROM course_offering_ny as ny2 WHERE ny.course_number = ny2.course_number and ( (ny2.year_ < ny.year_) or ( ny.year_ = ny2.year_ and ( (ny.quarter='spring' and ny2.quarter='winter') or ( ny.quarter='fall' and ( ny2.quarter='winter' or ny2.quarter='spring' ) ) ) ) ) ) ) select earliest_classes.course_number, earliest_classes.year_, earliest_classes.quarter, gradudateDegreeRequiarment.concentration from earliest_classes, gradudateDegreeRequiarment WHERE gradudateDegreeRequiarment.degree_id = ? and gradudateDegreeRequiarment.course_number = earliest_classes.course_number;"; 
	PreparedStatement concentration_earliest_state = conn.prepareStatement(concentration_earliest_str);
	ResultSet concentration_earliest_RS = null;

	String GPA_str = "WITH total_enrollment as ((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)), qtrgpa as (SELECT year_, quarter, avg(number_grade) as gpa FROM (total_enrollment JOIN grade_conversion ON total_enrollment.grade = grade_conversion.grade) where student_id = ? GROUP BY year_, quarter) SELECT * FROM qtrgpa;"; 
	PreparedStatement GPA_state = conn.prepareStatement(GPA_str);
	ResultSet GPA_RS = null;

	int Units = -1; 
	String Units_str = "WITH total_enrollment AS( (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment) ), all_courses AS( select distinct(course_number) FROM total_enrollment WHERE total_enrollment.student_id = ? ) select sum(courses.unit) from all_courses, courses where all_courses.course_number = courses.course_number and courses.is_upper = 2"; 
	PreparedStatement Units_state = conn.prepareStatement(Units_str);
	ResultSet Units_RS = null;

	String action = request.getParameter("action");
	if (action != null && action.equals("query")) {
		conn.setAutoCommit(false);

		display_student_query_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID"))); 
		display_student_query_RS = display_student_query_state.executeQuery(); 
		display_degree_query_state.setString(1, request.getParameter("DEGREEID")); 
		display_degree_query_RS = display_degree_query_state.executeQuery(); 
		display_concentration_state.setString(1, request.getParameter("DEGREEID"));
		display_concentration_RS = display_concentration_state.executeQuery(); 

		// Display completed concentration 
		concentration_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID"))); 
		concentration_state.setInt(2, mininum_grade);
		concentration_state.setString(3, request.getParameter("DEGREEID")); 
		concentration_state.setString(4, request.getParameter("DEGREEID")); 
		concentration_RS = concentration_state.executeQuery(); 

		// Display earliest concentraion
		concentration_earliest_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
		concentration_earliest_state.setString(2, request.getParameter("DEGREEID"));
		concentration_earliest_state.setString(3, request.getParameter("DEGREEID"));
		concentration_earliest_RS = concentration_earliest_state.executeQuery(); 

		GPA_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
		GPA_RS = GPA_state.executeQuery(); 

		Units_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
		Units_RS = Units_state.executeQuery(); 
		
		conn.commit();
		conn.setAutoCommit(true);

		Units_RS.next();
		Units =  Units_RS.getInt("sum"); 
	}

	%>

	<%-- Statement code --%>
	<%
	Statement student_state = conn.createStatement();
	Statement degree_state = conn.createStatement();
	
	String student_query = "SELECT distinct(MSStudent.student_id) from enrollment, MSStudent where MSStudent.student_id = enrollment.student_id order by student_id; ";
	String degree_query = "SELECT graduateDegree.degree_id from graduateDegree where institution ='UCSD' order by degree_id;"; 
	
	ResultSet student_RS = student_state.executeQuery(student_query);
	ResultSet degree_RS = degree_state.executeQuery(degree_query);
	%>

	<%-- query form code --%>
	<table>
		<tr>
			<th>Student ID</th>
			<th>Degree ID</th>
		</tr>

		<tr>
			<%-- Input form Code--%>
			<form action="1_e.jsp" method="get">
				<input type="hidden" value="query" name="action">
				<td><select name="STUDENTID" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (student_RS.next()) {
						%>
						<option value=<%=student_RS.getInt("student_id")%>>
							<%=student_RS.getInt("student_id")%>
						</option>
						<%
						}
						%>
				</select></td>
				<td><select name="DEGREEID" style="width: 130px;">
						<option value="" disabled selected>Please Choose...</option>
						<%
						while (degree_RS.next()) {
						%>
						<option value=<%=degree_RS.getString("degree_id")%>>
							<%=degree_RS.getString("degree_id")%>
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
	<p>Student Info:</p>
	<table>
		<tr>
			<th>Student ID</th>
			<th>SSN</th>
			<th>First Name</th>
			<th>Last Name</th>
		</tr>
		<%
		while (display_student_query_RS != null && display_student_query_RS.next()) {
		%>
		<tr>
			<td><%=display_student_query_RS.getInt("student_id")%></td>
			<td><%=display_student_query_RS.getInt("SSN")%></td>
			<td><%=display_student_query_RS.getString("first_name").trim()%></td>
			<td><%=display_student_query_RS.getString("last_name").trim()%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<p>Degree Info:</p>
	<table>
		<tr>
			<th>Degree Name</th>
			<th>Department</th>
			<th>Required Units</th>
		</tr>
		<%
		while (display_degree_query_RS != null && display_degree_query_RS.next()) {
		%>
		<tr>
			<td><%=display_degree_query_RS.getString("degree_name")%></td>
			<td><%=display_degree_query_RS.getString("department")%></td>
			<td><%=display_degree_query_RS.getInt("required_units")%></td>
		</tr>
		<%
		}
		%>
	</table>

	<p>GPA</p>
	<table>
		<tr>
			<th>Year</th>
			<th>Quarter</th>
			<th>GPA</th>
		</tr>
		<%
		while (GPA_RS != null && GPA_RS.next()) {
		%>
		<tr>
			<td><%=GPA_RS.getInt("year_")%></td>
			<td><%=GPA_RS.getString("quarter")%></td>
			<td><%=GPA_RS.getInt("gpa")%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<p>Completed Units = <%= Units %></p>
	

	<p>All Possible Concentrations with Your Degree</p>
	<table>
		<tr>
			<th>Concentration Name</th>
		</tr>
		<%
		while (display_concentration_RS != null && display_concentration_RS.next()) {
		%>
		<tr>
			<td><%=display_concentration_RS.getString("concentration")%></td>
		</tr>
		<%
		}
		%>
	</table>

	<p>Concentration Completed</p>
	<table>
		<tr>
			<th>Concentration Name</th>
		</tr>
		<%
		while (concentration_RS != null && concentration_RS.next()) {
		%>
		<tr>
			<td><%=concentration_RS.getString("concentration")%></td>
		</tr>
		<%
		}
		%>
	</table>

	<p>Concentration Earliest Courses Offering </p>
	<table>
		<tr>
			<th>Course Number</th>
			<th>Year</th>
			<th>quarter</th>
			<th>Concentration Name</th>
		</tr>
		<%
		while (concentration_earliest_RS != null && concentration_earliest_RS.next()) {
		%>
		<tr>
			<td><%=concentration_earliest_RS.getString("course_number")%></td>
			<td><%=concentration_earliest_RS.getInt("year_")%></td>
			<td><%=concentration_earliest_RS.getString("quarter")%></td>
			<td><%=concentration_earliest_RS.getString("concentration")%></td>
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