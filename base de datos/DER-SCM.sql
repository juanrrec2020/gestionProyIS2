CREATE TABLE  permisos(
	id numeric NOT NULL,
	nombre_permiso character(60) NOT NULL,
	CONSTRAINT permisos_pk PRIMARY KEY (id)

);

CREATE TABLE  rol(
	id numeric NOT NULL,
	nombre_rol character(30) NOT NULL,
	descripcion_rol character(60) NOT NULL,
	CONSTRAINT rol_pk PRIMARY KEY (id)

);

CREATE TABLE  rol_permisos(
	id_permiso numeric NOT NULL,
	id_rol numeric NOT NULL,
	observacion character(60),
	CONSTRAINT rol_permisos_pk PRIMARY KEY (id_permiso,id_rol)

);

CREATE TABLE  proyecto(
	codigo character(4) NOT NULL,
	nombre_proyecto character(45) NOT NULL,
	fecha_inicio date,
	fecha_fin_estimada date,
	anho_proyecto character(4),
	fase character(70),
	estado character(3) DEFAULT 'PEN'::bpchar,
	CONSTRAINT proyecto_check CHECK ((estado = ANY (ARRAY['CAN'::bpchar, 'CUR'::bpchar, 'TER'::bpchar, 'PEN'::bpchar]))),
	CONSTRAINT proyecto_pk PRIMARY KEY (codigo)

);

CREATE TABLE  linea_base(
	id numeric NOT NULL,
	nombre character(100),
	tarea character(50),
	tiempo_estimado numeric,
	responsable character(50),
	estado character(40),
	id_proyecto character(4),
	CONSTRAINT linea_base_pk PRIMARY KEY (id)

);

CREATE TABLE  item(
	id numeric NOT NULL,
	nombre character(45),
	descripcion character(300),
	historial_cambios character(300),
	version character(10),
	fecha_creacion date,
	fecha_modificacion date,
	id_linea_base numeric,
	CONSTRAINT item_pk PRIMARY KEY (id)

);

CREATE TABLE  usuario(
	id numeric NOT NULL,
	nombre character(30) NOT NULL,
	apellido character(30) NOT NULL,
	email character(40) NOT NULL,
	nombre_usuario character(30) NOT NULL,
	contrasenha character(8) NOT NULL,
	descripcion character(60),
	telefono character(15) NOT NULL,
	estado character(9),
	ultima_sesion time with time zone,
	id_rol numeric,
	id_proyecto character(4),
	CONSTRAINT estado_check CHECK ((estado = ANY (ARRAY['ACTIVO'::bpchar, 'INACTIVO'::bpchar]))),
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_unico UNIQUE (nombre_usuario)

);

ALTER TABLE  rol_permisos ADD CONSTRAINT rol_permisos_permisos_fk FOREIGN KEY (id_permiso)
REFERENCES  permisos (id);

ALTER TABLE  rol_permisos ADD CONSTRAINT rol_permisos_rol_fk FOREIGN KEY (id_rol)
REFERENCES  rol (id);

ALTER TABLE  linea_base ADD CONSTRAINT linea_base_proyecto_fk FOREIGN KEY (id_proyecto)
REFERENCES  proyecto (codigo);

ALTER TABLE  item ADD CONSTRAINT item_linea_base_fk FOREIGN KEY (id_linea_base)
REFERENCES  linea_base (id);

ALTER TABLE  usuario ADD CONSTRAINT usuario_rol_fk FOREIGN KEY (id_rol)
REFERENCES  rol (id);

ALTER TABLE  usuario ADD CONSTRAINT usuario_proyecto_fk FOREIGN KEY (id_proyecto)
REFERENCES  proyecto (codigo);
