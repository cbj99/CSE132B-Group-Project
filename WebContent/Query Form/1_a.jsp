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
                    Connection conn=DriverManager.getConnection(strCBJ);
                %>

				<%-- Query Code --%>
				<%
				String query1 ="select * from student where student_id = ?";
				String query2 ="select * from enrollment where student_id = ? and quarter = 'spring' and year_ = 2018";
				PreparedStatement statement1 = conn.prepareStatement(query1);
				PreparedStatement statement2 = conn.prepareStatement(query2);
				ResultSet result1 = null;
				ResultSet result2 = null;
				
				String action = request.getParameter("action"); 
				
				if(action != null && action.equals("input")){
					conn.setAutoCommit(false); 
					
					statement1.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
					result1 = statement1.executeQuery();
					
					statement2.setInt(1, Integer.parseInt(request.getParameter("STUDENTID")));
					result2 = statement2.executeQuery();
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				 
				<%-- Statement code --%>
				<%
				Statement studentState = conn.createStatement();
				
				ResultSet studentRS = studentState.executeQuery("select student_id from enrollment where quarter = 'spring' and year_ = 2018;"); 
				%>
				
				<%-- query form code --%>
				<table>
					<tr>
						<th>Student ID</th>
					</tr>

					<tr>
					<%-- Input form Code--%>
						<form action = "1_a.jsp" method="get"> 
							<input type="hidden" value="input" name="action"> 
							<td>
                            	<select name="STUDENTID" style="width:60px;">                            	
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
					<%-- Iteration code for part 1 of this report--%>
					<% while(result1 != null && result1.next()){ %> 
						<tr>
							<th>ID</th>
                        	<th>SSN</th>
                        	<th>First Name</th>
                        	<th>Middle Name</th>
                        	<th>Last Name</th>
						</tr>
						<tr>
							<td><%= result1.getInt("student_id")%></td>
                        	<td><%= result1.getInt("SSN") %></td>
                        	<td><%= result1.getString("first_name").trim() %></td>                        
                        	<td><%= result1.getString("middle_name").trim() %></td>
                        	<td><%= result1.getString("last_name").trim() %></td>
						</tr>
					<% } %>
				</table>
				
				<div style="height:20px"></div>
				<p>Classes taken in the current quarter:</p>
				<table>
					<%-- Iteration code for part 2 of this report--%>
					<% while(result2 != null && result2.next()){ %> 
						<tr>
							<th>course_number</th>
							<th>year</th>
							<th>quarter</th>
							<th>section_id</th>
							<th>faculty_name</th>
							<th>status</th>
							<th>grade</th>
						</tr>
						<tr>
							<td><%= result2.getString("course_number").trim()%></td>
                            <td><%= result2.getInt("year_") %></td>
                            <td><%= result2.getString("quarter").trim()%></td>
                            <td><%= result2.getInt("section_id")%></td>
                            <td><%= result2.getString("faculty_name").trim()%></td>
                            <td><%= result2.getString("status").trim()%></td>
                            <td><%= result2.getString("grade").trim()%></td>  
						</tr>
					<% } %>
				</table>
				

				<%-- Close connection code --%>
				<% 
				// close Resultset 
				if(result1 != null){
					result1.close(); 
					// close Statement 
				}
				statement1.close(); 
				if(result2 != null){
					result2.close(); 
					// close Statement 
				}
				statement2.close();
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