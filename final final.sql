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
select * from contratos


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
set descripcion = "Cubre evento con los servicios de atención de 16 meseros"
where id_servicio = 2

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
values (" 12/01/2021"," 13:00:00"," Antigua Event Center","boda","Evento de boda en  Antigua Event Center",9),
(" 06/07/2023"," 15:00:00"," La Casa de los Sueños","15 años","Evento de 15 años en  La Casa de los Sueños",7),
(" 17/09/2021"," 16:00:00"," Xelajú Convention Center","bodas de plata","Evento de bodas de plata en  Xelajú Convention Center",7),
(" 29/11/2022"," 17:00:00"," Lake Atitlán Resort","bodas de oro","Evento de bodas de oro en  Lake Atitlán Resort",6),
(" 11/02/2023"," 18:00:00"," Petén Jungle Lodge","gala benéfica","Evento de gala benéfica en  Petén Jungle Lodge",5),
(" 22/04/2021"," 19:00:00"," Casa Santo Domingo","exposición","Evento de exposición en  Casa Santo Domingo",8),
(" 28/11/2021"," 22:00:00"," La Reunión Golf Resort","bautizo","Evento de bautizo en  La Reunión Golf Resort",7),
(" 10/02/2022"," 23:00:00"," Hotel Camino Real Antigua","seminario","Evento de seminario en  Hotel Camino Real Antigua",5),
(" 21/04/2023"," 24:00:00"," Hacienda Real Antigua","convivio","Evento de convivio en  Hacienda Real Antigua",7),
(" 03/07/2021"," 13:00:00"," Finca Filadelfia Coffee Resort","boda","Evento de boda en  Finca Filadelfia Coffee Resort",5),
(" 15/09/2022"," 14:00:00"," Vista Real Guatemala","cumpleaños","Evento de cumpleaños en  Vista Real Guatemala",8),
(" 27/11/2023"," 15:00:00"," Santo Domingo Del Cerro","15 años","Evento de 15 años en  Santo Domingo Del Cerro",10),
(" 20/03/2022"," 17:00:00"," Casa Prana Lake Atitlán","bodas de oro","Evento de bodas de oro en  Casa Prana Lake Atitlán",9),
(" 01/07/2023"," 18:00:00"," Villa Sumaya","gala benéfica","Evento de gala benéfica en  Villa Sumaya",8),
(" 24/11/2022"," 20:00:00"," Hotel Atitlán","conferencia","Evento de conferencia en  Hotel Atitlán",7),
(" 06/02/2023"," 21:00:00"," Barceló Guatemala City","graduación","Evento de graduación en  Barceló Guatemala City",8),
(" 17/04/2021"," 22:00:00"," Casa Encantada","bautizo","Evento de bautizo en  Casa Encantada",10),
(" 29/06/2022"," 23:00:00"," Casa Santa Lucía","seminario","Evento de seminario en  Casa Santa Lucía",10),
(" 11/09/2023"," 24:00:00"," Eco Hotel Uxlabil Atitlán","convivio","Evento de convivio en  Eco Hotel Uxlabil Atitlán",9),
(" 23/11/2021"," 13:00:00"," The Westin Camino Real, Guatemala","boda","Evento de boda en  The Westin Camino Real, Guatemala",9),
(" 05/02/2022"," 14:00:00"," Hotel Bambú","cumpleaños","Evento de cumpleaños en  Hotel Bambú",5),
(" 16/04/2023"," 15:00:00"," Kawilal Hotel","15 años","Evento de 15 años en  Kawilal Hotel",6),
(" 28/06/2021"," 16:00:00"," Porta Hotel Antigua","bodas de plata","Evento de bodas de plata en  Porta Hotel Antigua",9),
(" 10/09/2022"," 17:00:00"," Villa Maya","bodas de oro","Evento de bodas de oro en  Villa Maya",8),
(" 22/11/2023"," 18:00:00"," Hotel Soleil Pacifico","gala benéfica","Evento de gala benéfica en  Hotel Soleil Pacifico",6),
(" 03/01/2021"," 19:00:00"," Hotel Museo Spa Casa Santo Domingo","exposición","Evento de exposición en  Hotel Museo Spa Casa Santo Domingo",10),
(" 14/03/2022"," 20:00:00"," Hotel Real Intercontinental Guatemala","conferencia","Evento de conferencia en  Hotel Real Intercontinental Guatemala",9),
(" 26/06/2023"," 21:00:00"," Hotel Museo Uxlabil Atitlán","boda","Evento de boda en  Hotel Museo Uxlabil Atitlán",10),
(" 07/09/2021"," 22:00:00"," Hotel EuroMaya Suites","cumpleaños","Evento de cumpleaños en  Hotel EuroMaya Suites",10),
(" 12/04/2021"," 13:00:00"," Hotel Aurora","bodas de oro","Evento de bodas de oro en  Hotel Aurora",9),
(" 24/06/2022"," 14:00:00"," Hotel Posada de Don Rodrigo Panajachel","gala benéfica","Evento de gala benéfica en  Hotel Posada de Don Rodrigo Panajachel",9),
(" 06/09/2023"," 15:00:00"," Hotel Las Farolas","exposición","Evento de exposición en  Hotel Las Farolas",8),
(" 18/11/2021"," 16:00:00"," Hotel Grand Tikal Futura","conferencia","Evento de conferencia en  Hotel Grand Tikal Futura",8),
(" 30/01/2022"," 17:00:00"," Hotel Vista Real Guatemala","graduación","Evento de graduación en  Hotel Vista Real Guatemala",5),
(" 11/04/2023"," 18:00:00"," Hotel San Carlos","bautizo","Evento de bautizo en  Hotel San Carlos",7),
(" 23/06/2021"," 19:00:00"," Hotel Clarion Suites Guatemala","seminario","Evento de seminario en  Hotel Clarion Suites Guatemala",5),
(" 05/09/2022"," 20:00:00"," Hotel El Carmen","boda","Evento de boda en  Hotel El Carmen",7),
(" 17/11/2023"," 21:00:00"," Hotel Stofella","cumpleaños","Evento de cumpleaños en  Hotel Stofella",10),
(" 29/01/2021"," 22:00:00"," Hotel Barceló Guatemala City","15 años","Evento de 15 años en  Hotel Barceló Guatemala City",8),
(" 10/03/2022"," 23:00:00"," Hotel Casa Noble","bodas de plata","Evento de bodas de plata en  Hotel Casa Noble",6),
(" 22/06/2023"," 24:00:00"," Hotel Camino Real Tikal","bodas de oro","Evento de bodas de oro en  Hotel Camino Real Tikal",7),
(" 03/09/2021"," 13:00:00"," Hotel Quinta de las Flores","gala benéfica","Evento de gala benéfica en  Hotel Quinta de las Flores",10),
(" 15/11/2022"," 14:00:00"," Hotel Casa Turquesa","exposición","Evento de exposición en  Hotel Casa Turquesa",10)



insert into eventos (fecha, hora, lugar, tipo, descripcion, motivo_cancel, tiempo_horas)
values ( "04/07/2022", "20:00:00"," El Convento Boutique Hotel","conferencia","Evento de conferenciaen  El Convento Boutique Hotel","clima",9),
( "16/09/2023", "21:00:00"," Guatemala City Marriott Hotel","graduación","Evento de graduaciónen  Guatemala City Marriott Hotel","incumplimiento del lugar",7),
( "09/01/2021", "16:00:00"," Casa Palopó","bodas de plata","Evento de bodas de plataen  Casa Palopó","comunicación erronea",7),
( "12/09/2021", "19:00:00"," Cayman Suites Hotel","exposición","Evento de exposiciónen  Cayman Suites Hotel","seguridad",6),
( "19/11/2022", "23:00:00"," Hotel Casa Madeleine","15 años","Evento de 15 añosen  Hotel Casa Madeleine","incumplimiento de pago",9),
( "01/02/2023", "24:00:00"," Hotel Los Pasos","bodas de plata","Evento de bodas de plataen  Hotel Los Pasos","cambio de ultimo minuto",6),
(" 15/101/2022"," 14:00:00"," Hotel Casa Turquesa","boda","Evento de boda en  Hotel Casa Turquesa","cambio de ultimo minuto",10)

select * from eventos


insert into contratos (estado_cumplimiento, metodo_pago, fecha_requerimiento, monto_pagado, id_cliente, id_vendedor, id_evento)
values ("programado","Tarjeta"," 12/10/2020",4971,7,4,40),
("completado","Efectivo"," 06/04/2023",3715,6,5,2),
("programado","Cheque"," 17/06/2021",4390,16,6,16),
("completado","Transferencia"," 29/08/2022",4225,1,3,33),
("programado","Tarjeta"," 11/11/2022",4197,14,1,19),
("completado","Efectivo"," 22/01/2021",3500,12,1,13),
("programado","Cheque"," 28/08/2021",4167,13,1,34),
("completado","Transferencia"," 10/11/2021",3342,3,3,23),
("programado","Tarjeta"," 21/01/2023",1816,6,7,11),
("completado","Efectivo"," 03/04/2021",2923,2,4,40),
("programado","Cheque"," 15/06/2022",2647,14,2,35),
("completado","Transferencia"," 27/08/2023",4442,15,3,13),
("programado","Tarjeta"," 20/12/2021",1520,11,7,9),
("completado","Efectivo"," 01/04/2023",3642,3,7,12),
("programado","Cheque"," 24/08/2022",3435,1,2,33),
("completado","Transferencia"," 06/11/2022",4225,11,7,17),
("programado","Tarjeta"," 17/01/2021",1999,12,3,17),
("completado","Efectivo"," 29/03/2022",1566,16,4,28),
("programado","Cheque"," 11/06/2023",3787,6,7,21),
("completado","Transferencia"," 23/08/2021",2151,5,1,43),
("programado","Tarjeta"," 05/11/2021",4906,7,3,9),
("completado","Efectivo"," 16/01/2023",4171,4,3,29),
("programado","Cheque"," 28/03/2021",1379,14,6,5),
("completado","Transferencia"," 10/06/2022",3020,2,1,5),
("programado","Tarjeta"," 22/08/2023",1184,9,5,5),
("completado","Efectivo"," 03/10/2020",1758,10,1,36),
("programado","Cheque"," 14/12/2021",3394,15,6,29),
("completado","Transferencia"," 26/03/2023",2297,4,5,28),
("programado","Tarjeta"," 07/06/2021",1896,1,7,6),
("completado","Efectivo"," 12/01/2021",3819,5,2,8),
("programado","Cheque"," 24/03/2022",2220,3,5,31),
("completado","Transferencia"," 06/06/2023",2834,10,3,24),
("programado","Tarjeta"," 18/08/2021",4459,8,6,28),
("completado","Efectivo"," 30/10/2021",3850,14,2,8),
("programado","Cheque"," 11/01/2023",2281,9,5,22),
("completado","Transferencia"," 23/03/2021",1800,4,3,27),
("programado","Tarjeta"," 05/06/2022",2249,1,4,42),
("completado","Efectivo"," 17/08/2023",4141,4,6,17),
("programado","Cheque"," 29/10/2020",3913,10,4,7),
("completado","Transferencia"," 10/12/2021",1108,3,5,21),
("programado","Tarjeta"," 22/03/2023",3459,9,2,5),
("completado","Efectivo"," 03/06/2021",3739,4,4,23),
("programado","Cheque"," 15/08/2022",4327,16,5,41)


insert into contratos (estado_cumplimiento, metodo_pago, fecha_requerimiento, monto_pagado, id_cliente, id_vendedor, id_evento)
values ("cancelado",""," 4/04/2022",0,12,2,44),
("cancelado",""," 16/06/2023",0,3,5,45),
("cancelado",""," 9/10/2020",0,5,5,46),
("cancelado",""," 12/06/2021",0,4,6,47),
("cancelado",""," 19/08/2022",0,2,1,48),
("cancelado",""," 1/11/2022",0,8,7,49),
("cancelado","","15/07/2022",0,6,1,50)


select * from contratos


insert into servicio_contratado (id_servicio, id_contrato)
values (9,1),
(2,2),
(4,3),
(11,4),
(9,5),
(7,6),
(10,7),
(6,8),
(2,9),
(10,10),
(5,11),
(5,12),
(8,13),
(8,14),
(3,15),
(4,16),
(11,17),
(2,18),
(7,19),
(6,20),
(7,21),
(5,22),
(9,23),
(10,24),
(9,25),
(9,26),
(4,27),
(4,28),
(10,29),
(3,30),
(4,31),
(7,32),
(4,33),
(6,34),
(4,35),
(3,36),
(5,37),
(10,38),
(4,39),
(6,40),
(5,41),
(9,42),
(10,43),
(7,44),
(3,45),
(3,46),
(2,47),
(9,48),
(6,49),
(6,50)

select * from servicio_contratado


insert into meseros_asignados_evento (id_mesero, id_evento)
values (1,40),
(2,40),
(3,40),
(4,40),
(5,40),
(6,40),
(7,40),
(8,40),
(9,40),
(10,40),
(11,40),
(12,40),
(13,40),
(14,40),
(15,40),
(16,40),
(17,40),
(18,40),
(19,40),
(20,40),
(21,40),
(22,40),
(23,40),
(24,40),
(25,40),
(26,2),
(27,2),
(28,2),
(29,2),
(30,2),
(31,2),
(32,2),
(33,2),
(34,2),
(35,2),
(36,2),
(37,2),
(38,2),
(39,2),
(40,2),
(41,2),
(42,16),
(43,16),
(44,16),
(45,16),
(46,16),
(47,16),
(48,16),
(49,16),
(50,16),
(2,23),
(3,23),
(4,23),
(5,23),
(6,23),
(7,23),
(8,23),
(9,11),
(10,11),
(11,11),
(12,11),
(13,11),
(14,11),
(15,11),
(16,11),
(17,11),
(18,11),
(19,11),
(20,11),
(21,11),
(22,11),
(23,11),
(24,11),
(25,32),
(26,32),
(27,32),
(28,32),
(29,32),
(30,32),
(31,32),
(32,32),
(33,13),
(34,13),
(35,13),
(36,13),
(37,13),
(38,13),
(39,13),
(40,13),
(41,33),
(42,33),
(43,33),
(44,33),
(45,33),
(46,33),
(47,33),
(48,33),
(49,33),
(50,33),
(1,33),
(2,33),
(3,17),
(4,17),
(5,17),
(6,17),
(7,17),
(8,17),
(9,17),
(10,17),
(11,17),
(12,17),
(13,43),
(14,43),
(15,43),
(16,43),
(17,43),
(18,43),
(19,29),
(20,29),
(21,29),
(22,29),
(23,29),
(24,29),
(25,29),
(26,29),
(27,28),
(28,28),
(29,28),
(30,28),
(31,28),
(32,28),
(33,28),
(34,28),
(35,28),
(36,28),
(37,31),
(38,31),
(39,31),
(40,31),
(41,31),
(42,31),
(43,31),
(44,31),
(45,31),
(46,31),
(47,8),
(48,8),
(49,8),
(50,8),
(1,8),
(2,8),
(3,22),
(4,22),
(5,22),
(6,22),
(7,22),
(8,22),
(9,22),
(10,22),
(11,22),
(12,22),
(13,27),
(14,27),
(15,27),
(16,27),
(17,27),
(18,27),
(19,27),
(20,27),
(21,27),
(22,27),
(23,27),
(24,27),
(25,42),
(26,42),
(27,42),
(28,42),
(29,42),
(30,42),
(31,42),
(32,42),
(33,7),
(34,7),
(35,7),
(36,7),
(37,7),
(38,7),
(39,7),
(40,7),
(41,7),
(42,7),
(43,21),
(44,21),
(45,21),
(46,21),
(47,21),
(48,21),
(49,5),
(50,5),
(1,5),
(2,5),
(3,5),
(4,5),
(5,5),
(6,5),
(7,45),
(8,45),
(9,45),
(10,45),
(11,45),
(12,45),
(13,45),
(14,45),
(15,45),
(16,45),
(17,45),
(18,45),
(19,46),
(20,46),
(21,46),
(22,46),
(23,46),
(24,46),
(25,46),
(26,46),
(27,46),
(28,46),
(29,46),
(30,46),
(31,47),
(32,47),
(33,47),
(34,47),
(35,47),
(36,47),
(37,47),
(38,47),
(39,47),
(40,47),
(41,47),
(42,47),
(43,47),
(44,47),
(45,47),
(46,47),
(47,49),
(48,49),
(49,49),
(50,49),
(1,49),
(2,49),
(3,50),
(4,50),
(5,50),
(6,50),
(7,50),
(8,50)

select * from meseros_asignados_evento

-- consulta a
select * from contratos
WHERE substr(fecha_requerimiento, 5, 2) = '03'

--conculta b 
select s.nombre, COUNT(cs.id_contrato) as veces_contratado
from servicios s 
left join servicio_contratado cs on s.id_servicio = cs.id_servicio
GROUP BY s.nombre 

-- consulta c
select * from contratos
WHERE estado_cumplimiento = 'programado' or estado_cumplimiento = 'cancelado'

--consulta d
select vendedor.id_vendedor, vendedor.nombre, count(contratos.id_contrato) as total_contratos
from vendedor
join contratos on vendedor.id_vendedor = contratos.id_vendedor
group by vendedor.id_vendedor, vendedor.nombre

-- consulta e pendiente
SELECT m.nombre
from meseros m
join meseros_asignados_evento em on m.id_mesero = em.id_mesero
Join eventos e on em.id_evento = e.id_evento
WHERE 

--consulta f pendiente
select COUNT(*) as total_eventos
from contratos c 
inner join eventos e on c.id_evento = e.id_evento 
where STRFTIME('%d-%m-%y', e.fecha) BETWEEN '01/01/2020' and '12/12/2023'
and c.estado_cumplimiento = 'completado'

-- consulta g 
SELECT m.nombre as mesero, COUNT(em.id_evento) as total_eventos
from meseros m 
left join meseros_asignados_evento em on m.id_mesero = em.id_mesero 
GROUP BY m.nombre

-- consulta h pendiente
SELECT substr(e.fecha, 5, 2) = '07' as mes, COUNT(*) as total_eventos
from eventos e
group by mes
ORDER BY mes 

-- consulta i pendiente
select STRFTIME('%A', e.fecha) as dia_semana, COUNT(*) as total_eventos
from eventos e 
group by dia_semana
ORDER BY total_eventos DESC
limit 1

--consulta j
SELECT c.id_cliente, c.fecha_requerimiento, c.monto_pagado, v.nombre as nombre_vendedor, c2.nombre as nombre_cliente
from contratos c 
join vendedor v on c.id_vendedor = v.id_vendedor 
JOIN clientes c2 on c.id_cliente  = c2.id_cliente  

--consulta k 
UPDATE servicios
SET precio = 16500
WHERE nombre = "P2"

--consulta l 
UPDATE servicios
SET precio = precio * 1.1
WHERE precio > 15000;

--consulta m 
--individual
UPDATE servicios
SET nombre = 'D4'
WHERE nombre = 'P4';
--en conjunto
UPDATE servicios
SET nombre = 
    CASE
        WHEN nombre = 'P4' THEN 'D4'
        WHEN nombre = 'P5' THEN 'D5'
    END
WHERE nombre IN ('P4', 'P5');

--consulta n
--crear la columna primero
ALTER TABLE servicios
ADD COLUMN estado_servicio INTEGER DEFAULT "activo";
--cambiar el estado del servicio P6
UPDATE servicios
SET estado_servicio = "desactivado"
WHERE nombre = 'P6';

--consulta o 
SELECT c.fecha_requerimiento
from contratos c 
join servicio_contratado sc on c.id_contrato = sc.id_contrato 
join servicios s on s.id_servicio = sc.id_servicio 
where s.nombre  = 'P6'
ORDER BY c.fecha_requerimiento DESC
LIMIT 1

--consulta p 
SELECT m.genero, COUNT(*) as cantidad
from meseros m 
join meseros_asignados_evento mae on m.id_mesero = mae.id_mesero
GROUP by genero 
ORDER BY cantidad DESC
LIMIT 1

--consulta q 
SELECT m.id_mesero, COUNT(*) * tiempo_horas as horas_trabajadas
from meseros m 
join meseros_asignados_evento mae on m.id_mesero = mae.id_mesero 
join eventos e on mae.id_evento = e.id_evento 
where substr(e.fecha , 5, 2) = '02'
GROUP BY m.id_mesero 

--consulta r 
SELECT m.nombre, m.dpi, m.edad, m.disponibilidad, COUNT(*) * e2.tiempo_horas as horas_trabajadas
from meseros m 
join eventos e2 on e2.id_evento = mae.id_evento 
join meseros_asignados_evento mae ON m.id_mesero = mae.id_mesero 
JOIN (
select AVG(e.tiempo_horas) as duracion_evento
from eventos e
WHERE strftime('&Y', fecha) = STRFTIME('%Y', 'now', '-1 year')
) as horas_evento
WHERE STRFTIME('%Y', e2.fecha) = STRFTIME('%Y', 'now', '-1 year')
GROUP  by m.id_mesero 


select * from eventos e
