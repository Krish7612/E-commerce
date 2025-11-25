<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<html>
<head>
    <title>Simple Shop - Home</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Welcome to Simple Shop</h2>
<p>Discover minimal essentials with a clean shopping experience.</p>

<h3>Products</h3>
<ul>
    <%
        if (products != null) {
            for (Product p : products) {
    %>
    <li>
        <a href="product?id=<%=p.getId()%>"><%=p.getName()%></a>
        - ₹<%=p.getPrice()%>
    </li>
    <%
            }
        }
    %>
</ul>

</body>
</html>
