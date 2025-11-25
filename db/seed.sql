USE ecommerce_shop;

INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@example.com', 'admin123', 'ADMIN'),
('Test User', 'user@example.com', 'user123', 'USER');

INSERT INTO products (name, description, price, image_url, category) VALUES
('Minimal Chair', 'Ergonomic minimal chair.', 79.99, 'assets/chair.jpg', 'Furniture'),
('Desk Lamp', 'Warm LED lamp.', 39.50, 'assets/lamp.jpg', 'Lighting'),
('Ceramic Mug', 'Matte ceramic mug.', 12.00, 'assets/mug.jpg', 'Kitchen'),
('Notebook', 'A5 dotted notebook.', 9.99, 'assets/notebook.jpg', 'Stationery'),
('Wireless Earbuds', 'True wireless earbuds.', 59.00, 'assets/earbuds.jpg', 'Electronics'),
('Canvas Tote', 'Everyday carry tote.', 25.00, 'assets/tote.jpg', 'Accessories');
