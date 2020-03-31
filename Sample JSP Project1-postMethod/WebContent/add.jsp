<html>
<body bgcolor='cyan'>
	<%!int a;
	int b;
	int x;%>
	<%
		a = Integer.parseInt(request.getParameter("num1"));
		b = Integer.parseInt(request.getParameter("num2"));
		x = a + b;
	%>
	<h2>
		sum is <%=x%>
	</h2>
</body>
</html>