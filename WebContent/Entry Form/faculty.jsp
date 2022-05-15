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
                    Connection conn=DriverManager.getConnection(StrD);
                %>
                
                <%-- Insertion Code --%>
                <%
				String action = request.getParameter("action"); 
				if(action != null && action.equals("insert")){
					conn.setAutoCommit(false); 
					PreparedStatement insertFacultyStatement = conn.prepareStatement("INSERT INTO faculty VALUES(?, ?, ?)");
					
					insertFacultyStatement.setString(1, request.getParameter("FACULTYNAME")); 
					insertFacultyStatement.setString(2, request.getParameter("TITLE")); 
					insertFacultyStatement.setString(3, request.getParameter("DEPARTMENT")); 
					
					insertFacultyStatement.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
                <%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement updateFacultyStatement = conn.prepareStatement("UPDATE faculty SET faculty_name = ?, title=?, department=? where faculty_name=?;");
					updateFacultyStatement.setString(1, request.getParameter("FACULTYNAME")); 
					updateFacultyStatement.setString(2, request.getParameter("TITLE")); 
					updateFacultyStatement.setString(3, request.getParameter("DEPARTMENT")); 
					updateFacultyStatement.setString(4, request.getParameter("FACULTYNAMEKEY")); 
					updateFacultyStatement.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deleteFacultyStatement = conn.prepareStatement("DELETE FROM faculty where faculty_name=?;");
					
					deleteFacultyStatement.setString(1, request.getParameter("FACULTYNAME"));
					deleteFacultyStatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from faculty;"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>Faculty Name</th>
						<th>Title</th>
						<th>Department</th>
						<th>Action</th>
					</tr>
					<tr>
					<%-- Insert form Code--%>
						<form action = "faculty.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="FACULTYNAME" size="20"></th>
							<th><input value="" name="TITLE" size="20"></th>
							<th><input value="" name="DEPARTMENT" size="20"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<tr style="height:20px"></tr>
					
					<%-- Iteration code for Faculty--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="faculty.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= result.getString("faculty_name") %>" name="FACULTYNAMEKEY" size="20">
                            
                            <td><input value="<%= result.getString("faculty_name").trim() %>" name="FACULTYNAME" size="20" readonly></td>
                            <td><input value="<%= result.getString("title").trim() %>" name="TITLE" size="20"></td>
                            <td><input value="<%= result.getString("department").trim() %>" name="DEPARTMENT" size="20"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="faculty.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getString("faculty_name") %>" name="FACULTYNAME">
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