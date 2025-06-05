CREATE TABLE Agente (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(10), CodNomina VARCHAR(50), eMail VARCHAR(50), Nombre VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(2048), PComision FLOAT , Telefono VARCHAR(150), Domicilio1 INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Almacen (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(10), Descripcion VARCHAR(50) NOT NULL  UNIQUE , eMail VARCHAR(50), Fax VARCHAR(150), Telefonos VARCHAR(150), WebSite VARCHAR(150), Domicilio1 INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE AplCxC (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Destino INT  NOT NULL , Fecha DATE  NOT NULL , Importe DOUBLE , AplicadoA INT  NOT NULL , FK_DCxC_AplicadoA INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE AplCxP (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Destino INT  NOT NULL , Fecha DATE  NOT NULL , Importe DOUBLE , AplicadoA INT  NOT NULL , FK_DCxP_AplicadoA INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Banco (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Nombre VARCHAR(50), Notas VARCHAR(2048), WebSite VARCHAR(150), Contacto INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE BlockDocumentos (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Activo BOOL  NOT NULL , Datos VARCHAR(255), Documento INT  NOT NULL , FInicial INT  NOT NULL , Fiscal BOOL  NOT NULL , FUltimo INT  NOT NULL , IDControl VARCHAR(32), NumControl INT , Serie VARCHAR(3) NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Caja (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(5), Descripcion VARCHAR(50) UNIQUE , Notas VARCHAR(2048), CentroConsumo INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cajero (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(10), CodNomina VARCHAR(50), Contrasena VARCHAR(32) NOT NULL , eMail VARCHAR(50), Nombre VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(2048), Telefono VARCHAR(150), Domicilio1 INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cardex (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Aplicado BOOL , Descripcion VARCHAR(8192), Fecha DATE , Referencia VARCHAR(250), Valuado BOOL , DocCompra INT , DocOrden INT , DocVenta INT , ICategoria INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Categoria (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(5), Descripcion VARCHAR(50) NOT NULL  UNIQUE , PMensual DOUBLE , Tipo INT , Padre INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE CConsumo (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(2048), Precio INT , IAlmacen INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE cfgImpuesto (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), I1Compra VARCHAR(4096), I1Venta VARCHAR(4096), I2Compra VARCHAR(4096), I2Venta VARCHAR(4096), I3Compra VARCHAR(4096), I3Venta VARCHAR(4096), I4Compra VARCHAR(4096), I4Venta VARCHAR(4096), Nombre VARCHAR(25),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE Chequera (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CLABE VARCHAR(18), CodCuenta VARCHAR(50), Nombre VARCHAR(25), Notas VARCHAR(4096), NumCuenta VARCHAR(25), IBanco INT , IDivisa INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Ciudad (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(8), CodigoTel VARCHAR(5), Nombre VARCHAR(50) NOT NULL , Estado INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cliente (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(35), CURP VARCHAR(25), Descuento FLOAT , DiasCredito INT , eMail VARCHAR(80), Fax VARCHAR(150), LimiteCredito DOUBLE , Monedero DOUBLE , Nombre VARCHAR(150) NOT NULL  UNIQUE , Notas VARCHAR(32000), Precio INT , Puntos DOUBLE , RFC VARCHAR(15), Saldo DOUBLE , SaldoPuntos DOUBLE , Status INT , Telefonos VARCHAR(150), WebSite VARCHAR(150), Agente INT , Contacto1 INT , Contacto2 INT , Contacto3 INT , Domicilio1 INT , Domicilio2 INT , Domicilio3 INT , IDivisa INT  NOT NULL , Tipo INT  NOT NULL , Zona INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE CLoteXAlmacen (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT  NOT NULL , IAlmacen INT  NOT NULL , FK_Lote_ExisXAlmacen INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Compra (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Auditado BOOL , Contabilizado BOOL , Descuento1 DOUBLE , Descuento2 DOUBLE , Directos DOUBLE , Documento INT  NOT NULL , Fecha DATE , FEmbarque DATE , FEntrega DATE , FLiquidacion DATE , FormaPago INT  NOT NULL , FUltimoPago DATE , Impuesto1 DOUBLE  NOT NULL , Impuesto2 DOUBLE  NOT NULL , Impuesto3 DOUBLE  NOT NULL , Impuesto4 DOUBLE  NOT NULL , Indirectos DOUBLE , Notas VARCHAR(32000), Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(25) NOT NULL , StatusAdministrativo INT  NOT NULL , StatusEntrega INT  NOT NULL , StatusFacturacion INT  NOT NULL , StatusFinanciero INT  NOT NULL , Subtotal DOUBLE  NOT NULL , TipoCambio DOUBLE  NOT NULL , Vencimiento DATE , AplicadoA INT , IAlmacen INT  NOT NULL , IDivisa INT  NOT NULL , IMovCaja INT , IMovChequera INT , IProveedor INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Contacto (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Apellidos VARCHAR(50) NOT NULL , eMail1 VARCHAR(50), eMail2 VARCHAR(50), eMail3 VARCHAR(50), eMail4 VARCHAR(50), Empresa VARCHAR(50), Nombre VARCHAR(50) NOT NULL , Notas VARCHAR(32000), Puesto VARCHAR(30), Tel1 VARCHAR(50), Tel2 VARCHAR(50), Tel3 VARCHAR(50), Tratamiento VARCHAR(5), WebSite VARCHAR(150), Domicilio1 INT , Domicilio2 INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Corte (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cerrado BOOL , FApertura DATE  NOT NULL , FCierre DATE , HApertura DATETIME  NOT NULL , HCierre DATETIME , ICaja INT  NOT NULL , ICajero INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE CProduccion (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Descripcion VARCHAR(30) NOT NULL  UNIQUE , AlmacenMP INT  NOT NULL , AlmacenPT INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cupon (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(32), FechaAlta DATE , FechaUso DATE , Status INT  NOT NULL , Tipo INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DAdic2 (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT , CDirecto DOUBLE , CIndirecto DOUBLE , CManoObra DOUBLE , CMaquinaria DOUBLE , Notas VARCHAR(255), Precio DOUBLE , IProducto INT , FK_DAdicionales_IAdicionales INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DAdicionales (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT , CDirecto DOUBLE , CIndirecto DOUBLE , CManoObra DOUBLE , CMaquinaria DOUBLE , Notas VARCHAR(255), Precio DOUBLE , IProducto INT  NOT NULL , FK_DOrden_Adicionales INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCantidades (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad INT  NOT NULL , IProducto INT  NOT NULL , FK_DOrden_CantidadesVariadas INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCapa (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT  NOT NULL , Costo DOUBLE  NOT NULL , PKEntrada INT  NOT NULL , FK_DCardex_Capas INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCardex (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Abonos FLOAT , Auditado BOOL , Cargos FLOAT , Contabilizado BOOL , CPromedio DOUBLE , Entradas FLOAT , Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(30), Resto FLOAT , Salidas FLOAT , TipoCambio DOUBLE  NOT NULL , Valuado BOOL , IAlmacen INT  NOT NULL , ILote INT , IProducto INT  NOT NULL , ISerie INT , RCompra INT , RVenta INT , FK_Cardex_Movimientos INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCheques (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Banco VARCHAR(50) NOT NULL , Beneficiario VARCHAR(250) NOT NULL , Emisor VARCHAR(50) NOT NULL , Importe DOUBLE  NOT NULL , Notas VARCHAR(50), Numero VARCHAR(5) NOT NULL , TipoCambio DOUBLE  NOT NULL , IDivisa INT  NOT NULL , Retiro INT , FK_MovCaja_DetalleCheques INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCompra (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT  NOT NULL , CostoTotal DOUBLE , Descuento1 DOUBLE , Descuento2 DOUBLE , Factor FLOAT , Impuesto1 DOUBLE , Impuesto2 DOUBLE , Impuesto3 DOUBLE , Impuesto4 DOUBLE , Notas VARCHAR(255), Precio DOUBLE , Status INT  NOT NULL , TipoCambio DOUBLE  NOT NULL , Unidad VARCHAR(10) NOT NULL , XFacturar FLOAT , Documento INT , IProducto INT  NOT NULL , FK_Compra_Detalle INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCxC (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Aplicable BOOL , Aplicacion DATE , Auditado BOOL , BaseCM INT , Bonificaciones DOUBLE , Contabilizado BOOL , Debe DOUBLE , Documento INT  NOT NULL , Fecha DATE , FUltMoratorios DATE , Haber DOUBLE , IntFinancieros DOUBLE , IntMoratorios DOUBLE , Notas VARCHAR(4096), Pagos DOUBLE , Partida VARCHAR(32), Poliza VARCHAR(32), porImpuestoCap FLOAT , porImpuestoFin FLOAT , porImpuestoMor FLOAT , Referencia VARCHAR(50) NOT NULL , RelacionadoA INT , TasaMoratorios FLOAT , TipoCambio DOUBLE , XAplicar DOUBLE , ICliente INT  NOT NULL , IFolio INT , IFolioIFin INT , IMovCaja INT , IVenta INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCxP (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Aplicable BOOL , Aplicacion DATE  NOT NULL , Auditado BOOL , BaseCM INT , Bonificaciones DOUBLE , Contabilizado BOOL , Debe DOUBLE , Documento INT  NOT NULL , Fecha DATE  NOT NULL , FUltMoratorios DATE , Haber DOUBLE , IntFinancieros DOUBLE , IntMoratorios DOUBLE , Notas VARCHAR(3200), Pagos DOUBLE , Partida VARCHAR(32), Poliza VARCHAR(32), porImpuestoCap FLOAT , porImpuestoFin FLOAT , porImpuestoMor FLOAT , Referencia VARCHAR(50) NOT NULL , RelacionadoA INT , TasaMoratorios FLOAT , TipoCambio DOUBLE  NOT NULL , XAplicar DOUBLE , ICompra INT , IMovCaja INT , IMovChequera INT , IProveedor INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DDepositos (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Banco VARCHAR(50) NOT NULL , Fecha DATE  NOT NULL , Importe DOUBLE  NOT NULL , Referencia VARCHAR(50), TipoCambio DOUBLE  NOT NULL , IDivisa INT  NOT NULL , Retiro INT , FK_MovCaja_DetalleDepositos INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Departamento (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Comision1 FLOAT , Comision2 FLOAT , Comision3 FLOAT , Comision4 FLOAT , Comision5 FLOAT , Descripcion VARCHAR(50) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Divisa (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Descripcion VARCHAR(30) NOT NULL  UNIQUE , TCambio FLOAT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Domicilio (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CodPos VARCHAR(10), Colonia VARCHAR(150), Direccion VARCHAR(1024), Notas VARCHAR(150), Telefonos VARCHAR(150), ICiudad INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DOrden (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT , CDirecto DOUBLE , CIndirecto DOUBLE , CManoObra DOUBLE , CMaquinaria DOUBLE , D1 DOUBLE , D2 DOUBLE , Especificaciones VARCHAR(4096), Precio DOUBLE , TiempoProduccion INT , TiempoServicio INT , TipoCambio DOUBLE  NOT NULL , IDivisa INT  NOT NULL , IProducto INT  NOT NULL , FK_Orden_Detalle INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DTabla (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Col1 FLOAT , Col10 FLOAT , Col2 FLOAT , Col3 FLOAT , Col4 FLOAT , Col5 FLOAT , Col6 FLOAT , Col7 FLOAT , Col8 FLOAT , Col9 FLOAT , Etiqueta VARCHAR(50), FK_Tabla_Filas INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DTarjeta (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Autorizacion VARCHAR(50), CVV VARCHAR(10), Domicilio VARCHAR(1024), Importe DOUBLE  NOT NULL , Nombre VARCHAR(50), Numero VARCHAR(32), TipoCambio DOUBLE  NOT NULL , IDivisa INT  NOT NULL , Retiro INT , Tipo INT  NOT NULL , FK_MovCaja_DetalleTarjetas INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DVales (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Fecha DATE , Importe DOUBLE , Notas VARCHAR(50), Referencia VARCHAR(50) NOT NULL , TipoCambio DOUBLE , IDivisa INT  NOT NULL , Retiro INT , FK_MovCaja_DetalleVales INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DVenta (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cantidad FLOAT , Descuento1 DOUBLE , Descuento2 DOUBLE , Factor FLOAT , Impuesto1 DOUBLE , Impuesto2 DOUBLE , Impuesto3 DOUBLE , Impuesto4 DOUBLE , Notas VARCHAR(255), Precio DOUBLE  NOT NULL , Status INT  NOT NULL , TipoCambio DOUBLE  NOT NULL , Unidad VARCHAR(10), XFacturar FLOAT , XSalir FLOAT , Documento INT , IAlmacen INT  NOT NULL , IProducto INT  NOT NULL , FK_Venta_Detalle INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE EdoProv (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(8), Nombre VARCHAR(50) NOT NULL , IPais INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Existencias (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Existencia FLOAT , Saldo DOUBLE , IAlmacen INT  NOT NULL , FK_Producto_IExistencias INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE FoliosDocumentos (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Cancelado BOOL  NOT NULL , Fecha DATE  NOT NULL , Folio INT  NOT NULL , Block INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE GrupoClientes (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Nombre VARCHAR(25), Notas VARCHAR(4096),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE GrupoProductos (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Comision1 FLOAT , Comision2 FLOAT , Comision3 FLOAT , Comision4 FLOAT , Comision5 FLOAT , Nombre VARCHAR(25), Notas VARCHAR(4096),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE GrupoProveedores (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Nombre VARCHAR(25), Notas VARCHAR(4096),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE Guia (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Alto FLOAT , Ancho FLOAT , Costo DOUBLE , Deducible DOUBLE , Dias INT , EnAtencion VARCHAR(50), Estado INT  NOT NULL , FCompra DATE , FEmbarque DATE , FEntrega DATE , Largo FLOAT , Notas VARCHAR(2048), Numero VARCHAR(50), Peso FLOAT , SumaAsegurada DOUBLE , IDivisa INT , IDomicilio INT  NOT NULL , IPorteador INT  NOT NULL , IRepartidor INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE IEnsamble (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CantDemasiado FLOAT , Cantidad FLOAT  NOT NULL , CantMucho FLOAT , CantPoco FLOAT , Omitible BOOL , Elemento INT  NOT NULL , Reemplazo INT , FK_Producto_Elementos INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE IVariable (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CDirectoProm DOUBLE , CIndirectoProm DOUBLE , CManoObraProm DOUBLE , CMaquinariaProm DOUBLE , Descripcion VARCHAR(35), Factor FLOAT , Maximo FLOAT , Minimo FLOAT , PAdicional INT , Grupo INT , FK_Producto_IVariables INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Linea (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Clase INT  NOT NULL , Codigo VARCHAR(15), Color INT , Comision1 FLOAT , Comision2 FLOAT , Comision3 FLOAT , Comision4 FLOAT , Comision5 FLOAT , Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(4096), Visible BOOL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Lote (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Entradas FLOAT , Existencia FLOAT , FCaducidad DATE , FEntrada DATE , Numero VARCHAR(50), IProducto INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Marca (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Descripcion VARCHAR(50) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Monedero (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Descripcion VARCHAR(35), Fecha DATE , Puntos DOUBLE , ICliente INT  NOT NULL , IVenta INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE MovCaja (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Auditado BOOL , Cheques DOUBLE , Contabilizado BOOL , Depositos DOUBLE , Documento INT  NOT NULL , Efectivo DOUBLE , Fecha DATE  NOT NULL , Hora DATETIME  NOT NULL , Notas VARCHAR(255), Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(50) NOT NULL , Tarjetas DOUBLE , TipoCambio DOUBLE  NOT NULL , Vales DOUBLE , ICategoria INT  NOT NULL , ICorte INT  NOT NULL , IDivisa INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE MovCuenta (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Aplicacion DATE , Auditado BOOL , Beneficiario VARCHAR(150), Cancelado BOOL , Conciliado BOOL , Contabilizado BOOL , Egreso DOUBLE , Fecha DATE , Ingreso DOUBLE , Notas VARCHAR(4096) NOT NULL , Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(50), Tipo INT  NOT NULL , ICategoria INT  NOT NULL , ICuenta INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Orden (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Auditada BOOL , CDirecto DOUBLE , CIndirecto DOUBLE , CManoObra DOUBLE , CMaquinaria DOUBLE , Contabilizada BOOL , D1 DOUBLE , D2 DOUBLE , Fecha DATE , FPrevista DATE , FProduccion DATE , Hora DATETIME , HPrevista DATETIME , HProduccion DATETIME , Importe DOUBLE , Notas VARCHAR(4096), Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(50), Status INT  NOT NULL , TiempoProduccion INT , TiempoServicio INT , TipoCambio DOUBLE , IAgente INT , ICConsumo INT  NOT NULL , ICProduccion INT  NOT NULL , IDivisa INT , IVenta INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Pais (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(8), CodigoTel VARCHAR(5), Nombre VARCHAR(50),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE Porteador (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(2048), IProveedor INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE PrecioVenta (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Limite FLOAT , Precio DOUBLE , Producto INT  NOT NULL , FK_Cliente_ListaPrecios INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Producto (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Adicional BOOL , CDirecto DOUBLE  NOT NULL , CIndirecto DOUBLE  NOT NULL , CManoObra DOUBLE  NOT NULL , CMaquinaria DOUBLE  NOT NULL , CodBar1 VARCHAR(35), CodBar2 VARCHAR(35), CodBar3 VARCHAR(35), Codigo VARCHAR(35), Color INT , Comision FLOAT , Comision1 FLOAT , Comision2 FLOAT , Comision3 FLOAT , Comision4 FLOAT , Comision5 FLOAT , CostoPromedio DOUBLE , CostoUltimo DOUBLE  NOT NULL , Data1 VARCHAR(500), Data2 VARCHAR(500), Data3 VARCHAR(500), Desc2 FLOAT , Desc3 FLOAT , Desc4 FLOAT , Desc5 FLOAT , Descripcion VARCHAR(150) NOT NULL  UNIQUE , DiasEntrega INT , Existencia FLOAT , FactorB FLOAT  NOT NULL , FactorC FLOAT , FactorD FLOAT , FactorE FLOAT , flagLimites BOOL , flagUtilidad BOOL , FormaComision INT , IClase INT  NOT NULL , ITipo INT  NOT NULL , Lim2 FLOAT , Lim3 FLOAT , Lim4 FLOAT , Lim5 FLOAT , Maximo FLOAT , MetodoValuacion INT  NOT NULL , Minimo FLOAT , Notas VARCHAR(4096), PAdic1 DOUBLE , PAdic2 DOUBLE , PAdic3 DOUBLE , PAdic4 DOUBLE , PAdic5 DOUBLE , PPuntos DOUBLE , Precio1 DOUBLE  NOT NULL , Precio2 DOUBLE  NOT NULL , Precio3 DOUBLE  NOT NULL , Precio4 DOUBLE  NOT NULL , Precio5 DOUBLE  NOT NULL , PuntoRO FLOAT , ReqLote BOOL  NOT NULL , ReqSerie BOOL  NOT NULL , Saldo DOUBLE  NOT NULL , TipoComision INT , Unidad VARCHAR(10) NOT NULL , UnidadB VARCHAR(10), UnidadC VARCHAR(10), UnidadD VARCHAR(10), UnidadE VARCHAR(10), Util1 FLOAT , Util2 FLOAT , Util3 FLOAT , Util4 FLOAT , Util5 FLOAT , UtilMin FLOAT , VincularData BOOL , Visible BOOL , IDepartamento INT , IDivisa INT  NOT NULL , ILinea INT  NOT NULL , IMarca INT , Impuestos INT  NOT NULL , Proveedor1 INT , Proveedor2 INT , Proveedor3 INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Promocion (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Activa BOOL , Ambito INT  NOT NULL , CantidadVigencia FLOAT , Codigo VARCHAR(15), Domingo BOOL , DomingoFinal DATETIME , DomingoInicio DATETIME , Excepcion INT  NOT NULL , Excluyente BOOL , FechaInicio DATE  NOT NULL , FechaVigencia DATE , ItemAmbito VARCHAR(32), ItemExcepcion VARCHAR(32), ItemRestriccion VARCHAR(32), Jueves BOOL , JuevesFinal DATETIME , JuevesInicio DATETIME , LibreEleccion BOOL , Lunes BOOL , LunesFinal DATETIME , LunesInicio DATETIME , Martes BOOL , MartesFinal DATETIME , MartesInicio DATETIME , Miercoles BOOL , MiercolesFinal DATETIME , MiercolesInicio DATETIME , Nombre VARCHAR(50), Restriccion INT  NOT NULL , Sabado BOOL , SabadoFinal DATETIME , SabadoInicio DATETIME , Tipo INT  NOT NULL , Var1 FLOAT , Var2 FLOAT , Viernes BOOL , ViernesFinal DATETIME , ViernesInicio DATETIME , Vigencia INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Proveedor (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(35), CURP VARCHAR(35), DiasCredito INT , DiasEntrega INT , eMail VARCHAR(50), Fax VARCHAR(50), LimiteCredito DOUBLE , Nombre VARCHAR(150) NOT NULL  UNIQUE , Notas VARCHAR(32000), RFC VARCHAR(15), Saldo DOUBLE , Status INT , TasaIVA INT  NOT NULL , Telefonos VARCHAR(50), WebSite VARCHAR(150), Contacto1 INT , Contacto2 INT , Contacto3 INT , Domicilio1 INT , Domicilio2 INT , Domicilio3 INT , IDivisa INT  NOT NULL , IZona INT , Tipo INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Repartidor (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), CodNomina VARCHAR(50), eMail VARCHAR(50), Nombre VARCHAR(50), Notas VARCHAR(4096), Telefono VARCHAR(50), Domicilio1 INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Serie (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), FEntrada DATE , FVenta DATE , Notas VARCHAR(4096), Numero VARCHAR(50), Status INT  NOT NULL , DocCompra INT , DocVenta INT , IAlmacen INT , IEnsamble INT , ILote INT , IProducto INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Tabla (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Col1 VARCHAR(15), Col10 VARCHAR(15), Col2 VARCHAR(15), Col3 VARCHAR(15), Col4 VARCHAR(15), Col5 VARCHAR(15), Col6 VARCHAR(15), Col7 VARCHAR(15), Col8 VARCHAR(15), Col9 VARCHAR(15), Etiqueta BOOL , nColumnas INT , nFilas INT , Nombre VARCHAR(10),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE TarjetaCredito (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(5), Descripcion VARCHAR(25) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TasaFija (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Nombre VARCHAR(10), Valor FLOAT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TasaVariable (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Nombre VARCHAR(10), ITabla INT  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TipoCliente (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(15), Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(4096),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE TipoCupon (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Caducidad INT , Nombre VARCHAR(25), Notas VARCHAR(4096), Tipo INT , UsoIlimitado BOOL , Valor FLOAT , IDivisa INT , IProducto INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TipoProveedor (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Codigo VARCHAR(15), Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(4096),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE Venta (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Auditado BOOL , Contabilizado BOOL , Descuento1 DOUBLE , Descuento2 DOUBLE , dmnsMesa VARCHAR(45), dmnsNota VARCHAR(255), dmnsPersonas INT , Documento INT  NOT NULL , DomicilioEntrega VARCHAR(255), Fecha DATE  NOT NULL , FEmbarque DATE , FEntrega DATE , FLiquidacion DATE , FormaPago INT  NOT NULL , FUltimoCobro DATE , ImporteAdicional DOUBLE , Impuesto1 DOUBLE , Impuesto2 DOUBLE , Impuesto3 DOUBLE , Impuesto4 DOUBLE , Notas VARCHAR(32000), Partida VARCHAR(32), PComision FLOAT , Poliza VARCHAR(32), Referencia VARCHAR(25), StatusAdministrativo INT , StatusEntrega INT , StatusFacturacion INT , StatusFinanciero INT , Subtotal DOUBLE , TipoCambio DOUBLE  NOT NULL , TipoDomicilio INT , txtGuia VARCHAR(150), Vencimiento DATE , AplicadoA INT , IAgente INT , ICaja INT , ICConsumo INT  NOT NULL , ICliente INT  NOT NULL , ICorte INT , IDivisa INT  NOT NULL , IFolio INT  NOT NULL , IGuia INT , IMovCaja INT , IPorteador INT , IRepartidor INT,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Zona (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , Sys_GUID VARCHAR(32), Sys_DTCreated DATETIME , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported BOOL , Sys_DTExported DATETIME , Sys_Info VARCHAR(32), Nombre VARCHAR(30), Notas VARCHAR(255),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE CConsumo_CProduccion_ (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , ICProduccion INT  NOT NULL , IConsumo INT  NOT NULL );
CREATE TABLE Cliente_GrupoClientes_ (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , IGrupos INT  NOT NULL , IClientes INT  NOT NULL );
CREATE TABLE CProduccion_Producto_ (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , IProductos INT  NOT NULL , ICentrosProduccion INT  NOT NULL );
CREATE TABLE GrupoProductos_Producto_ (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , IProductos INT  NOT NULL , IGrupos INT  NOT NULL );
CREATE TABLE GrupoProveedores_Proveedor_ (Sys_PK INT  NOT NULL AUTO_INCREMENT, PRIMARY KEY (Sys_PK), Sys_TimeStamp DATETIME  NOT NULL , IProveedores INT  NOT NULL , IGrupos INT  NOT NULL );
CREATE TABLE cAmbitoPromociones (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cBCIMoratorios (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cCantidades (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cClaseProducto (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cDiasXMes (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cDocumentos (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cExcepcionPromociones (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cFormaComisionProducto (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cFormasPago (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cImpAdicionales (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cMetodosValuacion (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cPeriodicidades (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cRestriccionPromociones (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusAdministrativos (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusCupon (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusDetalleCompra (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusDetalleVenta (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusEntrega (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusFacturacion (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusFinancieros (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusGuias (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusOrdenProduccion (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusOrg (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cStatusSeries (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTasasIVA (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTipoProducto (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTiposCategorias (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTiposComisionesProducto (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTiposInteres (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTiposPromociones (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTiposRegalos (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cTipoValorCupon (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));
CREATE TABLE cVigenciasPromociones (ID INT  NOT NULL, PRIMARY KEY (ID), Const VARCHAR(255));















































































































ALTER TABLE Agente ADD CONSTRAINT RLAgenteDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Almacen ADD CONSTRAINT RLAlmacenDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE AplCxC ADD CONSTRAINT RLAplCxCAplicadoA_DCxCSys_PK FOREIGN KEY  (AplicadoA ) REFERENCES DCxC(Sys_PK);
ALTER TABLE AplCxP ADD CONSTRAINT RLAplCxPAplicadoA_DCxPSys_PK FOREIGN KEY  (AplicadoA ) REFERENCES DCxP(Sys_PK);
ALTER TABLE Banco ADD CONSTRAINT RLBancoContacto_ContactoSys_PK FOREIGN KEY  (Contacto ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Caja ADD CONSTRAINT RLCajaCentroConsumo_CConsumoSys_PK FOREIGN KEY  (CentroConsumo ) REFERENCES CConsumo(Sys_PK);
ALTER TABLE Cajero ADD CONSTRAINT RLCajeroDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Cardex ADD CONSTRAINT RLCardexDocCompra_CompraSys_PK FOREIGN KEY  (DocCompra ) REFERENCES Compra(Sys_PK);
ALTER TABLE Cardex ADD CONSTRAINT RLCardexDocOrden_OrdenSys_PK FOREIGN KEY  (DocOrden ) REFERENCES Orden(Sys_PK);
ALTER TABLE Cardex ADD CONSTRAINT RLCardexDocVenta_VentaSys_PK FOREIGN KEY  (DocVenta ) REFERENCES Venta(Sys_PK);
ALTER TABLE Cardex ADD CONSTRAINT RLCardexICategoria_CategoriaSys_PK FOREIGN KEY  (ICategoria ) REFERENCES Categoria(Sys_PK);
ALTER TABLE Categoria ADD CONSTRAINT RLCategoriaPadre_CategoriaSys_PK FOREIGN KEY  (Padre ) REFERENCES Categoria(Sys_PK);
ALTER TABLE CConsumo ADD CONSTRAINT RLCConsumoIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE Chequera ADD CONSTRAINT RLChequeraIBanco_BancoSys_PK FOREIGN KEY  (IBanco ) REFERENCES Banco(Sys_PK);
ALTER TABLE Chequera ADD CONSTRAINT RLChequeraIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Ciudad ADD CONSTRAINT RLCiudadEstado_EdoProvSys_PK FOREIGN KEY  (Estado ) REFERENCES EdoProv(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteAgente_AgenteSys_PK FOREIGN KEY  (Agente ) REFERENCES Agente(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteContacto1_ContactoSys_PK FOREIGN KEY  (Contacto1 ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteContacto2_ContactoSys_PK FOREIGN KEY  (Contacto2 ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteContacto3_ContactoSys_PK FOREIGN KEY  (Contacto3 ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteDomicilio2_DomicilioSys_PK FOREIGN KEY  (Domicilio2 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteDomicilio3_DomicilioSys_PK FOREIGN KEY  (Domicilio3 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteTipo_TipoClienteSys_PK FOREIGN KEY  (Tipo ) REFERENCES TipoCliente(Sys_PK);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteZona_ZonaSys_PK FOREIGN KEY  (Zona ) REFERENCES Zona(Sys_PK);
ALTER TABLE CLoteXAlmacen ADD CONSTRAINT RLCLoteXAlmacenIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE Compra ADD CONSTRAINT RLCompraAplicadoA_CompraSys_PK FOREIGN KEY  (AplicadoA ) REFERENCES Compra(Sys_PK);
ALTER TABLE Compra ADD CONSTRAINT RLCompraIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE Compra ADD CONSTRAINT RLCompraIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Compra ADD CONSTRAINT RLCompraIMovCaja_MovCajaSys_PK FOREIGN KEY  (IMovCaja ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE Compra ADD CONSTRAINT RLCompraIMovChequera_MovCuentaSys_PK FOREIGN KEY  (IMovChequera ) REFERENCES MovCuenta(Sys_PK);
ALTER TABLE Compra ADD CONSTRAINT RLCompraIProveedor_ProveedorSys_PK FOREIGN KEY  (IProveedor ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE Contacto ADD CONSTRAINT RLContactoDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Contacto ADD CONSTRAINT RLContactoDomicilio2_DomicilioSys_PK FOREIGN KEY  (Domicilio2 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Corte ADD CONSTRAINT RLCorteICaja_CajaSys_PK FOREIGN KEY  (ICaja ) REFERENCES Caja(Sys_PK);
ALTER TABLE Corte ADD CONSTRAINT RLCorteICajero_CajeroSys_PK FOREIGN KEY  (ICajero ) REFERENCES Cajero(Sys_PK);
ALTER TABLE CProduccion ADD CONSTRAINT RLCProduccionAlmacenMP_AlmacenSys_PK FOREIGN KEY  (AlmacenMP ) REFERENCES Almacen(Sys_PK);
ALTER TABLE CProduccion ADD CONSTRAINT RLCProduccionAlmacenPT_AlmacenSys_PK FOREIGN KEY  (AlmacenPT ) REFERENCES Almacen(Sys_PK);
ALTER TABLE Cupon ADD CONSTRAINT RLCuponTipo_TipoCuponSys_PK FOREIGN KEY  (Tipo ) REFERENCES TipoCupon(Sys_PK);
ALTER TABLE DAdic2 ADD CONSTRAINT RLDAdic2IProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE DAdicionales ADD CONSTRAINT RLDAdicionalesIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE DCantidades ADD CONSTRAINT RLDCantidadesIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexILote_LoteSys_PK FOREIGN KEY  (ILote ) REFERENCES Lote(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexISerie_SerieSys_PK FOREIGN KEY  (ISerie ) REFERENCES Serie(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexRCompra_DCompraSys_PK FOREIGN KEY  (RCompra ) REFERENCES DCompra(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexRVenta_DVentaSys_PK FOREIGN KEY  (RVenta ) REFERENCES DVenta(Sys_PK);
ALTER TABLE DCheques ADD CONSTRAINT RLDChequesIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE DCheques ADD CONSTRAINT RLDChequesRetiro_MovCajaSys_PK FOREIGN KEY  (Retiro ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DCompra ADD CONSTRAINT RLDCompraDocumento_CompraSys_PK FOREIGN KEY  (Documento ) REFERENCES Compra(Sys_PK);
ALTER TABLE DCompra ADD CONSTRAINT RLDCompraIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCICliente_ClienteSys_PK FOREIGN KEY  (ICliente ) REFERENCES Cliente(Sys_PK);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCIFolio_FoliosDocumentosSys_PK FOREIGN KEY  (IFolio ) REFERENCES FoliosDocumentos(Sys_PK);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCIFolioIFin_FoliosDocumentosSys_PK FOREIGN KEY  (IFolioIFin ) REFERENCES FoliosDocumentos(Sys_PK);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCIMovCaja_MovCajaSys_PK FOREIGN KEY  (IMovCaja ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCIVenta_VentaSys_PK FOREIGN KEY  (IVenta ) REFERENCES Venta(Sys_PK);
ALTER TABLE DCxP ADD CONSTRAINT RLDCxPICompra_CompraSys_PK FOREIGN KEY  (ICompra ) REFERENCES Compra(Sys_PK);
ALTER TABLE DCxP ADD CONSTRAINT RLDCxPIMovCaja_MovCajaSys_PK FOREIGN KEY  (IMovCaja ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DCxP ADD CONSTRAINT RLDCxPIMovChequera_MovCuentaSys_PK FOREIGN KEY  (IMovChequera ) REFERENCES MovCuenta(Sys_PK);
ALTER TABLE DCxP ADD CONSTRAINT RLDCxPIProveedor_ProveedorSys_PK FOREIGN KEY  (IProveedor ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE DDepositos ADD CONSTRAINT RLDDepositosIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE DDepositos ADD CONSTRAINT RLDDepositosRetiro_MovCajaSys_PK FOREIGN KEY  (Retiro ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE Domicilio ADD CONSTRAINT RLDomicilioICiudad_CiudadSys_PK FOREIGN KEY  (ICiudad ) REFERENCES Ciudad(Sys_PK);
ALTER TABLE DOrden ADD CONSTRAINT RLDOrdenIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE DOrden ADD CONSTRAINT RLDOrdenIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE DTarjeta ADD CONSTRAINT RLDTarjetaIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE DTarjeta ADD CONSTRAINT RLDTarjetaRetiro_MovCajaSys_PK FOREIGN KEY  (Retiro ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DTarjeta ADD CONSTRAINT RLDTarjetaTipo_TarjetaCreditoSys_PK FOREIGN KEY  (Tipo ) REFERENCES TarjetaCredito(Sys_PK);
ALTER TABLE DVales ADD CONSTRAINT RLDValesIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE DVales ADD CONSTRAINT RLDValesRetiro_MovCajaSys_PK FOREIGN KEY  (Retiro ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DVenta ADD CONSTRAINT RLDVentaDocumento_VentaSys_PK FOREIGN KEY  (Documento ) REFERENCES Venta(Sys_PK);
ALTER TABLE DVenta ADD CONSTRAINT RLDVentaIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE DVenta ADD CONSTRAINT RLDVentaIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE EdoProv ADD CONSTRAINT RLEdoProvIPais_PaisSys_PK FOREIGN KEY  (IPais ) REFERENCES Pais(Sys_PK);
ALTER TABLE Existencias ADD CONSTRAINT RLExistenciasIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE FoliosDocumentos ADD CONSTRAINT RLFoliosDocumentosBlock_BlockDocumentosSys_PK FOREIGN KEY  (Block ) REFERENCES BlockDocumentos(Sys_PK);
ALTER TABLE Guia ADD CONSTRAINT RLGuiaIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Guia ADD CONSTRAINT RLGuiaIDomicilio_DomicilioSys_PK FOREIGN KEY  (IDomicilio ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Guia ADD CONSTRAINT RLGuiaIPorteador_PorteadorSys_PK FOREIGN KEY  (IPorteador ) REFERENCES Porteador(Sys_PK);
ALTER TABLE Guia ADD CONSTRAINT RLGuiaIRepartidor_RepartidorSys_PK FOREIGN KEY  (IRepartidor ) REFERENCES Repartidor(Sys_PK);
ALTER TABLE IEnsamble ADD CONSTRAINT RLIEnsambleElemento_ProductoSys_PK FOREIGN KEY  (Elemento ) REFERENCES Producto(Sys_PK);
ALTER TABLE IEnsamble ADD CONSTRAINT RLIEnsambleReemplazo_ProductoSys_PK FOREIGN KEY  (Reemplazo ) REFERENCES Producto(Sys_PK);
ALTER TABLE IVariable ADD CONSTRAINT RLIVariableGrupo_GrupoProductosSys_PK FOREIGN KEY  (Grupo ) REFERENCES GrupoProductos(Sys_PK);
ALTER TABLE Lote ADD CONSTRAINT RLLoteIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE Monedero ADD CONSTRAINT RLMonederoICliente_ClienteSys_PK FOREIGN KEY  (ICliente ) REFERENCES Cliente(Sys_PK);
ALTER TABLE Monedero ADD CONSTRAINT RLMonederoIVenta_VentaSys_PK FOREIGN KEY  (IVenta ) REFERENCES Venta(Sys_PK);
ALTER TABLE MovCaja ADD CONSTRAINT RLMovCajaICategoria_CategoriaSys_PK FOREIGN KEY  (ICategoria ) REFERENCES Categoria(Sys_PK);
ALTER TABLE MovCaja ADD CONSTRAINT RLMovCajaICorte_CorteSys_PK FOREIGN KEY  (ICorte ) REFERENCES Corte(Sys_PK);
ALTER TABLE MovCaja ADD CONSTRAINT RLMovCajaIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE MovCuenta ADD CONSTRAINT RLMovCuentaICategoria_CategoriaSys_PK FOREIGN KEY  (ICategoria ) REFERENCES Categoria(Sys_PK);
ALTER TABLE MovCuenta ADD CONSTRAINT RLMovCuentaICuenta_ChequeraSys_PK FOREIGN KEY  (ICuenta ) REFERENCES Chequera(Sys_PK);
ALTER TABLE Orden ADD CONSTRAINT RLOrdenIAgente_AgenteSys_PK FOREIGN KEY  (IAgente ) REFERENCES Agente(Sys_PK);
ALTER TABLE Orden ADD CONSTRAINT RLOrdenICConsumo_CConsumoSys_PK FOREIGN KEY  (ICConsumo ) REFERENCES CConsumo(Sys_PK);
ALTER TABLE Orden ADD CONSTRAINT RLOrdenICProduccion_CProduccionSys_PK FOREIGN KEY  (ICProduccion ) REFERENCES CProduccion(Sys_PK);
ALTER TABLE Orden ADD CONSTRAINT RLOrdenIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Orden ADD CONSTRAINT RLOrdenIVenta_VentaSys_PK FOREIGN KEY  (IVenta ) REFERENCES Venta(Sys_PK);
ALTER TABLE Porteador ADD CONSTRAINT RLPorteadorIProveedor_ProveedorSys_PK FOREIGN KEY  (IProveedor ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE PrecioVenta ADD CONSTRAINT RLPrecioVentaProducto_ProductoSys_PK FOREIGN KEY  (Producto ) REFERENCES Producto(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoIDepartamento_DepartamentoSys_PK FOREIGN KEY  (IDepartamento ) REFERENCES Departamento(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoILinea_LineaSys_PK FOREIGN KEY  (ILinea ) REFERENCES Linea(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoIMarca_MarcaSys_PK FOREIGN KEY  (IMarca ) REFERENCES Marca(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoImpuestos_cfgImpuestoSys_PK FOREIGN KEY  (Impuestos ) REFERENCES cfgImpuesto(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoProveedor1_ProveedorSys_PK FOREIGN KEY  (Proveedor1 ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoProveedor2_ProveedorSys_PK FOREIGN KEY  (Proveedor2 ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE Producto ADD CONSTRAINT RLProductoProveedor3_ProveedorSys_PK FOREIGN KEY  (Proveedor3 ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorContacto1_ContactoSys_PK FOREIGN KEY  (Contacto1 ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorContacto2_ContactoSys_PK FOREIGN KEY  (Contacto2 ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorContacto3_ContactoSys_PK FOREIGN KEY  (Contacto3 ) REFERENCES Contacto(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorDomicilio2_DomicilioSys_PK FOREIGN KEY  (Domicilio2 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorDomicilio3_DomicilioSys_PK FOREIGN KEY  (Domicilio3 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorIZona_ZonaSys_PK FOREIGN KEY  (IZona ) REFERENCES Zona(Sys_PK);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorTipo_TipoProveedorSys_PK FOREIGN KEY  (Tipo ) REFERENCES TipoProveedor(Sys_PK);
ALTER TABLE Repartidor ADD CONSTRAINT RLRepartidorDomicilio1_DomicilioSys_PK FOREIGN KEY  (Domicilio1 ) REFERENCES Domicilio(Sys_PK);
ALTER TABLE Serie ADD CONSTRAINT RLSerieDocCompra_CompraSys_PK FOREIGN KEY  (DocCompra ) REFERENCES Compra(Sys_PK);
ALTER TABLE Serie ADD CONSTRAINT RLSerieDocVenta_VentaSys_PK FOREIGN KEY  (DocVenta ) REFERENCES Venta(Sys_PK);
ALTER TABLE Serie ADD CONSTRAINT RLSerieIAlmacen_AlmacenSys_PK FOREIGN KEY  (IAlmacen ) REFERENCES Almacen(Sys_PK);
ALTER TABLE Serie ADD CONSTRAINT RLSerieIEnsamble_SerieSys_PK FOREIGN KEY  (IEnsamble ) REFERENCES Serie(Sys_PK);
ALTER TABLE Serie ADD CONSTRAINT RLSerieILote_LoteSys_PK FOREIGN KEY  (ILote ) REFERENCES Lote(Sys_PK);
ALTER TABLE Serie ADD CONSTRAINT RLSerieIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE TasaVariable ADD CONSTRAINT RLTasaVariableITabla_TablaSys_PK FOREIGN KEY  (ITabla ) REFERENCES Tabla(Sys_PK);
ALTER TABLE TipoCupon ADD CONSTRAINT RLTipoCuponIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE TipoCupon ADD CONSTRAINT RLTipoCuponIProducto_ProductoSys_PK FOREIGN KEY  (IProducto ) REFERENCES Producto(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaAplicadoA_VentaSys_PK FOREIGN KEY  (AplicadoA ) REFERENCES Venta(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIAgente_AgenteSys_PK FOREIGN KEY  (IAgente ) REFERENCES Agente(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaICaja_CajaSys_PK FOREIGN KEY  (ICaja ) REFERENCES Caja(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaICConsumo_CConsumoSys_PK FOREIGN KEY  (ICConsumo ) REFERENCES CConsumo(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaICliente_ClienteSys_PK FOREIGN KEY  (ICliente ) REFERENCES Cliente(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaICorte_CorteSys_PK FOREIGN KEY  (ICorte ) REFERENCES Corte(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIDivisa_DivisaSys_PK FOREIGN KEY  (IDivisa ) REFERENCES Divisa(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIFolio_FoliosDocumentosSys_PK FOREIGN KEY  (IFolio ) REFERENCES FoliosDocumentos(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIGuia_GuiaSys_PK FOREIGN KEY  (IGuia ) REFERENCES Guia(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIMovCaja_MovCajaSys_PK FOREIGN KEY  (IMovCaja ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIPorteador_PorteadorSys_PK FOREIGN KEY  (IPorteador ) REFERENCES Porteador(Sys_PK);
ALTER TABLE Venta ADD CONSTRAINT RLVentaIRepartidor_RepartidorSys_PK FOREIGN KEY  (IRepartidor ) REFERENCES Repartidor(Sys_PK);
ALTER TABLE DCardex ADD CONSTRAINT RLDCardexFK_Cardex_Movimientos_CardexSys_PK FOREIGN KEY  (FK_Cardex_Movimientos ) REFERENCES Cardex(Sys_PK);
ALTER TABLE CConsumo_CProduccion_ ADD CONSTRAINT RLCConsumo_CProduccion_ICProduccion_CConsumoSys_PK FOREIGN KEY  (ICProduccion ) REFERENCES CProduccion(Sys_PK);
ALTER TABLE CConsumo_CProduccion_ ADD CONSTRAINT RLCConsumo_CProduccion_IConsumo_CProduccionSys_PK FOREIGN KEY  (IConsumo ) REFERENCES CConsumo(Sys_PK);
ALTER TABLE Cliente_GrupoClientes_ ADD CONSTRAINT RLCliente_GrupoClientes_IGrupos_ClienteSys_PK FOREIGN KEY  (IGrupos ) REFERENCES GrupoClientes(Sys_PK);
ALTER TABLE Cliente_GrupoClientes_ ADD CONSTRAINT RLCliente_GrupoClientes_IClientes_GrupoClientesSys_PK FOREIGN KEY  (IClientes ) REFERENCES Cliente(Sys_PK);
ALTER TABLE PrecioVenta ADD CONSTRAINT RLPrecioVentaFK_Cliente_ListaPrecios_ClienteSys_PK FOREIGN KEY  (FK_Cliente_ListaPrecios ) REFERENCES Cliente(Sys_PK);
ALTER TABLE DCompra ADD CONSTRAINT RLDCompraFK_Compra_Detalle_CompraSys_PK FOREIGN KEY  (FK_Compra_Detalle ) REFERENCES Compra(Sys_PK);
ALTER TABLE CProduccion_Producto_ ADD CONSTRAINT RLCProduccion_Producto_IProductos_CProduccionSys_PK FOREIGN KEY  (IProductos ) REFERENCES Producto(Sys_PK);
ALTER TABLE CProduccion_Producto_ ADD CONSTRAINT RLCProduccion_Producto_ICentrosProduccion_ProductoSys_PK FOREIGN KEY  (ICentrosProduccion ) REFERENCES CProduccion(Sys_PK);
ALTER TABLE DAdic2 ADD CONSTRAINT RLDAdic2FK_DAdicionales_IAdicionales_DAdicionalesSys_PK FOREIGN KEY  (FK_DAdicionales_IAdicionales ) REFERENCES DAdicionales(Sys_PK);
ALTER TABLE DCapa ADD CONSTRAINT RLDCapaFK_DCardex_Capas_DCardexSys_PK FOREIGN KEY  (FK_DCardex_Capas ) REFERENCES DCardex(Sys_PK);
ALTER TABLE AplCxC ADD CONSTRAINT RLAplCxCFK_DCxC_AplicadoA_DCxCSys_PK FOREIGN KEY  (FK_DCxC_AplicadoA ) REFERENCES DCxC(Sys_PK);
ALTER TABLE AplCxP ADD CONSTRAINT RLAplCxPFK_DCxP_AplicadoA_DCxPSys_PK FOREIGN KEY  (FK_DCxP_AplicadoA ) REFERENCES DCxP(Sys_PK);
ALTER TABLE DAdicionales ADD CONSTRAINT RLDAdicionalesFK_DOrden_Adicionales_DOrdenSys_PK FOREIGN KEY  (FK_DOrden_Adicionales ) REFERENCES DOrden(Sys_PK);
ALTER TABLE DCantidades ADD CONSTRAINT RLDCantidadesFK_DOrden_CantidadesVariadas_DOrdenSys_PK FOREIGN KEY  (FK_DOrden_CantidadesVariadas ) REFERENCES DOrden(Sys_PK);
ALTER TABLE GrupoProductos_Producto_ ADD CONSTRAINT RLGrupoProductos_Producto_IProductos_GrupoProductosSys_PK FOREIGN KEY  (IProductos ) REFERENCES Producto(Sys_PK);
ALTER TABLE GrupoProductos_Producto_ ADD CONSTRAINT RLGrupoProductos_Producto_IGrupos_ProductoSys_PK FOREIGN KEY  (IGrupos ) REFERENCES GrupoProductos(Sys_PK);
ALTER TABLE GrupoProveedores_Proveedor_ ADD CONSTRAINT RLGrupoProveedores_Proveedor_IProveedores_GrupoProveedoresSys_PK FOREIGN KEY  (IProveedores ) REFERENCES Proveedor(Sys_PK);
ALTER TABLE GrupoProveedores_Proveedor_ ADD CONSTRAINT RLGrupoProveedores_Proveedor_IGrupos_ProveedorSys_PK FOREIGN KEY  (IGrupos ) REFERENCES GrupoProveedores(Sys_PK);
ALTER TABLE CLoteXAlmacen ADD CONSTRAINT RLCLoteXAlmacenFK_Lote_ExisXAlmacen_LoteSys_PK FOREIGN KEY  (FK_Lote_ExisXAlmacen ) REFERENCES Lote(Sys_PK);
ALTER TABLE DCheques ADD CONSTRAINT RLDChequesFK_MovCaja_DetalleCheques_MovCajaSys_PK FOREIGN KEY  (FK_MovCaja_DetalleCheques ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DDepositos ADD CONSTRAINT RLDDepositosFK_MovCaja_DetalleDepositos_MovCajaSys_PK FOREIGN KEY  (FK_MovCaja_DetalleDepositos ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DTarjeta ADD CONSTRAINT RLDTarjetaFK_MovCaja_DetalleTarjetas_MovCajaSys_PK FOREIGN KEY  (FK_MovCaja_DetalleTarjetas ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DVales ADD CONSTRAINT RLDValesFK_MovCaja_DetalleVales_MovCajaSys_PK FOREIGN KEY  (FK_MovCaja_DetalleVales ) REFERENCES MovCaja(Sys_PK);
ALTER TABLE DOrden ADD CONSTRAINT RLDOrdenFK_Orden_Detalle_OrdenSys_PK FOREIGN KEY  (FK_Orden_Detalle ) REFERENCES Orden(Sys_PK);
ALTER TABLE IEnsamble ADD CONSTRAINT RLIEnsambleFK_Producto_Elementos_ProductoSys_PK FOREIGN KEY  (FK_Producto_Elementos ) REFERENCES Producto(Sys_PK);
ALTER TABLE Existencias ADD CONSTRAINT RLExistenciasFK_Producto_IExistencias_ProductoSys_PK FOREIGN KEY  (FK_Producto_IExistencias ) REFERENCES Producto(Sys_PK);
ALTER TABLE IVariable ADD CONSTRAINT RLIVariableFK_Producto_IVariables_ProductoSys_PK FOREIGN KEY  (FK_Producto_IVariables ) REFERENCES Producto(Sys_PK);
ALTER TABLE DTabla ADD CONSTRAINT RLDTablaFK_Tabla_Filas_TablaSys_PK FOREIGN KEY  (FK_Tabla_Filas ) REFERENCES Tabla(Sys_PK);
ALTER TABLE DVenta ADD CONSTRAINT RLDVentaFK_Venta_Detalle_VentaSys_PK FOREIGN KEY  (FK_Venta_Detalle ) REFERENCES Venta(Sys_PK);
ALTER TABLE Promocion ADD CONSTRAINT RLPromocionAmbito_cAmbitoPromocionesID FOREIGN KEY  (Ambito ) REFERENCES cAmbitoPromociones(ID);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCBaseCM_cBCIMoratoriosID FOREIGN KEY  (BaseCM ) REFERENCES cBCIMoratorios(ID);
ALTER TABLE DCxP ADD CONSTRAINT RLDCxPBaseCM_cBCIMoratoriosID FOREIGN KEY  (BaseCM ) REFERENCES cBCIMoratorios(ID);
ALTER TABLE DCantidades ADD CONSTRAINT RLDCantidadesCantidad_cCantidadesID FOREIGN KEY  (Cantidad ) REFERENCES cCantidades(ID);
ALTER TABLE Linea ADD CONSTRAINT RLLineaClase_cClaseProductoID FOREIGN KEY  (Clase ) REFERENCES cClaseProducto(ID);
ALTER TABLE Producto ADD CONSTRAINT RLProductoIClase_cClaseProductoID FOREIGN KEY  (IClase ) REFERENCES cClaseProducto(ID);
ALTER TABLE BlockDocumentos ADD CONSTRAINT RLBlockDocumentosDocumento_cDocumentosID FOREIGN KEY  (Documento ) REFERENCES cDocumentos(ID);
ALTER TABLE Compra ADD CONSTRAINT RLCompraDocumento_cDocumentosID FOREIGN KEY  (Documento ) REFERENCES cDocumentos(ID);
ALTER TABLE DCxC ADD CONSTRAINT RLDCxCDocumento_cDocumentosID FOREIGN KEY  (Documento ) REFERENCES cDocumentos(ID);
ALTER TABLE DCxP ADD CONSTRAINT RLDCxPDocumento_cDocumentosID FOREIGN KEY  (Documento ) REFERENCES cDocumentos(ID);
ALTER TABLE MovCaja ADD CONSTRAINT RLMovCajaDocumento_cDocumentosID FOREIGN KEY  (Documento ) REFERENCES cDocumentos(ID);
ALTER TABLE MovCuenta ADD CONSTRAINT RLMovCuentaTipo_cDocumentosID FOREIGN KEY  (Tipo ) REFERENCES cDocumentos(ID);
ALTER TABLE Venta ADD CONSTRAINT RLVentaDocumento_cDocumentosID FOREIGN KEY  (Documento ) REFERENCES cDocumentos(ID);
ALTER TABLE Promocion ADD CONSTRAINT RLPromocionExcepcion_cExcepcionPromocionesID FOREIGN KEY  (Excepcion ) REFERENCES cExcepcionPromociones(ID);
ALTER TABLE Producto ADD CONSTRAINT RLProductoFormaComision_cFormaComisionProductoID FOREIGN KEY  (FormaComision ) REFERENCES cFormaComisionProducto(ID);
ALTER TABLE Compra ADD CONSTRAINT RLCompraFormaPago_cFormasPagoID FOREIGN KEY  (FormaPago ) REFERENCES cFormasPago(ID);
ALTER TABLE Venta ADD CONSTRAINT RLVentaFormaPago_cFormasPagoID FOREIGN KEY  (FormaPago ) REFERENCES cFormasPago(ID);
ALTER TABLE IVariable ADD CONSTRAINT RLIVariablePAdicional_cImpAdicionalesID FOREIGN KEY  (PAdicional ) REFERENCES cImpAdicionales(ID);
ALTER TABLE Producto ADD CONSTRAINT RLProductoMetodoValuacion_cMetodosValuacionID FOREIGN KEY  (MetodoValuacion ) REFERENCES cMetodosValuacion(ID);
ALTER TABLE Promocion ADD CONSTRAINT RLPromocionRestriccion_cRestriccionPromocionesID FOREIGN KEY  (Restriccion ) REFERENCES cRestriccionPromociones(ID);
ALTER TABLE Compra ADD CONSTRAINT RLCompraStatusAdministrativo_cStatusAdministrativosID FOREIGN KEY  (StatusAdministrativo ) REFERENCES cStatusAdministrativos(ID);
ALTER TABLE Venta ADD CONSTRAINT RLVentaStatusAdministrativo_cStatusAdministrativosID FOREIGN KEY  (StatusAdministrativo ) REFERENCES cStatusAdministrativos(ID);
ALTER TABLE Cupon ADD CONSTRAINT RLCuponStatus_cStatusCuponID FOREIGN KEY  (Status ) REFERENCES cStatusCupon(ID);
ALTER TABLE DCompra ADD CONSTRAINT RLDCompraStatus_cStatusDetalleCompraID FOREIGN KEY  (Status ) REFERENCES cStatusDetalleCompra(ID);
ALTER TABLE DVenta ADD CONSTRAINT RLDVentaStatus_cStatusDetalleVentaID FOREIGN KEY  (Status ) REFERENCES cStatusDetalleVenta(ID);
ALTER TABLE Compra ADD CONSTRAINT RLCompraStatusEntrega_cStatusEntregaID FOREIGN KEY  (StatusEntrega ) REFERENCES cStatusEntrega(ID);
ALTER TABLE Venta ADD CONSTRAINT RLVentaStatusEntrega_cStatusEntregaID FOREIGN KEY  (StatusEntrega ) REFERENCES cStatusEntrega(ID);
ALTER TABLE Compra ADD CONSTRAINT RLCompraStatusFacturacion_cStatusFacturacionID FOREIGN KEY  (StatusFacturacion ) REFERENCES cStatusFacturacion(ID);
ALTER TABLE Venta ADD CONSTRAINT RLVentaStatusFacturacion_cStatusFacturacionID FOREIGN KEY  (StatusFacturacion ) REFERENCES cStatusFacturacion(ID);
ALTER TABLE Compra ADD CONSTRAINT RLCompraStatusFinanciero_cStatusFinancierosID FOREIGN KEY  (StatusFinanciero ) REFERENCES cStatusFinancieros(ID);
ALTER TABLE Venta ADD CONSTRAINT RLVentaStatusFinanciero_cStatusFinancierosID FOREIGN KEY  (StatusFinanciero ) REFERENCES cStatusFinancieros(ID);
ALTER TABLE Guia ADD CONSTRAINT RLGuiaEstado_cStatusGuiasID FOREIGN KEY  (Estado ) REFERENCES cStatusGuias(ID);
ALTER TABLE Orden ADD CONSTRAINT RLOrdenStatus_cStatusOrdenProduccionID FOREIGN KEY  (Status ) REFERENCES cStatusOrdenProduccion(ID);
ALTER TABLE Cliente ADD CONSTRAINT RLClienteStatus_cStatusOrgID FOREIGN KEY  (Status ) REFERENCES cStatusOrg(ID);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorStatus_cStatusOrgID FOREIGN KEY  (Status ) REFERENCES cStatusOrg(ID);
ALTER TABLE Serie ADD CONSTRAINT RLSerieStatus_cStatusSeriesID FOREIGN KEY  (Status ) REFERENCES cStatusSeries(ID);
ALTER TABLE Proveedor ADD CONSTRAINT RLProveedorTasaIVA_cTasasIVAID FOREIGN KEY  (TasaIVA ) REFERENCES cTasasIVA(ID);
ALTER TABLE Producto ADD CONSTRAINT RLProductoITipo_cTipoProductoID FOREIGN KEY  (ITipo ) REFERENCES cTipoProducto(ID);
ALTER TABLE Categoria ADD CONSTRAINT RLCategoriaTipo_cTiposCategoriasID FOREIGN KEY  (Tipo ) REFERENCES cTiposCategorias(ID);
ALTER TABLE Producto ADD CONSTRAINT RLProductoTipoComision_cTiposComisionesProductoID FOREIGN KEY  (TipoComision ) REFERENCES cTiposComisionesProducto(ID);
ALTER TABLE Promocion ADD CONSTRAINT RLPromocionTipo_cTiposPromocionesID FOREIGN KEY  (Tipo ) REFERENCES cTiposPromociones(ID);
ALTER TABLE TipoCupon ADD CONSTRAINT RLTipoCuponTipo_cTipoValorCuponID FOREIGN KEY  (Tipo ) REFERENCES cTipoValorCupon(ID);
ALTER TABLE Promocion ADD CONSTRAINT RLPromocionVigencia_cVigenciasPromocionesID FOREIGN KEY  (Vigencia ) REFERENCES cVigenciasPromociones(ID);
INSERT INTO cAmbitoPromociones (ID,Const)  VALUES (1,'cGrupoProductos')

INSERT INTO cAmbitoPromociones (ID,Const)  VALUES (2,'cLinea')

INSERT INTO cAmbitoPromociones (ID,Const)  VALUES (3,'cMarca')

INSERT INTO cAmbitoPromociones (ID,Const)  VALUES (4,'cDepartamento')

INSERT INTO cAmbitoPromociones (ID,Const)  VALUES (5,'cProducto')

INSERT INTO cAmbitoPromociones (ID,Const)  VALUES (6,'cTodos')

INSERT INTO cBCIMoratorios (ID,Const)  VALUES (0,'cSaldo_insoluto_capital')

INSERT INTO cBCIMoratorios (ID,Const)  VALUES (1,'cSaldo_insoluto_capital_IF')

INSERT INTO cBCIMoratorios (ID,Const)  VALUES (2,'cSaldo_insoluto_capital_IM')

INSERT INTO cBCIMoratorios (ID,Const)  VALUES (3,'cSaldo_insoluto_documento')

INSERT INTO cBCIMoratorios (ID,Const)  VALUES (4,'cCapital_inicial')

INSERT INTO cBCIMoratorios (ID,Const)  VALUES (5,'cCapital_IF')

INSERT INTO cCantidades (ID,Const)  VALUES (0,'cEstandar')

INSERT INTO cCantidades (ID,Const)  VALUES (1,'cPoco')

INSERT INTO cCantidades (ID,Const)  VALUES (2,'cMucho')

INSERT INTO cCantidades (ID,Const)  VALUES (3,'cDemasiado')

INSERT INTO cCantidades (ID,Const)  VALUES (99,'cOmitir')

INSERT INTO cClaseProducto (ID,Const)  VALUES (1,'cMateria_prima')

INSERT INTO cClaseProducto (ID,Const)  VALUES (2,'cReceta')

INSERT INTO cClaseProducto (ID,Const)  VALUES (3,'cServicio')

INSERT INTO cClaseProducto (ID,Const)  VALUES (4,'cArtículo')

INSERT INTO cClaseProducto (ID,Const)  VALUES (5,'cEnsamble')

INSERT INTO cClaseProducto (ID,Const)  VALUES (6,'cManufactura')

INSERT INTO cClaseProducto (ID,Const)  VALUES (7,'cTrabajo')

INSERT INTO cClaseProducto (ID,Const)  VALUES (8,'cArrendamiento')

INSERT INTO cClaseProducto (ID,Const)  VALUES (9,'cCosto_indirecto')

INSERT INTO cClaseProducto (ID,Const)  VALUES (33,'cMaquinaria_o_equipo')

INSERT INTO cClaseProducto (ID,Const)  VALUES (34,'cRecurso_humano')

INSERT INTO cClaseProducto (ID,Const)  VALUES (35,'cEquipo_de_transporte')

INSERT INTO cDiasXMes (ID,Const)  VALUES (0,'cEfectivos')

INSERT INTO cDiasXMes (ID,Const)  VALUES (1,'c28Dias')

INSERT INTO cDiasXMes (ID,Const)  VALUES (2,'c30Dias')

INSERT INTO cDocumentos (ID,Const)  VALUES (1,'cCotización')

INSERT INTO cDocumentos (ID,Const)  VALUES (2,'cPedido')

INSERT INTO cDocumentos (ID,Const)  VALUES (3,'cRemisión')

INSERT INTO cDocumentos (ID,Const)  VALUES (4,'cFactura')

INSERT INTO cDocumentos (ID,Const)  VALUES (5,'cNota_de_crédito')

INSERT INTO cDocumentos (ID,Const)  VALUES (6,'cTicket')

INSERT INTO cDocumentos (ID,Const)  VALUES (17,'cNota_de_cargo')

INSERT INTO cDocumentos (ID,Const)  VALUES (18,'cPagaré')

INSERT INTO cDocumentos (ID,Const)  VALUES (19,'cRecibo')

INSERT INTO cDocumentos (ID,Const)  VALUES (33,'cIngreso')

INSERT INTO cDocumentos (ID,Const)  VALUES (34,'cEgreso')

INSERT INTO cDocumentos (ID,Const)  VALUES (65,'cDepósito')

INSERT INTO cDocumentos (ID,Const)  VALUES (66,'cCheque')

INSERT INTO cDocumentos (ID,Const)  VALUES (67,'cRetiro')

INSERT INTO cExcepcionPromociones (ID,Const)  VALUES (1,'cNinguna')

INSERT INTO cExcepcionPromociones (ID,Const)  VALUES (2,'cGrupo_de_clientes')

INSERT INTO cExcepcionPromociones (ID,Const)  VALUES (3,'cTipo_de_clientes')

INSERT INTO cExcepcionPromociones (ID,Const)  VALUES (4,'cCliente')

INSERT INTO cFormaComisionProducto (ID,Const)  VALUES (0,'cNinguna')

INSERT INTO cFormaComisionProducto (ID,Const)  VALUES (1,'cPorProducto')

INSERT INTO cFormaComisionProducto (ID,Const)  VALUES (2,'cPorPrecio')

INSERT INTO cFormaComisionProducto (ID,Const)  VALUES (3,'cPorVendedor')

INSERT INTO cFormasPago (ID,Const)  VALUES (0,'cNo_aplica')

INSERT INTO cFormasPago (ID,Const)  VALUES (1,'cContado')

INSERT INTO cFormasPago (ID,Const)  VALUES (2,'cCrédito')

INSERT INTO cFormasPago (ID,Const)  VALUES (3,'cFinanciado')

INSERT INTO cFormasPago (ID,Const)  VALUES (4,'cConsignado')

INSERT INTO cImpAdicionales (ID,Const)  VALUES (0,'cNinguno')

INSERT INTO cImpAdicionales (ID,Const)  VALUES (1,'cSumatoria')

INSERT INTO cImpAdicionales (ID,Const)  VALUES (3,'cCaro')

INSERT INTO cImpAdicionales (ID,Const)  VALUES (4,'cBarato')

INSERT INTO cMetodosValuacion (ID,Const)  VALUES (1,'PEPS')

INSERT INTO cMetodosValuacion (ID,Const)  VALUES (2,'UEPS')

INSERT INTO cMetodosValuacion (ID,Const)  VALUES (3,'Promedio')

INSERT INTO cMetodosValuacion (ID,Const)  VALUES (4,'Identificado')

INSERT INTO cMetodosValuacion (ID,Const)  VALUES (99,'Ninguno')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (0,'cDiario')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (1,'cSemanal')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (2,'cQuincenal')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (3,'cMensual')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (4,'cBimestral')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (5,'cTrimestral')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (6,'cCuatrimestral')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (7,'cSemestral')

INSERT INTO cPeriodicidades (ID,Const)  VALUES (8,'cAnual')

INSERT INTO cRestriccionPromociones (ID,Const)  VALUES (1,'cTodos_los_clientes')

INSERT INTO cRestriccionPromociones (ID,Const)  VALUES (2,'cTipo_de_clientes')

INSERT INTO cRestriccionPromociones (ID,Const)  VALUES (3,'cGrupo_de_clientes')

INSERT INTO cRestriccionPromociones (ID,Const)  VALUES (4,'cCliente')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (0,'cNo_aplica')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (1,'cAbierto')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (2,'cCerrado')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (3,'cProcesado')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (4,'cXEntregar')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (5,'cEnReparto')

INSERT INTO cStatusAdministrativos (ID,Const)  VALUES (99,'cCancelado')

INSERT INTO cStatusCupon (ID,Const)  VALUES (1,'cDisponible')

INSERT INTO cStatusCupon (ID,Const)  VALUES (2,'cUsado')

INSERT INTO cStatusCupon (ID,Const)  VALUES (3,'cCaducado')

INSERT INTO cStatusCupon (ID,Const)  VALUES (4,'cCancelado')

INSERT INTO cStatusDetalleCompra (ID,Const)  VALUES (0,'cNo_Aplica')

INSERT INTO cStatusDetalleCompra (ID,Const)  VALUES (1,'cPor_recibir')

INSERT INTO cStatusDetalleCompra (ID,Const)  VALUES (2,'cRecibido')

INSERT INTO cStatusDetalleCompra (ID,Const)  VALUES (3,'cFacturado')

INSERT INTO cStatusDetalleCompra (ID,Const)  VALUES (4,'cDevuelto')

INSERT INTO cStatusDetalleVenta (ID,Const)  VALUES (0,'cNo_Aplica')

INSERT INTO cStatusDetalleVenta (ID,Const)  VALUES (1,'cPor_entregar')

INSERT INTO cStatusDetalleVenta (ID,Const)  VALUES (2,'cEntregado')

INSERT INTO cStatusDetalleVenta (ID,Const)  VALUES (3,'cFacturado')

INSERT INTO cStatusDetalleVenta (ID,Const)  VALUES (4,'cDevuelto')

INSERT INTO cStatusEntrega (ID,Const)  VALUES (0,'cNo_aplica')

INSERT INTO cStatusEntrega (ID,Const)  VALUES (1,'cPor_Entregar')

INSERT INTO cStatusEntrega (ID,Const)  VALUES (3,'cEntregado')

INSERT INTO cStatusFacturacion (ID,Const)  VALUES (0,'cNo_Aplica')

INSERT INTO cStatusFacturacion (ID,Const)  VALUES (1,'cPor_facturar')

INSERT INTO cStatusFacturacion (ID,Const)  VALUES (2,'cParcialmente_facturado')

INSERT INTO cStatusFacturacion (ID,Const)  VALUES (3,'cFacturado')

INSERT INTO cStatusFinancieros (ID,Const)  VALUES (0,'cNo_aplica')

INSERT INTO cStatusFinancieros (ID,Const)  VALUES (1,'cCon_adeudo')

INSERT INTO cStatusFinancieros (ID,Const)  VALUES (2,'cSaldado')

INSERT INTO cStatusFinancieros (ID,Const)  VALUES (3,'cConsignado')

INSERT INTO cStatusGuias (ID,Const)  VALUES (1,'cDisponible')

INSERT INTO cStatusGuias (ID,Const)  VALUES (2,'cEn_tránsito')

INSERT INTO cStatusGuias (ID,Const)  VALUES (3,'cEntregada')

INSERT INTO cStatusGuias (ID,Const)  VALUES (4,'cDevuelta')

INSERT INTO cStatusGuias (ID,Const)  VALUES (5,'cPerdida')

INSERT INTO cStatusGuias (ID,Const)  VALUES (6,'cCancelada')

INSERT INTO cStatusOrdenProduccion (ID,Const)  VALUES (0,'cEn_espera')

INSERT INTO cStatusOrdenProduccion (ID,Const)  VALUES (1,'cEn_proceso')

INSERT INTO cStatusOrdenProduccion (ID,Const)  VALUES (2,'cParcialmente_terminada')

INSERT INTO cStatusOrdenProduccion (ID,Const)  VALUES (3,'cTerminada')

INSERT INTO cStatusOrdenProduccion (ID,Const)  VALUES (4,'cCancelada')

INSERT INTO cStatusOrg (ID,Const)  VALUES (1,'cNormal')

INSERT INTO cStatusOrg (ID,Const)  VALUES (2,'cBloqueado')

INSERT INTO cStatusSeries (ID,Const)  VALUES (1,'cDisponible')

INSERT INTO cStatusSeries (ID,Const)  VALUES (2,'cVendido')

INSERT INTO cStatusSeries (ID,Const)  VALUES (3,'cDevuelto_a_proveedor')

INSERT INTO cStatusSeries (ID,Const)  VALUES (4,'cDevuelto_por_el_cliente')

INSERT INTO cStatusSeries (ID,Const)  VALUES (5,'cEnsamblado')

INSERT INTO cTasasIVA (ID,Const)  VALUES (1,'cInterior')

INSERT INTO cTasasIVA (ID,Const)  VALUES (2,'cFrontera')

INSERT INTO cTipoProducto (ID,Const)  VALUES (1,'cNo_inventariable')

INSERT INTO cTipoProducto (ID,Const)  VALUES (2,'cInventariable')

INSERT INTO cTiposCategorias (ID,Const)  VALUES (1,'cIngreso')

INSERT INTO cTiposCategorias (ID,Const)  VALUES (2,'cEgreso')

INSERT INTO cTiposCategorias (ID,Const)  VALUES (3,'cInventario')

INSERT INTO cTiposComisionesProducto (ID,Const)  VALUES (0,'cSinComision')

INSERT INTO cTiposComisionesProducto (ID,Const)  VALUES (1,'cEnDinero')

INSERT INTO cTiposComisionesProducto (ID,Const)  VALUES (2,'cEnPorcentaje')

INSERT INTO cTiposInteres (ID,Const)  VALUES (0,'cSimple')

INSERT INTO cTiposInteres (ID,Const)  VALUES (1,'cCompuesto')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (0,'cDescuento')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (1,'cXxY')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (2,'cDtoXVolumen')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (3,'cDtoXMonto')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (4,'cRegaloXVolumen')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (5,'cRegaloXMonto')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (6,'cFactorMonedero')

INSERT INTO cTiposPromociones (ID,Const)  VALUES (7,'cFactorPuntos')

INSERT INTO cTiposRegalos (ID,Const)  VALUES (1,'cProducto')

INSERT INTO cTiposRegalos (ID,Const)  VALUES (2,'cPuntos')

INSERT INTO cTiposRegalos (ID,Const)  VALUES (3,'cMonedero')

INSERT INTO cTiposRegalos (ID,Const)  VALUES (4,'cCupon')

INSERT INTO cTipoValorCupon (ID,Const)  VALUES (1,'cDinero')

INSERT INTO cTipoValorCupon (ID,Const)  VALUES (2,'cPorcentaje')

INSERT INTO cTipoValorCupon (ID,Const)  VALUES (3,'cPuntos')

INSERT INTO cTipoValorCupon (ID,Const)  VALUES (4,'cProducto')

INSERT INTO cVigenciasPromociones (ID,Const)  VALUES (1,'cSiempreVigente')

INSERT INTO cVigenciasPromociones (ID,Const)  VALUES (2,'cFecha_limite')

INSERT INTO cVigenciasPromociones (ID,Const)  VALUES (3,'cHasta_agotar_existencias')

INSERT INTO cVigenciasPromociones (ID,Const)  VALUES (5,'cFechaLimiteOAgotarExistencias')
