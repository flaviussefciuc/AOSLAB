<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%!
public void saveInDB(String name, String mail) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/labdb", "flavius", "flavius");

			Statement stmt = con.createStatement();
			stmt.executeUpdate(String.format("INSERT INTO person (name,email) VALUES ('%s','%s')",name, mail));
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}%>

    <%        
    String a = request.getParameter("name");
    if(a != null){
    	saveInDB(request.getParameter("name"),request.getParameter("email"));
    }
    %>
<html>
<head>
<title>SELECT Operation</title>
</head>

<body>
	<form action="#" method="POST">
		Name:<br> <input id="theName" type="text" name="name"> <br>
		Email:<br> <input id="theEmail" type="text" name="email"> <br> <br>
		<input type="submit" value="Save">
	</form>
</body>
</html>