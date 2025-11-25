<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Register</h2>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p style="color:red;"><%=error%></p>
<%
    }
%>

<form action="auth" method="post">
    <input type="hidden" name="action" value="register"/>
    <label>Name: <input type="text" name="name" required/></label><br/>
    <label>Email: <input type="email" name="email" required/></label><br/>
    <label>Password: <input type="password" name="password" required/></label><br/>
    <button type="submit">Register</button>
</form>

</body>
</html>
