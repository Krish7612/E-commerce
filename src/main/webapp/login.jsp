<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Login</h2>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p style="color:red;"><%=error%></p>
<%
    }
%>

<form action="auth" method="post">
    <input type="hidden" name="action" value="login"/>
    <label>Email: <input type="email" name="email" required/></label><br/>
    <label>Password: <input type="password" name="password" required/></label><br/>
    <button type="submit">Login</button>
</form>

<p>No account? <a href="register">Register here</a></p>

</body>
</html>
