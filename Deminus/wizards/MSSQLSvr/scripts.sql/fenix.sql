CREATE TABLE Agente (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Agente_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(10) NOT NULL  UNIQUE , CodNomina VARCHAR(50), eMail VARCHAR(50), Nombre VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , PComision float , Telefono VARCHAR(150), Domicilio1 Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Almacen (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Almacen_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(10) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE , eMail VARCHAR(50), Fax VARCHAR(150), Telefonos VARCHAR(150), WebSite VARCHAR(150), Domicilio1 Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE AplCxC (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_AplCxC_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Destino Int  NOT NULL , Fecha Datetime  NOT NULL , Importe money , AplicadoA Int  NOT NULL , FK_DCxC_AplicadoA Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE AplCxP (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_AplCxP_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Destino Int  NOT NULL , Fecha Datetime  NOT NULL , Importe money , AplicadoA Int  NOT NULL , FK_DCxP_AplicadoA Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Banco (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Banco_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Nombre VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , WebSite VARCHAR(150), Contacto Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE BlockDocumentos (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_BlockDocumentos_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Activo Bit  NOT NULL , Datos VARCHAR(255), Documento Int  NOT NULL , FInicial Int  NOT NULL , Fiscal Bit  NOT NULL , FUltimo Int  NOT NULL , IDControl VARCHAR(32), NumControl Int , Serie VARCHAR(3) NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Caja (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Caja_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(50), Notas VARCHAR(MAX) , CentroConsumo Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cajero (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Cajero_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(10) NOT NULL  UNIQUE , CodNomina VARCHAR(50), Contrasena VARCHAR(32) NOT NULL , eMail VARCHAR(50), Nombre VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , Telefono VARCHAR(150), Domicilio1 Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cardex (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Cardex_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Aplicado Bit , Descripcion VARCHAR(MAX) , Fecha Datetime , Referencia VARCHAR(250) NOT NULL  UNIQUE , Valuado Bit , DocCompra Int , DocOrden Int , DocVenta Int , ICategoria Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Categoria (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Categoria_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE , PMensual money , Tipo Int , Padre Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE CConsumo (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_CConsumo_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , Precio Int , IAlmacen Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE cfgImpuesto (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_cfgImpuesto_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), I1Compra VARCHAR(MAX) , I1Venta VARCHAR(MAX) , I2Compra VARCHAR(MAX) , I2Venta VARCHAR(MAX) , I3Compra VARCHAR(MAX) , I3Venta VARCHAR(MAX) , I4Compra VARCHAR(MAX) , I4Venta VARCHAR(MAX) , Nombre VARCHAR(25) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Chequera (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Chequera_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CLABE VARCHAR(18), CodCuenta VARCHAR(50), Nombre VARCHAR(25) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , NumCuenta VARCHAR(25), IBanco Int , IDivisa Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Ciudad (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Ciudad_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(8) NOT NULL  UNIQUE , CodigoTel VARCHAR(5), Nombre VARCHAR(50) NOT NULL , Estado Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cliente (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Cliente_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(35) NOT NULL  UNIQUE , CURP VARCHAR(25), Descuento float , DiasCredito Int , eMail VARCHAR(80), Fax VARCHAR(150), LimiteCredito money , Monedero money , Nombre VARCHAR(150) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , Precio Int , Puntos money , RFC VARCHAR(15), Saldo money , SaldoPuntos money , Status Int , Telefonos VARCHAR(150), WebSite VARCHAR(150), Agente Int , Contacto1 Int , Contacto2 Int , Contacto3 Int , Domicilio1 Int , Domicilio2 Int , Domicilio3 Int , IDivisa Int  NOT NULL , Tipo Int  NOT NULL , Zona Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE CLoteXAlmacen (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_CLoteXAlmacen_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad float  NOT NULL , IAlmacen Int  NOT NULL , FK_Lote_ExisXAlmacen Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Compra (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Compra_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Auditado Bit , Contabilizado Bit , Descuento1 money , Descuento2 money , Directos money , Documento Int  NOT NULL , Fecha Datetime , FEmbarque Datetime , FEntrega Datetime , FLiquidacion Datetime , FormaPago Int  NOT NULL , FUltimoPago Datetime , Impuesto1 money  NOT NULL , Impuesto2 money  NOT NULL , Impuesto3 money  NOT NULL , Impuesto4 money  NOT NULL , Indirectos money , Notas VARCHAR(MAX) , Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(25) NOT NULL , StatusAdministrativo Int  NOT NULL , StatusEntrega Int  NOT NULL , StatusFacturacion Int  NOT NULL , StatusFinanciero Int  NOT NULL , Subtotal money  NOT NULL , TipoCambio money  NOT NULL , Vencimiento Datetime , AplicadoA Int , IAlmacen Int  NOT NULL , IDivisa Int  NOT NULL , IMovCaja Int , IMovChequera Int , IProveedor Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Contacto (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Contacto_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Apellidos VARCHAR(50) NOT NULL , eMail1 VARCHAR(50), eMail2 VARCHAR(50), eMail3 VARCHAR(50), eMail4 VARCHAR(50), Empresa VARCHAR(50), Nombre VARCHAR(50) NOT NULL , Notas VARCHAR(MAX) , Puesto VARCHAR(30), Tel1 VARCHAR(50), Tel2 VARCHAR(50), Tel3 VARCHAR(50), Tratamiento VARCHAR(5), WebSite VARCHAR(150), Domicilio1 Int , Domicilio2 Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Corte (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Corte_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cerrado Bit , FApertura Datetime  NOT NULL , FCierre Datetime , HApertura Datetime  NOT NULL , HCierre Datetime , ICaja Int  NOT NULL , ICajero Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE CProduccion (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_CProduccion_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(30) NOT NULL  UNIQUE , AlmacenMP Int  NOT NULL , AlmacenPT Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Cupon (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Cupon_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(32) NOT NULL  UNIQUE , FechaAlta Datetime , FechaUso Datetime , Status Int  NOT NULL , Tipo Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DAdicionales (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DAdicionales_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad float , CDirecto money , CIndirecto money , CManoObra money , CMaquinaria money , Notas VARCHAR(255), IProducto Int  NOT NULL , FK_DOrden_Adicionales Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCantidades (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCantidades_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad Int  NOT NULL , IProducto Int  NOT NULL , FK_DOrden_CantidadesVariadas Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCapa (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCapa_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad float  NOT NULL , Costo money  NOT NULL , PKEntrada Int  NOT NULL , FK_DCardex_Capas Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCardex (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCardex_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Abonos float , Auditado Bit , Cargos float , Contabilizado Bit , CPromedio money , Entradas float , Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(30), Resto float , Salidas float , TipoCambio money  NOT NULL , Valuado Bit , IAlmacen Int  NOT NULL , ILote Int , IProducto Int  NOT NULL , ISerie Int , RCompra Int , RVenta Int , FK_Cardex_Movimientos Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCheques (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCheques_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Banco VARCHAR(50) NOT NULL , Beneficiario VARCHAR(250) NOT NULL , Emisor VARCHAR(50) NOT NULL , Importe money  NOT NULL , Notas VARCHAR(50), Numero VARCHAR(5) NOT NULL , TipoCambio money  NOT NULL , IDivisa Int  NOT NULL , Retiro Int , FK_MovCaja_DetalleCheques Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCompra (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCompra_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad float  NOT NULL , CostoTotal money , Descuento1 money , Descuento2 money , Factor float , Impuesto1 money , Impuesto2 money , Impuesto3 money , Impuesto4 money , Notas VARCHAR(255), Precio money , Status Int  NOT NULL , TipoCambio money  NOT NULL , Unidad VARCHAR(10) NOT NULL , XFacturar float , Documento Int , IProducto Int  NOT NULL , FK_Compra_Detalle Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCxC (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCxC_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Aplicable Bit , Aplicacion Datetime , Auditado Bit , BaseCM Int , Bonificaciones money , Contabilizado Bit , Debe money , Documento Int  NOT NULL , Fecha Datetime , FUltMoratorios Datetime , Haber money , IntFinancieros money , IntMoratorios money , Notas VARCHAR(MAX) , Pagos money , Partida VARCHAR(32), Poliza VARCHAR(32), porImpuestoCap float , porImpuestoFin float , porImpuestoMor float , Referencia VARCHAR(50) NOT NULL , RelacionadoA Int , TasaMoratorios float , TipoCambio money , XAplicar money , ICliente Int  NOT NULL , IFolio Int , IFolioIFin Int , IMovCaja Int , IVenta Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DCxP (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DCxP_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Aplicable Bit , Aplicacion Datetime  NOT NULL , Auditado Bit , BaseCM Int , Bonificaciones money , Contabilizado Bit , Debe money , Documento Int  NOT NULL , Fecha Datetime  NOT NULL , FUltMoratorios Datetime , Haber money , IntFinancieros money , IntMoratorios money , Notas VARCHAR(MAX) , Pagos money , Partida VARCHAR(32), Poliza VARCHAR(32), porImpuestoCap float , porImpuestoFin float , porImpuestoMor float , Referencia VARCHAR(50) NOT NULL , RelacionadoA Int , TasaMoratorios float , TipoCambio money  NOT NULL , XAplicar money , ICompra Int , IMovCaja Int , IMovChequera Int , IProveedor Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DDepositos (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DDepositos_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Banco VARCHAR(50) NOT NULL , Fecha Datetime  NOT NULL , Importe money  NOT NULL , Referencia VARCHAR(50), TipoCambio money  NOT NULL , IDivisa Int  NOT NULL , Retiro Int , FK_MovCaja_DetalleDepositos Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Departamento (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Departamento_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Comision1 float , Comision2 float , Comision3 float , Comision4 float , Comision5 float , Descripcion VARCHAR(50) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Divisa (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Divisa_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(30) NOT NULL  UNIQUE , TCambio float  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Domicilio (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Domicilio_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CodPos VARCHAR(10), Colonia VARCHAR(150), Direccion VARCHAR(MAX) , Notas VARCHAR(150), Telefonos VARCHAR(150), ICiudad Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DOrden (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DOrden_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad float , CDirecto money , CIndirecto money , CManoObra money , CMaquinaria money , D1 money , D2 money , Especificaciones VARCHAR(MAX) , Precio money , TiempoProduccion Int , TiempoServicio Int , TipoCambio money  NOT NULL , IDivisa Int  NOT NULL , IProducto Int  NOT NULL , FK_Orden_Detalle Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DTabla (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DTabla_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Col1 float , Col10 float , Col2 float , Col3 float , Col4 float , Col5 float , Col6 float , Col7 float , Col8 float , Col9 float , Etiqueta VARCHAR(50), FK_Tabla_Filas Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DTarjeta (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DTarjeta_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Autorizacion VARCHAR(50), CVV VARCHAR(10), Domicilio VARCHAR(MAX) , Importe money  NOT NULL , Nombre VARCHAR(50), Numero VARCHAR(32), TipoCambio money  NOT NULL , IDivisa Int  NOT NULL , Retiro Int , Tipo Int  NOT NULL , FK_MovCaja_DetalleTarjetas Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DVales (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DVales_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Fecha Datetime , Importe money , Notas VARCHAR(50), Referencia VARCHAR(50) NOT NULL , TipoCambio money , IDivisa Int  NOT NULL , Retiro Int , FK_MovCaja_DetalleVales Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE DVenta (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_DVenta_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cantidad float , Descuento1 money , Descuento2 money , Factor float , Impuesto1 money , Impuesto2 money , Impuesto3 money , Impuesto4 money , Notas VARCHAR(255), Precio money  NOT NULL , Status Int  NOT NULL , TipoCambio money  NOT NULL , Unidad VARCHAR(10), XFacturar float , XSalir float , Documento Int , IAlmacen Int  NOT NULL , IProducto Int  NOT NULL , FK_Venta_Detalle Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE EdoProv (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_EdoProv_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(8) NOT NULL  UNIQUE , Nombre VARCHAR(50) NOT NULL , IPais Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Existencias (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Existencias_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Existencia float , Saldo money , IAlmacen Int  NOT NULL , FK_Producto_IExistencias Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE FoliosDocumentos (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_FoliosDocumentos_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Cancelado Bit  NOT NULL , Fecha Datetime  NOT NULL , Folio Int  NOT NULL , Block Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE GrupoClientes (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_GrupoClientes_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Nombre VARCHAR(25) NOT NULL  UNIQUE , Notas VARCHAR(MAX),sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE GrupoProductos (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_GrupoProductos_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Comision1 float , Comision2 float , Comision3 float , Comision4 float , Comision5 float , Nombre VARCHAR(25) NOT NULL  UNIQUE , Notas VARCHAR(MAX),sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE GrupoProveedores (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_GrupoProveedores_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Nombre VARCHAR(25) NOT NULL  UNIQUE , Notas VARCHAR(MAX),sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Guia (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Guia_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Alto float , Ancho float , Costo money , Deducible money , Dias Int , EnAtencion VARCHAR(50), Estado Int  NOT NULL , FCompra Datetime , FEmbarque Datetime , FEntrega Datetime , Largo float , Notas VARCHAR(MAX) , Numero VARCHAR(50) NOT NULL  UNIQUE , Peso float , SumaAsegurada money , IDivisa Int , IDomicilio Int  NOT NULL , IPorteador Int  NOT NULL , IRepartidor Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE IEnsamble (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_IEnsamble_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CantDemasiado float , Cantidad float  NOT NULL , CantMucho float , CantPoco float , Omitible Bit , Elemento Int  NOT NULL , Reemplazo Int , FK_Producto_Elementos Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE IVariable (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_IVariable_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CDirectoProm money , CIndirectoProm money , CManoObraProm money , CMaquinariaProm money , Descripcion VARCHAR(35), Factor float , Maximo float , Minimo float , Grupo Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Linea (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Linea_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Clase Int  NOT NULL , Codigo VARCHAR(15) NOT NULL  UNIQUE , Color Int , Comision1 float , Comision2 float , Comision3 float , Comision4 float , Comision5 float , Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , Visible Bit,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Lote (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Lote_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Entradas float , Existencia float , FCaducidad Datetime , FEntrada Datetime , Numero VARCHAR(50) NOT NULL  UNIQUE , IProducto Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Marca (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Marca_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Monedero (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Monedero_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Descripcion VARCHAR(35), Fecha Datetime , Puntos money , ICliente Int  NOT NULL , IVenta Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE MovCaja (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_MovCaja_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Auditado Bit , Cheques money , Contabilizado Bit , Depositos money , Documento Int  NOT NULL , Efectivo money , Fecha Datetime  NOT NULL , Hora Datetime  NOT NULL , Notas VARCHAR(255), Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(50) NOT NULL , Tarjetas money , TipoCambio money  NOT NULL , Vales money , ICategoria Int  NOT NULL , ICorte Int  NOT NULL , IDivisa Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE MovCuenta (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_MovCuenta_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Aplicacion Datetime , Auditado Bit , Beneficiario VARCHAR(150), Cancelado Bit , Conciliado Bit , Contabilizado Bit , Egreso money , Fecha Datetime , Ingreso money , Notas VARCHAR(MAX)  NOT NULL , Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(50) NOT NULL  UNIQUE , Tipo Int  NOT NULL , ICategoria Int  NOT NULL , ICuenta Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Orden (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Orden_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Auditada Bit , CDirecto money , CIndirecto money , CManoObra money , CMaquinaria money , Contabilizada Bit , D1 money , D2 money , Fecha Datetime , FPrevista Datetime , FProduccion Datetime , Hora Datetime , HPrevista Datetime , HProduccion Datetime , Importe money , Notas VARCHAR(MAX) , Partida VARCHAR(32), Poliza VARCHAR(32), Referencia VARCHAR(50), Status Int  NOT NULL , TiempoProduccion Int , TiempoServicio Int , TipoCambio money , IAgente Int , ICConsumo Int  NOT NULL , ICProduccion Int  NOT NULL , IDivisa Int , IVenta Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Pais (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Pais_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(8) NOT NULL  UNIQUE , CodigoTel VARCHAR(5), Nombre VARCHAR(50) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Porteador (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Porteador_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , IProveedor Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE PrecioVenta (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_PrecioVenta_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Limite float , Precio money , Producto Int  NOT NULL , FK_Cliente_ListaPrecios Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Producto (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Producto_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Adicional Bit , CDirecto money  NOT NULL , CIndirecto money  NOT NULL , CManoObra money  NOT NULL , CMaquinaria money  NOT NULL , CodBar1 VARCHAR(35), CodBar2 VARCHAR(35), CodBar3 VARCHAR(35), Codigo VARCHAR(35) NOT NULL  UNIQUE , Color Int , Comision float , Comision1 float , Comision2 float , Comision3 float , Comision4 float , Comision5 float , CostoPromedio money , CostoUltimo money  NOT NULL , Data1 VARCHAR(MAX) , Data2 VARCHAR(MAX) , Data3 VARCHAR(MAX) , Desc2 float , Desc3 float , Desc4 float , Desc5 float , Descripcion VARCHAR(150) NOT NULL  UNIQUE , DiasEntrega Int , Existencia float , FactorB float  NOT NULL , FactorC float , FactorD float , FactorE float , flagLimites Bit , flagUtilidad Bit , FormaComision Int , IClase Int  NOT NULL , ITipo Int  NOT NULL , Lim2 float , Lim3 float , Lim4 float , Lim5 float , Maximo float , MetodoValuacion Int  NOT NULL , Minimo float , Notas VARCHAR(MAX) , PAdic1 money , PAdic2 money , PAdic3 money , PAdic4 money , PAdic5 money , PPuntos money , Precio1 money  NOT NULL , Precio2 money  NOT NULL , Precio3 money  NOT NULL , Precio4 money  NOT NULL , Precio5 money  NOT NULL , PuntoRO float , ReqLote Bit  NOT NULL , ReqSerie Bit  NOT NULL , Saldo money  NOT NULL , TipoComision Int , Unidad VARCHAR(10) NOT NULL , UnidadB VARCHAR(10), UnidadC VARCHAR(10), UnidadD VARCHAR(10), UnidadE VARCHAR(10), Util1 float , Util2 float , Util3 float , Util4 float , Util5 float , UtilMin float , VincularData Bit , Visible Bit , IDepartamento Int , IDivisa Int  NOT NULL , ILinea Int  NOT NULL , IMarca Int , Impuestos Int  NOT NULL , IVariables Int , Proveedor1 Int , Proveedor2 Int , Proveedor3 Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Promocion (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Promocion_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Activa Bit , Ambito Int  NOT NULL , CantidadVigencia float , Codigo VARCHAR(15) NOT NULL  UNIQUE , Domingo Bit , DomingoFinal Datetime , DomingoInicio Datetime , Excepcion Int  NOT NULL , Excluyente Bit , FechaInicio Datetime  NOT NULL , FechaVigencia Datetime , ItemAmbito VARCHAR(32), ItemExcepcion VARCHAR(32), ItemRestriccion VARCHAR(32), Jueves Bit , JuevesFinal Datetime , JuevesInicio Datetime , LibreEleccion Bit , Lunes Bit , LunesFinal Datetime , LunesInicio Datetime , Martes Bit , MartesFinal Datetime , MartesInicio Datetime , Miercoles Bit , MiercolesFinal Datetime , MiercolesInicio Datetime , Nombre VARCHAR(50) NOT NULL  UNIQUE , Restriccion Int  NOT NULL , Sabado Bit , SabadoFinal Datetime , SabadoInicio Datetime , Tipo Int  NOT NULL , Var1 float , Var2 float , Viernes Bit , ViernesFinal Datetime , ViernesInicio Datetime , Vigencia Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Proveedor (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Proveedor_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), CodCuenta VARCHAR(50), Codigo VARCHAR(35) NOT NULL  UNIQUE , CURP VARCHAR(35), DiasCredito Int , DiasEntrega Int , eMail VARCHAR(50), Fax VARCHAR(50), LimiteCredito money , Nombre VARCHAR(150) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , RFC VARCHAR(15), Saldo money , Status Int , TasaIVA Int  NOT NULL , Telefonos VARCHAR(50), WebSite VARCHAR(150), Contacto1 Int , Contacto2 Int , Contacto3 Int , Domicilio1 Int , Domicilio2 Int , Domicilio3 Int , IDivisa Int  NOT NULL , IZona Int , Tipo Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Repartidor (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Repartidor_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , CodNomina VARCHAR(50), eMail VARCHAR(50), Nombre VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , Telefono VARCHAR(50), Domicilio1 Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Serie (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Serie_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), FEntrada Datetime , FVenta Datetime , Notas VARCHAR(MAX) , Numero VARCHAR(50) NOT NULL  UNIQUE , Status Int  NOT NULL , DocCompra Int , DocVenta Int , IAlmacen Int , IEnsamble Int , ILote Int , IProducto Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Tabla (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Tabla_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Col1 VARCHAR(15), Col10 VARCHAR(15), Col2 VARCHAR(15), Col3 VARCHAR(15), Col4 VARCHAR(15), Col5 VARCHAR(15), Col6 VARCHAR(15), Col7 VARCHAR(15), Col8 VARCHAR(15), Col9 VARCHAR(15), Etiqueta Bit , nColumnas Int , nFilas Int , Nombre VARCHAR(10) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TarjetaCredito (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_TarjetaCredito_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(5) NOT NULL  UNIQUE , Descripcion VARCHAR(25) NOT NULL  UNIQUE,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TasaFija (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_TasaFija_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Nombre VARCHAR(10) NOT NULL  UNIQUE , Valor float,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TasaVariable (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_TasaVariable_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Nombre VARCHAR(10) NOT NULL  UNIQUE , ITabla Int  NOT NULL,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TipoCliente (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_TipoCliente_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(15) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX),sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TipoCupon (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_TipoCupon_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Caducidad Int , Nombre VARCHAR(25) NOT NULL  UNIQUE , Notas VARCHAR(MAX) , Tipo Int , UsoIlimitado Bit , Valor float , IDivisa Int , IProducto Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE TipoProveedor (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_TipoProveedor_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Codigo VARCHAR(15) NOT NULL  UNIQUE , Descripcion VARCHAR(50) NOT NULL  UNIQUE , Notas VARCHAR(MAX),sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Venta (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Venta_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Auditado Bit , Contabilizado Bit , Descuento1 money , Descuento2 money , dmnsMesa VARCHAR(45), dmnsNota VARCHAR(255), dmnsPersonas Int , Documento Int  NOT NULL , DomicilioEntrega VARCHAR(255), Fecha Datetime  NOT NULL , FEmbarque Datetime , FEntrega Datetime , FLiquidacion Datetime , FormaPago Int  NOT NULL , FUltimoCobro Datetime , ImporteAdicional money , Impuesto1 money , Impuesto2 money , Impuesto3 money , Impuesto4 money , Notas VARCHAR(MAX) , Partida VARCHAR(32), PComision float , Poliza VARCHAR(32), Referencia VARCHAR(25) NOT NULL  UNIQUE , StatusAdministrativo Int , StatusEntrega Int , StatusFacturacion Int , StatusFinanciero Int , Subtotal money , TipoCambio money  NOT NULL , TipoDomicilio Int , txtGuia VARCHAR(150), Vencimiento Datetime , AplicadoA Int , IAgente Int , ICaja Int , ICConsumo Int  NOT NULL , ICliente Int  NOT NULL , ICorte Int , IDivisa Int  NOT NULL , IFolio Int  NOT NULL , IGuia Int , IMovCaja Int , IPorteador Int , IRepartidor Int,sys_recver int default 0,sys_deleted bit null,sys_lock int null );
CREATE TABLE Zona (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Zona_PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , Sys_GUID VARCHAR(32) NOT NULL  UNIQUE , Sys_DTCreated Datetime , Sys_User VARCHAR(5), Sys_LastUser VARCHAR(5), Sys_Exported Bit , Sys_DTExported Datetime , Sys_Info VARCHAR(32), Nombre VARCHAR(30) NOT NULL  UNIQUE , Notas VARCHAR(255),sys_recver int default 0,sys_deleted bit null,sys_lock int null);
CREATE TABLE CConsumo_CProduccion_ (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_CConsumo_CProduccion__PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , ICProduccion Int  NOT NULL , IConsumo Int  NOT NULL );
CREATE TABLE Cliente_GrupoClientes_ (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_Cliente_GrupoClientes__PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , IGrupos Int  NOT NULL , IClientes Int  NOT NULL );
CREATE TABLE CProduccion_Producto_ (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_CProduccion_Producto__PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , IProductos Int  NOT NULL , ICentrosProduccion Int  NOT NULL );
CREATE TABLE GrupoProductos_Producto_ (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_GrupoProductos_Producto__PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , IProductos Int  NOT NULL , IGrupos Int  NOT NULL );
CREATE TABLE GrupoProveedores_Proveedor_ (Sys_PK Int  NOT NULL IDENTITY(1,1) CONSTRAINT IDX_GrupoProveedores_Proveedor__PK PRIMARY KEY , Sys_TimeStamp Datetime  NOT NULL , IProveedores Int  NOT NULL , IGrupos Int  NOT NULL );
CREATE TABLE cAmbitoPromociones (ID Int  NOT NULL CONSTRAINT IDX_cAmbitoPromociones_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cBCIMoratorios (ID Int  NOT NULL CONSTRAINT IDX_cBCIMoratorios_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cCantidades (ID Int  NOT NULL CONSTRAINT IDX_cCantidades_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cClaseProducto (ID Int  NOT NULL CONSTRAINT IDX_cClaseProducto_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cDiasXMes (ID Int  NOT NULL CONSTRAINT IDX_cDiasXMes_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cDocumentos (ID Int  NOT NULL CONSTRAINT IDX_cDocumentos_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cExcepcionPromociones (ID Int  NOT NULL CONSTRAINT IDX_cExcepcionPromociones_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cFormaComisionProducto (ID Int  NOT NULL CONSTRAINT IDX_cFormaComisionProducto_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cFormasPago (ID Int  NOT NULL CONSTRAINT IDX_cFormasPago_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cMetodosValuacion (ID Int  NOT NULL CONSTRAINT IDX_cMetodosValuacion_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cPeriodicidades (ID Int  NOT NULL CONSTRAINT IDX_cPeriodicidades_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cRestriccionPromociones (ID Int  NOT NULL CONSTRAINT IDX_cRestriccionPromociones_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusAdministrativos (ID Int  NOT NULL CONSTRAINT IDX_cStatusAdministrativos_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusCupon (ID Int  NOT NULL CONSTRAINT IDX_cStatusCupon_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusDetalleCompra (ID Int  NOT NULL CONSTRAINT IDX_cStatusDetalleCompra_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusDetalleVenta (ID Int  NOT NULL CONSTRAINT IDX_cStatusDetalleVenta_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusEntrega (ID Int  NOT NULL CONSTRAINT IDX_cStatusEntrega_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusFacturacion (ID Int  NOT NULL CONSTRAINT IDX_cStatusFacturacion_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusFinancieros (ID Int  NOT NULL CONSTRAINT IDX_cStatusFinancieros_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusGuias (ID Int  NOT NULL CONSTRAINT IDX_cStatusGuias_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusOrdenProduccion (ID Int  NOT NULL CONSTRAINT IDX_cStatusOrdenProduccion_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusOrg (ID Int  NOT NULL CONSTRAINT IDX_cStatusOrg_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cStatusSeries (ID Int  NOT NULL CONSTRAINT IDX_cStatusSeries_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTasasIVA (ID Int  NOT NULL CONSTRAINT IDX_cTasasIVA_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTipoProducto (ID Int  NOT NULL CONSTRAINT IDX_cTipoProducto_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTiposCategorias (ID Int  NOT NULL CONSTRAINT IDX_cTiposCategorias_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTiposComisionesProducto (ID Int  NOT NULL CONSTRAINT IDX_cTiposComisionesProducto_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTiposInteres (ID Int  NOT NULL CONSTRAINT IDX_cTiposInteres_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTiposPromociones (ID Int  NOT NULL CONSTRAINT IDX_cTiposPromociones_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTiposRegalos (ID Int  NOT NULL CONSTRAINT IDX_cTiposRegalos_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cTipoValorCupon (ID Int  NOT NULL CONSTRAINT IDX_cTipoValorCupon_PK PRIMARY KEY , Const VARCHAR(255));
CREATE TABLE cVigenciasPromociones (ID Int  NOT NULL CONSTRAINT IDX_cVigenciasPromociones_PK PRIMARY KEY , Const VARCHAR(255));













































































































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
ALTER TABLE Producto ADD CONSTRAINT RLProductoIVariables_IVariableSys_PK FOREIGN KEY  (IVariables ) REFERENCES IVariable(Sys_PK);
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
