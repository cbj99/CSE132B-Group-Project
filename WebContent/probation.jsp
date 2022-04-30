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
                    Connection conn=DriverManager.getConnection("jdbc:postgresql:milestone_2?user=postgres&password=cbj991112");
                %>

				<%-- Insertion Code --%>
				<%
				String action = request.getParameter("action"); 
				if(action != null && action.equals("insert")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("INSERT INTO probation VALUES(?, ?, ?, ?, ?)"); 
					
					statement.setInt(1, Integer.parseInt(request.getParameter("ID")));
					statement.setInt(2, Integer.parseInt(request.getParameter("YEAR")));
					statement.setString(3, request.getParameter("QUARTER"));
					statement.setString(4, request.getParameter("UNIVERSITY"));
					statement.setString(5, request.getParameter("REASON"));
					statement.executeUpdate(); 
					
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>

				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("UPDATE probation SET reason=? where student_id=?, year=?, quarter=?, university=?;");
					
					statement.setString(1, request.getParameter("REASON"));
					statement.setInt(2, Integer.parseInt(request.getParameter("ID")));
					statement.setInt(3, Integer.parseInt(request.getParameter("YEAR")));
					statement.setString(4, request.getParameter("QUARTER"));
					statement.setString(5, request.getParameter("UNIVERSITY"));
					
					statement.executeUpdate();
					
					
					conn.commit();
                    conn.setAutoCommit(true); 

				}
				%>
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deletestatement = conn.prepareStatement("DELETE FROM probation where student_id=?, year=?, quarter=?, university=?;");
					
					deletestatement.setInt(1, Integer.parseInt(request.getParameter("ID")));
					deletestatement.setInt(2, Integer.parseInt(request.getParameter("YEAR")));
					deletestatement.setString(3, request.getParameter("QUARTER"));
					deletestatement.setString(4, request.getParameter("UNIVERSITY"));
					deletestatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from probation"); 

				%>
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>ID</th>
						<th>YEAR</th>
						<th>QUARTER</th>
						<th>UNIVERSITY</th>
						<th>REASON</th>
						<th>ACTION</th>
					</tr>

					<tr>
					<%-- Insert form Code--%>
						<form action = "probation.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="ID" size="10"></th>
							<th><input value="" name="YEAR" size="10"></th>
							<th><input value="" name="QUARTER" size="10"></th>
							<th><input value="" name="UNIVERSITY" size="10"></th>
							<th><input value="" name="REASON" size="10"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</th>
					<tr style="height:20px"></tr>
					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="probation.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= result.getInt("student_id") %>" name="ID" size="10"></td>
                            <td><input value="<%= result.getInt("year") %>" name="YEAR" size="10"></td>
                            <td><input value="<%= result.getString("quarter") %>" name="QUARTER" size="10"></td>
                            <td><input value="<%= result.getString("university") %>" name="UNIVERSITY" size="10"></td>
                            <td><input value="<%= result.getString("reason") %>" name="REASON" size="10"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="probation.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getInt("student_id") %>" name="ID">
                            <input type="hidden" value="<%= result.getInt("year") %>" name="YEAR">
                            <input type="hidden" value="<%= result.getString("quarter") %>" name="QUARTER">
                            <input type="hidden" value="<%= result.getString("university") %>" name="UNIVERSITY">
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