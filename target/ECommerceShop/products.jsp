<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<html>
<head>
    <title>Products</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>All Products</h2>

<table border="1" cellpadding="6">
    <tr>
        <th>Name</th><th>Price</th><th>Category</th><th></th>
    </tr>
    <%
        if (products != null) {
            for (Product p : products) {
    %>
    <tr>
        <td><a href="product?id=<%=p.getId()%>"><%=p.getName()%></a></td>
        <td>₹<%=p.getPrice()%></td>
        <td><%=p.getCategory()%></td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="id" value="<%=p.getId()%>"/>
                <input type="number" name="qty" value="1" min="1"/>
                <button type="submit">Add to Cart</button>
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
