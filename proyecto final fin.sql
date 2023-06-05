
--DDL PROYECTO

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
tiempo_horas integer
)

alter table eventos rename column "tiempo(horas)" to "tiempo_horas"

select * from eventos


CREATE table meseros_asignados_evento (
id integer NOT NULL
	PRIMARY KEY AUTOINCREMENT,
	id_mesero integer,
	id_evento integer,
CONSTRAINT fk_id_mesero
FOREIGN KEY (id_mesero)
REFERENCES meseros(id_mesero),
CONSTRAINT fk_id_evento
FOREIGN KEY (id_evento)
REFERENCES eventos(id_evento)
)

alter table meseros_asginados_evento
rename to meseros_asignados_evento

select * from meseros_asignados_evento


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
id_servicio integer,
CONSTRAINT fk_id_cliente
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente),
CONSTRAINT fk_id_vendedor
FOREIGN KEY (id_vendedor)
REFERENCES vendedor(id_vendedor),
CONSTRAINT fk_id_evento
FOREIGN KEY (id_evento)
REFERENCES eventos(id_evento)
CONSTRAINT fk_id_servicio
FOREIGN KEY (id_servicio)
REFERENCES servicios(id_servicio)
)

alter table contratos
add column id_servicio integer references servicios(id_servicio)

ALTER TABLE contratos
ADD FOREIGN KEY (id_servicio)
REFERENCES servicios(id_servicio)

alter table contratos
drop column id_servicio

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

--DML PROYECTO

insert into servicios (nombre, descripcion, precio)
values ("P1","Cubre evento con los serviciso de atención de 25 meseros", 25000.00),
("P2","Cubre evento con los serviciso de atención de 16 meseros", 16000.00),
("P3","Cubre evento con los servicios de atención de 12 meseros", 12000.00),
("P4","Cubre evento con los servicios de atención de 10 meseros", 10000.00),
("P5","Cubre evento con los servicios de atención de 8 meseros", 8000.00),
("P6","Cubre evento con los servicios de atención de 6 meseros", 6000.00),
("P7","Cubre evento con los servicios de alquiler de mobiliario", 9000.00),
("P8","Cubre evento con los servicios de cristaleria", 5000.00),
("P9","Cubre evento con los servicios de reposteria", 4000.00),
("P10","Cubre evento con los servicios de bartender", 7000.00),
("P11","Cubre evento con los servicios de servicios varios", 1000.00)

select * from servicios

update servicios
set descripcion = "Cubre evento con los servicios de atención de 25 meseros"
where id_servicio = 1

insert into clientes (nombre, telefono)
values ("aron mercury", "9632-6598"),
("sofia perez", "5546-9632"),
("scarleth patzan", "9632-7631"),
("cristofer hernandez", "9632-8965"),
("Joel perez", "9632-2347"),
("santiago toma", "9632-2379"),
("kevin perez", "9632-0398"),
("vilma ramirez", "9632-0023"),
("walter patzan", "5362-6598"),
("cristel mendez", "8396-6598"),
("cesar mendez", "8632-6598"),
("junior soto", "7931-6598"),
("alejandro chavach", "5321-6598"),
("lenin lopez", "9632-0976"),
("hans torres", "2352-6598"),
("merlina addams", "5697-6598")

select * from clientes


insert into vendedor (nombre)
values ("marvin arauz"),
("miguel martinez"),
("ariel yoc"),
("maria de los angeles"),
("nery orellana"),
("thania iriarte"),
("jose cantoral")

select * from vendedor

insert into meseros (nombre, edad, disponibilidad, dpi, telefono, genero)
values ("manuel rodríguez", 33,"disponible","1261755110110","+502 23047941","m"),
("jose gonzález", 18,"disponible","2328114010110","+502 13909303","m"),
("francisco fernández", 29,"no disponible","1606725710110","+502 21421982","m"),
("david lópez", 38,"disponible","1580460010110","+502 14071118","m"),
("juan martínez", 37,"disponible","1317137510110","+502 22073621","m"),
("javier sánchez", 38,"no disponible","1630124810110","+502 16710370","m"),
("jose antonio pérez", 33,"disponible","1791075010110","+502 12422780","m"),
("daniel gómez", 18,"no disponible","2212780110110","+502 14494892","m"),
("francisco martín", 39,"disponible","2215121410110","+502 21798982","m"),
("jose jiménez", 21,"disponible","1511663910110","+502 23075413","m"),
("carlos hernández", 40,"disponible","2103210110110","+502 15890885","m"),
("jesus ruiz", 33,"disponible","2085508010110","+502 16361853","m"),
("alejandro díaz", 40,"no disponible","1449378710110","+502 12770356","m"),
("miguel angel garcía", 39,"disponible","2300971110110","+502 17132138","m"),
("jose rodríguez", 20,"disponible","1555750510110","+502 20165889","m"),
("rafael gonzález", 42,"no disponible","1317108310110","+502 16535088","m"),
("miguel angel fernández", 25,"disponible","2021036310110","+502 15221726","m"),
("pablo lópez", 35,"no disponible","1322018610110","+502 22807851","m"),
("pedro martínez", 37,"disponible","1823902310110","+502 22941139","m"),
("angel sánchez", 26,"disponible","2076424110110","+502 13729061","m"),
("sergio pérez", 42,"disponible","1637366210110","+502 13584536","m"),
("jose maria gómez", 28,"no disponible","1761582710110","+502 19156025","m"),
("fernando martín", 32,"disponible","2176545010110","+502 20179891","m"),
("jorge garcía", 20,"no disponible","1274950310110","+502 13465036","m"),
("sofia rodríguez", 41,"disponible","2288729610110","+502 14017470","f"),
("claudia gonzález", 30,"disponible","1680865310110","+502 17183246","f"),
("maria josefa fernández", 31,"disponible","1572735310110","+502 20783905","f"),
("eva maria lópez", 37,"disponible","1661525110110","+502 17725419","f"),
("carla martínez", 35,"no disponible","1515248210110","+502 20358632","f"),
("maria rosario sánchez", 27,"disponible","2089303910110","+502 20238097","f"),
("inmaculada pérez", 18,"disponible","1362564010110","+502 16356638","f"),
("maria mercedes gómez", 19,"no disponible","1933234910110","+502 18812225","f"),
("ana isabel martín", 20,"disponible","1498140010110","+502 15574693","f"),
("noelia garcía", 44,"disponible","1953932410110","+502 13828367","f"),
("esther rodríguez", 44,"no disponible","1597235610110","+502 16429894","f"),
("veronica gonzález", 19,"disponible","1694506910110","+502 14166044","f"),
("nerea fernández", 29,"no disponible","1322894610110","+502 21288507","f"),
("carolina lópez", 38,"disponible","1623537110110","+502 18267888","f"),
("daniela martínez", 27,"disponible","1666171410110","+502 12617082","f"),
("ines sánchez", 33,"disponible","1318155810110","+502 17545593","f"),
("eva maria pérez", 27,"no disponible","2096335410110","+502 23425041","f"),
("maria victoria lópez", 22,"disponible","1575987010110","+502 14551420","f"),
("angeles pérez", 21,"no disponible","1251894110110","+502 13025662","f"),
("miriam garcía", 39,"disponible","1378268810110","+502 19468847","f"),
("lorena hernández", 25,"disponible","1239039210110","+502 15033754","f"),
("maria rosa morales", 43,"disponible","1664093410110","+502 12589303","f"),
("ana belen ramírez", 34,"disponible","2289543610110","+502 22163059","f"),
("maria elena gómez", 37,"no disponible","1904016010110","+502 12990454","f"),
("martina gonzález", 26,"disponible","1947665110110","+502 20227020","f")


select * from meseros


insert into eventos (fecha, hora, lugar, tipo, descripcion, tiempo_horas)
values (" 12/01/2021"," 13:00:00"," Antigua Event Center","boda","boda de la familia mercury",9),
(" 06/07/2023"," 15:00:00"," La Casa de los Sueños","15 años","15 años de la familia patzan",7),
(" 17/09/2021"," 16:00:00"," Xelajú Convention Center","bodas de plata","bodas de plata de la familia hernandez",7),
(" 29/11/2022"," 17:00:00"," Lake Atitlán Resort","bodas de oro","bodas de oro de la familia toma",6),
(" 11/02/2023"," 18:00:00"," Petén Jungle Lodge","gala benéfica","gala benéfica de la familia ramirez",5),
(" 22/04/2021"," 19:00:00"," Casa Santo Domingo","exposición","exposición de la familia mendez",8),
(" 28/11/2021"," 22:00:00"," La Reunión Golf Resort","bautizo","bautizo de la familia lopez",7),
(" 10/02/2022"," 23:00:00"," Hotel Camino Real Antigua","seminario","seminario de la familia torres",5),
(" 21/04/2023"," 24:00:00"," Hacienda Real Antigua","convivio","convivio de la familia addams",7),
(" 03/07/2021"," 13:00:00"," Finca Filadelfia Coffee Resort","boda","boda de la familia mercury",5),
(" 15/09/2022"," 14:00:00"," Vista Real Guatemala","cumpleaños","cumpleaños de la familia perez",8),
(" 27/11/2023"," 15:00:00"," Santo Domingo Del Cerro","15 años","15 años de la familia patzan",10),
(" 20/03/2022"," 17:00:00"," Casa Prana Lake Atitlán","bodas de oro","bodas de oro de la familia toma",9),
(" 01/07/2023"," 18:00:00"," Villa Sumaya","gala benéfica","gala benéfica de la familia ramirez",8),
(" 24/11/2022"," 20:00:00"," Hotel Atitlán","conferencia","conferencia de la familia soto",7),
(" 06/02/2023"," 21:00:00"," Barceló Guatemala City","graduación","graduación de la familia chavach",8),
(" 17/04/2021"," 22:00:00"," Casa Encantada","bautizo","bautizo de la familia lopez",10),
(" 29/06/2022"," 23:00:00"," Casa Santa Lucía","seminario","seminario de la familia torres",10),
(" 11/09/2023"," 24:00:00"," Eco Hotel Uxlabil Atitlán","convivio","convivio de la familia addams",9),
(" 23/11/2021"," 13:00:00"," The Westin Camino Real, Guatemala","boda","boda de la familia mercury",9),
(" 05/02/2022"," 14:00:00"," Hotel Bambú","cumpleaños","cumpleaños de la familia perez",5),
(" 16/04/2023"," 15:00:00"," Kawilal Hotel","15 años","15 años de la familia patzan",6),
(" 28/06/2021"," 16:00:00"," Porta Hotel Antigua","bodas de plata","bodas de plata de la familia hernandez",9),
(" 10/09/2022"," 17:00:00"," Villa Maya","bodas de oro","bodas de oro de la familia toma",8),
(" 22/11/2023"," 18:00:00"," Hotel Soleil Pacifico","gala benéfica","gala benéfica de la familia ramirez",6),
(" 03/01/2021"," 19:00:00"," Hotel Museo Spa Casa Santo Domingo","exposición","exposición de la familia mendez",10),
(" 14/03/2022"," 20:00:00"," Hotel Real Intercontinental Guatemala","conferencia","conferencia de la familia soto",9),
(" 26/06/2023"," 21:00:00"," Hotel Museo Uxlabil Atitlán","boda","boda de la familia chavach",10),
(" 07/09/2021"," 22:00:00"," Hotel EuroMaya Suites","cumpleaños","cumpleaños de la familia lopez",10),
(" 12/04/2021"," 13:00:00"," Hotel Aurora","bodas de oro","bodas de oro de la familia mercury",9),
(" 24/06/2022"," 14:00:00"," Hotel Posada de Don Rodrigo Panajachel","gala benéfica","gala benéfica de la familia perez",9),
(" 06/09/2023"," 15:00:00"," Hotel Las Farolas","exposición","exposición de la familia patzan",8),
(" 18/11/2021"," 16:00:00"," Hotel Grand Tikal Futura","conferencia","conferencia de la familia hernandez",8),
(" 30/01/2022"," 17:00:00"," Hotel Vista Real Guatemala","graduación","graduación de la familia toma",5),
(" 11/04/2023"," 18:00:00"," Hotel San Carlos","bautizo","bautizo de la familia ramirez",7),
(" 23/06/2021"," 19:00:00"," Hotel Clarion Suites Guatemala","seminario","seminario de la familia mendez",5),
(" 05/09/2022"," 20:00:00"," Hotel El Carmen","boda","boda de la familia soto",7),
(" 17/11/2023"," 21:00:00"," Hotel Stofella","cumpleaños","cumpleaños de la familia chavach",10),
(" 29/01/2021"," 22:00:00"," Hotel Barceló Guatemala City","15 años","15 años de la familia lopez",8),
(" 10/03/2022"," 23:00:00"," Hotel Casa Noble","bodas de plata","bodas de plata de la familia torres",6),
(" 22/06/2023"," 24:00:00"," Hotel Camino Real Tikal","bodas de oro","bodas de oro de la familia addams",7),
(" 03/09/2021"," 13:00:00"," Hotel Quinta de las Flores","gala benéfica","gala benéfica de la familia mercury",10),
(" 15/11/2022"," 14:00:00"," Hotel Casa Turquesa","exposición","exposición de la familia perez",10)


insert into eventos (fecha, hora, lugar, tipo, descripcion, motivo_cancel, tiempo_horas)
values ( "04/07/2022", "20:00:00"," El Convento Boutique Hotel","conferencia","conferencia de la familia soto","clima",9),
( "16/09/2023", "21:00:00"," Guatemala City Marriott Hotel","graduación","graduación de la familia chavach","incumplimiento del lugar",7),
( "09/01/2021", "16:00:00"," Casa Palopó","bodas de plata","bodas de plata de la familia hernandez","comunicación erronea",7),
( "12/09/2021", "19:00:00"," Cayman Suites Hotel","exposición","exposición de la familia mendez","seguridad",6),
( "19/11/2022", "23:00:00"," Hotel Casa Madeleine","15 años","15 años de la familia torres","incumplimiento de pago",9),
( "01/02/2023", "24:00:00"," Hotel Los Pasos","bodas de plata","bodas de plata de la familia addams","cambio de ultimo minuto",6)

select * from eventos

delete FROM eventos WHERE id_evento = 2

insert into contratos (estado_cumplimiento, metodo_pago, fecha_requerimiento, monto_pagado, id_cliente, id_vendedor, id_evento)
values ("programado","Tarjeta"," 24/09/2021",4971,7,4,3),
("completado","Efectivo"," 12/07/2020",3715,6,5,4),
("programado","Cheque"," 06/01/2023",4390,16,6,5),
("completado","Transferencia"," 17/03/2021",4225,1,3,6),
("programado","Tarjeta"," 29/05/2022",4197,14,1,7),
("completado","Efectivo"," 11/08/2022",3500,12,1,8),
("programado","Cheque"," 22/10/2020",4167,13,1,9),
("completado","Transferencia"," 28/05/2021",3342,3,3,10),
("programado","Tarjeta"," 10/08/2021",1816,6,7,11),
("completado","Efectivo"," 21/10/2022",2923,2,4,12),
("programado","Cheque"," 03/01/2021",2647,14,2,13),
("completado","Transferencia"," 15/03/2022",4442,15,3,14),
("programado","Tarjeta"," 27/05/2023",1520,11,7,15),
("completado","Efectivo"," 20/09/2021",3642,3,7,16),
("programado","Cheque"," 01/01/2023",3435,1,2,17),
("completado","Transferencia"," 24/05/2022",4225,11,7,18),
("programado","Tarjeta"," 06/08/2022",1999,12,3,19),
("completado","Efectivo"," 17/10/2020",1566,16,4,20),
("programado","Cheque"," 29/12/2021",3787,6,7,21),
("completado","Transferencia"," 10/03/2023",2151,5,1,22),
("programado","Tarjeta"," 23/05/2021",4906,7,3,23),
("completado","Efectivo"," 05/08/2022",4171,4,3,24),
("programado","Cheque"," 16/10/2023",1379,14,6,25),
("completado","Transferencia"," 28/12/2020",3020,2,1,26),
("programado","Tarjeta"," 09/03/2022",1184,9,5,27),
("completado","Efectivo"," 21/05/2023",1758,10,1,28),
("programado","Cheque"," 03/07/2020",3394,15,6,29),
("completado","Transferencia"," 14/09/2021",2297,4,5,30),
("programado","Tarjeta"," 26/12/2022",1896,1,7,31),
("completado","Efectivo"," 07/03/2021",3819,5,2,32),
("programado","Cheque"," 12/10/2020",2220,3,5,33),
("completado","Transferencia"," 24/12/2021",2834,10,3,34),
("programado","Tarjeta"," 06/03/2023",4459,8,6,35),
("completado","Efectivo"," 18/05/2021",3850,14,2,36),
("programado","Cheque"," 30/07/2022",2281,9,5,37),
("completado","Transferencia"," 11/10/2023",1800,4,3,38),
("programado","Tarjeta"," 23/12/2020",2249,1,4,39),
("completado","Efectivo"," 04/02/2022",4141,4,6,40),
("programado","Cheque"," 16/05/2023",3913,10,4,41),
("completado","Transferencia"," 28/07/2020",1108,3,5,42),
("programado","Tarjeta"," 10/10/2021",3459,9,2,43),
("completado","Efectivo"," 22/12/2022",3739,4,4,44),
("programado","Cheque"," 03/02/2020",4327,16,5,45),
("completado","Transferencia"," 14/08/2021",2741,16,2,46)

insert into contratos (estado_cumplimiento, metodo_pago, fecha_requerimiento, monto_pagado, id_cliente, id_vendedor, id_evento)
values ("cancelado",""," 26/11/2022",0,12,2,47),
("cancelado",""," 07/02/2023",0,3,5,48),
("cancelado",""," 04/01/2022",0,5,5,49),
("cancelado",""," 16/03/2023",0,4,6,50),
("cancelado",""," 09/07/2020",0,2,1,51),
("cancelado",""," 12/03/2021",0,8,7,52)

insert into contratos (id_servicio)
values ("P3")

select * from contratos

delete from contratos
WHERE id_contrato = '51'

-- consulta a
select * from contratos
WHERE substr(fecha_requerimiento, 5, 2) = '01'
--conculta b 


-- consulta c
select * from contratos
WHERE estado_cumplimiento = 'programado' or estado_cumplimiento = 'cancelado'

--consulta d
select vendedor.id_vendedor, vendedor.nombre, count(contratos.id_contrato) as total_contratos
from vendedor
join contratos on vendedor.id_vendedor = contratos.id_vendedor
group by vendedor.id_vendedor, vendedor.nombre

--consulta e

--consulta f






