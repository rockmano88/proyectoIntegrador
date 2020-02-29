CREATE TABLE usuarios (
id MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
dni VARCHAR(100),
celular VARCHAR(100),
ciudad VARCHAR(100),
pais VARCHAR(100),
nombreUsuario VARCHAR(100) NOT NULL,
tipo_usuario TINYINT UNSIGNED NOT NULL,
email VARCHAR(100) NOT NULL,
contraseña VARCHAR(100) NOT NULL,
foto VARCHAR(100)
);

-- CREATE TABLE usuarios_admins (
-- id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
-- nombre VARCHAR(100) NOT NULL,
-- apellido VARCHAR(100) NOT NULL,
-- dni VARCHAR(100),
-- celular VARCHAR(100),
-- ciudad VARCHAR(100),
-- pais VARCHAR(100),
-- nombre_usuario VARCHAR(100) NOT NULL,
-- email VARCHAR(100) NOT NULL,
-- contraseña VARCHAR(100) NOT NULL,
-- foto VARCHAR(100)
-- );

CREATE TABLE marcas (
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE categorias (
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE categoria_marca (
-- id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
categoria_id TINYINT UNSIGNED NOT NULL,
marca_id TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (categoria_id) REFERENCES categorias(id),
FOREIGN KEY (marca_id) REFERENCES marcas(id),
PRIMARY KEY (categoria_id, marca_id)
);

CREATE TABLE carritos (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
usuario_id MEDIUMINT UNSIGNED NOT NULL,
precio_envio FLOAT,
subtotal FLOAT,
total FLOAT,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE productos (
id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- usuario_admin_id TINYINT UNSIGNED NOT NULL,
-- categoria_marca_id SMALLINT UNSIGNED NOT NULL,
categoria_id TINYINT UNSIGNED NOT NULL,
marca_id TINYINT UNSIGNED NOT NULL,
nombre VARCHAR(100) NOT NULL,
-- descripcion VARCHAR(200) NOT NULL,
-- cantidad_stock SMALLINT UNSIGNED NOT NULL,
precio FLOAT NOT NULL,
-- disponibilidad VARCHAR(10),
foto VARCHAR(100),
-- FOREIGN KEY (usuario_admin_id) REFERENCES usuarios_admins(id),
-- FOREIGN KEY (categoria_marca_id) REFERENCES categoria_marca(id),
FOREIGN KEY (categoria_id) REFERENCES categoria_marca(categoria_id),
FOREIGN KEY (marca_id) REFERENCES categoria_marca(marca_id)
);

CREATE TABLE producto_carrito (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
producto_id SMALLINT UNSIGNED NOT NULL,
carrito_id INT UNSIGNED NOT NULL,
FOREIGN KEY (producto_id) REFERENCES productos(id),
FOREIGN KEY (carrito_id) REFERENCES carritos(id)
);

CREATE TABLE compras (
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
carrito_id INT UNSIGNED NOT NULL,
usuario_id MEDIUMINT UNSIGNED NOT NULL,
fecha DATE NOT NULL,
forma_pago VARCHAR(50),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (carrito_id) REFERENCES carritos(id)
);