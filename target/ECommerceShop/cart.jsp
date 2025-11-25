<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.shop.model.Cart" %>
<%@ page import="com.shop.model.CartItem" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
%>
<html>
<head>
    <title>Your Cart</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<h2>Your Cart</h2>

<%
    if (cart == null || cart.isEmpty()) {
%>
<p>Your cart is empty.</p>
<%
    } else {
        Collection<CartItem> items = cart.getItems();
%>
<table border="1" cellpadding="6">
    <tr>
        <th>Name</th><th>Qty</th><th>Price</th><th>Total</th><th></th>
    </tr>
    <%
        for (CartItem item : items) {
    %>
    <tr>
        <td><%=item.getProduct().getName()%></td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="id" value="<%=item.getProduct().getId()%>"/>
                <input type="number" name="qty" value="<%=item.getQuantity()%>" min="1"/>
                <button type="submit">Update</button>
            </form>
        </td>
        <td>₹<%=item.getProduct().getPrice()%></td>
        <td>₹<%=item.getLineTotal()%></td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="action" value="remove"/>
                <input type="hidden" name="id" value="<%=item.getProduct().getId()%>"/>
                <button type="submit">Remove</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    <tr>
        <th colspan="3" style="text-align:right;">Grand Total:</th>
        <th>₹<%=cart.getTotal()%></th>
        <th></th>
    </tr>
</table>

<form action="cart" method="post">
    <input type="hidden" name="action" value="clear"/>
    <button type="submit">Clear Cart</button>
</form>

<a href="products">Continue Shopping</a> |
<a href="checkout">Checkout</a>

<%
    }
%>

</body>
</html>
