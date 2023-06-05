CREATE table vendedor (
id_vendedor integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
nombre varchar(100)
)


select * from vendedor


CREATE table clientes (
id_cliente integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
nombre varchar(100),
telefono varchar(50)
)

select * from clientes

CREATE table servicios (
id_servicio integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
nombre varchar(100),
descripcion varchar(100),
precio decimal(9,2)
)

select * from servicios


CREATE table meseros (
id_mesero integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
nombre varchar(100),
edad integer,
disponibilidad varchar(100),
dpi varchar(13),
telefono varchar(50),
genero varchar(1)
)


select * from meseros


CREATE table eventos (
id_evento integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
fecha date,
hora time, 
lugar varchar(100),
tipo varchar(100),
descripcion varchar(1000),
motivo_cancel varchar(100),
tiempo integer
)


select * from eventos


CREATE table meseros_asginados_evento (
id integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
	idmesero integer,
	idevento integer,
CONSTRAINT fk_id_mesero
FOREIGN KEY (idmesero)
REFERENCES meseros(id_mesero),
CONSTRAINT fk_id_evento
FOREIGN KEY (idevento)
REFERENCES eventos(id_evento)
)

select * from meseros_asginados_evento


CREATE table contratos (
id_contrato integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
estado_cumplimiento varchar(50),
metodo_pago varchar(100),
fecha_requerimiento date,
monto_pagado decimal(9,2),
id_cliente integer,
id_vendedor integer,
id_evento integer,
CONSTRAINT fk_id_cliente
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente),
CONSTRAINT fk_id_vendedor
FOREIGN KEY (id_vendedor)
REFERENCES vendedor(id_vendedor),
CONSTRAINT fk_id_evento
FOREIGN KEY (id_evento)
REFERENCES eventos(id_evento)
)

select * from contratos



CREATE table servicio_contratado (
id integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
	id_servicio integer,
	id_contrato integer,
CONSTRAINT fk_id_servicio
FOREIGN KEY (id_servicio)
REFERENCES servicios(id_servicio),
CONSTRAINT fk_id_contrato
FOREIGN KEY (id_contrato)
REFERENCES contratos(id_contrato)
)


select * from servicio_contratado


