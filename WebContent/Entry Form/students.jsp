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
                        PreparedStatement studentInsertState = conn.prepareStatement( ("INSERT INTO Student VALUES(?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement underGraduatestudentInsertState = conn.prepareStatement( ("INSERT INTO undergraduateStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement graduatestudentState = conn.prepareStatement( ("INSERT INTO graduateStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement masterStudentState = conn.prepareStatement( ("INSERT INTO MSStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement BSMSStudentState = conn.prepareStatement( ("INSERT INTO BSMSStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement PHDPreStudentState = conn.prepareStatement( ("INSERT INTO PHDPreCandidacyStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                        PreparedStatement PHDCandidateStudentState = conn.prepareStatement( ("INSERT INTO PHDCandidateStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)"));
                        
                        studentInsertState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        studentInsertState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        studentInsertState.setString(3, request.getParameter("IDENTITY"));
                        studentInsertState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        studentInsertState.setString(5, request.getParameter("FIRSTNAME"));
                        studentInsertState.setString(6, request.getParameter("LASTNAME"));
                        studentInsertState.setString(7, request.getParameter("MIDDLENAME"));
                        studentInsertState.executeUpdate();
                        
                        if(request.getParameter("STUDENTTYPE").equals("UNDERGRADUATE")){
                        	underGraduatestudentInsertState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        	underGraduatestudentInsertState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        	underGraduatestudentInsertState.setString(3, request.getParameter("IDENTITY"));
                        	underGraduatestudentInsertState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        	underGraduatestudentInsertState.setString(5, request.getParameter("FIRSTNAME"));
                        	underGraduatestudentInsertState.setString(6, request.getParameter("LASTNAME"));
                        	underGraduatestudentInsertState.setString(7, request.getParameter("MIDDLENAME"));
                        	underGraduatestudentInsertState.setString(8, request.getParameter("MAJOR"));
                        	underGraduatestudentInsertState.setString(9, request.getParameter("MINOR"));
                        	underGraduatestudentInsertState.setString(10, request.getParameter("COLLEGE"));
                            underGraduatestudentInsertState.executeUpdate(); 
                        }
                        if(!request.getParameter("STUDENTTYPE").equals("UNDERGRADUATE")){
                        	graduatestudentState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        	graduatestudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        	graduatestudentState.setString(3, request.getParameter("IDENTITY"));
                        	graduatestudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        	graduatestudentState.setString(5, request.getParameter("FIRSTNAME"));
                        	graduatestudentState.setString(6, request.getParameter("LASTNAME"));
                        	graduatestudentState.setString(7, request.getParameter("MIDDLENAME"));
                        	graduatestudentState.setString(8, request.getParameter("DEPARTMENT"));
                        	graduatestudentState.executeUpdate(); 
                        }
                        if(request.getParameter("STUDENTTYPE").equals("MASTERSTUDENT")){
                        	masterStudentState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        	masterStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        	masterStudentState.setString(3, request.getParameter("IDENTITY"));
                        	masterStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        	masterStudentState.setString(5, request.getParameter("FIRSTNAME"));
                        	masterStudentState.setString(6, request.getParameter("LASTNAME"));
                        	masterStudentState.setString(7, request.getParameter("MIDDLENAME"));
                        	masterStudentState.setString(8, request.getParameter("DEPARTMENT"));
                        	masterStudentState.executeUpdate(); 
                        }
                        if(request.getParameter("STUDENTTYPE").equals("BSMSSTUDENT")){
                        	BSMSStudentState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        	BSMSStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        	BSMSStudentState.setString(3, request.getParameter("IDENTITY"));
                        	BSMSStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        	BSMSStudentState.setString(5, request.getParameter("FIRSTNAME"));
                        	BSMSStudentState.setString(6, request.getParameter("LASTNAME"));
                        	BSMSStudentState.setString(7, request.getParameter("MIDDLENAME"));
                        	BSMSStudentState.setString(8, request.getParameter("DEPARTMENT"));
                        	BSMSStudentState.executeUpdate(); 
                        }
                        if(request.getParameter("STUDENTTYPE").equals("PHDPRECANDIDACYSTUDENT")){
                        	PHDPreStudentState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        	PHDPreStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        	PHDPreStudentState.setString(3, request.getParameter("IDENTITY"));
                        	PHDPreStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        	PHDPreStudentState.setString(5, request.getParameter("FIRSTNAME"));
                        	PHDPreStudentState.setString(6, request.getParameter("LASTNAME"));
                        	PHDPreStudentState.setString(7, request.getParameter("MIDDLENAME"));
                        	PHDPreStudentState.setString(8, request.getParameter("DEPARTMENT"));
                        	PHDPreStudentState.executeUpdate(); 
                        }
                        if(request.getParameter("STUDENTTYPE").equals("PHDCANDIDATESTUDENT")){
                        	PHDCandidateStudentState.setInt(1,Integer.parseInt(request.getParameter("ID")));
                        	PHDCandidateStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        	PHDCandidateStudentState.setString(3, request.getParameter("IDENTITY"));
                        	PHDCandidateStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        	PHDCandidateStudentState.setString(5, request.getParameter("FIRSTNAME"));
                        	PHDCandidateStudentState.setString(6, request.getParameter("LASTNAME"));
                        	PHDCandidateStudentState.setString(7, request.getParameter("MIDDLENAME"));
                        	PHDCandidateStudentState.setString(8, request.getParameter("DEPARTMENT"));
                        	PHDCandidateStudentState.setString(9, request.getParameter("ADVISOR"));
                        	PHDCandidateStudentState.executeUpdate(); 
                        }
                        
                        
                        conn.commit();
                        conn.setAutoCommit(true); 
                    }
                %>


                <%-- Update Code --%>
                <%  if (action != null && action.equals("update")) {
                		conn.setAutoCommit(false);
            			PreparedStatement studentUpdate = conn.prepareStatement("UPDATE student SET student_id=?, SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=? where student_id=?;");
            			// update main table no matter what
            			studentUpdate.setInt(1, Integer.parseInt(request.getParameter("ID")));
                        studentUpdate.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                        studentUpdate.setString(3, request.getParameter("IDENTITY"));
                        studentUpdate.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                        studentUpdate.setString(5, request.getParameter("FIRSTNAME"));
                        studentUpdate.setString(6, request.getParameter("LASTNAME"));
                        studentUpdate.setString(7, request.getParameter("MIDDLENAME"));
                        studentUpdate.setInt(8,Integer.parseInt(request.getParameter("IDKEY")));
                        studentUpdate.executeUpdate();
                        
                		if(!request.getParameter("previousStudentStatus").equals(request.getParameter("STUDENTTYPE"))){
                			// delete from original table
            				String deleteStatement = ""; 
                			if(request.getParameter("previousStudentStatus").equals("UNDERGRADUATE")){
                				deleteStatement = "DELETE FROM undergraduateStudent WHERE student_id = ?;"; 
                            }
                			if(!request.getParameter("previousStudentStatus").equals("UNDERGRADUATE")){
                            	deleteStatement = "DELETE FROM graduateStudent WHERE student_id = ?;"; 
                            }
                            if(request.getParameter("previousStudentStatus").equals("MASTERSTUDENT")){
                            	deleteStatement = "DELETE FROM MSStudent WHERE student_id = ?;"; 
                            }
                            if(request.getParameter("previousStudentStatus").equals("BSMSSTUDENT")){
                            	deleteStatement = "DELETE FROM BSMSStudent WHERE student_id = ?;"; 
                            }
                            if(request.getParameter("previousStudentStatus").equals("PHDPRECANDIDACYSTUDENT")){
                            	deleteStatement = "DELETE FROM PHDPreCandidacyStudent WHERE student_id = ?;"; 
                            }
                            if(request.getParameter("previousStudentStatus").equals("PHDCANDIDATESTUDENT")){
                            	deleteStatement = "DELETE FROM PHDCandidateStudent WHERE student_id = ?;"; 
                            }
                            PreparedStatement pstmt = conn.prepareStatement(deleteStatement);
                            pstmt.setInt(1, Integer.parseInt(request.getParameter("IDKEY")));
                            int rowCount = pstmt.executeUpdate();
                            
                            // add into new table
                            PreparedStatement studentInsertState = conn.prepareStatement( ("INSERT INTO Student VALUES(?, ?, ?, ?, ?, ?, ?)"));
                            PreparedStatement underGraduatestudentInsertState = conn.prepareStatement( ("INSERT INTO undergraduateStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
                            PreparedStatement graduateStudentState = conn.prepareStatement( ("INSERT INTO graduateStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                            PreparedStatement masterStudentState = conn.prepareStatement( ("INSERT INTO MSStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                            PreparedStatement BSMSStudentState = conn.prepareStatement( ("INSERT INTO BSMSStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                            PreparedStatement PHDPreStudentState = conn.prepareStatement( ("INSERT INTO BSMSStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?)"));
                            PreparedStatement PHDCandidateStudentState = conn.prepareStatement( ("INSERT INTO BSMSStudent VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)"));
                            
                            if(request.getParameter("STUDENTTYPE").equals("UNDERGRADUATE")){
                            	underGraduatestudentInsertState.setInt(1,Integer.parseInt(request.getParameter("IDKEY")));
                            	underGraduatestudentInsertState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                            	underGraduatestudentInsertState.setString(3, request.getParameter("IDENTITY"));
                            	underGraduatestudentInsertState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                            	underGraduatestudentInsertState.setString(5, request.getParameter("FIRSTNAME"));
                            	underGraduatestudentInsertState.setString(6, request.getParameter("LASTNAME"));
                            	underGraduatestudentInsertState.setString(7, request.getParameter("MIDDLENAME"));
                            	underGraduatestudentInsertState.setString(8, request.getParameter("MAJOR"));
                            	underGraduatestudentInsertState.setString(9, request.getParameter("MINOR"));
                            	underGraduatestudentInsertState.setString(10, request.getParameter("COLLEGE"));
                                underGraduatestudentInsertState.executeUpdate(); 
                            }
                            if(!request.getParameter("STUDENTTYPE").equals("UNDERGRADUATE")){
                            	graduateStudentState.setInt(1,Integer.parseInt(request.getParameter("IDKEY")));
                            	graduateStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                            	graduateStudentState.setString(3, request.getParameter("IDENTITY"));
                            	graduateStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                            	graduateStudentState.setString(5, request.getParameter("FIRSTNAME"));
                            	graduateStudentState.setString(6, request.getParameter("LASTNAME"));
                            	graduateStudentState.setString(7, request.getParameter("MIDDLENAME"));
                            	graduateStudentState.setString(8, request.getParameter("DEPARTMENT"));
                            	graduateStudentState.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("MASTERSTUDENT")){
                            	masterStudentState.setInt(1,Integer.parseInt(request.getParameter("IDKEY")));
                            	masterStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                            	masterStudentState.setString(3, request.getParameter("IDENTITY"));
                            	masterStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                            	masterStudentState.setString(5, request.getParameter("FIRSTNAME"));
                            	masterStudentState.setString(6, request.getParameter("LASTNAME"));
                            	masterStudentState.setString(7, request.getParameter("MIDDLENAME"));
                            	masterStudentState.setString(8, request.getParameter("DEPARTMENT"));
                            	masterStudentState.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("BSMSSTUDENT")){
                            	BSMSStudentState.setInt(1,Integer.parseInt(request.getParameter("IDKEY")));
                            	BSMSStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                            	BSMSStudentState.setString(3, request.getParameter("IDENTITY"));
                            	BSMSStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                            	BSMSStudentState.setString(5, request.getParameter("FIRSTNAME"));
                            	BSMSStudentState.setString(6, request.getParameter("LASTNAME"));
                            	BSMSStudentState.setString(7, request.getParameter("MIDDLENAME"));
                            	BSMSStudentState.setString(8, request.getParameter("DEPARTMENT"));
                            	BSMSStudentState.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("PHDPRECANDIDACYSTUDENT")){
                            	PHDPreStudentState.setInt(1,Integer.parseInt(request.getParameter("IDKEY")));
                            	PHDPreStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                            	PHDPreStudentState.setString(3, request.getParameter("IDENTITY"));
                            	PHDPreStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                            	PHDPreStudentState.setString(5, request.getParameter("FIRSTNAME"));
                            	PHDPreStudentState.setString(6, request.getParameter("LASTNAME"));
                            	PHDPreStudentState.setString(7, request.getParameter("MIDDLENAME"));
                            	PHDPreStudentState.setString(8, request.getParameter("DEPARTMENT"));
                            	PHDPreStudentState.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("PHDCANDIDATESTUDENT")){
                            	PHDCandidateStudentState.setInt(1,Integer.parseInt(request.getParameter("IDKEY")));
                            	PHDCandidateStudentState.setInt(2, Integer.parseInt(request.getParameter("SSN")));
                            	PHDCandidateStudentState.setString(3, request.getParameter("IDENTITY"));
                            	PHDCandidateStudentState.setString(4, request.getParameter("ENROLLMENTSTATUS"));
                            	PHDCandidateStudentState.setString(5, request.getParameter("FIRSTNAME"));
                            	PHDCandidateStudentState.setString(6, request.getParameter("LASTNAME"));
                            	PHDCandidateStudentState.setString(7, request.getParameter("MIDDLENAME"));
                            	PHDCandidateStudentState.setString(8, request.getParameter("DEPARTMENT"));
                            	PHDCandidateStudentState.setString(9, request.getParameter("ADVISOR"));
                            	PHDCandidateStudentState.executeUpdate(); 
                            }
                		}
                		else{
                            PreparedStatement undergraduateStudentUpdate = conn.prepareStatement("UPDATE undergraduateStudent SET SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=?, major=?, minor=?, college=? where student_id=?;");
                            PreparedStatement graduateStudentUpdate = conn.prepareStatement("UPDATE graduateStudent SET SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=?, department=? where student_id=?;");
                            PreparedStatement masterStudentUpdate = conn.prepareStatement("UPDATE MSStudent SET SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=?, department=? where student_id=?;");
                            PreparedStatement BSMSStudentUpdate = conn.prepareStatement("UPDATE BSMSStudent SET SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=?, department=? where student_id=?;");
                            PreparedStatement PHDPreStudentUpdate = conn.prepareStatement("UPDATE PHDPreCandidacyStudent SET SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=?, department=? where student_id=?;");
                            PreparedStatement PHDCandidateStudentUpdate = conn.prepareStatement("UPDATE PHDCandidateStudent SET SSN=?, identity_=?, enrollment_status=?, first_name=?, last_name=?, middle_name=?, department=?, faculty_name=? where student_id=?;");
                            
                            if(request.getParameter("STUDENTTYPE").equals("UNDERGRADUATE")){
                            	undergraduateStudentUpdate.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                            	undergraduateStudentUpdate.setString(2, request.getParameter("IDENTITY"));
                            	undergraduateStudentUpdate.setString(3, request.getParameter("ENROLLMENTSTATUS"));
                            	undergraduateStudentUpdate.setString(4, request.getParameter("FIRSTNAME"));
                            	undergraduateStudentUpdate.setString(5, request.getParameter("LASTNAME"));
                            	undergraduateStudentUpdate.setString(6, request.getParameter("MIDDLENAME"));
                            	undergraduateStudentUpdate.setString(7, request.getParameter("MAJOR"));
                            	undergraduateStudentUpdate.setString(8, request.getParameter("MINOR"));
                            	undergraduateStudentUpdate.setString(9, request.getParameter("COLLEGE"));
                            	undergraduateStudentUpdate.setInt(10,Integer.parseInt(request.getParameter("ID")));
                            	undergraduateStudentUpdate.executeUpdate(); 
                            }
                            if(!request.getParameter("STUDENTTYPE").equals("UNDERGRADUATE")){
                            	graduateStudentUpdate.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                            	graduateStudentUpdate.setString(2, request.getParameter("IDENTITY"));
                            	graduateStudentUpdate.setString(3, request.getParameter("ENROLLMENTSTATUS"));
                            	graduateStudentUpdate.setString(4, request.getParameter("FIRSTNAME"));
                            	graduateStudentUpdate.setString(5, request.getParameter("LASTNAME"));
                            	graduateStudentUpdate.setString(6, request.getParameter("MIDDLENAME"));
                            	graduateStudentUpdate.setString(7, request.getParameter("DEPARTMENT"));
                            	graduateStudentUpdate.setInt(8,Integer.parseInt(request.getParameter("ID")));
                            	graduateStudentUpdate.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("MASTERSTUDENT")){
                            	masterStudentUpdate.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                            	masterStudentUpdate.setString(2, request.getParameter("IDENTITY"));
                            	masterStudentUpdate.setString(3, request.getParameter("ENROLLMENTSTATUS"));
                            	masterStudentUpdate.setString(4, request.getParameter("FIRSTNAME"));
                            	masterStudentUpdate.setString(5, request.getParameter("LASTNAME"));
                            	masterStudentUpdate.setString(6, request.getParameter("MIDDLENAME"));
                            	masterStudentUpdate.setString(7, request.getParameter("DEPARTMENT"));
                            	masterStudentUpdate.setInt(8,Integer.parseInt(request.getParameter("ID")));
                            	masterStudentUpdate.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("BSMSSTUDENT")){
                            	BSMSStudentUpdate.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                            	BSMSStudentUpdate.setString(2, request.getParameter("IDENTITY"));
                            	BSMSStudentUpdate.setString(3, request.getParameter("ENROLLMENTSTATUS"));
                            	BSMSStudentUpdate.setString(4, request.getParameter("FIRSTNAME"));
                            	BSMSStudentUpdate.setString(5, request.getParameter("LASTNAME"));
                            	BSMSStudentUpdate.setString(6, request.getParameter("MIDDLENAME"));
                            	BSMSStudentUpdate.setString(7, request.getParameter("DEPARTMENT"));
                            	BSMSStudentUpdate.setInt(8,Integer.parseInt(request.getParameter("ID")));
                            	BSMSStudentUpdate.executeUpdate(); 
                            	BSMSStudentUpdate.executeUpdate();
                            }
                            if(request.getParameter("STUDENTTYPE").equals("PHDPRECANDIDACYSTUDENT")){
                            	PHDPreStudentUpdate.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                            	PHDPreStudentUpdate.setString(2, request.getParameter("IDENTITY"));
                            	PHDPreStudentUpdate.setString(3, request.getParameter("ENROLLMENTSTATUS"));
                            	PHDPreStudentUpdate.setString(4, request.getParameter("FIRSTNAME"));
                            	PHDPreStudentUpdate.setString(5, request.getParameter("LASTNAME"));
                            	PHDPreStudentUpdate.setString(6, request.getParameter("MIDDLENAME"));
                            	PHDPreStudentUpdate.setString(7, request.getParameter("DEPARTMENT"));
                            	PHDPreStudentUpdate.setInt(8,Integer.parseInt(request.getParameter("ID")));
                            	PHDPreStudentUpdate.executeUpdate(); 
                            }
                            if(request.getParameter("STUDENTTYPE").equals("PHDCANDIDATESTUDENT")){
                            	PHDCandidateStudentUpdate.setInt(1, Integer.parseInt(request.getParameter("SSN")));
                            	PHDCandidateStudentUpdate.setString(2, request.getParameter("IDENTITY"));
                            	PHDCandidateStudentUpdate.setString(3, request.getParameter("ENROLLMENTSTATUS"));
                            	PHDCandidateStudentUpdate.setString(4, request.getParameter("FIRSTNAME"));
                            	PHDCandidateStudentUpdate.setString(5, request.getParameter("LASTNAME"));
                            	PHDCandidateStudentUpdate.setString(6, request.getParameter("MIDDLENAME"));
                            	PHDCandidateStudentUpdate.setString(7, request.getParameter("DEPARTMENT"));
                            	PHDCandidateStudentUpdate.setString(8, request.getParameter("ADVISOR"));
                            	PHDCandidateStudentUpdate.setInt(9,Integer.parseInt(request.getParameter("ID")));
                            	PHDCandidateStudentUpdate.executeUpdate(); 
                            }
                		}
                        
                        conn.commit(); 
                        conn.setAutoCommit(true);
                    }
                %>


                <%-- Delete Code --%>
                <%  if (action != null && action.equals("delete")){
                        conn.setAutoCommit(false);
                        PreparedStatement pstmt = conn.prepareStatement("DELETE FROM Student WHERE student_id = ?;");
                        pstmt.setInt(1, Integer.parseInt(request.getParameter("ID")));
                        pstmt.executeUpdate();
                        conn.commit(); 
                        conn.setAutoCommit(true);
                    }
                %>



                <%-- Statement code --%>
                <%  Statement statement = conn.createStatement();
                	Statement statementBSMS =conn.createStatement();
                	Statement statementMS =conn.createStatement();
                	Statement statementPHDPreStudent =conn.createStatement();
                	Statement statementPHDCandidateStudent =conn.createStatement();
                	
                    ResultSet rsUnderGraduateStudent = statement.executeQuery ("SELECT * FROM undergraduateStudent");
                   	ResultSet rsBSMSStudent = statementBSMS.executeQuery ("SELECT * FROM BSMSStudent"); 
                    ResultSet rsMSStudent = statementMS.executeQuery ("SELECT * FROM MSStudent"); 
                    ResultSet PHDPreStudent = statementPHDPreStudent.executeQuery ("SELECT * FROM PHDPreCandidacyStudent"); 
                    ResultSet PHDCandidateStudent = statementPHDCandidateStudent.executeQuery ("SELECT * FROM PHDCandidateStudent");
                %>


                <%-- Presentation code --%>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>SSN</th>
                        <th>Identity</th>
                        <th>Enrollment Status</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Middle Name</th>
                        <th>Major</th>
                        <th>Minor</th>
                        <th>College</th>
                        <th>Department</th>
                        <th>Advisor</th>
                        <th>Student Type</th>
                        <th>Action</th>
                    </tr>
                    
                    <%-- Insert Form Code --%>
                    <tr>
                    	<form action="students.jsp" method="post">
                            <input type="hidden" value="insert" name="action">
                            <th><input value="" name="ID" size="10"></th>
                            <th><input value="" name="SSN" size="10"></th>
                            <th><input value="" name="IDENTITY" size="15"></th>
                            <th><input value="" name="ENROLLMENTSTATUS" size="15"></th>
                            <th><input value="" name="FIRSTNAME" size="10"></th>
                            <th><input value="" name="LASTNAME" size="10"></th>
                            <th><input value="" name="MIDDLENAME" size="10"></th>
                            <th><input value="" name="MAJOR" size="10"></th>
                            <th><input value="" name="MINOR" size="10"></th>
                            <th><input value="" name="COLLEGE" size="10"></th>
                            <th><input value="" name="DEPARTMENT" size="25"></th>
                            <th><input value="" name="ADVISOR" size="10"></th>
                            <th>
                            	<select name="STUDENTTYPE">
                            		<option value="UNDERGRADUATE">undergraduate student</option>
                            		<option value="MASTERSTUDENT">master student</option>
                            		<option value="BSMSSTUDENT">BSMS student</option>
                            		<option value="PHDPRECANDIDACYSTUDENT">PHD-pre-candidacy student</option>
                            		<option value="PHDCANDIDATESTUDENT">PHD-candidate student</option>
                            	</select>
                            </th>
                            <th><input style="width:60px;" type="submit" value="Insert"></th>
                        </form>
                    </tr>
    				<tr style="height:20px"></tr>
                    <%-- Iteration Code for under-graduate student--%>
                    <% while (rsUnderGraduateStudent.next()) {%>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= rsUnderGraduateStudent.getInt("student_id") %>" name="IDKEY" size="10">
                            <td><input value="<%= rsUnderGraduateStudent.getInt("student_id")%>" name="ID" size="10" readonly></td>
                            <td><input value="<%= rsUnderGraduateStudent.getInt("SSN") %>" name="SSN" size="10"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("identity_").trim() %>" name="IDENTITY" size="15"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("enrollment_status").trim() %>" name="ENROLLMENTSTATUS" size="15"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("first_name").trim() %>" name="FIRSTNAME" size="10"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("last_name").trim() %>" name="LASTNAME" size="10"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("middle_name").trim() %>" name="MIDDLENAME" size="10"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("major").trim() %>" name="MAJOR" size="10"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("minor")%>" name="MINOR" size="10"></td>
                            <td><input value="<%= rsUnderGraduateStudent.getString("college").trim() %>" name="COLLEGE" size="10"></td>
                            <td><input value="null" name="DEPARTMENT" size="25"></td>
                            <th><input value="null" name="ADVISOR" size="10"></th>
                            <input type="hidden" value="UNDERGRADUATE" name="previousStudentStatus">
                            <th>
                            	<select name="STUDENTTYPE">
                            		<option value="UNDERGRADUATE" selected>undergraduate student</option>
                            		<option value="MASTERSTUDENT">master student</option>
                            		<option value="BSMSSTUDENT">BSMS student</option>
                            		<option value="PHDPRECANDIDACYSTUDENT">PHD-pre-candidacy student</option>
                            		<option value="PHDCANDIDATESTUDENT">PHD-candidate student</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= rsUnderGraduateStudent.getInt("student_id")%>" name="ID">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                    <%--iteration code for BSMS student --%>
                    <% while (rsBSMSStudent.next()) {%>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= rsBSMSStudent.getInt("student_id") %>" name="IDKEY" size="10" readonly>
                            <td><input value="<%= rsBSMSStudent.getInt("student_id") %>" name="ID" size="10"></td>
                            <td><input value="<%= rsBSMSStudent.getInt("SSN") %>" name="SSN" size="10"></td>
                            <td><input value="<%= rsBSMSStudent.getString("identity_").trim() %>" name="IDENTITY" size="15"></td>
                            <td><input value="<%= rsBSMSStudent.getString("enrollment_status").trim() %>" name="ENROLLMENTSTATUS" size="15"></td>
                            <td><input value="<%= rsBSMSStudent.getString("first_name").trim() %>" name="FIRSTNAME" size="10"></td>
                            <td><input value="<%= rsBSMSStudent.getString("last_name").trim() %>" name="LASTNAME" size="10"></td>
                            <td><input value="<%= rsBSMSStudent.getString("middle_name").trim() %>" name="MIDDLENAME" size="10"></td>
                            <td><input value="null" name="MAJOR" size="10"></td>
                            <td><input value="null" name="MINOR" size="10"></td>
                            <td><input value="null" name="COLLEGE" size="10"></td>
                            <td><input value="<%= rsBSMSStudent.getString("department") %>" name="DEPARTMENT" size="25"></td>
                            <input type="hidden" value="BSMSSTUDENT" name="previousStudentStatus">
                            <th><input value="null" name="ADVISOR" size="10"></th>
                            <th>
                            	<select name="STUDENTTYPE">
                            		<option value="UNDERGRADUATE">undergraduate student</option>
                            		<option value="MASTERSTUDENT">master student</option>
                            		<option value="BSMSSTUDENT" selected>BSMS student</option>
                            		<option value="PHDPRECANDIDACYSTUDENT">PHD-pre-candidacy student</option>
                            		<option value="PHDCANDIDATESTUDENT">PHD-candidate student</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= rsBSMSStudent.getInt("student_id") %>" name="ID">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                    <%--iteration code for master student --%>
                    <% while (rsMSStudent.next()) {%>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= rsMSStudent.getInt("student_id") %>" name="IDKEY" size="10" readonly>
                            <td><input value="<%= rsMSStudent.getInt("student_id") %>" name="ID" size="10"></td>
                            <td><input value="<%= rsMSStudent.getInt("SSN") %>" name="SSN" size="10"></td>
                            <td><input value="<%= rsMSStudent.getString("identity_").trim() %>" name="IDENTITY" size="15"></td>
                            <td><input value="<%= rsMSStudent.getString("enrollment_status").trim() %>" name="ENROLLMENTSTATUS" size="15"></td>
                            <td><input value="<%= rsMSStudent.getString("first_name").trim() %>" name="FIRSTNAME" size="10"></td>
                            <td><input value="<%= rsMSStudent.getString("last_name").trim() %>" name="LASTNAME" size="10"></td>
                            <td><input value="<%= rsMSStudent.getString("middle_name").trim() %>" name="MIDDLENAME" size="10"></td>
                            <td><input value="null" name="MAJOR" size="10"></td>
                            <td><input value="null" name="MINOR" size="10"></td>
                            <td><input value="null" name="COLLEGE" size="10"></td>
                            <td><input value="<%= rsMSStudent.getString("department") %>" name="DEPARTMENT" size="25"></td>
                            <input type="hidden" value="MASTERSTUDENT" name="previousStudentStatus">
                            <th><input value="null" name="ADVISOR" size="10"></th>
                            <th>
                            	<select name="STUDENTTYPE">
                            		<option value="UNDERGRADUATE">undergraduate student</option>
                            		<option value="MASTERSTUDENT" selected>master student</option>
                            		<option value="BSMSSTUDENT">BSMS student</option>
                            		<option value="PHDPRECANDIDACYSTUDENT">PHD-pre-candidacy student</option>
                            		<option value="PHDCANDIDATESTUDENT">PHD-candidate student</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= rsMSStudent.getInt("student_id") %>" name="ID">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                    <%--iteration code for PHD pre candidacy student --%>
                    <% while (PHDPreStudent.next()) {%>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= PHDPreStudent.getInt("student_id") %>" name="IDKEY" size="10" readonly>
                            <td><input value="<%= PHDPreStudent.getInt("student_id") %>" name="ID" size="10"></td>
                            <td><input value="<%= PHDPreStudent.getInt("SSN") %>" name="SSN" size="10"></td>
                            <td><input value="<%= PHDPreStudent.getString("identity_").trim() %>" name="IDENTITY" size="15"></td>
                            <td><input value="<%= PHDPreStudent.getString("enrollment_status").trim() %>" name="ENROLLMENTSTATUS" size="15"></td>
                            <td><input value="<%= PHDPreStudent.getString("first_name").trim() %>" name="FIRSTNAME" size="10"></td>
                            <td><input value="<%= PHDPreStudent.getString("last_name").trim() %>" name="LASTNAME" size="10"></td>
                            <td><input value="<%= PHDPreStudent.getString("middle_name").trim() %>" name="MIDDLENAME" size="10"></td>
                            <td><input value="null" name="MAJOR" size="10"></td>
                            <td><input value="null" name="MINOR" size="10"></td>
                            <td><input value="null" name="COLLEGE" size="10"></td>
                            <td><input value="<%= PHDPreStudent.getString("department") %>" name="DEPARTMENT" size="25"></td>
                            <input type="hidden" value="PHDPRECANDIDACYSTUDENT" name="previousStudentStatus" size="10">
                            <th><input value="null" name="ADVISOR" size="10"></th>
                            <th>
                            	<select name="STUDENTTYPE">
                            		<option value="UNDERGRADUATE">undergraduate student</option>
                            		<option value="MASTERSTUDENT">master student</option>
                            		<option value="BSMSSTUDENT">BSMS student</option>
                            		<option value="PHDPRECANDIDACYSTUDENT" selected>PHD-pre-candidacy student</option>
                            		<option value="PHDCANDIDATESTUDENT">PHD-candidate student</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= PHDPreStudent.getInt("student_id") %>" name="ID">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                     <%--iteration code for PHD candidate student --%>
                    <% while (PHDCandidateStudent.next()) {%>
                    <tr>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="update" name="action">
                            <input type="hidden" value="<%= PHDCandidateStudent.getInt("student_id") %>" name="IDKEY" size="10" readonly>
                            <td><input value="<%= PHDCandidateStudent.getInt("student_id") %>" name="ID" size="10"></td>
                            <td><input value="<%= PHDCandidateStudent.getInt("SSN") %>" name="SSN" size="10"></td>
                            <td><input value="<%= PHDCandidateStudent.getString("identity_").trim() %>" name="IDENTITY" size="15"></td>
                            <td><input value="<%= PHDCandidateStudent.getString("enrollment_status".trim()) %>" name="ENROLLMENTSTATUS" size="15"></td>
                            <td><input value="<%= PHDCandidateStudent.getString("first_name").trim() %>" name="FIRSTNAME" size="10"></td>
                            <td><input value="<%= PHDCandidateStudent.getString("last_name").trim() %>" name="LASTNAME" size="10"></td>
                            <td><input value="<%= PHDCandidateStudent.getString("middle_name").trim() %>" name="MIDDLENAME" size="10"></td>
                            <td><input value="null" name="MAJOR" size="10"></td>
                            <td><input value="null" name="MINOR" size="10"></td>
                            <td><input value="null" name="COLLEGE" size="10"></td>
                            <td><input value="<%= PHDCandidateStudent.getString("department") %>" name="DEPARTMENT" size="25"></td>
                            <input type="hidden" value="PHDCANDIDATESTUDENT" name="previousStudentStatus" size="10">
                            <th><input value="<%= PHDCandidateStudent.getString("faculty_name") %>" name="ADVISOR" size="10"></th>
                            <th>
                            	<select name="STUDENTTYPE">
                            		<option value="UNDERGRADUATE">undergraduate student</option>
                            		<option value="MASTERSTUDENT">master student</option>
                            		<option value="BSMSSTUDENT">BSMS student</option>
                            		<option value="PHDPRECANDIDACYSTUDENT">PHD-pre-candidacy student</option>
                            		<option value="PHDCANDIDATESTUDENT" selected>PHD-candidate student</option>
                            	</select>
                            </th>
                            <td><input style="width:60px;" type="submit" value="Update"></td>
                        </form>
                        <form action="students.jsp" method="get">
                            <input type="hidden" value="delete" name="action">
                            <input type="hidden" value="<%= PHDCandidateStudent.getInt("student_id") %>" name="ID">
                            <td><input style="width:60px;" type="submit" value="Delete"></td>
                        </form>
                    </tr>
                    <% } %>
                    
                    
                </table>

                
                <%-- Close connection code --%>
                <%  // Close the ResultSet
                	rsUnderGraduateStudent.close();
                	rsBSMSStudent.close(); 
                	rsMSStudent.close(); 
                	PHDPreStudent.close(); 
                	PHDCandidateStudent.close();
                	
                    // Close the Statement
                    statement.close();
                	statementBSMS.close(); 
                	statementMS.close(); 
                	statementPHDPreStudent.close();  
                	statementPHDCandidateStudent.close();
                	
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
