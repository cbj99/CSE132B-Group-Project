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
                	DriverManager.registerDriver (new org.postgresql.Driver());
                	String strCBJ = "jdbc:postgresql:milestone_2?user=postgres&password=cbj991112"; 
                	String StrD = "jdbc:postgresql:Test?user=postgres&password=vhgjhbgibiyy1234"; 
                    Connection conn=DriverManager.getConnection(StrD);
                %>

				<%-- Query Code --%>
				<%
						int year = 2018; 
						String quarter = "SPRING"; 
						
						String student_id_query ="select * from student where student_id = ? ORDER BY student_id;";
						String enrollment_query ="WITH total_enrollment as ((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)) SELECT classes.course_number, classes.year_, classes.quarter, classes.section_id, total_enrollment.faculty_name, total_enrollment.grade, total_enrollment.unit_taken FROM classes, total_enrollment WHERE (total_enrollment.student_id = ? and classes.course_number = total_enrollment.course_number and classes.year_ = total_enrollment.year_ and classes.quarter = total_enrollment.quarter and classes.section_id = total_enrollment.section_id) ORDER BY classes.year_, classes.quarter ASC;";
						String qtr_gpa_query = "WITH total_enrollment as ((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)), qtrgpa as (SELECT year_, quarter, sum(unit_taken) as total_units, sum(number_grade * unit_taken)/sum(unit_taken) as gpa FROM (total_enrollment JOIN grade_conversion ON total_enrollment.grade = grade_conversion.grade) where student_id = ? GROUP BY year_, quarter) SELECT * FROM qtrgpa;";
						
						PreparedStatement student_id_state = conn.prepareStatement(student_id_query);
						PreparedStatement enrollment_state = conn.prepareStatement(enrollment_query);
						PreparedStatement qtr_gpa_state = conn.prepareStatement(qtr_gpa_query);
						
						ResultSet student_id_RS = null;
						ResultSet enrollment_RS = null;
						ResultSet qtr_gpa_RS = null;

						String action = request.getParameter("action");

						if (action != null && action.equals("input")) {
							conn.setAutoCommit(false);

							student_id_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
							student_id_RS = student_id_state.executeQuery();

							enrollment_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
							enrollment_RS = enrollment_state.executeQuery();
							
							qtr_gpa_state.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
							qtr_gpa_RS = qtr_gpa_state.executeQuery();

							conn.commit();
							conn.setAutoCommit(true);
						}
				%>
				 
				<%-- Statement code --%>
				<%
				String student_query_by_enrollment = "select student_id from enrollment UNION select student_id from past_enrollment ORDER BY student_id;";
				PreparedStatement student_query_by_enrollment_state = conn.prepareStatement(student_query_by_enrollment); 
				
				ResultSet studentRS = student_query_by_enrollment_state.executeQuery(); 
				%>
				
				<%-- query form code --%>
				<table>
					<tr>
						<th>Student ID</th>
					</tr>

					<tr>
					<%-- Input form Code--%>
						<form action = "1_c.jsp" method="get"> 
							<input type="hidden" value="input" name="action"> 
							<td>
                            	<select name="STUDENTID" style="width:130px;">
                            		<option value="" disabled selected hidden>Please Choose...</option>                            	
                            	<% while (studentRS.next()){ %>
                            		<option value=<%= studentRS.getInt("student_id")%>> <%= studentRS.getInt("student_id")%></option>
                            	<% } %>
                            	</select>
                            </td>
							<td><input style="width:60px;" type="submit" value="Input"></td>
						</form>
					</tr>
				</table>
				<div style="height:20px"></div>
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
					<% while(student_id_RS != null && student_id_RS.next()){ %> 
						
						<tr>
							<td><%= student_id_RS.getInt("student_id")%></td>
                        	<td><%= student_id_RS.getInt("SSN") %></td>
                        	<td><%= student_id_RS.getString("first_name").trim() %></td>                        
                        	<td><%= student_id_RS.getString("middle_name").trim() %></td>
                        	<td><%= student_id_RS.getString("last_name").trim() %></td>
						</tr>
					<% } %>
				</table>
				
				<div style="height:20px"></div>
				<p>Classes taken in the current quarter:</p>
				<table>
					<tr>
						<th>course_number</th>
						<th>year</th>
						<th>quarter</th>
						<th>section_id</th>
						<th>faculty_name</th>
						<th>grade</th>
						<th>units</th>
					</tr>
					<%-- Iteration code for part 2 of this report--%>
					<% while(enrollment_RS != null && enrollment_RS.next()){ %> 
						
						<tr>
							<td><%= enrollment_RS.getString("course_number").trim()%></td>
                            <td><%= enrollment_RS.getInt("year_") %></td>
                            <td><%= enrollment_RS.getString("quarter").trim()%></td>
                            <td><%= enrollment_RS.getInt("section_id")%></td>
                            <td><%= enrollment_RS.getString("faculty_name").trim()%></td>
                            <td><%= enrollment_RS.getString("grade").trim()%></td>  
                            <td><%= enrollment_RS.getInt("unit_taken")%></td>  
						</tr>
					<% } %>
				</table>
				
				<div style="height:20px"></div>
				<p>GPA of each quarter:</p>
				<table>
					<tr>
						<th>year</th>
						<th>quarter</th>
						<th>total units</th>
						<th>quarter GPA</th>
					</tr>
					<%-- Iteration code for part 2 of this report--%>
					<% double sum = 0;%>
					<% double i=0;%>
					<% while(qtr_gpa_RS != null && qtr_gpa_RS.next()){ %> 
						<%  sum += qtr_gpa_RS.getDouble("gpa") * qtr_gpa_RS.getInt("total_units"); %>
						<%  i += qtr_gpa_RS.getInt("total_units"); %>
						<tr>
                            <td><%= qtr_gpa_RS.getInt("year_") %></td>
                            <td><%= qtr_gpa_RS.getString("quarter").trim()%></td>
                            <td><%= qtr_gpa_RS.getInt("total_units")%></td>  
                            <td><%= qtr_gpa_RS.getDouble("gpa") %></td>
						</tr>
					<% } %>
				</table>
				
				<div style="height:20px"></div>
				<p>cumulative GPA:</p>
				<table>
					<tr>
						<th>cumulative GPA</th>
					</tr>
					<%if (i != 0){ %>
					<tr>
                        <td><%= sum/i %></td>
					</tr>
					<%}%>
					
				</table>
				

				<%-- Close connection code --%>
				<% 
				// close Resultset 
				if(student_id_RS != null){
					student_id_RS.close(); 
					// close Statement 
				}
				student_id_state.close(); 
				if(enrollment_RS != null){
					enrollment_RS.close(); 
					// close Statement 
				}
				enrollment_state.close();
				if(qtr_gpa_RS != null){
					qtr_gpa_RS.close(); 
					// close Statement 
				}
				qtr_gpa_state.close();
				studentRS.close(); 
				student_query_by_enrollment_state.close(); 
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