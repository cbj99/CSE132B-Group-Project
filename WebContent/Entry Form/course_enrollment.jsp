<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><jsp:include page="menu.html"/></td>
		
			<td>
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
	            
	            <%-- Insertion Code --%>
	            <%
	            String action = request.getParameter("action"); 
				if(action != null && action.equals("insert")){
					conn.setAutoCommit(false); 
					PreparedStatement insertEnrollment = conn.prepareStatement("INSERT INTO enrollment VALUES(?, ?, ?, ?, ?, ?, ?, ?);");
					insertEnrollment.setInt(1, Integer.parseInt(request.getParameter("STUDENTID"))); 
					insertEnrollment.setString(2, request.getParameter("COURSENUMBER"));
					insertEnrollment.setInt(3, Integer.parseInt(request.getParameter("YEAR")));
					insertEnrollment.setString(4, request.getParameter("QUARTER"));
					insertEnrollment.setInt(5, Integer.parseInt(request.getParameter("SECTION"))); 
					insertEnrollment.setString(6, request.getParameter("FACULTY"));
					insertEnrollment.setString(7, request.getParameter("STATUS"));
					insertEnrollment.setString(8, request.getParameter("GRADE"));
					insertEnrollment.executeUpdate();
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement updateEnrollment = conn.prepareStatement("UPDATE enrollment SET status=?, grade=? WHERE student_id=? and course_number=? and year_=? and quarter=? and section_id=? and faculty_name=?; "); 
					updateEnrollment.setInt(3, Integer.parseInt(request.getParameter("STUDENTID"))); 
					updateEnrollment.setString(4, request.getParameter("COURSENUMBER"));
					updateEnrollment.setInt(5, Integer.parseInt(request.getParameter("YEAR")));
					updateEnrollment.setString(6, request.getParameter("QUARTER"));
					updateEnrollment.setInt(7, Integer.parseInt(request.getParameter("SECTION"))); 
					updateEnrollment.setString(8, request.getParameter("FACULTY"));
					updateEnrollment.setString(1, request.getParameter("STATUS"));
					updateEnrollment.setString(2, request.getParameter("GRADE"));
					updateEnrollment.executeUpdate();
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deldeteEnrollment = conn.prepareStatement("DELETE FROM enrollment WHERE student_id=? and course_number=? and year_=? and quarter=? and section_id=? and faculty_name=?;");
					deldeteEnrollment.setInt(1, Integer.parseInt(request.getParameter("STUDENTID"))); 
					deldeteEnrollment.setString(2, request.getParameter("COURSENUMBER"));
					deldeteEnrollment.setInt(3, Integer.parseInt(request.getParameter("YEAR")));
					deldeteEnrollment.setString(4, request.getParameter("QUARTER"));
					deldeteEnrollment.setInt(5, Integer.parseInt(request.getParameter("SECTION"))); 
					deldeteEnrollment.setString(6, request.getParameter("FACULTY"));
					deldeteEnrollment.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement enrollmentState = conn.createStatement(); 
				
				ResultSet enrollmentRS = enrollmentState.executeQuery("select * from enrollment order by student_id;"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>student_id</th>
						<th>course_number</th>
						<th>year</th>
						<th>quarter</th>
						<th>section_id</th>
						<th>faculty_name</th>
						<th>status</th>
						<th>grade</th>
					</tr>
					
					<%-- Insert form Code--%>
					<tr>
						<form action = "course_enrollment.jsp" method="get"> 
							<input type="hidden" value="insert" name="action">
							<td><input value="" name="STUDENTID" size="20"></td>
							<td><input value="" name="COURSENUMBER" size="20"></td>
							<td><input value="" name="YEAR" size="20"></td>
							<td><input value="" name="QUARTER" size="20"></td>
							<td><input value="" name="SECTION" size="20"></td>
							<td><input value="" name="FACULTY" size="20"></td>
<!-- 							<td><input value="" name="STATUS" size="20"></td> -->
							<td>
								<select name="STATUS">                            	
                            		<option value="INPROGRESS" selected>In-Progress</option>
                            		<option value="COMPLETED">Completed</option>
                            	</select>
							</td>
<!-- 							<td><input value="" name="GRADE" size="20"></td> -->
							<td>
								<select name="GRADE">   
									<option value="INPROGRESS" selected>In-Progress</option>                         	
                            		<option value="A+">A+</option>
                            		<option value="A-">A-</option>
                            		<option value="A">A</option>
                            		<option value="B+">B+</option>
                            		<option value="B">B</option>
                            		<option value="B-">B-</option>
                            		<option value="C+">C+</option>
                            		<option value="C">C</option>
                            		<option value="C-">C-</option>
                            		<option value="D">D</option>
                            		<option value="Pass">Pass</option>
                            		<option value="Not Pass">Not Pass</option>
                            		<option value="W">W</option>
                            		<option value="F">F</option>
                            	</select>
							</td>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
						
						<% while(enrollmentRS.next()){ %> 
						<tr>
						<form action="course_enrollment.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            
                            <td><input value="<%= enrollmentRS.getString("student_id")%>" name="STUDENTID" size="20" readonly></td>
                            <td><input value="<%= enrollmentRS.getString("course_number").trim()%>" name="COURSENUMBER" size="20" readonly></td>
                            <td><input value="<%= enrollmentRS.getInt("year_") %>" name="YEAR" size="20" readonly></td>
                            <td><input value="<%= enrollmentRS.getString("quarter").trim()%>" name="QUARTER" size="20" readonly></td>
                            <td><input value="<%= enrollmentRS.getInt("section_id")%>" name="SECTION" size="20" readonly></td>
                            <td><input value="<%= enrollmentRS.getString("faculty_name").trim()%>" name="FACULTY" size="20" readonly></td>
<%--                             <td><input value="<%= enrollmentRS.getString("status").trim()%>" name="STATUS" size="20"></td> --%>
                            <td>
								<select name="STATUS">       
									<option value="<%= enrollmentRS.getString("status").trim()%>" selected><%= enrollmentRS.getString("status").trim()%></option>                     	
                            		<option value="INPROGRESS">In-Progress</option>
                            		<option value="COMPLETED">Completed</option>
                            	</select>
							</td>
							
<%--                             <td><input value="<%= enrollmentRS.getString("grade").trim()%>" name="GRADE" size="20"></td> --%>
                            <td>
								<select name="GRADE">   
									<option value="<%= enrollmentRS.getString("grade").trim()%>" selected><%= enrollmentRS.getString("grade").trim()%></option>  
									<option value="INPROGRESS">In-Progress</option>                         	
                            		<option value="A+">A+</option>
                            		<option value="A-">A-</option>
                            		<option value="A">A</option>
                            		<option value="B+">B+</option>
                            		<option value="B">B</option>
                            		<option value="B-">B-</option>
                            		<option value="C+">C+</option>
                            		<option value="C">C</option>
                            		<option value="C-">C-</option>
                            		<option value="D">D</option>
                            		<option value="Pass">Pass</option>
                            		<option value="Not Pass">Not Pass</option>
                            		<option value="W">W</option>
                            		<option value="F">F</option>
                            	</select>
							</td>
							
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="course_enrollment.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= enrollmentRS.getString("student_id")%>" name="STUDENTID" size="20">
                            <input type="hidden" value="<%= enrollmentRS.getString("course_number").trim()%>" name="COURSENUMBER" size="20">
                            <input type="hidden" value="<%= enrollmentRS.getInt("year_") %>" name="YEAR" size="20">
                            <input type="hidden" value="<%= enrollmentRS.getString("quarter").trim()%>" name="QUARTER" size="20">
                            <input type="hidden" value="<%= enrollmentRS.getInt("section_id")%>" name="SECTION" size="20">
                            <input type="hidden" value="<%= enrollmentRS.getString("faculty_name").trim()%>" name="FACULTY" size="20">
                            
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
					</tr>
					<% } %>
					</tr>
					
					
				</table>
				
				
	            <% 
				// close Resultset 
				enrollmentRS.close(); 
				// close Statement 
				enrollmentState.close(); 
				// close Connection
				conn.close(); 
				} catch (SQLException sqle) {
					String err = sqle.getMessage(); 
	                out.println(sqle.getMessage());
	            } catch (Exception e) {
	                out.println("second exception\n"); 
	                out.println(e.getMessage());
	            }
				%>
					
			</td>
		</tr>
	</table>
</body>
</html>