<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.model.Cart" %>
<html>
<head>
    <title>Checkout</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Checkout</h2>

<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<p style="color:red;"><%=error%></p>
<%
    }
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
<p>Your cart is empty.</p>
<%
    } else {
%>
<p>Total Amount: ₹<%=cart.getTotal()%></p>
<form action="checkout" method="post">
    <label>Name: <input type="text" name="name" required/></label><br/>
    <label>Email: <input type="email" name="email" required/></label><br/>
    <label>Address: <textarea name="address" required></textarea></label><br/>
    <button type="submit">Place Order</button>
</form>
<%
    }
%>

</body>
</html>
