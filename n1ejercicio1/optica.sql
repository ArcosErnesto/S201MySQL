CREATE DATABASE optica;
USE optica;

CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    direccion_calle VARCHAR(45) NOT NULL,
    direccion_numero INT NOT NULL,
    direccion_piso VARCHAR(45),
    direccion_puerta VARCHAR(45),
    direccion_ciudad VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    telefono VARCHAR(15),
    fax VARCHAR(15),
    nif VARCHAR(15) NOT NULL
);
CREATE TABLE Gafas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(45) NOT NULL,
    graduacion_cristal_l DECIMAL(5, 2),
    graduacion_cristal_r DECIMAL(5, 2),
    tipo_montura VARCHAR(50) NOT NULL,
    color_montura VARCHAR(50),
    color_cristales VARCHAR(50),
    precio DECIMAL(10, 2) NOT NULL,
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id)
);
INSERT INTO Gafas (marca, graduacion_cristal_l, graduacion_cristal_r, tipo_montura, color_montura, color_cristales, precio, proveedor_id) 
VALUES 
('OptiStyle', -2.25, -2.50, 'Flotante', 'Negro', 'Azul', 125.50, 1),
('CrystalWave', -3.00, -3.25, 'Pasta', 'Marrón', 'Gris', 150.75, 1),
('VisionPro', -1.75, -2.00, 'Metálica', 'Plateado', 'Verde', 110.00, 1),
('LensCraft', -3.50, -3.75, 'Pasta', 'Negro', 'Negro', 180.25, 1),
('SunLuxe', -2.00, -2.25, 'Flotante', 'Rojo', 'Amarillo', 135.99, 1),
('SightMasters', -1.50, -1.75, 'Pasta', 'Negro', 'Azul', 120.00, 1),
('EyeGlo', -2.75, -3.00, 'Metálica', 'Plateado', 'Marrón', 155.50, 1),
('LensXpress', -2.25, -2.50, 'Pasta', 'Negro', 'Verde', 142.75, 1),
('FrameFusion', -3.25, -3.50, 'Metálica', 'Dorado', 'Gris', 165.00, 1),
('ClearVision', -1.75, -2.00, 'Flotante', 'Azul', 'Marrón', 120.50, 1);

INSERT INTO Gafas (marca, graduacion_cristal_l, graduacion_cristal_r, tipo_montura, color_montura, color_cristales, precio, proveedor_id) 
VALUES 
('Visionary', -1.25, -1.50, 'Pasta', 'Negro', 'Azul', 110.25, 1),
('ElegantEye', -2.75, -3.00, 'Flotante', 'Plateado', 'Verde', 130.75, 1),
('SunSpecs', -3.25, -3.50, 'Pasta', 'Negro', 'Negro', 145.50, 1),
('UrbanGaze', -1.50, -1.75, 'Metálica', 'Dorado', 'Gris', 118.00, 1),
('VibrantView', -2.00, -2.25, 'Flotante', 'Negro', 'Amarillo', 135.99, 1),
('LuxeLenses', -2.25, -2.50, 'Pasta', 'Rojo', 'Marrón', 125.00, 1),
('ChicSight', -1.75, -2.00, 'Metálica', 'Plateado', 'Azul', 138.25, 1),
('TrendyOptics', -2.50, -2.75, 'Flotante', 'Negro', 'Negro', 120.50, 1),
('ModaGlasses', -2.00, -2.25, 'Pasta', 'Marrón', 'Verde', 142.75, 1),
('StyleVision', -3.00, -3.25, 'Metálica', 'Negro', 'Marrón', 155.00, 1);

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    direccion_calle VARCHAR(45) NOT NULL,
    direccion_numero INT NOT NULL,
    direccion_piso VARCHAR(10),
    direccion_puerta VARCHAR(10),
    direccion_ciudad VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    telefono VARCHAR(15),
    correo_electronico VARCHAR(45),
    fecha_registro DATE,
    cliente_recomendador_id INT,
    FOREIGN KEY (cliente_recomendador_id) REFERENCES Clientes(id)
);

INSERT INTO Clientes (nombre, direccion_calle, direccion_numero, direccion_piso, direccion_puerta, direccion_ciudad, codigo_postal, pais, telefono, correo_electronico, fecha_registro, cliente_recomendador_id)
VALUES
('Juan Pérez', 'Carrer de Sant Antoni', 45, '1A', '2', 'Barcelona', '08001', 'España', '648236841', 'juan@example.com', '2023-10-01', NULL),
('Ana García', 'Avinguda Diagonal', 123, '2B', 'C', 'Barcelona', '08002', 'España', '679246158', 'ana@example.com', '2023-10-02', NULL),
('Carlos Martínez', 'Carrer de Gran de Gràcia', 78, '3C', 'D', 'Barcelona', '08003', 'España', '631846921', 'carlos@example.com', '2023-10-03', 2),
('Laura Sánchez', 'Plaça de Catalunya', 101, '4D', 'E', 'Barcelona', '08004', 'España', '694321064', 'laura@example.com', '2023-10-04', 2),
('Pedro Rodríguez', 'Rambla de Catalunya', 222, '2B', 'F', 'Barcelona', '08005', 'España', '609482346', 'pedro@example.com', '2023-10-05', 4),
('María López', 'Carrer de la Riera', 555, '5E', 'G', 'Sabadell', '08201', 'España', '604871356', 'maria@example.com', '2023-10-06', NULL),
('Isabel Fernández', 'Plaça Major', 777, '6F', 'H', 'Terrassa', '08202', 'España', '647523951', 'isabel@example.com', '2023-10-07', NULL),
('Javier Torres', 'Carrer de la Creu', 333, '7G', 'I', 'Granollers', '08401', 'España', '615789230', 'javier@example.com', '2023-10-08', 7),
('Elena Ruiz', 'Rambla de la Pau', 999, '8H', 'J', 'Mataró', '08301', 'España', '636495210', 'elena@example.com', '2023-10-09', NULL),
('Sergio Gómez', 'Carrer de Sant Pau', 111, '9I', 'K', 'Badalona', '08901', 'España', '666666666', 'sergio@example.com', '2023-10-10', 9);

CREATE TABLE Empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    telefono VARCHAR(15),
    fecha_contratacion DATE
);

INSERT INTO Empleado (nombre, telefono, fecha_contratacion)
VALUES
('Luis Martínez', '631458968', '2023-06-20'),
('Carmen Rodríguez', '631458969', '2023-01-15'),
('Pablo Sánchez', '631458970', '2023-03-10'),
('Isabel González', '631458971', '2023-08-05');

CREATE TABLE venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE NOT NULL,
    cliente_id INT,
    empleado_id INT,
    id_gafa INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (empleado_id) REFERENCES Empleado(id),
    FOREIGN KEY (id_gafa) REFERENCES Gafas(id)
);

INSERT INTO venta (fecha_venta, cliente_id, empleado_id, id_gafa)
VALUES
('2023-10-15', 1, 4, 15),
('2023-10-16', 7, 3, 9),
('2023-10-17', 4, 2, 3),
('2023-10-18', 3, 1, 20),
('2023-10-19', 9, 3, 2);

ALTER TABLE venta
ADD CONSTRAINT gafa_unico UNIQUE (id_gafa);

INSERT INTO venta (fecha_venta, cliente_id, empleado_id, id_gafa)
VALUES
('2023-10-19', 5, 2, 8);
