CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE Provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Localidad (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES Provincia(id_provincia)
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    direccion VARCHAR(90) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    id_localidad INT,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_localidad) REFERENCES Localidad(id_localidad)
);

INSERT INTO Provincia (nombre) VALUES ('Barcelona');
INSERT INTO Provincia (nombre) VALUES ('Valencia');
INSERT INTO Provincia (nombre) VALUES ('Sevilla');

INSERT INTO Localidad (nombre, id_provincia) 
VALUES 
('Barcelona', 1),
('Hospitalet de Llobregat', 1),
('Badalona', 1),
('Valencia', 2),
('Paterna', 2),
('Gandía', 2),
('Sevilla', 3),
('Dos Hermanas', 3),
('Alcalá de Guadaíra', 3);

INSERT INTO Cliente (nombre, apellidos, direccion, codigo_postal, id_localidad, telefono)
VALUES
('Juan', 'Pérez García', 'Calle Mayor 123', '28001', 1, '555-123-4567'),
('Ana', 'López Martínez', 'Avenida Central 456', '46002', 4, '555-987-6543'),
('Pedro', 'Rodríguez Sánchez', 'Plaza del Sol 789', '41001', 7, '555-234-5678'),
('María', 'Fernández López', 'Calle Primavera 234', '28005', 2, '555-876-5432'),
('Carlos', 'Gómez Martín', 'Paseo del Río 567', '46005', 5, '555-345-6789'),
('Laura', 'Torres Pérez', 'Calle Nueva 456', '41003', 8, '555-654-3210'),
('Miguel', 'Díaz Rodríguez', 'Avenida Principal 789', '28010', 3, '555-432-1098'),
('Elena', 'Sánchez Gómez', 'Calle Mayor 123', '46004', 6, '555-210-9876'),
('David', 'Martínez Fernández', 'Paseo Central 234', '41002', 9, '555-876-5432'),
('Isabel', 'López García', 'Calle del Sol 567', '28020', 1, '555-543-2109'),
('Javier', 'Ruiz Pérez', 'Avenida de la Playa 890', '46003', 4, '555-321-0987'),
('Carmen', 'García Sánchez', 'Plaza del Parque 123', '41004', 7, '555-654-3210'),
('Sergio', 'Fernández López', 'Calle del Bosque 456', '28015', 2, '555-432-1098'),
('Natalia', 'Ramírez Martínez', 'Avenida del Lago 789', '46006', 5, '555-321-0987'),
('Raúl', 'Torres López', 'Calle de la Luna 123', '41005', 8, '555-210-9876');

CREATE TABLE Categoria_Producto (
    id_categoria_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT NOT NULL,
    imagen VARCHAR(90),
    precio DECIMAL(5, 2) NOT NULL,
    id_categoria_producto INT,
    id_categoria_pizza INT,
    FOREIGN KEY (id_categoria_producto) REFERENCES Categoria_Producto(id_categoria_producto),
    FOREIGN KEY (id_categoria_pizza) REFERENCES Categoria_Pizza(id_categoria_pizza)
);

CREATE TABLE Categoria_Pizza (
    id_categoria_pizza INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    entrega_domicilio BOOLEAN NOT NULL,
    cantidad_productos INT NOT NULL,
    precio_total DECIMAL(10, 2) NOT NULL,
    id_cliente INT,
    id_tienda INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_tienda) REFERENCES Tienda(id_tienda)
);

CREATE TABLE Pedido_Reparto (
    id_pedido_reparto INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_empleado INT,
    fecha_hora_entrega DATETIME,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Tienda (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(90) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    id_localidad INT,
    id_provincia INT,
    FOREIGN KEY (id_localidad) REFERENCES Localidad(id_localidad),
    FOREIGN KEY (id_provincia) REFERENCES Provincia(id_provincia)
);

CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    nif VARCHAR(10) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    cocinero BOOLEAN NOT NULL,
    repartidor BOOLEAN NOT NULL,
    id_tienda INT,
    FOREIGN KEY (id_tienda) REFERENCES Tienda(id_tienda)
)

INSERT INTO Tienda (direccion, codigo_postal, id_localidad, id_provincia)
VALUES
('Calle Rambla de Catalunya 123', '08001', 1, 1),
('Calle de Sant Josep 456', '08901', 2, 1),
('Calle del Mar 789', '08911', 3, 1),
('Avenida de la Paz 123', '46001', 4, 2),
('Calle Mayor 456', '46980', 5, 2),
('Carrer del Marjal 789', '46701', 6, 2),
('Calle Sierpes 123', '41001', 7, 3),
('Avenida de España 456', '41701', 8, 3),
('Calle de la Feria 789', '41500', 9, 3);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Antonio', 'López García', '12345678A', '555-111-1111', 1, 0, 1),
('María', 'Rodríguez Pérez', '87654321B', '555-222-2222', 1, 0, 1),
('Juan', 'Martínez López', '98765432C', '555-333-3333', 1, 0, 1);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Pedro', 'Sánchez García', '45678901D', '555-444-4444', 0, 1, 1),
('Laura', 'Pérez Rodríguez', '34567890E', '555-555-5555', 0, 1, 1),
('Carlos', 'González Martínez', '23456789F', '555-666-6666', 0, 1, 1);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Isabel', 'García López', '98765432A', '555-777-7777', 1, 0, 2),
('Sergio', 'Martínez Pérez', '12345678B', '555-888-8888', 1, 0, 2),
('Elena', 'Sánchez Rodríguez', '87654321C', '555-999-9999', 1, 0, 2);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Pedro', 'Gómez García', '23456789D', '555-000-0000', 0, 1, 2),
('Laura', 'López Martínez', '34567890E', '555-111-1111', 0, 1, 2),
('Juan', 'Díaz Pérez', '45678901F', '555-222-2222', 0, 1, 2);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Manuel', 'Fernández García', '12345678A', '555-777-7777', 1, 0, 3),
('Cristina', 'Gómez Pérez', '98765432B', '555-888-8888', 1, 0, 3),
('Antonia', 'Sánchez Rodríguez', '87654321C', '555-999-9999', 1, 0, 3);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('José', 'Martínez López', '23456789D', '555-000-0000', 0, 1, 3),
('Marta', 'Pérez Martínez', '34567890E', '555-111-1111', 0, 1, 3),
('Andrés', 'López Sánchez', '45678901F', '555-222-2222', 0, 1, 3);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Sara', 'García López', '12345678A', '555-777-7777', 1, 0, 4),
('Javier', 'Fernández Martínez', '98765432B', '555-888-8888', 1, 0, 4),
('Luis', 'Sánchez Pérez', '87654321C', '555-999-9999', 1, 0, 4);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Laura', 'Pérez García', '23456789D', '555-000-0000', 0, 1, 4),
('Pablo', 'Martínez Sánchez', '34567890E', '555-111-1111', 0, 1, 4),
('Eva', 'López Martínez', '45678901F', '555-222-2222', 0, 1, 4);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Silvia', 'Martínez García', '12345678A', '555-777-7777', 1, 0, 5),
('Pablo', 'Sánchez Pérez', '98765432B', '555-888-8888', 1, 0, 5),
('Elena', 'García López', '87654321C', '555-999-9999', 1, 0, 5);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Manuel', 'Pérez Martínez', '23456789D', '555-000-0000', 0, 1, 5),
('Ana', 'González López', '34567890E', '555-111-1111', 0, 1, 5),
('Diego', 'Fernández Sánchez', '45678901F', '555-222-2222', 0, 1, 5);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Sara', 'Gómez Martínez', '12345678A', '555-777-7777', 1, 0, 6),
('Alejandro', 'López Pérez', '98765432B', '555-888-8888', 1, 0, 6),
('Olga', 'Fernández García', '87654321C', '555-999-9999', 1, 0, 6);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('José', 'Pérez López', '23456789D', '555-000-0000', 0, 1, 6),
('Isabel', 'García Pérez', '34567890E', '555-111-1111', 0, 1, 6),
('Luis', 'Martínez Sánchez', '45678901F', '555-222-2222', 0, 1, 6);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Roberto', 'Gómez Pérez', '12345678A', '555-777-7777', 1, 0, 7),
('Nuria', 'López Martínez', '98765432B', '555-888-8888', 1, 0, 7),
('Diego', 'Fernández Sánchez', '87654321C', '555-999-9999', 1, 0, 7);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Marina', 'Pérez López', '23456789D', '555-000-0000', 0, 1, 7),
('Andrés', 'García Martínez', '34567890E', '555-111-1111', 0, 1, 7),
('Sandra', 'Martínez García', '45678901F', '555-222-2222', 0, 1, 7);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Marta', 'García Pérez', '12345678A', '555-333-3333', 1, 0, 8),
('Adrián', 'Martínez López', '98765432B', '555-444-4444', 1, 0, 8),
('Sofía', 'López Martínez', '87654321C', '555-555-5555', 1, 0, 8);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Hugo', 'Fernández Sánchez', '23456789D', '555-666-6666', 0, 1, 8),
('Lucía', 'Gómez Martín', '34567890E', '555-777-7777', 0, 1, 8),
('Víctor', 'Sánchez López', '45678901F', '555-888-8888', 0, 1, 8);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Beatriz', 'Martínez Pérez', '12345678A', '555-333-3333', 1, 0, 9),
('Roberto', 'Gómez López', '98765432B', '555-444-4444', 1, 0, 9),
('Sara', 'Sánchez Martín', '87654321C', '555-555-5555', 1, 0, 9);

INSERT INTO Empleado (nombre, apellidos, nif, telefono, cocinero, repartidor, id_tienda)
VALUES
('Álvaro', 'García Sánchez', '23456789D', '555-666-6666', 0, 1, 9),
('Eva', 'López Martínez', '34567890E', '555-777-7777', 0, 1, 9),
('Luis', 'Rodríguez Martín', '45678901F', '555-888-8888', 0, 1, 9);

INSERT INTO categoria_producto (nombre)
VALUES
('pizzas'),
('hamburguesas'),
('bebidas');

INSERT INTO categoria_pizza (nombre)
VALUES
('clasicas'),
('especialidades');

INSERT INTO Producto (nombre, descripcion, precio, id_categoria_producto)
VALUES
('Agua Mineral', 'Botella de agua mineral sin gas', 1.50, 3),
('Coca-Cola', 'Refresco de cola en lata', 2.00, 3),
('Zumo de Naranja', 'Zumo de naranja natural', 2.50, 3),
('Té Helado', 'Té helado con limón', 2.20, 3),
('Café', 'Taza de café recién hecho', 1.80, 3);

INSERT INTO Producto (nombre, descripcion, precio, id_categoria_producto)
VALUES
('Hamburguesa Clásica', 'Hamburguesa con carne de res, lechuga, tomate y queso', 4.99, 2),
('Hamburguesa de Pollo', 'Hamburguesa con filete de pollo empanizado y aderezos', 5.49, 2),
('Hamburguesa Vegetariana', 'Hamburguesa vegetariana con base de garbanzos y verduras', 4.79, 2),
('Hamburguesa Doble', 'Doble hamburguesa con doble carne, queso y aderezos', 6.99, 2),
('Hamburguesa con Bacon', 'Hamburguesa con bacon, queso, lechuga y tomate', 5.29, 2);

INSERT INTO Producto (nombre, descripcion, precio, id_categoria_producto, id_categoria_pizza)
VALUES
('Pizza Margarita', 'Sencilla y deliciosa con salsa de tomate, mozzarella y albahaca', 7.99, 1, 1),
('Pizza Pepperoni', 'Con salsa de tomate, mozzarella y abundantes rodajas de pepperoni', 8.49, 1, 1),
('Pizza Hawaiana', 'Salsa de tomate, mozzarella, jamón y piña', 8.99, 1, 1),
('Pizza Napolitana', 'Tomate, mozzarella, anchoas, aceitunas negras y alcaparras', 9.29, 1, 1),
('Pizza 4 Quesos', 'Una mezcla de cuatro quesos: mozzarella, gorgonzola, parmesano y queso de cabra', 9.99, 1, 1);

INSERT INTO Producto (nombre, descripcion, precio, id_categoria_producto, id_categoria_pizza)
VALUES
('Pizza Carbonara', 'Salsa de nata, mozzarella, huevo, bacon y queso parmesano', 10.99, 1, 2),
('Pizza Barbacoa', 'Salsa barbacoa, mozzarella, carne de cerdo desmenuzada, cebolla y maíz', 11.49, 1, 2),
('Pizza Vegetariana', 'Salsa de tomate, mozzarella y una variedad de verduras frescas', 9.79, 1, 2),
('Pizza Marinera', 'Salsa de tomate, mozzarella, mariscos y aceite de oliva', 12.29, 1, 2),
('Pizza Del Chef', 'Salsa de tomate, mozzarella, jamón serrano, rúcula y lascas de parmesano', 11.99, 1, 2);

INSERT INTO Pedido (fecha_hora, entrega_domicilio, cantidad_productos, precio_total, id_cliente, id_tienda)
VALUES ('2023-11-05 14:00:00', 1, 3, 15.99, 3, 4);

INSERT INTO Pedido_Reparto (id_pedido, id_empleado, fecha_hora_entrega)
VALUES (1, 6, '2023-11-05 14:30:00');

INSERT INTO Pedido (fecha_hora, entrega_domicilio, cantidad_productos, precio_total, id_cliente, id_tienda)
VALUES ('2023-11-05 15:30:00', 1, 4, 19.99, 7, 6);

INSERT INTO Pedido_Reparto (id_pedido, id_empleado, fecha_hora_entrega)
VALUES (2, 11, '2023-11-05 16:00:00');

INSERT INTO Pedido (fecha_hora, entrega_domicilio, cantidad_productos, precio_total, id_cliente, id_tienda)
VALUES ('2023-11-05 17:30:00', 1, 2, 9.49, 12, 8);

INSERT INTO Pedido_Reparto (id_pedido, id_empleado, fecha_hora_entrega)
VALUES (3, 16, '2023-11-05 18:00:00');

INSERT INTO Pedido (fecha_hora, entrega_domicilio, cantidad_productos, precio_total, id_cliente, id_tienda)
VALUES ('2023-11-05 19:00:00', 0, 2, 8.99, 10, 5);

INSERT INTO Pedido (fecha_hora, entrega_domicilio, cantidad_productos, precio_total, id_cliente, id_tienda)
VALUES ('2023-11-05 20:30:00', 0, 3, 13.49, 13, 2);

INSERT INTO Pedido (fecha_hora, entrega_domicilio, cantidad_productos, precio_total, id_cliente, id_tienda)
VALUES ('2023-11-05 21:15:00', 0, 4, 17.99, 1, 1);

