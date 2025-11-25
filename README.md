🛍️ECommerceShop - Java, Servlets, JSP, JDBC, MySQL

A fully functional E-Commerce Web Application built with Java (Servlets), JSP, JDBC, MySQL, and deployed using Tomcat 9.
Users can browse products, register/login, manage cart, checkout, and place orders.
Admins can manage products, view orders, and control inventory.
=============================================
#TO OPEN WEBSITE YOU WILL NEED TO FOLLOW RUN INSTRUCTIONS GIVEN BELOW, THEN OPEN THE LINK(Example----->http://localhost:8080/ECommerceShop/)

🚀 Features Overview
🧑‍💻 User Features
✔ User Registration & Login (Secure Sessions)
✔ Browse Products (Search & Filter)
✔ Add to Cart / Update Quantity
✔ Checkout with Order Summary
✔ Order Confirmation Page
✔ Session-based Cart (NO login required initially)

🔐 Admin Features
✔ Admin Login
✔ Add / Edit / Delete Products
✔ View All Orders
✔ Update Stock / Mark Order as Delivered

🧰 Tech Stack Used
Layer	                       Technologies
Frontend	                    HTML, CSS, JSP
Backend	                    Java (OOP), Servlets
Database	                    MySQL + JDBC
Server	                    Apache Tomcat 9
Build Tool	                 Maven
Security	                    Session-based Authentication
IDE	                       IntelliJ IDEA


🖥️ Running Instructions
1. Import into IntelliJ IDEA
   - File -> Open -> choose this folder (ECommerceShop)
   - Let IntelliJ detect it as a Maven project.

2. Set up MySQL
   - Run db/schema.sql then db/seed.sql in your MySQL client.
   - Update DB credentials in:
       src/main/java/com/shop/dao/DBConnection.java
     (change USER and PASS from 'root'/'root' to yours)

3. Add Apache Tomcat (recommended Tomcat 9)
   - Install Tomcat 9 on your system.
   - In IntelliJ: Run -> Edit Configurations -> Add New Configuration -> Tomcat Server -> Local.
   - Set application context path to: /ECommerceShop or just /

4. Run
   - Build the project (Maven 'install' or just build).
   - Start Tomcat from IntelliJ.
   - Open browser: http://localhost:8080/ECommerceShop/  (or your context path)

5. Demo accounts (from seed.sql)
   - Admin: admin@example.com / admin123
   - User: user@example.com / user123


Install Required Software
Software	               Install Link
Java JDK 8+	            https://adoptopenjdk.net

MySQL	                  https://dev.mysql.com/downloads/installer/

Tomcat 9	               https://tomcat.apache.org/download-90.cgi

IntelliJ IDEA	         https://www.jetbrains.com/idea/download/


📜 License
This project is for learning & educational purposes only.
You are free to modify, use, and improve it ✌️
