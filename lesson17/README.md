Кроки до виконання:

#1 Створення бази даних і таблиць:

Створіть нову базу даних MySQL

CREATE DATABASE my_database;

Створіть кілька таблиць з декількома рядками даних у кожній. Наприклад, таблиці «Клієнти», «Замовлення», «Продукти»
CREATE TABLE clients (
client_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(100)
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT,
product_id INT,
quantity INT,
order_date DATE,
FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
price DECIMAL(10,2)
);

INSERT INTO clients (name, email, phone) VALUES
('First', 'first@gmail.com', '380111111111'),
('Second', 'second@gmail.com', '380222222222'),
('Third', 'third@gmail.com','380333333333');

INSERT INTO products (name, price) VALUES
('Product 1', 99.99),
('Product 2', 12.99),
('Product 3', 15.99);

INSERT INTO orders (client_id, product_id, quantity, order_date) VALUES
(2, 2, 2, '2024-01-01'),
(3, 1, 1, '2024-01-02'),
(1, 3, 3, '2024-01-03');
![image1](https://github.com/NataliaKozey/laba/blob/master/lesson17/images/img_0.png)
![image2](https://github.com/NataliaKozey/laba/blob/master/lesson17/images/img.png)
#2 Конфігурація основного сервера (master):

Встановіть унікальний server-id
Включіть бінарне логування
Створіть користувацький обліковий запис для реплікації
CREATE USER 'replica'@'%' IDENTIFIED BY 'iI2F1e8fIJu4';
ALTER USER 'replica'@'%' IDENTIFIED WITH mysql_native_password BY 'iI2F1e8fIJu4';
GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';
FLUSH PRIVILEGES;
![image2](https://github.com/NataliaKozey/laba/blob/master/lesson17/images/img_1.png)
#3 Експорт даних з основного сервера:

Зробіть дамп бази даних для імпорту на вторинний сервер

mysqldump my_database > my_database.sql

#4 Налаштування вторинного сервера (slave):

Встановіть унікальний server-id, що відрізняється від основного сервера
Імпортуйте дамп бази даних з основного сервера
![image2](https://github.com/NataliaKozey/laba/blob/master/lesson17/images/img_2.png)

#5 З'єднання slave з master:

Налаштуйте вторинний сервер для з'єднання з основним сервером і вказівки на бінарний лог

CHANGE MASTER TO MASTER_HOST='10.0.30.97', MASTER_USER='replica', MASTER_PASSWORD='iI2F1e8fIJu4', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=2274;

#6 Запуск реплікації:

Запустіть реплікацію на вторинному сервері
![image2](https://github.com/NataliaKozey/laba/blob/master/lesson17/images/img_3.png)


#7 Перевірка статусу реплікації:

Використовуйте команду SHOW SLAVE STATUS на вторинному сервері для перевірки стану реплікації
![image4](https://github.com/NataliaKozey/laba/blob/master/lesson17/images/img_4.png)

#8 Симуляція збою мастера:

Симулюйте збій основного сервера та перевірте, як вторинний сервер реагує на збій. Після відновлення основного сервера перевірте синхронізацію даних