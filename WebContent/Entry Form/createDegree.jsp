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
					PreparedStatement insertDegree = conn.prepareStatement("INSERT INTO degree_ VALUES(?, ?, ?, ?)");
					PreparedStatement insertUnderDegree = conn.prepareStatement("INSERT INTO undergraduateDegree VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
					PreparedStatement insertGraduate = conn.prepareStatement("INSERT INTO graduateDegree VALUES(?, ?, ?, ?)");
					
					insertDegree.setString(1, request.getParameter("DEGREEID")); 
					insertDegree.setString(2, request.getParameter("INSTITUTION")); 
					insertDegree.setString(3, request.getParameter("DEGREENAME")); 
					insertDegree.setString(4, request.getParameter("DEPARTMENT"));
					insertDegree.executeUpdate(); 
					
					if(request.getParameter("DEGREETYPE").equals("UNDERGRADUATE")){
						insertUnderDegree.setString(1, request.getParameter("DEGREEID")); 
						insertUnderDegree.setString(2, request.getParameter("INSTITUTION")); 
						insertUnderDegree.setString(3, request.getParameter("DEGREENAME")); 
						insertUnderDegree.setString(4, request.getParameter("DEPARTMENT"));
						insertUnderDegree.setString(5, request.getParameter("UNDERDEGREETYPE"));
						insertUnderDegree.setInt(6, Integer.parseInt(request.getParameter("UPPERUNITS")));
						insertUnderDegree.setInt(7, Integer.parseInt(request.getParameter("LOWERUNITS")));
						insertUnderDegree.setInt(8, Integer.parseInt(request.getParameter("COREUNITS")));
						insertUnderDegree.setInt(9, Integer.parseInt(request.getParameter("TECHNICALUNITS")));
						insertUnderDegree.setInt(10, Integer.parseInt(request.getParameter("MAJORELECTIVEUNITS")));
						insertUnderDegree.setInt(11, Integer.parseInt(request.getParameter("COLLEGEUNITS")));
						insertUnderDegree.executeUpdate(); 
					}
					if(request.getParameter("DEGREETYPE").equals("GRADUATE")){
						insertGraduate.setString(1, request.getParameter("DEGREEID")); 
						insertGraduate.setString(2, request.getParameter("INSTITUTION")); 
						insertGraduate.setString(3, request.getParameter("DEGREENAME")); 
						insertGraduate.setString(4, request.getParameter("DEPARTMENT"));
						insertGraduate.executeUpdate(); 
					}
					
					conn.commit(); 
                    conn.setAutoCommit(true); 
				}
				%>
				
                <%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement updateDegree = conn.prepareStatement("UPDATE degree_ SET degree_id=?, institution=?, degree_name=?, department=? where degree_id=? AND institution=?");
					PreparedStatement updateUnderDegree = conn.prepareStatement("UPDATE undergraduateDegree SET degree_id=?, institution=?, degree_name=?, department=?, type=?, upper_division_units=?, lower_division_units=?, core_units=?, technical_units=?, major_elective_units=?, college_units=? where degree_id=? AND institution=?");
					PreparedStatement updateGraduate = conn.prepareStatement("UPDATE graduateDegree SET degree_id=?, institution=?, degree_name=?, department=? where degree_id=? AND institution=?");
					
					updateDegree.setString(1, request.getParameter("DEGREEID")); 
					updateDegree.setString(2, request.getParameter("INSTITUTION")); 
					updateDegree.setString(3, request.getParameter("DEGREENAME")); 
					updateDegree.setString(4, request.getParameter("DEPARTMENT"));
					updateDegree.setString(5, request.getParameter("DEGREEIDKEY"));
					updateDegree.setString(6, request.getParameter("INSTITUTIONKEY"));
					updateDegree.executeUpdate(); 
					
					if(request.getParameter("DEGREETYPE").equals("UNDERGRADUATE")){
						updateUnderDegree.setString(1,request.getParameter("DEGREEID")); 
						updateUnderDegree.setString(2, request.getParameter("INSTITUTION")); 
						updateUnderDegree.setString(3, request.getParameter("DEGREENAME")); 
						updateUnderDegree.setString(4, request.getParameter("DEPARTMENT"));
						updateUnderDegree.setString(5, request.getParameter("UNDERDEGREETYPE"));
						updateUnderDegree.setInt(6, Integer.parseInt(request.getParameter("UPPERUNITS")));
						updateUnderDegree.setInt(7, Integer.parseInt(request.getParameter("LOWERUNITS")));
						updateUnderDegree.setInt(8, Integer.parseInt(request.getParameter("COREUNITS")));
						updateUnderDegree.setInt(9, Integer.parseInt(request.getParameter("TECHNICALUNITS")));
						updateUnderDegree.setInt(10, Integer.parseInt(request.getParameter("MAJORELECTIVEUNITS")));
						updateUnderDegree.setInt(11, Integer.parseInt(request.getParameter("COLLEGEUNITS")));
						updateUnderDegree.setString(12, request.getParameter("DEGREEIDKEY")); 
						updateUnderDegree.setString(13, request.getParameter("INSTITUTIONKEY")); 
						updateUnderDegree.executeUpdate(); 
					}
					if(request.getParameter("DEGREETYPE").equals("GRADUATE")){
						updateGraduate.setString(1, request.getParameter("DEGREEID")); 
						updateGraduate.setString(2, request.getParameter("INSTITUTION")); 
						updateGraduate.setString(3, request.getParameter("DEGREENAME")); 
						updateGraduate.setString(4, request.getParameter("DEPARTMENT"));
						updateGraduate.setString(5, request.getParameter("DEGREEIDKEY"));
						updateGraduate.setString(6, request.getParameter("INSTITUTIONKEY"));
						updateGraduate.executeUpdate(); 
					}
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deleteDegree = conn.prepareStatement("DELETE FROM degree_ where degree_id=? AND institution=?");
					deleteDegree.setString(1, request.getParameter("DEGREEID")); 
					deleteDegree.setString(2, request.getParameter("INSTITUTION")); 
					deleteDegree.executeUpdate(); 
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				
				<%-- Statement code --%>
				<%
				Statement UnderGraduateState = conn.createStatement(); 
				Statement GraduateState = conn.createStatement();
				
				ResultSet UnderGraduateRS = UnderGraduateState.executeQuery("SELECT * FROM undergraduateDegree"); 
				ResultSet GradRS = GraduateState.executeQuery("SELECT * FROM graduateDegree"); 
				%>
				
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>Degree ID</th>
						<th>Institution</th>
						<th>Degree Name</th>
						<th>Department</th>
						<th>Undergraduate Degree Type</th>
						<th>Upper Division Units</th>
						<th>Lower Division Units</th>
						<th>Core Units</th>
						<th>Technical Units</th>
						<th>Major Elective Units</th>
						<th>College Units</th>
						<th>UnderGraduate/Graduate</th>
						<th>Action</th>
					</tr>
					<tr>
					<%-- Insert form Code--%>
						<form action = "createDegree.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							
							<th><input value="" name="DEGREEID" size="20"></th>
							<th><input value="UCSD" name="INSTITUTION" size="20"></th>
							<th><input value="" name="DEGREENAME" size="20"></th>
							<th><input value="" name="DEPARTMENT" size="20"></th>
							<th><input value="" name="UNDERDEGREETYPE" size="20"></th>
							<th><input value="" name="UPPERUNITS" size="20"></th>
							<th><input value="" name="LOWERUNITS" size="20"></th>
							<th><input value="" name="COREUNITS" size="20"></th>
							<th><input value="" name="TECHNICALUNITS" size="20"></th>
							<th><input value="" name="MAJORELECTIVEUNITS" size="20"></th>
							<th><input value="" name="COLLEGEUNITS" size="20"></th>
							<th>
                            	<select name="DEGREETYPE">
                            		<option value="UNDERGRADUATE" selected>undergraduate</option>
                            		<option value="GRADUATE">graduate</option>
                            	</select>
                            </th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<tr style="height:20px"></tr>
					
					<%-- Iteration code for Courses--%>
					<%-- Iteration Undergraduate Degree --%>
					<% while(UnderGraduateRS.next()){ %> 
					<tr>
						<form action="createDegree.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= UnderGraduateRS.getString("degree_id") %>" name="DEGREEIDKEY" size="20">
                            <input type="hidden" value="<%= UnderGraduateRS.getString("institution").trim() %>" name="INSTITUTIONKEY" size="20">
                            
                            <td><input value="<%= UnderGraduateRS.getString("degree_id") %>" name="DEGREEID" size="20" readonly></td>
                            <td><input value="<%= UnderGraduateRS.getString("institution").trim() %>" name="INSTITUTION" size="20" readonly></td>
                            <td><input value="<%= UnderGraduateRS.getString("degree_name").trim() %>" name="DEGREENAME" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getString("department").trim() %>" name="DEPARTMENT" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getString("type").trim() %>" name="UNDERDEGREETYPE" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getInt("upper_division_units") %>" name="UPPERUNITS" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getInt("lower_division_units") %>" name="LOWERUNITS" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getInt("core_units") %>" name="COREUNITS" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getInt("technical_units") %>" name="TECHNICALUNITS" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getInt("major_elective_units") %>" name="MAJORELECTIVEUNITS" size="20"></td>
                            <td><input value="<%= UnderGraduateRS.getInt("college_units") %>" name="COLLEGEUNITS" size="20"></td>
                            <th>
                            	<select name="DEGREETYPE">
                            		<option value="UNDERGRADUATE" selected>undergraduate</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="createDegree.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= UnderGraduateRS.getString("degree_id") %>" name="DEGREEID">
                            <input type="hidden" value="<%= UnderGraduateRS.getString("institution") %>" name="INSTITUTION">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
					</tr>
					<% } %>
					
					<%-- Iteration Graduate Degree --%>
					<% while(GradRS.next()){ %> 
					<tr>
						<form action="createDegree.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= GradRS.getString("degree_id") %>" name="DEGREEIDKEY" size="20">
                            <input type="hidden" value="<%= GradRS.getString("institution").trim() %>" name="INSTITUTIONKEY" size="20">
                            
                            <td><input value="<%= GradRS.getString("degree_id") %>" name="DEGREEID" size="20" readonly></td>
                            <td><input value="<%= GradRS.getString("institution").trim() %>" name="INSTITUTION" size="20" readonly></td>
                            <td><input value="<%= GradRS.getString("degree_name").trim() %>" name="DEGREENAME" size="20"></td>
                            <td><input value="<%= GradRS.getString("department").trim() %>" name="DEPARTMENT" size="20"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <th>
                            	<select name="DEGREETYPE">
                            		<option value="GRADUATE" selected>graduate</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="createDegree.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= GradRS.getString("degree_id") %>" name="DEGREEID">
                            <input type="hidden" value="<%= GradRS.getString("institution") %>" name="INSTITUTION">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
					</tr>
					<% } %>
					
				</table>
				
                <%-- Close connection code --%>
				<% 
				// close Resultset 
				UnderGraduateRS.close(); 
				GradRS.close(); 
				// close Statement 
				UnderGraduateState.close(); 
				GraduateState.close(); 
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