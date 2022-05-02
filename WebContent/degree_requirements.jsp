<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
    <table>
        <tr>
            <td>
                <jsp:include page="menu.html" />
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
                <%  String action=request.getParameter("action"); 
                    if (action !=null && action.equals("insert")) {
                        conn.setAutoCommit(false); 
                        
                        PreparedStatement UG_State = conn.prepareStatement( ("INSERT INTO undergradudatedegreerequiarment VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement G_State = conn.prepareStatement( ("INSERT INTO gradudatedegreerequiarment VALUES(?, ?, ?, ?, ?)"));
                        
                        
                        
                        if(request.getParameter("DEGREETYPE").equals("UNDERGRADUATE")){
                        	UG_State.setInt(1,Integer.parseInt(request.getParameter("DEGREEID")));
                        	UG_State.setString(2, request.getParameter("INSTITUTION"));
                        	UG_State.setString(3, request.getParameter("COURSENUMBER"));
                        	UG_State.setString(4, request.getParameter("ISCORE"));
                        	UG_State.setString(5, request.getParameter("ISTECHELECTIVE"));
                        	UG_State.setString(6, request.getParameter("ISMAJORELECTIVE"));
                        	UG_State.setString(7, request.getParameter("ISCOLLEGEREQUIRED"));
                        	UG_State.setInt(8,Integer.parseInt(request.getParameter("MINIMUMGRADE")));
                        	UG_State.executeUpdate(); 
                        }
                        if(request.getParameter("DEGREETYPE").equals("GRADUATE")){
                        	G_State.setInt(1,Integer.parseInt(request.getParameter("DEGREEID")));
                        	G_State.setString(2, request.getParameter("INSTITUTION"));
                        	G_State.setString(3, request.getParameter("COURSENUMBER"));
                        	G_State.setString(4, request.getParameter("ISREQUIRED"));
                        	G_State.setString(5, request.getParameter("CONCENTRATION"));
                        	G_State.executeUpdate(); 
                        }
                        
                        
                        conn.commit();
                        conn.setAutoCommit(true); 
                    }
                %>


                <%-- Update Code --%>
                <%  if (action != null && action.equals("update")) {
                		conn.setAutoCommit(false);
            			
                        PreparedStatement UG_Update = conn.prepareStatement("UPDATE undergradudatedegreerequiarment SET institution=?, is_core=?, is_technical_elective=?, is_major_elective=?, is_college_required=?, minimum_grade=? where degree_id=? and course_number=?;");
                        PreparedStatement G_Update = conn.prepareStatement("UPDATE gradudatedegreerequiarment SET institution=?, is_required=?, concentration=? where degree_id=? and course_number=?;");
                            
                            
                        if(request.getParameter("DEGREETYPE").equals("UNDERGRADUATE")){
                        	
                        	UG_Update.setString(1, request.getParameter("INSTITUTION"));
                        	UG_Update.setString(2, request.getParameter("ISCORE"));
                        	UG_Update.setString(3, request.getParameter("ISTECHELECTIVE"));
                        	UG_Update.setString(4, request.getParameter("ISMAJORELECTIVE"));
                        	UG_Update.setString(5, request.getParameter("ISCOLLEGEREQUIRED"));
                        	UG_Update.setInt(6,Integer.parseInt(request.getParameter("MINIMUMGRADE")));
                        	UG_Update.setInt(7,Integer.parseInt(request.getParameter("DEGREEID")));
                        	UG_Update.setString(8, request.getParameter("COURSENUMBER"));
                        	UG_Update.executeUpdate(); 
                        }
                        if(request.getParameter("DEGREETYPE").equals("GRADUATE")){
                        	
                        	G_Update.setString(1, request.getParameter("INSTITUTION"));
                        	G_Update.setString(2, request.getParameter("ISREQUIRED"));
                        	G_Update.setString(3, request.getParameter("CONCENTRATION"));
                        	G_Update.setInt(4,Integer.parseInt(request.getParameter("DEGREEID")));
                        	G_Update.setString(5, request.getParameter("COURSENUMBER"));
                        	G_Update.executeUpdate();  
                        }

                		
                        conn.commit(); 
                        conn.setAutoCommit(true);
                    }
                %>


                <%-- Delete Code --%>
                <%  if (action != null && action.equals("delete")){
                        conn.setAutoCommit(false);
                        
                        PreparedStatement UG_Delete = conn.prepareStatement("DELETE FROM undergradudatedegreerequiarment where degree_id=? and course_number=?;");
                        PreparedStatement G_Delete = conn.prepareStatement("DELETE FROM gradudatedegreerequiarment where degree_id=? and course_number=?;");
                            
                            
                        if(request.getParameter("DEGREETYPE").equals("UNDERGRADUATE")){
                        	
                        	
                        	UG_Delete.setInt(7,Integer.parseInt(request.getParameter("DEGREEID")));
                        	UG_Delete.setString(8, request.getParameter("COURSENUMBER"));
                        	UG_Delete.executeUpdate(); 
                        }
                        if(request.getParameter("DEGREETYPE").equals("GRADUATE")){
                        	
                        	
                        	G_Delete.setInt(4,Integer.parseInt(request.getParameter("DEGREEID")));
                        	G_Delete.setString(5, request.getParameter("COURSENUMBER"));
                        	G_Delete.executeUpdate();  
                        }
                        
                        conn.commit(); 
                        conn.setAutoCommit(true);
                    }
                %>



                <%-- Statement code --%>
                <%  Statement UG_statement = conn.createStatement();
                	Statement G_statement =conn.createStatement();
                	
                	
                    ResultSet UG_rs = UG_statement.executeQuery ("SELECT * FROM undergradudatedegreerequiarment");
                   	ResultSet G_rs = G_statement.executeQuery ("SELECT * FROM gradudatedegreerequiarment"); 
                %>


                <%-- Presentation code --%>
                <table>
                    <tr>
                        <th>Degree ID</th>
                        <th>Institution</th>
                        <th>Course Number</th>
                        <th>Core?</th>
                        <th>Technical Elective?</th>
                        <th>Major Elective?</th>
                        <th>College Required?</th>
                        <th>Graduate School Required?</th>
                        <th>Minimum Grade</th>
                        <th>Concentration</th>
                        <th>Degree Type</th>
                        <th>Action</th>
                    </tr>
                    
                    <%-- Insert Form Code --%>
                    <tr>
                    	<form action="degree_requirements.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="DEGREEID" size="10"></th>
                            <th><input value="" name="INSTITUTION" size="10"></th>
                            <th><input value="" name="COURSENUMBER" size="15"></th>
                            <th>
                            	<select name="ISCORE" style="width:60px;">
                            		<option value="YES">YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <th>
                            	<select name="ISTECHELECTIVE" style="width:140px;">
                            		<option value="YES">YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <th>
                            	<select name="ISMAJORELECTIVE" style="width:120px;">
                            		<option value="YES">YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <th>
                            	<select name="ISCOLLEGEREQUIRED" style="width:140px;">
                            		<option value="YES">YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <th>
                            	<select name="ISREQUIRED" style="width:200px;">
                            		<option value="YES">YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <th><input value="" name="MINIMUMGRADE" size="15"></th>
                            <th><input value="" name="CONCENTRATION" size="10"></th>
                            <th>
                            	<select name="DEGREETYPE">
                            		<option value="UNDERGRADUATE">Undergraduate Degree</option>
                            		<option value="GRADUATE">Graduate Degree</option>
                            	</select>
                            </th>
                            <th><input style="width:60px;" type="submit" value="Insert"></th>
                        </form>
                    </tr>
    				<tr style="height:20px"></tr>
    				
                    <%-- Iteration Code for under-graduate student--%>
                    <% while (UG_rs.next()) {%>
                    <tr>
                        <form action="degree_requirements.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= UG_rs.getInt("degree_id") %>" name="DEGREEID" size="10"></td>
                            <td><input value="<%= UG_rs.getString("institution").trim() %>" name="INSTITUTION" size="10"></td>
                            <td><input value="<%= UG_rs.getString("course_number").trim() %>" name="COURSENUMBER" size="15"></td>
                            <% if ((UG_rs.getString("is_core").trim()).equals("YES")){%>
                            <th>
                            	<select name="ISCORE" style="width:60px;">
                            		<option value="YES" selected>YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <% }else{%>
                            <th>
                            	<select name="ISCORE" style="width:60px;">
                            		<option value="YES">YES</option>
                            		<option value="NO" selected>NO</option>
                            	</select>
                            </th>
                            <% } %>
                            <% if ((UG_rs.getString("is_technical_elective").trim()).equals("YES")){%>
                            <th>
                            	<select name="ISTECHELECTIVE" style="width:140px;">
                            		<option value="YES" selected>YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <% }else{%>
                            <th>
                            	<select name="ISTECHELECTIVE" style="width:140px;">
                            		<option value="YES">YES</option>
                            		<option value="NO" selected>NO</option>
                            	</select>
                            </th>
                            <% } %>
                            <% if ((UG_rs.getString("is_major_elective").trim()).equals("YES")){%>
                            <th>
                            	<select name="ISMAJORELECTIVE" style="width:120px;">
                            		<option value="YES" selected>YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <% }else{%>
                            <th>
                            	<select name="ISMAJORELECTIVE" style="width:120px;">
                            		<option value="YES">YES</option>
                            		<option value="NO" selected>NO</option>
                            	</select>
                            </th>
                            <% } %>
                            <% if ((UG_rs.getString("is_college_required").trim()).equals("YES")){%>
                            <th>
                            	<select name="ISCOLLEGEREQUIRED" style="width:140px;">
                            		<option value="YES" selected>YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <% }else{%>
                            <th>
                            	<select name="ISCOLLEGEREQUIRED" style="width:140px;">
                            		<option value="YES">YES</option>
                            		<option value="NO" selected>NO</option>
                            	</select>
                            </th>
                            <% } %>
                            <td></td>
                            <td><input value="<%= UG_rs.getInt("minimum_grade")%>" name="MINIMUMGRADE" size="15"></td>
                            <td></td>
                            <td>Undergraduate Degree</td>
                            <input type="hidden" value="UNDERGRADUATE" name="DEGREETYPE">
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= UG_rs.getInt("degree_id") %>" name="DEGREEID">
                            <input type="hidden" value="<%= UG_rs.getString("course_number").trim() %>" name="COURSENUMBER">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                    <%--iteration code for graduate student --%>
                    <% while (G_rs.next()) {%>
                    <tr>
                        <form action="degree_requirements.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= G_rs.getInt("degree_id") %>" name="DEGREEID" size="10"></td>
                            <td><input value="<%= G_rs.getString("institution").trim() %>" name="INSTITUTION" size="10"></td>
                            <td><input value="<%= G_rs.getString("course_number").trim() %>" name="COURSENUMBER" size="15"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <% if ((G_rs.getString("is_required").trim()).equals("YES")){%>
                            <th>
                            	<select name="ISREQUIRED" style="width:200px;">
                            		<option value="YES" selected>YES</option>
                            		<option value="NO">NO</option>
                            	</select>
                            </th>
                            <% }else{%>
                            <th>
                            	<select name="ISREQUIRED" style="width:200px;">
                            		<option value="YES">YES</option>
                            		<option value="NO" selected>NO</option>
                            	</select>
                            </th>
                            <% } %>
                            <td></td>
                            <td><input value="<%= G_rs.getString("concentration").trim() %>" name="CONCENTRATION" size="10"></td>
                            <td>Graduate Degree</td>
                            <input type="hidden" value="GRADUATE" name="DEGREETYPE">
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= G_rs.getInt("degree_id") %>" name="DEGREEID">
                            <input type="hidden" value="<%= G_rs.getString("course_number").trim() %>" name="COURSENUMBER">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                    
                </table>

                
                <%-- Close connection code --%>
                <%  // Close the ResultSet
                	UG_rs.close();
                	G_rs.close(); 
                	
                    // Close the Statement
                    UG_statement.close();
                    G_statement.close(); 
                	
                    // Close the Connection
                    conn.close();
                    
                    // Exceptions
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
