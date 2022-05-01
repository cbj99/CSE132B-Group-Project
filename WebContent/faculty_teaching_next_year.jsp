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
			<td>
				<jsp:include page="menu.html"/> 
			</td>
			
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
                    Connection conn=DriverManager.getConnection(strCBJ);
                %>
                <%-- Insertion Code --%>
                <%
				String action = request.getParameter("action"); 
				if(action != null && action.equals("insert")){
					conn.setAutoCommit(false); 
					PreparedStatement insertStatement = conn.prepareStatement("INSERT INTO course_offering_ny VALUES(?, ?, ?, ?, ?)");
					
					insertStatement.setString(1, request.getParameter("FACULTYNAME")); 
					insertStatement.setString(2, request.getParameter("COURSENUMBER")); 
					insertStatement.setInt(3, Integer.parseInt(request.getParameter("YEAR")));
					insertStatement.setString(4, request.getParameter("QUARTER")); 
					insertStatement.setInt(5, Integer.parseInt(request.getParameter("SECTION")));
					
					insertStatement.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
                <%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement updateFacultyStatement = conn.prepareStatement("UPDATE course_offering_ny SET faculty_name = ?, course_number=?, year_=?, quarter=?, section_id=? where faculty_name = ? and course_number=? and year_=? and quarter=? and section_id=?;");
					
					updateFacultyStatement.setString(1, request.getParameter("FACULTYNAME")); 
					updateFacultyStatement.setString(2, request.getParameter("COURSENUMBER")); 
					updateFacultyStatement.setInt(3, Integer.parseInt(request.getParameter("YEAR")));
					updateFacultyStatement.setString(4, request.getParameter("QUARTER")); 
					updateFacultyStatement.setInt(5, Integer.parseInt(request.getParameter("SECTION")));
					
					updateFacultyStatement.setString(6, request.getParameter("FACULTYNAME")); 
					updateFacultyStatement.setString(7, request.getParameter("COURSENUMBER")); 
					updateFacultyStatement.setInt(8, Integer.parseInt(request.getParameter("YEAR")));
					updateFacultyStatement.setString(9, request.getParameter("QUARTER")); 
					updateFacultyStatement.setInt(10, Integer.parseInt(request.getParameter("SECTION")));
					
					updateFacultyStatement.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deleteFacultyStatement = conn.prepareStatement("DELETE FROM course_offering_ny where faculty_name = ? and course_number=? and year_=? and quarter=? and section_id=?;");
					
					deleteFacultyStatement.setString(1, request.getParameter("FACULTYNAME")); 
					deleteFacultyStatement.setString(2, request.getParameter("COURSENUMBER")); 
					deleteFacultyStatement.setInt(3, Integer.parseInt(request.getParameter("YEAR")));
					deleteFacultyStatement.setString(4, request.getParameter("QUARTER")); 
					deleteFacultyStatement.setInt(5, Integer.parseInt(request.getParameter("SECTION")));
					
					deleteFacultyStatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from course_offering_ny;"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>Faculty Name</th>
						<th>Course Number</th>
						<th>Year</th>
						<th>Quarter</th>
						<th>Section ID</th>
						<th>Action</th>
					</tr>
					<tr>
					<%-- Insert form Code--%>
						<form action = "faculty_teaching_next_year.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="FACULTYNAME" size="20"></th>
							<th><input value="" name="COURSENUMBER" size="20"></th>
							<th><input value="" name="YEAR" size="20"></th>
							<th><input value="" name="QUARTER" size="20"></th>
							<th><input value="" name="SECTION" size="20"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<tr style="height:20px"></tr>
					
					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="faculty_teaching_next_year.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= result.getString("faculty_name").trim() %>" name="FACULTYNAME" size="20"></td>
                            <td><input value="<%= result.getString("course_number").trim() %>" name="COURSENUMBER" size="20"></td>
                            <td><input value="<%= result.getInt("year_") %>" name="YEAR" size="20"></td>
                            <td><input value="<%= result.getString("quarter").trim() %>" name="QUARTER" size="20"></td>
                            <td><input value="<%= result.getInt("section_id") %>" name="SECTION" size="20"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="faculty_teaching_next_year.jsp" method="get">
                            <input type="hidden" type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getString("faculty_name").trim() %>" name="FACULTYNAME">
                            <input type="hidden" value="<%= result.getString("course_number").trim() %>" name="COURSENUMBER">
                            <input type="hidden" value="<%= result.getInt("year_") %>" name="YEAR">
                            <input type="hidden" value="<%= result.getString("quarter").trim() %>" name="QUARTER">
                            <input type="hidden" value="<%= result.getInt("section_id") %>" name="SECTION">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
					</tr>
					<% } %>
				</table>
				
                <%-- Close connection code --%>
				<% 
				// close Resultset 
				result.close(); 
				// close Statement 
				statement.close(); 
				// close Connection
				conn.close(); 
				} catch (SQLException sqle) {
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