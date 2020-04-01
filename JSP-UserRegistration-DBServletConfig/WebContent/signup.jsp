<%@ page language="java" import=" java.sql.*"%>
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
	String Insert_UserDetails="insert into employee values(?,?,?)";
	%>

	<%
	try{
	String driver = config.getInitParameter("driver");
	String url = config.getInitParameter("url");
	String user = config.getInitParameter("user");
	String password = config.getInitParameter("password");
	
	String fullName = request.getParameter("fullname");
	String uName = request.getParameter("uname");
	String pws = request.getParameter("pws");
	
	Class.forName(driver);
	con = DriverManager.getConnection(url,user,password);
	ps= con.prepareStatement(Insert_UserDetails);
	ps.setString(1, fullName);
	ps.setString(2, uName);
	ps.setString(3, pws);
	count = ps.executeUpdate();
	}catch(Exception cof){
	cof.printStackTrace();
	}
	 %>
	 <h2>
	 <%
	if(count==1){ 
	 %>
	User Registered <%= count %>
	 <%
	}else{ 
	%>
	User Registration failed <%= count %>
	 <%
	}
	%>
	</h2>
</body>
</html>