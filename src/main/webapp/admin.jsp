<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shop.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<html>
<head>
    <title>Admin - Products</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Admin Panel</h2>

<h3>Add Product</h3>
<form action="admin" method="post">
    <label>Name: <input type="text" name="name" required/></label><br/>
    <label>Description: <textarea name="description"></textarea></label><br/>
    <label>Price: <input type="text" name="price" required/></label><br/>
    <label>Category: <input type="text" name="category"/></label><br/>
    <label>Image URL: <input type="text" name="imageUrl"/></label><br/>
    <button type="submit">Add Product</button>
</form>

<h3>Existing Products</h3>
<table border="1" cellpadding="6">
    <tr>
        <th>ID</th><th>Name</th><th>Price</th><th>Category</th>
    </tr>
    <%
        if (products != null) {
            for (Product p : products) {
    %>
    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getName()%></td>
        <td>₹<%=p.getPrice()%></td>
        <td><%=p.getCategory()%></td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
