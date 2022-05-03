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
					PreparedStatement statement = conn.prepareStatement("INSERT INTO location_ VALUES(?, ?, ?)"); 
					
					
					statement.setString(1, request.getParameter("ROOM"));
					statement.setString(2, request.getParameter("BUILDING"));
					statement.setInt(3, Integer.parseInt(request.getParameter("CAPACITY")));
					statement.executeUpdate(); 
					
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>

				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("UPDATE location_ SET capacity=? where room_number=? and building_number=?;");
					
					statement.setInt(1, Integer.parseInt(request.getParameter("CAPACITY")));
					statement.setString(2, request.getParameter("ROOM"));
					statement.setString(3, request.getParameter("BUILDING"));
					
					statement.executeUpdate();
					
					
					conn.commit();
                    conn.setAutoCommit(true); 

				}
				%>
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deletestatement = conn.prepareStatement("DELETE FROM location_ where room_number=? and building_number=?;");
					
					deletestatement.setString(1, request.getParameter("ROOM"));
					deletestatement.setString(2, request.getParameter("BUILDING"));
					deletestatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from location_"); 

				%>
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>ROOM#</th>
						<th>BUILDING#</th>
						<th>CAPACITY</th>
						<th>ACTION</th>
					</tr>

					<tr>
					<%-- Insert form Code--%>
						<form action = "location.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="ROOM" size="10"></th>
							<th><input value="" name="BUILDING" size="10"></th>
							<th><input value="" name="CAPACITY" size="10"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</th>
					<tr style="height:20px"></tr>
					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="location.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= result.getString("room_number") %>" name="ROOM" size="10" readonly></td>
                            <td><input value="<%= result.getString("building_number") %>" name="BUILDING" size="10" readonly></td>
                            <td><input value="<%= result.getInt("capacity") %>" name="CAPACITY" size="10"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="location.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getString("room_number") %>" name="ROOM" size="10">
                            <input type="hidden" value="<%= result.getString("building_number") %>" name="BUILDING" size="10">
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