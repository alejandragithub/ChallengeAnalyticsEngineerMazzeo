CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(10),
    address VARCHAR(255),
    birth_date DATE,
    phone VARCHAR(20)
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    path VARCHAR(255)
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    purchase_date DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);



CREATE TABLE Item (
    item_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    state VARCHAR(20),
    date_out_of_stock DATE,
    price DECIMAL(10, 2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Order(order_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);



CREATE TABLE ItemHistorial (
    item_id INT,
    registration_date DATETIME,
    price DECIMAL(10, 2),
    state VARCHAR(20),
    PRIMARY KEY (item_id, registration_date),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);


