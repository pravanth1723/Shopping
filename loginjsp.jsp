 <%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head>
        <title>Hello,User</title>
<%
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");                                   
    String message = "";
    try {
        String connectionURL = "jdbc:mysql://localhost:3306/database";
        // declare a connection by using Connection interface
        Connection connection = null;
        // Load JDBC driver "com.mysql.jdbc.Driver"
        Class.forName("com.mysql.jdbc.Driver").newInstance();           
        connection = DriverManager.getConnection(connectionURL,"root","");
        // check weather connection is established or not by isClosed() method
        if(!connection.isClosed())
        %>
        <font size="3" color="green"></b>
        <%
        {
        PreparedStatement stmt =null;
        stmt= connection.prepareStatement("insert into users(Userid, PasswordHash, Salt) values (?,?,?)");
        stmt.setString(1,userid);
        String enteredPassword = password;
        String saltFromDatabase = UUID.randomUUID().toString();
        String concatenatedValue = enteredPassword + saltFromDatabase;
        String hashedPasswordEntered = org.apache.commons.codec.digest.DigestUtils.sha256Hex(concatenatedValue); 

        <!-- String salt = ; -->
        stmt.setString(2,hashedPasswordEntered);
        stmt.setString(3,saltFromDatabase);


        <!-- -- Example in MySQL
        INSERT INTO Users (Username, PasswordHash, Salt)
        VALUES ('user123', SHA2(CONCAT('user_password', UUID()), 256), UUID()); -->
        
        <!-- -- Example in MySQL
        SET @enteredPassword = 'entered_password';
        SET @saltFromDatabase = (SELECT Salt FROM Users WHERE Username = 'user123');
        SET @hashedPasswordEntered = SHA2(CONCAT(@enteredPassword, @saltFromDatabase), 256);
        
        SELECT * FROM Users
        WHERE Username = 'user123'
        AND PasswordHash = @hashedPasswordEntered; -->
        
        stmt.executeUpdate();
        message="added";
        out.print(password);
    }
        }catch (Exception ex){
        message = "Error occurred while trying to connect to database: " + ex.getMessage();
    }        

%>      
        <script type="text/javascript">
            window.onload = function () {
                top.frames["displayFrame"].saveResult("<%= message %>");        
            }
       
        </script>     
    </head>
    <body>
        
    </body>
</html>























