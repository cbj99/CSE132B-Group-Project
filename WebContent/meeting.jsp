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
					PreparedStatement insertMeeting = conn.prepareStatement("INSERT INTO meetings VALUES(?, ?, ?, ?, ?, ?::date, ?::time, ?::time, ?, ?, ?);");
					insertMeeting.setString(1, request.getParameter("COURSENUMBER")); 
					insertMeeting.setInt(2, Integer.parseInt(request.getParameter("YEAR"))); 
					insertMeeting.setString(3, request.getParameter("QUARTER")); 
					insertMeeting.setInt(4, Integer.parseInt(request.getParameter("SECTION"))); 
					insertMeeting.setString(5, request.getParameter("TYPE")); 
					insertMeeting.setString(6, request.getParameter("DATE"));
					insertMeeting.setString(7, request.getParameter("BEGINTIME"));
					insertMeeting.setString(8, request.getParameter("ENDTIME"));
					insertMeeting.setString(9, request.getParameter("MANDATORY"));
					insertMeeting.setString(10, request.getParameter("ROOMNUMBER"));
					insertMeeting.setString(11, request.getParameter("BUILDINGNUMBER"));
					insertMeeting.executeUpdate();
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
                <%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement updatemeeting = conn.prepareStatement("UPDATE meetings SET begin_time=?::time, end_time=?::time, mandatory=?, room_number=?, building_number=? WHERE course_number=? and year_=? and quarter=? and section_id=? and type_=? and date_=?::date;"); 
					updatemeeting.setString(6, request.getParameter("COURSENUMBER")); 
					updatemeeting.setInt(7, Integer.parseInt(request.getParameter("YEAR"))); 
					updatemeeting.setString(8, request.getParameter("QUARTER")); 
					updatemeeting.setInt(9, Integer.parseInt(request.getParameter("SECTION"))); 
					updatemeeting.setString(10, request.getParameter("TYPE")); 
					updatemeeting.setString(11, request.getParameter("DATE"));
					updatemeeting.setString(1, request.getParameter("BEGINTIME"));
					updatemeeting.setString(2, request.getParameter("ENDTIME"));
					updatemeeting.setString(3, request.getParameter("MANDATORY"));
					updatemeeting.setString(4, request.getParameter("ROOMNUMBER"));
					updatemeeting.setString(5, request.getParameter("BUILDINGNUMBER"));
					updatemeeting.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deleteMeeting = conn.prepareStatement("DELETE FROM meetings WHERE course_number=? and year_=? and quarter=? and section_id=? and type_=? and date_=?::date;");
					deleteMeeting.setString(1, request.getParameter("COURSENUMBER")); 
					deleteMeeting.setInt(2, Integer.parseInt(request.getParameter("YEAR"))); 
					deleteMeeting.setString(3, request.getParameter("QUARTER")); 
					deleteMeeting.setInt(4, Integer.parseInt(request.getParameter("SECTION"))); 
					deleteMeeting.setString(5, request.getParameter("TYPE")); 
					deleteMeeting.setString(6, request.getParameter("DATE"));
					deleteMeeting.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement courseState = conn.createStatement(); 
				Statement meetingState = conn.createStatement(); 
				
				ResultSet courseRS = courseState.executeQuery("select course_number from courses;"); 
				ResultSet meetingRS = meetingState.executeQuery("select * from meetings;"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>course_number</th>
						<th>year</th>
						<th>quarter</th>
						<th>section</th>
						<th>type</th>
						<th>date</th>
						<th>begin_time</th>
						<th>end_time</th>
						<th>mandatory</th>
						<th>room_number</th>
						<th>building_number</th>
					</tr>
					
					
					<%-- Insert form Code--%>
					<tr>
						<form action = "meeting.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th>
                            	<select name="COURSENUMBER">                            	
                            	<% while (courseRS.next()){ %>
                            		<option value=<%= courseRS.getString("course_number")%>> <%= courseRS.getString("course_number")%></option>
                            	<% } %>
                            	</select>
                            </th>
							<th><input value="" name="YEAR" size="20"></th>
							<th><input value="" name="QUARTER" size="20"></th>
							<th><input value="" name="SECTION" size="20"></th>
							<th>
                            	<select name="TYPE">                            	
                            	<option value="LE">Lecture</option>
                            	<option value="DI">Discussion</option>
                            	<option value="LAB">Lab</option>
                            	<option value="SPECIAL">Review Session</option>
                            	</select>
                            </th>
                            
							<th><input value="" name="DATE" size="20"></th>
							<th><input value="" name="BEGINTIME" size="20"></th>
							<th><input value="" name="ENDTIME" size="20"></th>
							<th>
                            	<select name="MANDATORY">                            	
                            	<option value="YES">Yes</option>
                            	<option value="NO">No</option>
                            	</select>
                            </th>
							<th><input value="" name="ROOMNUMBER" size="20"></th>
							<th><input value="" name="BUILDINGNUMBER" size="20"></th>
							
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<%-- Iteration code for Courses--%>
					<% while(meetingRS.next()){ %> 
					<tr>
						<form action="meeting.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            
                            <td><input value="<%= meetingRS.getString("course_number").trim()%>" name="COURSENUMBER" size="20"></td>
                            <td><input value="<%= meetingRS.getInt("year_") %>" name="YEAR" size="20"></td>
                            <td><input value="<%= meetingRS.getString("quarter").trim() %>" name="QUARTER" size="20"></td>
                            <td><input value="<%= meetingRS.getInt("section_id") %>" name="SECTION" size="20"></td>
                            <td><input value="<%= meetingRS.getString("type_").trim() %>" name="TYPE" size="20"></td>
                            <td><input value="<%= meetingRS.getDate("date_") %>" name="DATE" size="20"></td>
                            <td><input value="<%= meetingRS.getTime("begin_time") %>" name="BEGINTIME" size="20"></td>
                            <td><input value="<%= meetingRS.getTime("end_time") %>" name="ENDTIME" size="20"></td>
                            <% if(meetingRS.getString("mandatory").equals("Yes")){ %>
                            <th>
                            	<select name="MANDATORY">                            	
                            	<option value="YES" selected>Yes</option>
                            	<option value="NO">No</option>
                            	</select>
                            </th>
                            <% } else{%>
                             <th>
                            	<select name="MANDATORY">                            	
                            	<option value="YES">Yes</option>
                            	<option value="NO" selected>No</option>
                            	</select>
                            </th>
                            <% } %>
                            
                            <td><input value="<%= meetingRS.getString("room_number").trim() %>" name="ROOMNUMBER" size="20"></td>
                            <td><input value="<%= meetingRS.getString("building_number").trim() %>" name="BUILDINGNUMBER" size="20"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="meeting.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= meetingRS.getString("course_number") %>" name="COURSENUMBER">
                            <input type="hidden" value="<%= meetingRS.getInt("year_") %>" name="YEAR" size="20">
                            <input type="hidden" value="<%= meetingRS.getString("quarter").trim() %>" name="QUARTER" size="20">
                            <input type="hidden" value="<%= meetingRS.getInt("section_id") %>" name="SECTION" size="20">
                            <input type="hidden" value="<%= meetingRS.getString("type_").trim() %>" name="TYPE" size="20">
                            <input type="hidden" value="<%= meetingRS.getDate("date_") %>" name="DATE" size="20">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
					</tr>
					<% } %>
				</table>
				
                <%-- Close connection code --%>
				<% 
				// close Resultset 
				courseRS.close(); 
				meetingRS.close(); 
				// close Statement 
				courseState.close(); 
				meetingState.close(); 
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