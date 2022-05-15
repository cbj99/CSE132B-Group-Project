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
					PreparedStatement statement = conn.prepareStatement("INSERT INTO probation VALUES(?, ?, ?, ?, ?)"); 
					
					/* make sure all strings are not empty */
					String quarterStr = request.getParameter("QUARTER").trim();
					String universityStr = request.getParameter("UNIVERSITY").trim();
					String reasonStr = request.getParameter("REASON").trim();
					if(quarterStr.length()>0 && universityStr.length()>0 && reasonStr.length()>0){
						statement.setInt(1, Integer.parseInt(request.getParameter("ID")));
						statement.setInt(2, Integer.parseInt(request.getParameter("YEAR")));
						statement.setString(3, request.getParameter("QUARTER"));
						statement.setString(4, request.getParameter("UNIVERSITY"));
						statement.setString(5, request.getParameter("REASON"));
						statement.executeUpdate(); 
					}
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>

				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("UPDATE probation SET student_id=?, year=?, quarter=?, university=?, reason=? where student_id=? and year=? and quarter=? and university=?");
					
					String quarterStr = request.getParameter("QUARTER").trim();
					String universityStr = request.getParameter("UNIVERSITY").trim();
					String reasonStr = request.getParameter("REASON").trim();
					
					if(quarterStr.length()>0 && universityStr.length()>0 && reasonStr.length()>0){
						statement.setInt(1, Integer.parseInt(request.getParameter("ID")));
						statement.setInt(2, Integer.parseInt(request.getParameter("YEAR")));
						statement.setString(3, request.getParameter("QUARTER"));
						statement.setString(4, request.getParameter("UNIVERSITY"));
						statement.setString(5, request.getParameter("REASON"));
						
						statement.setInt(6, Integer.parseInt(request.getParameter("IDKEY")));
						statement.setInt(7, Integer.parseInt(request.getParameter("YEARKEY")));
						statement.setString(8, request.getParameter("QUARTERKEY"));
						statement.setString(9, request.getParameter("UNIVERSITYKEY"));
						statement.executeUpdate(); 
					}
					
					conn.commit();
                    conn.setAutoCommit(true); 

				}
				%>
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deletestatement = conn.prepareStatement("DELETE FROM probation where student_id=? and year=? and quarter=? and university=?;");
					
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
				Statement studentStatement = conn.createStatement(); 
				PreparedStatement secondStudentState = conn.prepareStatement("select student_id from student where not student_id=?");
				
				ResultSet result = statement.executeQuery("select * from probation"); 
				ResultSet studentResult = studentStatement.executeQuery("select student_id from student"); 
				
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
							<th>
                            	<select name="ID">
                            	<option value="Please select an ID" selected>Please select an ID</option>
                            	<% while (studentResult.next()){ %>
                            		<option value=<%= studentResult.getInt("student_id")%>> <%= studentResult.getInt("student_id")%></option>
                            	<% } %>
                            	</select>
                            </th>
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
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getInt("student_id") %>" name="IDKEY" readonly>
                            <input type="hidden" value="<%= result.getInt("year") %>" name="YEARKEY" readonly>
                            <input type="hidden" value="<%= result.getString("quarter") %>" name="QUARTERKEY" readonly>
                            <input type="hidden" value="<%= result.getString("university") %>" name="UNIVERSITYKEY" readonly>
                            
                            <th>
                            	<select name="ID">
                            	<option value=<%= result.getInt("student_id")%> selected> <%= result.getInt("student_id")%></option>
                            	<% 
                            	secondStudentState.setInt(1, result.getInt("student_id")); 
                            	ResultSet seocndStuResultSet = secondStudentState.executeQuery(); 
                            	%>
                            	<% while (seocndStuResultSet.next()){ %>
                            		<option value=<%= seocndStuResultSet.getInt("student_id")%>> <%= seocndStuResultSet.getInt("student_id")%></option>
                            	<% } %>
                            	</select>
                            </th>
                            
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
				studentResult.close(); 
				// close Statement 
				statement.close(); 
				studentStatement.close(); 
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