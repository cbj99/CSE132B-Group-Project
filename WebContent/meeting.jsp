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
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
                <%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement courseState = conn.createStatement(); 
				
				ResultSet courseRS = courseState.executeQuery("select course_number from courses;"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>course_number</th>
						<th>year</th>
						<th>quarter</th>
						<th>type</th>
						<th>begin_date</th>
						<th>end_date</th>
						<th>Mon</th>
						<th>Tue</th>
						<th>Wed</th>
						<th>Thr</th>
						<th>Fri</th>
						<th>begin_time</th>
						<th>end_time</th>
						<th>room_number</th>
						<th>building_number</th>
					</tr>
					<tr>
					
					<%-- Insert form Code--%>
						<form action = "classes.jsp" method="get"> 
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
							<th><input value="" name="TYPE" size="20"></th>
							<th><input value="" name="BEGINDATE" size="20"></th>
							<th><input value="" name="ENDDATE" size="20"></th>
							<th><input type="checkbox" name="MONDAY"></th>
							<th><input type="checkbox" name="TUESDAY"></th>
							<th><input type="checkbox" name="WEDNEDAY"></th>
							<th><input type="checkbox" name="THURSDAY"></th>
							<th><input type="checkbox" name="FRIDAY"></th>
							<th><input value="" name="BEGINTIME" size="20"></th>
							<th><input value="" name="ENDTIME" size="20"></th>
							<th><input value="" name="ROOMNUMBER" size="20"></th>
							<th><input value="" name="BUILDINGNUMBER" size="20"></th>
							
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="classes.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= result.getString("faculty_name") %>" name="FACULTYNAMEKEY" size="20">
                            
                            <td><input value="<%= result.getString("faculty_name").trim() %>" name="FACULTYNAME" size="20"></td>
                            <td><input value="<%= result.getString("title").trim() %>" name="TITLE" size="20"></td>
                            <td><input value="<%= result.getString("department").trim() %>" name="DEPARTMENT" size="20"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="classes.jsp" method="get">
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
				// close Statement 
				// close Connection
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