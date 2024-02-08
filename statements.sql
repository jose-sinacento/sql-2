/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
Table: usuarios

Columns:
id_usuario
int(11) AI PK
nombre
varchar(50)
apellido
varchar(100)
email
varchar(100)
edad
int(11)
id_rol
int(11)
id_categoria
int(11)

-- PASO 2
-- Tu código aquí
Table: roles

Columns:
id_rol
int(11) AI PK
nombre_rol
varchar(50)

-- PASO 3
-- Tu código aquí

ALTER TABLE usuarios
	ADD COLUMN id_rol INT,
	ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

UPDATE usuarios SET id_rol = 2 WHERE id_usuario = 4;

-- PASO 4
-- Tu código aquí

SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol
FROM roles r, usuarios u
WHERE u.id_rol = r.id_rol;

SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol
FROM roles r
JOIN usuarios u on u.id_rol = r.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
Table: categorias

Columns:
id_categoria
int(11) AI PK
nombre_categoria
varchar(100)


-- PASO 2
-- Tu código aquí

ALTER TABLE usuarios ADD COLUMN id_categoria INT;

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);

-- PASO 4
-- Tu código aquí

SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON roles.id_rol = usuarios.id_rol
JOIN categorias ON categorias.id_categoria = usuarios.id_categoria;

SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios, categorias, roles
WHERE roles.id_rol = usuarios.id_rol AND categorias.id_categoria = usuarios.id_categoria;

/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
Table: usuarios_categorias

Columns:
id_usuario_categoria
int(11) AI PK
id_usuario
int(11)
id_categoría
int(11)

ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_categorias ADD FOREIGN KEY (id_categoría) REFERENCES categorias(id_categoria);

-- PASO 2
-- Tu código aquí
INSERT INTO usuarios_categorias (id_usuario, id_categoría) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

-- PASO 3
-- Tu código aquí
SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios, roles, categorias, usuarios_categorias
WHERE roles.id_rol = usuarios.id_rol AND usuarios_categorias.id_usuario = usuarios.id_usuario AND usuarios_categorias.id_categoría = categorias.id_categoria;

SELECT usuarios.id_usuario, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.edad, roles.nombre_rol, categorias.nombre_categoria
FROM usuarios
JOIN roles ON roles.id_rol = usuarios.id_rol
JOIN usuarios_categorias ON usuarios_categorias.id_usuario = usuarios.id_usuario
JOIN categorias ON usuarios_categorias.id_categoría = categorias.id_categoria;