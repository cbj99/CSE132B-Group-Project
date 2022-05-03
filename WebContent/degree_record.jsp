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
					PreparedStatement statement = conn.prepareStatement("INSERT INTO degreerecord VALUES(?, ?, ?, ?)"); 
					
					statement.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
					statement.setString(2, request.getParameter("DEGREEID"));
					statement.setString(3, request.getParameter("INSTITUTION"));
					statement.setString(4, request.getParameter("STATUS"));
					statement.executeUpdate(); 
					
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>

				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("UPDATE degreerecord SET status=? where student_id=? and degree_id=? and institution=?;");
					
					statement.setString(1, request.getParameter("STATUS"));
					statement.setInt(2, Integer.parseInt(request.getParameter("STUDENTID")));
					statement.setString(3, request.getParameter("DEGREEID"));
					statement.setString(4, request.getParameter("INSTITUTION"));
					
					statement.executeUpdate();
					
					
					conn.commit();
                    conn.setAutoCommit(true); 

				}
				%>
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deletestatement = conn.prepareStatement("DELETE FROM degreerecord where student_id=? and degree_id=? and institution=?;");
					
					deletestatement.setInt(2, Integer.parseInt(request.getParameter("STUDENTID")));
					deletestatement.setString(3, request.getParameter("DEGREEID"));
					deletestatement.setString(4, request.getParameter("INSTITUTION"));
					deletestatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from degreerecord"); 

				%>
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>Student ID</th>
						<th>Degree ID</th>
						<th>Institution</th>
						<th>Status</th>
						<th>Action</th>
					</tr>

					<tr>
					<%-- Insert form Code--%>
						<form action = "degree_record.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="STUDENTID" size="10"></th>
							<th><input value="" name="DEGREEID" size="10"></th>
							<th><input value="UCSD" name="INSTITUTION" size="10"></th>
							<th>
                            	<select name="STATUS" style="width:100px;">
                            		<option value="EARNED">Earned</option>
                            		<option value="INPROGRESS">In-progress</option>
                            	</select>
                            </th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</th>
					<tr style="height:20px"></tr>
					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="degree_record.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= result.getInt("student_id") %>" name="STUDENTID" size="10"></td>
                            <td><input value="<%= result.getString("degree_id") %>" name="DEGREEID" size="10"></td>
                            <td><input value="<%= result.getString("institution") %>" name="INSTITUTION" size="10"></td>
                            <% if ((result.getString("status").trim()).equals("EARNED")){%>
                            <th>
                            	<select name="STATUS" style="width:100px;">
                            		<option value="EARNED" selected>Earned</option>
                            		<option value="INPROGRESS">In-progress</option>
                            	</select>
                            </th>
                            <% }else{%>
                            <th>
                            	<select name="STATUS" style="width:100px;">
                            		<option value="EARNED">Earned</option>
                            		<option value="INPROGRESS" selected>In-progress</option>
                            	</select>
                            </th>
                            <% } %>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="degree_record.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getInt("student_id") %>" name="STUDENTID">
                            <input type="hidden" value="<%= result.getString("degree_id") %>" name="DEGREEID">
                            <input type="hidden" value="<%= result.getString("institution") %>" name="INSTITUTION">
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