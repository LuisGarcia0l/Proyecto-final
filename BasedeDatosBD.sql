drop database extras;
create database extras;
use extras;
create table Carnet(
idCarnet int not null auto_increment primary key,
nombreAC varchar(50),
nomProfesor varchar(50),
Periodo varchar(50),
Estado varchar(15)
);
create table ActividadCultural(
idAC int not null auto_increment primary key,
nombreAC varchar(50),
PeriodoIn date,
PeriodoFin date
);

create table Alum(
idAlum  int not null auto_increment primary key,
nombreAlum varchar(30),
apellidoAlum varchar(50),
matricula varchar(16),
foto varchar(200),
domicilio varchar(50),
correoElectronico varchar(50),
programaEducativo varchar(30),
cuatrimestre varchar(2),
numeroTelefono varchar(30),
nombreTutor varchar(50),
numAsistencias int,
numFaltas int,
idCarnet int,foreign key(idCarnet) references Carnet(idCarnet),
infoAdicional text,
alergias varchar(50),
enfermedadC varchar(50),
lesiones varchar(50),
visionPie varchar(50),
medicacion text,
grupoSanguineo varchar(10),
telefono varchar(12),
nombreAyuda varchar(50),
telefonoAyuda varchar(50),
parentescoAyuda varchar(20),
idAC int ,foreign key(idAC) references ActividadCultural(idAC),
contrasena varchar(50)
);
create table EventoMasivo(
idEventoMasivo int not null auto_increment primary key,
CodigoQr varchar(20),
NombreEM varchar(30),
FechaEvento date,
FotoEvidencia varchar(40),
idAlum int,foreign key(idAlum) references Alum(idAlum)
);
create table horario(
idHorario int not null auto_increment primary key,
dia enum('lunes','martes','miercoles','juevez','viernes','sabado'),
fecha date,
lugar varchar(30),
idAC int,foreign key(idAC) references ActividadCultural(idAC)
);
create table Horas(
idHoras int not null auto_increment primary key,
horaIn time,
horaFin time,
idHorario int,foreign key(idHorario) references Horario (idHorario)
);
create table Asistencia(
idAsistencia int not null auto_increment primary key,
nombreAlum varchar(50),
asistio varchar(2),
idHorario int,foreign key(idHorario) references Asistencia(idAsistencia)
);
create table Profesor(
idProfesor int not null auto_increment primary key,
nombreP varchar(20),
apellidoP varchar(30),
idAC int ,foreign key (idAC) references ActividadCultural(idAC)
);
insert into ActividadCultural(nombreAC,PeriodoIn,PeriodoFin) values
('charreria',230519,230919),
('Anime y Manga',230519,230919)
;
select *from ActividadCultural;
describe ActividadCultural;
describe Alum;
create view vwP as 
	select A.nombreAlum,A.apellidoAlum,A.matricula,AC.nombreAC
	from Alum as A,ActividadCultural as AC
	where A.idAC = AC.idAC;
create view vwEM as
	select A.nombreAlum,EM.CodigoQr,EM.FechaEvento,EM.FotoEvidencia from
	Alum as A,EventoMasivo as EM 
	where EM.idAlum = A.idAlum;
create view vwAyuda as
	select A.nombreAyuda,A.telefonoAyuda,A.parentescoAyuda
	from Alum as A;
create view vwMedicos as 
	select A.enfermedadC,A.medicacion,A.lesiones,A.alergias,A.infoAdicional,A.visionPie 
	from Alum as A;
create view vwHorarios as 
	select Hy.horaFin as salida,Hy.horaIn as entrada,Ho.fecha,Ho.lugar,AC.nombreAC 
	from Horas as HY, Horario as Ho,ActividadCultural as AC
	where Ho.idHorario = Hy.idHorario and AC.idAC = Ho.idAC;
create view vwCarnet as
	select C.nombreAC,C.Periodo,C.Estado,A.nombreAlum 
	from Carnet as C,Alum as A
	where A.idCarnet = C.idCarnet;
create view vwAsistencia as
	select A.nombreAlum,Ho.fecha,Asis.asistio
	from Alum as A ,Horario as Ho,Asistencia as Asis,ActividadCultural as AC
	where Asis.idHorario =Ho.idHorario and Ho.idAC =AC.idAC AND A.idAC=AC.idAC;



