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
					PreparedStatement insertClass = conn.prepareStatement("INSERT INTO classes VALUES(?, ?, ?, ?);");
					
					insertClass.setString(1, request.getParameter("COURSENUMBER")); 
					insertClass.setInt(2, Integer.parseInt(request.getParameter("YEAR"))); 
					insertClass.setString(3, request.getParameter("QUARTER")); 
					insertClass.setInt(4, Integer.parseInt(request.getParameter("SECTIONID"))); 
					insertClass.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
                <%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement updateClass = conn.prepareStatement("UPDATE classes SET course_number=?, year_=?, quarter=?,section_id=? WHERE course_number=? and year_=? and quarter=? and section_id=?;");
					
					updateClass.setString(1, request.getParameter("COURSENUMBER")); 
					updateClass.setInt(2, Integer.parseInt(request.getParameter("YEAR"))); 
					updateClass.setString(3, request.getParameter("QUARTER")); 
					updateClass.setInt(4, Integer.parseInt(request.getParameter("SECTIONID"))); 
					updateClass.setString(5, request.getParameter("COURSENUMBERKEY")); 
					updateClass.setInt(6, Integer.parseInt(request.getParameter("YEARKEY"))); 
					updateClass.setString(7, request.getParameter("QUARTERKEY")); 
					updateClass.setInt(8, Integer.parseInt(request.getParameter("SECTIONIDKEY"))); 
					
					updateClass.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deleteClass = conn.prepareStatement("DELETE FROM classes WHERE course_number=? and year_=? and quarter=? and section_id=?;");
					
					deleteClass.setString(1, request.getParameter("COURSENUMBER")); 
					deleteClass.setInt(2, Integer.parseInt(request.getParameter("YEAR"))); 
					deleteClass.setString(3, request.getParameter("QUARTER")); 
					deleteClass.setInt(4, Integer.parseInt(request.getParameter("SECTIONID"))); 
					deleteClass.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement courseState = conn.createStatement(); 
				Statement classesState = conn.createStatement(); 
				
				ResultSet courseRS = courseState.executeQuery("select course_number from courses;"); 
				ResultSet classesRS = classesState.executeQuery("select * from classes;"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>course_number</th>
						<th>year</th>
						<th>quarter</th>
						<th>section</th>
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
							<th><input value="" name="SECTIONID" size="20"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<%-- Iteration code for Courses--%>
					<% while(classesRS.next()){ %> 
					<tr>
						<form action="classes.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= classesRS.getString("course_number").trim() %>" name="COURSENUMBERKEY" size="20">
                            <input type="hidden" value="<%= classesRS.getInt("year_") %>" name="YEARKEY" size="20">
                            <input type="hidden" value="<%= classesRS.getString("quarter").trim() %>" name="QUARTERKEY" size="20">
                            <input type="hidden" value="<%= classesRS.getInt("section_id") %>" name="SECTIONIDKEY" size="20">
                            
                            <td><input value="<%= classesRS.getString("course_number").trim() %>" name="COURSENUMBER" size="20" readonly></td>
                            <td><input value="<%= classesRS.getInt("year_") %>" name="YEAR" size="20" readonly></td>
                            <td><input value="<%= classesRS.getString("quarter").trim() %>" name="QUARTER" size="20" readonly></td>
                            <td><input value="<%= classesRS.getInt("section_id") %>" name="SECTIONID" size="20" readonly></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="classes.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= classesRS.getString("course_number").trim() %>" name="COURSENUMBER" size="20">
                            <input type="hidden" value="<%= classesRS.getInt("year_") %>" name="YEAR" size="20">
                            <input type="hidden" value="<%= classesRS.getString("quarter").trim() %>" name="QUARTER" size="20">
                            <input type="hidden" value="<%= classesRS.getInt("section_id") %>" name="SECTIONID" size="20">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
					</tr>
					<% } %>
				</table>
				
                <%-- Close connection code --%>
				<% 
				// close Resultset 
				classesRS.close(); 
				courseRS.close(); 
				// close Statement 
				classesState.close(); 
				courseState.close(); 
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