CREATE Table Orders (
row_id int PRIMARY KEY NOT NULL,
order_id varchar(10) NOT NULL,
created_at datetime NOT NULL,
item_id varchar(10) NOT NULL,
quantity int NOT NULL,
cust_id int NOT NULL,
delivery boolean ,
add_id int NOT NULL
);

CREATE Table Customers
(
cust_id int NOT NULL,
cust_firstname varchar(50) NOT NULL,
cust_lastname varchar(50) NOT NULL,
PRIMARY KEY (cust_id)
);

CREATE Table Address
(
add_id int NOT NULL,
delivery_address1 varchar(200) Not null ,
delivery_address2 varchar(200) ,
delivery_city varchar(50) NOT NULL,
delivery_zipcode varchar(20) NOT NULL,
PRIMARY KEY (add_id)
);

CREATE Table Item
(
item_id varchar(10) NOT NULL, 
sku varchar(20) NOT NULL,
item_name varchar(50) NOT NULL,
item_cat varchar(50) NOT NULL,
item_size varchar(20) NOT NULL,
item_price decimal(5,2) NOT NULL,
PRIMARY KEY (item_id)
);

alter Table orders 
ADD CONSTRAINT fk_cust_id FOREIGN KEY (cust_id)
REFERENCES Customers (cust_id),
ADD CONSTRAINT fk_add_id FOREIGN KEY (add_id)
REFERENCES Address (add_id),
ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id)
REFERENCES Item (item_id);

CREATE Table Recipe 
(
row_id int primary key NOT NULL,
recipe_id varchar(20) NOT NULL,
ing_id varchar(10) NOT NULL,
quantity int NOT NULL
);
 
CREATE Table Ingredient
(
ing_id varchar(10) NOT NULL,
ing_name varchar(200) NOT NULL,
ing_weight int NOT NULL,
ing_meas varchar(20) NOT NULL,
ing_price decimal(5,2) NOT NULL,
PRIMARY KEY (ing_id)
);

alter table Recipe 
ADD constraint fk_ing_id foreign key (ing_id) references Ingredient(ing_id);

CREATE Table Inventory
(
inv_id int primary key NOT NULL,
item_id varchar(10) NOT NULL,
quantity int NOT NULL,
FOREIGN KEY (item_id) REFERENCES Recipe(ing_id)
);

CREATE Table Staff
(
staff_id varchar(20) primary key NOT NULL,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
position varchar(100) NOT NULL,
hourly_rate decimal(5,2) NOT NULL
);

CREATE Table Shift
(
shift_id varchar(20) NOT NULL,
day_of_week varchar(10) NOT NULL,
start_time time NOT NULL,
end_time time NOT NULL,
PRIMARY KEY (shift_id)
);

CREATE Table Rota
(
row_id int primary key NOT NULL,
rota_id varchar(20) NOT NULL,
order_date datetime NOT NULL,
shift_id varchar(20) NOT NULL, 
staff_id varchar(20) NOT NULL,
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
alter table Rota 
ADD constraint fk_shift_id foreign key(shift_id) references Shift(shift_id);

/*alter table Rota ADD constraint fk_order_date FOREIGN KEY (order_date) REFERENCES Orders(created_at);
alter table Recipe ADD constraint fk_recipe_id foreign key (recipe_id) references Item(sku);*/