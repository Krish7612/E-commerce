<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.model.Product" %>
<%
    Product p = (Product) request.getAttribute("product");
%>
<html>
<head>
    <title><%=p != null ? p.getName() : "Product"%></title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<%
    if (p == null) {
%>
<p>Product not found.</p>
<%
    } else {
%>
<h2><%=p.getName()%></h2>
<p>Category: <%=p.getCategory()%></p>
<p>Price: ₹<%=p.getPrice()%></p>
<p><%=p.getDescription()%></p>

<form action="cart" method="post">
    <input type="hidden" name="action" value="add"/>
    <input type="hidden" name="id" value="<%=p.getId()%>"/>
    <input type="number" name="qty" value="1" min="1"/>
    <button type="submit">Add to Cart</button>
</form>
<%
    }
%>

</body>
</html>
