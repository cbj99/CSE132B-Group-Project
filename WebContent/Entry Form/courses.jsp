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
					PreparedStatement statement = conn.prepareStatement("INSERT INTO courses VALUES(?, ?, ?, ?, ?, ?, ?)"); 
					PreparedStatement preStatement = conn.prepareStatement("INSERT INTO coursePrequisite VALUES(?, ?)");
					
					statement.setString(1, request.getParameter("COURSENUMBER"));
					statement.setString(2, request.getParameter("GRADINGOPTION"));
					statement.setInt(3, Integer.parseInt(request.getParameter("UNITS")));
					statement.setString(4, request.getParameter("DEPARTMENT"));
					statement.setInt(5, Integer.parseInt(request.getParameter("LABREQUIRED")));
					String temp = request.getParameter("COURSENUMBER").replaceAll("[a-zA-Z]", ""); 
					int checkUpper = Integer.parseInt(temp);
					if(checkUpper >= 100){
						statement.setInt(6, 1);
					}else{
						statement.setInt(6, 0);
					}
					statement.setString(7, request.getParameter("TITLE"));
					
					statement.executeUpdate(); 
					
					String courseNumber = request.getParameter("COURSENUMBER"); 
					String preReqStr = request.getParameter("PREREQUISITE"); 
					preReqStr = preReqStr.replace(" ", ""); 
					if(preReqStr.length()>0){
						String[] preReqStrArr =  preReqStr.split(",");
						for(int i = 0; i < preReqStrArr.length; i++){
							preStatement.setString(1, courseNumber); 
							preStatement.setString(2, preReqStrArr[i].replace(" ", "")); 
							preStatement.executeUpdate(); 
						}
					}
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>

				<%-- Update Code --%>
				<% 
				if(action != null && action.equals("update")){
					conn.setAutoCommit(false); 
					PreparedStatement statement = conn.prepareStatement("UPDATE courses SET course_number=?, grading_option=?, unit=?, department=?, lab_required=?, course_title=? where course_number=?;");
					PreparedStatement deleteStatement = conn.prepareStatement("DELETE FROM coursePrequisite where course_number=?;");
					PreparedStatement preStatement = conn.prepareStatement("INSERT INTO coursePrequisite VALUES(?, ?)");
					
					statement.setString(1, request.getParameter("COURSENUMBER"));
					statement.setString(2, request.getParameter("GRADINGOPTION"));
					statement.setInt(3, Integer.parseInt(request.getParameter("UNITS")));
					statement.setString(4, request.getParameter("DEPARTMENT"));
					statement.setInt(5, Integer.parseInt(request.getParameter("LABREQUIRED")));
					statement.setString(6, request.getParameter("TITLE"));
					statement.setString(7, request.getParameter("COURSENUMBERKEY"));
					statement.executeUpdate();
					
					String courseNumber = request.getParameter("COURSENUMBER"); 
					// delete all prerequisite 
					deleteStatement.setString(1, courseNumber);
					deleteStatement.executeUpdate(); 
					
					// reinsert into database
					String preReqStr = request.getParameter("PREREQUISITE"); 
					preReqStr = preReqStr.replace(" ", ""); 
					if(preReqStr.length()>0){
						String[] preReqStrArr =  preReqStr.split(",");
						for(int i = 0; i < preReqStrArr.length; i++){
							preStatement.setString(1, courseNumber); 
							preStatement.setString(2, preReqStrArr[i].replace(" ", "").toUpperCase()); 
							preStatement.executeUpdate(); 
						}
					}
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				<%-- Delete Code --%>
				<%
				if(action != null && action.equals("delete")){
					conn.setAutoCommit(false); 
					PreparedStatement deleteCoursestatement = conn.prepareStatement("DELETE FROM courses where course_number=?;");
					
					deleteCoursestatement.setString(1, request.getParameter("COURSENUMBER"));
					deleteCoursestatement.executeUpdate(); 
					
					conn.commit();
                    conn.setAutoCommit(true); 
				}
				%>
				<%-- Statement code --%>
				<%
				Statement statement = conn.createStatement(); 
				ResultSet result = statement.executeQuery("select * from Courses"); 

				PreparedStatement preRequisiteState = conn.prepareStatement("select prerequisite from coursePrequisite where course_number=?;"); 
				%>
				<%-- Presentation code --%>
				<table>
					<tr>
						<th>Course Number</th>
						<th>Grading Option</th>
						<th>Unit </th>
						<th>Department</th>
						<th>Lab Required</th>
						<th>Course Title</th>
						<th>Pre Requisite Course Number</th>
						<th>Action</th>
					</tr>

					<tr>
					<%-- Insert form Code--%>
						<form action = "courses.jsp" method="get"> 
							<input type="hidden" value="insert" name="action"> 
							<th><input value="" name="COURSENUMBER" size="10"></th>
							<th><input value="" name="GRADINGOPTION" size="15"></th>
							<th><input value="" name="UNITS" size="10"></th>
							<th><input value="" name="DEPARTMENT" size="10"></th>
							<th><input value="" name="LABREQUIRED" size="10"></th>
							<th><input value="" name="TITLE" size="45"></th>
							<th><input value="" name="PREREQUISITE" size="25"></th>
							<th><input style="width:60px;" type="submit" value="Insert"></th>
						</form>
					</tr>
					
					<tr style="height:20px"></tr>

					<%-- Iteration code for Courses--%>
					<% while(result.next()){ %> 
					<tr>
						<form action="courses.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= result.getString("course_number").trim()%>" name="COURSENUMBERKEY" size="10" readonly>
                            <td><input value="<%= result.getString("course_number").trim() %>" name="COURSENUMBER" size="10" readonly></td>
                            <td><input value="<%= result.getString("grading_option").trim() %>" name="GRADINGOPTION" size="15"></td>
                            <td><input value="<%= result.getInt("unit") %>" name="UNITS" size="10"></td>
                            <td><input value="<%= result.getString("department").trim() %>" name="DEPARTMENT" size="10"></td>
                            <td><input value="<%= result.getInt("lab_required") %>" name="LABREQUIRED" size="10"></td>
                            <td><input value="<%= result.getString("course_title").trim() %>" name="TITLE" size="45"></td>
							<% 
							preRequisiteState.setString(1, result.getString("course_number")); 
							ResultSet preRequisite = preRequisiteState.executeQuery(); 
							String preRequisiteStr = ""; 
							boolean hasPrerequisite = false; 
							while(preRequisite.next()){
								preRequisiteStr = preRequisiteStr + preRequisite.getString("prerequisite").replaceAll(" ", "") +","; 
								hasPrerequisite = true; 
							}
							if(hasPrerequisite){
								preRequisiteStr = preRequisiteStr.substring(0, preRequisiteStr.length() - 1); 
							}
							%>
                            <td><input value="<%= preRequisiteStr %>" name="PREREQUISITE" size="25"></td>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
						<form action="courses.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= result.getString("course_number") %>" name="COURSENUMBER">
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
