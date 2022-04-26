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
                <%  try { 
                        DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
                        Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@feast.ucsd.edu:1521:source", "user", "pass");
                    
                %>


                <%-- Insertion Code --%>
                <%  String action=request.getParameter("action"); 
                    if (action !=null && action.equals("insert")) {
                        conn.setAutoCommit(false); 
                        PreparedStatement pstmt=conn.prepareStatement( ("INSERT INTO Student VALUES(?, ?, ?, ?, ?)"));
                        pstmt.setInt(1,Integer.parseInt(request.getParameter("SSN")));
                        pstmt.setString(2, request.getParameter("ID"));
                        pstmt.setString(3, request.getParameter("FIRSTNAME"));
                        pstmt.setString(4, request.getParameter("LASTNAME"));
                        pstmt.setString(5, request.getParameter("COLLEGE"));
                      	//...
                        pstmt.executeUpdate();
                        conn.commit(); conn.setAutoCommit(true); 
                    }
                %>


                <%-- Update Code --%>
                <%  if (action != null && action.equals("update")) {
                        conn.setAutoCommit(false);
                        PreparedStatement pstatement = conn.prepareStatement("UPDATE Student SET ID = ?, FIRSTNAME = ?, " + "LASTNAME = ?, COLLEGE = ? WHERE SSN = ?");
                        pstatement.setString(1, request.getParameter("ID"));
                        pstatement.setString(2, request.getParameter("FIRSTNAME"));
                        pstatement.setString(3, request.getParameter("LASTNAME"));
                        pstatement.setString(4, request.getParameter("COLLEGE"));
                        pstatement.setInt(5, Integer.parseInt(request.getParameter("SSN")));
                        //...
                        int rowCount = pstatement.executeUpdate();
                        conn.setAutoCommit(false);
                        conn.setAutoCommit(true);
                    }
                %>


                <%-- Delete Code --%>
                <%  if (action != null && action.equals("delete")){
                        conn.setAutoCommit(false);
                        PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Student WHERE SSN = ?");
                        pstmt.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                        int rowCount = pstmt.executeUpdate();
                        conn.setAutoCommit(false);
                        conn.setAutoCommit(true);
                    }
                %>



                <%-- Statement code --%>
                <%  Statement statement=conn.createStatement();
                    ResultSet rs=statement.executeQuery ("SELECT * FROM Student"); 
                %>


                <%-- Presentation code --%>
                <table>
                    <tr>
                        <th>SSN</th>
                        <th>First</th>
                        <th>Last</th>
                        <th>College</th>
                    </tr>
                    
                    <%-- Insert Form Code --%>
                    <tr>
                    	<form action="students.jsp" method="get">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="SSN" size="10"></th>
                            <th><input value="" name="ID" size="10"></th>
                            <th><input value="" name="FIRSTNAME" size="15"></th>
                            <th><input value="" name="LASTNAME" size="15"></th>
                            <th><input value="" name="COLLEGE" size="15"></th>
                            <th><input type="submit" value="Insert"></th>
                        </form>
                    </tr>

                    <%-- Iteration Code --%>
                    <% while ( rs.next() ) {%>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <td><input value="<%= rs.getInt("SSN") %>" name="SSN"></td>
                            <td><input value="<%= rs.getString("ID") %>" name="ID"></td>
                            <td><input value="<%= rs.getString("FIRSTNAME") %>" name="FIRSTNAME"></td>
                            <td><input value="<%= rs.getString("LASTNAME") %>" name="LASTNAME"></td>
                            <td><input value="<%= rs.getString("COLLEGE") %>" name="COLLEGE"></td>
                            <%-- ... --%>
                            <td><input type="submit" value="Update"></td>
                        </form>
                        <form action="students2.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= rs.getInt("SSN") %>" name="SSN">
                            <td><input type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                </table>

                
                <%-- Close connection code --%>
                <%  // Close the ResultSet
                    rs.close();
                    // Close the Statement
                    statement.close();
                    // Close the Connection
                    conn.close();
                    } catch (SQLException sqle) {
                        out.println(sqle.getMessage());
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>


            </td>
        </tr>
    </table>
</body>

</html>
