CREATE DATABASE security_symfony;
USE security_symfony;

--CREATE USER - generado por symfony security make:user

--Resto de Entidades

CREATE TABLE IF NOT EXISTS users (
id          int(255) AUTO_INCREMENT NOT NULL,
role        varchar(50),

)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS categorias (
id          int(255) AUTO_INCREMENT NOT NULL,
nombre      varchar(255),
CONSTRAINT pk_categorias PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS pedidos (
id          int(255) AUTO_INCREMENT NOT NULL,
usuario_id  int(255),
provincia   varchar(255),
localidad   varchar(255),
direccion   varchar(255),
codigo_postal   int(255),
coste       float(200,2),
estado      varchar(50),
created_at  datetime,
updated_at  datetime,
CONSTRAINT pk_pedidos PRIMARY KEY(id),
CONSTRAINT fk_pedidos_usuarios FOREIGN KEY(usuario_id) REFERENCES user(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS productos (
id          int(255) AUTO_INCREMENT NOT NULL,
categoria_id    int(255),
nombre          varchar(255),
descripcion     varchar(255),
precio          float(200,2),
stock           int(255),
imagen          varchar(255),
created_at      datetime,
updated_at      datetime,
CONSTRAINT pk_productos PRIMARY KEY(id),
CONSTRAINT fk_productos_categoria FOREIGN KEY(categoria_id) REFERENCES categorias(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS lineas_pedidos (
id          int(255) AUTO_INCREMENT NOT NULL,
pedido_id   int(255),
producto_id int(255),
unidades    int(100),
created_at  datetime,
updated_at  datetime,
CONSTRAINT pk_lineas_pedidos PRIMARY KEY(id),
CONSTRAINT fk_lineasPed_pedidos FOREIGN KEY(pedido_id) REFERENCES pedidos(id),
CONSTRAINT fk_lineasPed_productos FOREIGN KEY(producto_id) REFERENCES productos(id)
)ENGINE=InnoDb;
