<%@ page language="java" import=" java.sql.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>SignUp Page</title>
</head>
<body bgcolor='yellow'>
	<%!
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int count;
	String select_UserDetails="select count(*) from employee where ename=? and password=?";
	%>

	<%
	try{
	String uName = request.getParameter("uname");
	String pws = request.getParameter("pws");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","shiv");
	ps= con.prepareStatement(select_UserDetails);
	ps.setString(1, uName);
	ps.setString(2, pws);
	rs = ps.executeQuery();
	rs.next();
	count = rs.getInt(1);
	}catch(Exception cof){
	cof.printStackTrace();
	}
	 %>
	 <h2>
	 <%
	if(count==1){ 
	 %>
	User loggedIn <%= count %>
	 <%
	}else{ 
	%>
	User Login failed <%= count %>
	 <%
	}
	%>
	</h2>
</body>
</html>