<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Success</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Order Placed</h2>

<p>Your order ID is <strong><%=request.getAttribute("orderId")%></strong>.</p>
<p>Total paid: ₹<%=request.getAttribute("total")%></p>

<a href="<%=request.getContextPath()%>/products">Continue Shopping</a>

</body>
</html>
