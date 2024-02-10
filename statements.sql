/* Relación tipo 1:1 */
-- PASO 1

CREATE TABLE usuarios(
id_usuarios INT auto_increment primary KEY,
nombre_usuario VARCHAR(50) NOT NULL,
apellido_usuario VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
edad  INT
);

INSERT INTO usuarios (nombre_usuario, apellido_usuario, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);



-- PASO 2
CREATE TABLE roles (
id_rol INT auto_increment PRIMARY KEY,
nombre_rol VARCHAR (50) NOT NULL
);

INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');


-- PASO 3
ALTER TABLE usuarios ADD id_rol INT;

ALTER TABLE usuarios ADD FOREIGN KEY(id_rol) REFERENCES roles (id_rol);



-- PASO 4
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol

FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol


/* Relación tipo 1:N */
--PASO 1
CREATE TABLE categorias (
id_categoria INT auto_increment PRIMARY KEY, 
nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');



-- PASO 2
ALTER TABLE usuarios ADD id_categoria INT ;

SELECT * FROM usuarios


-- PASO 3
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1,6,2,5,3);
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (4,6,6,3,1);
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (8,8,7,3,7);
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (9,6,7,4,3);
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (3,6,2,2,6);
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (7,6,2,5,3);
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (6,3,6,7,8);


-- PASO 4
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM categorias
JOIN usuarios ON categorias.id_categoria=usuarios-id_categoria
JOIN roles ON usuarios.id_rol = roles.id_rol


/* Relación tipo N:M */
-- PASO 1
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles (id_rol)


-- PASO 2
CREATE TABLE usuarios_categorias(
id_usuarios_categoria INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_categoria INT,
FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
FOREIGN KEY(id_categoria) REFERENCES usuarios(id_categoria)
)

INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10),


-- PASO 3
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad,
roles.nombre_rol, categorias.nombre_categoria
FROM usuarios_categorias AS usercat
JOIN (roles, categorias AS cat, usuarios) ON usercat.id_usuario = usuarios.id_usuario 
AND usercat.id_categoria = cat.id_categoria
AND usuarios.id_rol = roles.id_rol
