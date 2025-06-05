CREATE TABLE dmnsMesa (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Bandera INT , H INT , ID VARCHAR(10), Mesero VARCHAR(32), Notas VARCHAR(4096), Personas INT , W INT , X INT , Y INT , IZona INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE dmnsZona (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Archivo VARCHAR(255), Color INT , Fumar BOOL , ID VARCHAR(5), Mesero VARCHAR(32), Notas VARCHAR(4096),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE dmnsBarra (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK),Nombre VARCHAR(50),Tipo INT,Opciones TEXT(500));
CREATE TABLE dmnsAsignBarra (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Tipo INT, FK INT, FKBarra INT, Auto INT);
CREATE TABLE dmnsPWDAgente (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), FKAgente INT, PWD VARCHAR(50), Cadena VARCHAR(255), Img BLOB);

ALTER TABLE dmnsMesa ADD CONSTRAINT RLdmnsMesaIZona_dmnsZonaSys_PK FOREIGN KEY  (IZona ) REFERENCES dmnsZona(Sys_PK);


INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (4,'cXEntregar');
INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (5,'cEnReparto');