create database mama;
use mama;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    registration_date DATE
);
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(255),
    publication_year INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DOUBLE,
    FOREIGN KEY (customer_id) REFERENCES users(user_id)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    position VARCHAR(255),
    hire_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    price DOUBLE,
    stock_quantity INT,
    manufacturer VARCHAR(255)
);

CREATE TABLE fashion_magazines (
    magazine_id INT PRIMARY KEY AUTO_INCREMENT,
    magazine_name VARCHAR(255),
    editor_id INT,
    publication_date DATE,
    FOREIGN KEY (editor_id) REFERENCES employees(employee_id)
);

CREATE TABLE articles (
    article_id INT PRIMARY KEY AUTO_INCREMENT,
    magazine_id INT,
    title VARCHAR(255),
    author_id INT,
    content TEXT,
   
    FOREIGN KEY (magazine_id) REFERENCES fashion_magazines(magazine_id),
    FOREIGN KEY (author_id) REFERENCES employees(employee_id)
);

CREATE TABLE fashion_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255)
);

CREATE TABLE article_categories (
    article_id INT,
    category_id INT,
    PRIMARY KEY (article_id, category_id),
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (category_id) REFERENCES fashion_categories(category_id)
);