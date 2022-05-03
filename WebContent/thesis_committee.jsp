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
					PreparedStatement statement = conn.prepareStatement("INSERT INTO thesiscommittee VALUES(?, ?)"); 
					
					statement.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
					statement.setString(2, request.getParameter("FACULTYNAME"));
					
					statement.executeUpdate(); 
					
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>

				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("UPDATE thesiscommittee SET student_id=?, faculty_name=? where student_id=? and faculty_name=?;");
					
					statement.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
					statement.setString(2, request.getParameter("FACULTYNAME"));
					statement.setInt(3, Integer.parseInt(request.getParameter("STUDENTID")));
					statement.setString(4, request.getParameter("FACULTYNAME"));
					
					statement.executeUpdate();
					
					
					conn.commit();
                    conn.setAutoCommit(true); 

				}
				%>
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deletestatement = conn.prepareStatement("DELETE FROM thesiscommittee where room_number=? and building_number=?;");
					
					deletestatement.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
					deletestatement.setString(2, request.getParameter("FACULTYNAME"));
					deletestatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from thesiscommittee"); 

				%>
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>Student ID</th>
						<th>Faculty Name</th>
						<th>Action</th>
					</tr>

					<tr>
					<%-- Insert form Code--%>
						<form action = "thesis_committee.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="STUDENTID" size="20"></th>
							<th><input value="" name="FACULTYNAME" size="20"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</th>
					<tr style="height:20px"></tr>
					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="thesis_committee.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= result.getString("student_id") %>" name="STUDENTID" size="20"></td>
                            <td><input value="<%= result.getString("faculty_name") %>" name="FACULTYNAME" size="20"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="thesis_committee.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getString("student_id") %>" name="STUDENTID">
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