/*Consultas para Déminus 2008 Punto de venta*/
/*==================MYSQL===============*/

CREATE VIEW qLineasXCProd AS SELECT DISTINCT Linea.Sys_PK AS Sys_PK, Linea.Codigo, Linea.Descripcion AS Descripcion, Linea.Color AS Color, CProduccion_Producto_.ICentrosProduccion AS ICProduccion,Linea.Visible FROM (Linea INNER JOIN Producto ON Linea.Sys_PK=Producto.ILinea) INNER JOIN CProduccion_Producto_ ON Producto.Sys_PK=CProduccion_Producto_.IProductos WHERE Linea.Clase=2 ORDER BY Linea.Codigo;

CREATE VIEW qPartidasVariables AS SELECT IVariable.FK_Producto_IVariables AS PKProducto, Count(IVariable.FK_Producto_IVariables) AS Partidas FROM IVariable INNER JOIN GrupoProductos ON GrupoProductos.Sys_PK=IVariable.Grupo Group By IVariable.FK_Producto_IVariables;

CREATE VIEW qProdDmns AS SELECT Producto.Sys_PK, Producto.Descripcion, Producto.Precio1, Producto.Precio2, Producto.Precio3, Producto.Precio4, Producto.Precio5, Producto.Color, Producto.Data1, Producto.VincularData, Producto.IClase, Producto.ITipo, Producto.ILinea, Producto.IDivisa, Divisa.TCambio, cfgImpuesto.I1Venta, cfgImpuesto.I2Venta, cfgImpuesto.I3Venta, cfgImpuesto.I4Venta, cfgImpuesto.Nombre, if(isnull(qPartidasVariables.Partidas),0,qPartidasVariables.Partidas) AS Variables, Producto.Lim2, Producto.Lim3, Producto.Lim4, Producto.Lim5, Producto.flagLimites,Producto.Unidad,Producto.FactorB FROM (cfgImpuesto INNER JOIN (Divisa INNER JOIN Producto ON Divisa.Sys_PK=Producto.IDivisa) ON cfgImpuesto.Sys_PK=Producto.Impuestos) LEFT JOIN qPartidasVariables ON Producto.Sys_PK=qPartidasVariables.PKProducto WHERE Producto.Visible<>0 ORDER BY Producto.Descripcion;

CREATE VIEW qProdDmns2 AS SELECT Producto.Sys_PK, Producto.Descripcion, Producto.Adicional, Producto.PAdic1, Producto.PAdic2, Producto.PAdic3, Producto.PAdic4, Producto.PAdic5, Producto.Color, Producto.IClase, Producto.ITipo, Producto.ILinea, Producto.IDivisa, Divisa.TCambio, cfgImpuesto.I1Venta, cfgImpuesto.I2Venta, cfgImpuesto.I3Venta, cfgImpuesto.I4Venta, cfgImpuesto.Nombre, if(isnull(qPartidasVariables.Partidas),0,qPartidasVariables.Partidas) AS Variables FROM ((Producto INNER JOIN cfgImpuesto ON cfgImpuesto.Sys_PK=Producto.Impuestos) INNER JOIN Divisa ON Divisa.Sys_PK=Producto.IDivisa) LEFT JOIN qPartidasVariables ON Producto.Sys_PK=qPartidasVariables.PKProducto ORDER BY Producto.Descripcion;

CREATE VIEW qProdDmnsXCProd AS SELECT qProdDmns.*, CProduccion_Producto_.ICentrosProduccion FROM CProduccion_Producto_ INNER JOIN qProdDmns ON CProduccion_Producto_.IProductos = qProdDmns.Sys_PK;

CREATE VIEW qProdCPCC AS SELECT CProduccion_Producto_.IProductos, CProduccion_Producto_.ICentrosProduccion, CConsumo_CProduccion_.IConsumo FROM CProduccion_Producto_ INNER JOIN CConsumo_CProduccion_ ON CProduccion_Producto_.ICentrosProduccion = CConsumo_CProduccion_.ICProduccion;

CREATE VIEW qBarrasDmns AS SELECT dmnsBarra.Sys_PK, dmnsBarra.Nombre, dmnsBarra.Tipo, dmnsBarra.Opciones, dmnsAsignBarra.Tipo AS AsignadoA, dmnsAsignBarra.FK AS PKAsignadoA FROM dmnsAsignBarra INNER JOIN dmnsBarra ON dmnsAsignBarra.FKBarra=dmnsBarra.Sys_PK;

CREATE VIEW qRecetaConstanteDmns AS SELECT IEnsamble.*, Producto.Codigo, Producto.Descripcion, Producto.IClase, Producto.ITipo, Producto.cIndirecto, Producto.cManoObra,Producto.cMaquinaria FROM Producto INNER JOIN IEnsamble ON Producto.Sys_PK = IEnsamble.Elemento;

CREATE VIEW qLineaRecetasAdicionales AS SELECT DISTINCT Linea.* FROM Linea INNER JOIN Producto ON Linea.Sys_PK=Producto.ILinea WHERE Linea.Visible<>0 AND (Producto.IClase=2 AND Producto.Adicional<>0);

CREATE VIEW qAdicionalesDmns AS SELECT DAdicionales.Sys_PK, DAdicionales.Sys_GUID, DAdicionales.Sys_Info, DAdicionales.Cantidad, DAdicionales.Notas, DAdicionales.IProducto, DAdicionales.Precio, DAdicionales.FK_DOrden_Adicionales, Producto.Codigo, Producto.Descripcion, Producto.IClase, Producto.ITipo, Producto.CIndirecto, Producto.CManoObra, Producto.CMaquinaria FROM Producto INNER JOIN DAdicionales ON Producto.Sys_PK = DAdicionales.IProducto;

CREATE VIEW qAdicionalesD2Dmns AS SELECT DAdic2.Sys_PK, DAdic2.Sys_GUID, DAdic2.Sys_Info, DAdic2.Cantidad, DAdic2.Notas, DAdic2.Precio, DAdic2.IProducto, DAdic2.FK_DAdicionales_IAdicionales, Producto.Codigo, Producto.Descripcion, Producto.IClase, Producto.ITipo, Producto.CIndirecto, Producto.CManoObra, Producto.CMaquinaria FROM Producto INNER JOIN DAdic2 ON Producto.Sys_PK = DAdic2.IProducto;

CREATE VIEW qVentasServicioMesa AS SELECT Venta.*,((Venta.Subtotal-Venta.Descuento1-Venta.Descuento2)+Venta.Impuesto1+Venta.Impuesto2+Venta.Impuesto3+Venta.Impuesto4) AS Total FROM Venta WHERE (Venta.StatusAdministrativo=1 OR Venta.StatusAdministrativo=2) AND Venta.dmnsMesa<>'' AND (NOT isnull(Venta.dmnsMesa));

CREATE VIEW qVentasServicioDomicilio AS SELECT Venta.*, ((Venta.Subtotal-Venta.Descuento1-Venta.Descuento2)+Venta.Impuesto1+Venta.Impuesto2+Venta.Impuesto3+Venta.Impuesto4) AS Total, Cliente.Sys_PK AS PKCliente, Cliente.Codigo AS CodCliente, Cliente.Nombre AS NombreCliente, Domicilio.Direccion, Domicilio.Colonia, Domicilio.Notas AS DomReferencia, Domicilio.Telefonos, Ciudad.Nombre AS Poblacion, EdoProv.Nombre AS NombreEstado, Pais.Nombre AS NombrePais FROM Venta INNER JOIN (Cliente LEFT JOIN (Domicilio LEFT JOIN (Ciudad LEFT JOIN (EdoProv LEFT JOIN Pais ON EdoProv.IPais=Pais.Sys_PK) ON Ciudad.Estado=EdoProv.Sys_PK) ON Domicilio.ICiudad=Ciudad.Sys_PK) ON Cliente.Domicilio1=Domicilio.Sys_PK) ON Venta.ICliente=Cliente.Sys_PK WHERE  (Venta.StatusAdministrativo=4 OR Venta.StatusAdministrativo=5) AND  (Venta.dmnsMesa='' Or isnull(Venta.dmnsMesa));

CREATE VIEW qVentasOrdenPendienteDmns AS SELECT DISTINCT Venta.Sys_PK,Venta.Fecha, Venta.Referencia, Venta.ICliente, Cliente.Nombre AS NombreCliente FROM Cliente INNER JOIN (Venta INNER JOIN Orden ON Venta.Sys_PK=Orden.IVenta) ON Venta.ICliente=Cliente.Sys_PK WHERE (Orden.Status<>3 AND Orden.Status<>4) ORDER BY Venta.Fecha,Venta.Referencia;

CREATE PROCEDURE UpdLockSale(IN Machine Varchar(32), IN PKVenta INT) BEGIN UPDATE Venta SET Sys_Info = Machine WHERE (isnull(Sys_Info) Or Sys_Info=Machine) And (StatusAdministrativo=1 Or StatusAdministrativo=2 Or StatusAdministrativo=4 Or StatusAdministrativo=5) And Sys_PK=PKVenta; END;

CREATE PROCEDURE UpdUnLockSale(IN Machine Varchar(32), IN PKVenta INT) BEGIN UPDATE Venta SET Sys_Info = Null WHERE Sys_Info=Machine And (StatusAdministrativo=1 Or StatusAdministrativo=2 Or StatusAdministrativo=4 Or StatusAdministrativo=5) And Sys_PK=PKVenta; END;