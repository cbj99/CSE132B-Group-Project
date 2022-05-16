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
	String display_student_query_str = "SELECT student_id, SSN, first_name, last_name from undergraduateStudent where student_id=?;"; 
	String display_degree_query_str = "SELECT degree_name, type from undergraduateDegree where degree_id=? and institution ='UCSD';";
	
	// Units required
	String units_required_str ="SELECT upper_division_units, lower_division_units from undergraduateDegree where degree_id=?;"; 
	String units_core_str =" SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_core='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number;"; 
	String units_technical_elective_str = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id= ? and is_technical_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number;";
	String units_major_elective_str = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_major_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number;";
	String units_college_required_str = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_college_required='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number;";
	
	// Units student already taken
	String core_units_taken_queryStr = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_core='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = ?) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = ?));";
	String technical_elective_taken_queryStr = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_technical_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = ?) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = ?));"; 
	String major_elective_taken_queryStr = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_major_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = ?) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = ?));"; 
	String college_taken_queryStr = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and is_college_required='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = ?) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = ?));"; 
	String upperUnits_taken_queryStr = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and courses.course_number = underGradudateDegreeRequiarment.course_number and courses.is_upper = 1 and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = ?) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = ?));"; 
	String lowerUnits_taken_queryStr = "SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id=? and courses.course_number = underGradudateDegreeRequiarment.course_number and courses.is_upper = 0 and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = ?) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = ?));"; 
	
	PreparedStatement display_student_query_state = conn.prepareStatement(display_student_query_str);
	PreparedStatement display_degree_query_state = conn.prepareStatement(display_degree_query_str);
	
	PreparedStatement units_required_state = conn.prepareStatement(units_required_str);
	PreparedStatement units_core_state = conn.prepareStatement(units_core_str);
	PreparedStatement units_technical_elective_state = conn.prepareStatement(units_technical_elective_str);
	PreparedStatement units_major_elective_state = conn.prepareStatement(units_major_elective_str);
	PreparedStatement units_college_required_state = conn.prepareStatement(units_college_required_str);
	
	// statement for courses already taken
	PreparedStatement core_units_taken_state = conn.prepareStatement(core_units_taken_queryStr);
	PreparedStatement technical_elective_taken_state = conn.prepareStatement(technical_elective_taken_queryStr);
	PreparedStatement major_elective_taken_state = conn.prepareStatement(major_elective_taken_queryStr);
	PreparedStatement college_taken_state = conn.prepareStatement(college_taken_queryStr);
	PreparedStatement upperUnits_taken_state = conn.prepareStatement(upperUnits_taken_queryStr);
	PreparedStatement lowerUnits_taken_state = conn.prepareStatement(lowerUnits_taken_queryStr);

	ResultSet display_student_query_RS = null;
	ResultSet display_degree_query_RS = null;
	
	ResultSet units_required_RS = null;
	ResultSet units_core_RS = null;
	ResultSet units_technical_elective_RS = null;
	ResultSet units_major_elective_RS = null;
	ResultSet units_college_required_RS = null;
	
	// ResultSet for courses already taken
	ResultSet core_units_taken_RS = null;
	ResultSet technical_elective_RS = null;
	ResultSet major_elective_taken_RS = null;
	ResultSet college_taken_RS = null;
	ResultSet upperUnits_taken_RS = null;
	ResultSet lowerUnits_taken_RS = null;

	int units_required_upper = 0; 
	int units_required_lower = 0;
	int units_core = 0; 
	int units_technical_elective = 0; 
	int units_major_elective = 0; 
	int units_college_required = 0;
	
	int core_units_taken = 0; 
	int technical_elective = 0;
	int major_elective_taken = 0; 
	int college_taken = 0; 
	int upperUnits_taken = 0; 
	int lowerUnits_taken = 0;
	
	
	String action = request.getParameter("action");
	if (action != null && action.equals("query")) {
		conn.setAutoCommit(false);
		display_student_query_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID"))); 
		display_student_query_RS = display_student_query_state.executeQuery(); 
		
		display_degree_query_state.setString(1, request.getParameter("DEGREEID")); 
		display_degree_query_RS = display_degree_query_state.executeQuery(); 
		
		// second display
		units_required_state.setString(1, request.getParameter("DEGREEID")); 
		units_required_RS = units_required_state.executeQuery();
		
		units_core_state.setString(1, request.getParameter("DEGREEID")); 
		units_core_RS = units_core_state.executeQuery();
		
		units_technical_elective_state.setString(1, request.getParameter("DEGREEID")); 
		units_technical_elective_RS = units_technical_elective_state.executeQuery();
		
		units_major_elective_state.setString(1, request.getParameter("DEGREEID"));
		units_major_elective_RS = units_major_elective_state.executeQuery();
		
		units_college_required_state.setString(1, request.getParameter("DEGREEID")); 
		units_college_required_RS = units_college_required_state.executeQuery();
		
		// already taken query 
		core_units_taken_state.setString(1, request.getParameter("DEGREEID")); 
		core_units_taken_state.setInt(2, Integer.parseInt(request.getParameter("STUDENTID"))); 
		core_units_taken_state.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
		core_units_taken_RS = core_units_taken_state.executeQuery(); 
		
		technical_elective_taken_state.setString(1, request.getParameter("DEGREEID")); 
		technical_elective_taken_state.setInt(2, Integer.parseInt(request.getParameter("STUDENTID"))); 
		technical_elective_taken_state.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
		technical_elective_RS = technical_elective_taken_state.executeQuery(); 
		
		major_elective_taken_state.setString(1, request.getParameter("DEGREEID")); 
		major_elective_taken_state.setInt(2, Integer.parseInt(request.getParameter("STUDENTID"))); 
		major_elective_taken_state.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
		major_elective_taken_RS = major_elective_taken_state.executeQuery(); 
		
		college_taken_state.setString(1, request.getParameter("DEGREEID")); 
		college_taken_state.setInt(2, Integer.parseInt(request.getParameter("STUDENTID"))); 
		college_taken_state.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
		college_taken_RS = college_taken_state.executeQuery(); 
		
		upperUnits_taken_state.setString(1, request.getParameter("DEGREEID")); 
		upperUnits_taken_state.setInt(2, Integer.parseInt(request.getParameter("STUDENTID"))); 
		upperUnits_taken_state.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
		upperUnits_taken_RS = upperUnits_taken_state.executeQuery(); 
		
		lowerUnits_taken_state.setString(1, request.getParameter("DEGREEID")); 
		lowerUnits_taken_state.setInt(2, Integer.parseInt(request.getParameter("STUDENTID"))); 
		lowerUnits_taken_state.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
		lowerUnits_taken_RS = lowerUnits_taken_state.executeQuery(); 
		
		conn.commit();
		conn.setAutoCommit(true);
		
		// post-processing on units required 
		units_required_RS.next(); 
		units_core_RS.next(); 
		units_technical_elective_RS.next(); 
		units_major_elective_RS.next(); 
		units_college_required_RS.next(); 
		
		// post processin on units taken 
		core_units_taken_RS.next(); 
		technical_elective_RS.next();
		major_elective_taken_RS.next();
		college_taken_RS.next();
		upperUnits_taken_RS.next();
		lowerUnits_taken_RS.next();
		
		units_required_upper = units_required_RS.getInt("upper_division_units"); 
		units_required_lower = units_required_RS.getInt("lower_division_units");
		units_core = units_core_RS.getInt("sum");
		units_technical_elective = units_technical_elective_RS.getInt("sum");
		units_major_elective = units_major_elective_RS.getInt("sum");
		units_college_required = units_college_required_RS.getInt("sum");
		
		core_units_taken = core_units_taken_RS.getInt("sum"); 
		technical_elective = technical_elective_RS.getInt("sum");
		major_elective_taken = major_elective_taken_RS.getInt("sum");
		college_taken = college_taken_RS.getInt("sum");
		upperUnits_taken = upperUnits_taken_RS.getInt("sum");
		lowerUnits_taken = lowerUnits_taken_RS.getInt("sum");
	}
	%>

	<%-- Statement code --%>
	<%
	Statement student_state = conn.createStatement();
	Statement degree_state = conn.createStatement();
	
	String student_query = "SELECT distinct(undergraduateStudent.student_id) from enrollment, undergraduateStudent where undergraduatestudent.student_id = enrollment.student_id order by student_id; ";
	String degree_query = "SELECT undergraduateDegree.degree_id from undergraduateDegree where institution ='UCSD' order by degree_id;"; 
	
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
			<form action="1_d.jsp" method="get">
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
			<th>Type</th>
		</tr>
		<%
		while (display_degree_query_RS != null && display_degree_query_RS.next()) {
		%>
		<tr>
			<td><%=display_degree_query_RS.getString("degree_name")%></td>
			<td><%=display_degree_query_RS.getString("type")%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<p>Units Required for Degree</p>
	<table>
		<tr>
			<th>Upper Units</th>
			<th>Lower Units</th>
			<th>Core Units</th>
			<th>Technical Elective Units</th>
			<th>Major Elective Units</th>
			<th>College Required Units</th>
		</tr>
		<tr>
			<td><%=units_required_upper%></td>
			<td><%=units_required_lower%></td>
			<td><%=units_core%></td>
			<td><%=units_technical_elective%></td>
			<td><%=units_major_elective%></td>
			<td><%=units_college_required%></td>
		</tr>
	</table>
	
	<p>Units You have completed</p>
	<table>
		<tr>
			<th>Upper Units</th>
			<th>Lower Units</th>
			<th>Core Units</th>
			<th>Technical Elective Units</th>
			<th>Major Elective Units</th>
			<th>College Required Units</th>
		</tr>
		<tr>
			<td><%=upperUnits_taken%></td>
			<td><%=lowerUnits_taken%></td>
			<td><%=core_units_taken%></td>
			<td><%=technical_elective%></td>
			<td><%=major_elective_taken%></td>
			<td><%=college_taken%></td>
		</tr>
	</table>
	
	<p>Units You still need</p>
	<table>
		<tr>
			<th>Upper Units</th>
			<th>Lower Units</th>
			<th>Core Units</th>
			<th>Technical Elective Units</th>
			<th>Major Elective Units</th>
			<th>College Required Units</th>
		</tr>
		<tr>
			<td><%=units_required_upper - upperUnits_taken%></td>
			<td><%=units_required_lower - lowerUnits_taken%></td>
			<td><%=units_core - core_units_taken%></td>
			<td><%=units_technical_elective - technical_elective%></td>
			<td><%=units_major_elective - major_elective_taken%></td>
			<td><%=units_college_required - college_taken%></td>
		</tr>
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