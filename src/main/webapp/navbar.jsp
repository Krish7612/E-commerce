<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<div style="padding:10px;background:#f0f0f0;">
    <a href="<%=request.getContextPath()%>/">Home</a> |
    <a href="<%=request.getContextPath()%>/products">Products</a> |
    <a href="<%=request.getContextPath()%>/cart">Cart</a> |
    <a href="<%=request.getContextPath()%>/checkout">Checkout</a>
    <span style="float:right;">
        <%
            if (user == null) {
        %>
        <a href="<%=request.getContextPath()%>/login">Login</a> |
        <a href="<%=request.getContextPath()%>/register">Register</a>
        <%
            } else {
        %>
        Hello, <%=user.getName()%>
        <% if (user.isAdmin()) { %>
            | <a href="<%=request.getContextPath()%>/admin">Admin</a>
        <% } %>
        | <form action="<%=request.getContextPath()%>/auth" method="post" style="display:inline;">
              <input type="hidden" name="action" value="logout"/>
              <button type="submit">Logout</button>
          </form>
        <%
            }
        %>
    </span>
</div>
