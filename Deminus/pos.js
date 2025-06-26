/*
Información de versión
============================
	Versión: 2.0.0.0
	

Objetos disponibles en el  script
============================
	AppVars .- Tiene acceso a las variables globales del sistema
	NodeVar.- Acceso a variables locales del sistema
	ThisCnn .- Acceso a Conexion
	Impresora .- Acceso a Impresora
	eBasic- Referencia a objeto de funciones para propósito general
	MainForm-Referencia a la ventana principal
*/

mssqldf1();
var NDec; //tiene el numero de decimales configurado en el panel de  control

var RegAppName="Deminus";//"Maxicomercio";
var NewAppName="Deminus";

//Componente Net de Timbrado 3.3
var NetCfdi33=null;

function evAlIniciar()
{
		loadScript("modulo_recargas","(Subprograma de recargas)");
		loadScript("modulo_guarderia", "(Subprograma de guarderia de equipaje)");
	//Se ejecuta al iniciar la aplicación, puede contener secuencias de inicialización para este script
	//eBasic.eMsgbox("Hola mundo");
	
	//Ejemplo de inicialización de control ActiveX acoplado
	//if (!MainForm.CreateAX("HPOSExample.Simulador", "NombreCualquiera", "", "")) eBasic.eMsgbox("Error al crear ActiveX");
	loadScript("UIRequisiciones", "(Subprograma Funciones de configuraci?n de requisiones)");
	loadScript("pos_events","(Subprograma manejador de eventos)" );
	loadScript("pos_support","(Subprograma Funciones de Soporte)");
	loadScript("saldoCaja","(Subprograma funciones al cerrar el corte)");
	loadScript("config_email_arqueo_deminus","(Subprograma para configurar el de envío de correo.)");
	loadScript("pos_requisiciones","(Subprograma de requisiciones.)");
	//if(gFunciones.CFDActivo()){
		loadScript("cfd","(Subprograma funciones para generacón de Comprobantes Fiscales Digitales)");	
		
		cfd.ApplicationName="Deminus";
		cfd.OnBackOffice=false;
		cfd.IniciarScript();	
	//}
	
	
	
}



function evAntesProducto(PKProducto,CodigoProducto, Cantidad)
{
	//Se ejecuta antes de que un producto se agregue o se modifique su cantidad con los comandos ++,+X y *X en la venta actual
	//Si la función retorna 1 el producto no se agregará o modificará
	return pos_events.evAntesProducto(PKProducto,CodigoProducto, Cantidad);
}

function evAntesQuitarProducto(PKProducto)
{
	//Se ejecuta antes de quitarse un producto
	//Si la función retorna 1 el producto no se quitará
	return pos_events.evAntesQuitarProducto(PKProducto);
}

function evAlAgregarProducto(PKProducto, CodigoProducto,Cantidad)
{
	//Se ejecuta cuando el producto se ha agregado por primera vez
	pos_events.evAlAgregarProducto(PKProducto, CodigoProducto,Cantidad);
}

function evAntesProcesarVenta(PKVenta)
{
	//Si la función devuelve 1 la venta no se procesará
	return pos_events.evAntesProcesarVenta(PKVenta);
}

function evAlGuardarCotizacion(PKVenta)
{
	//Se ejecuta al guardarse una cotización
	pos_events.evAlGuardarCotizacion(PKVenta)
}

function evAlProcesarVenta(PKVenta)
{
	//Se ejecuta cuando la venta ha sido procesada (contado, crédito o facturada)
	//Application.Eval("pos_events.evAlProcesarVenta(");
	
	//pos_events.eVAlProcesarVenta(PKVenta); //ERROR EL EVENTO ES CON v MINUSCULA: Modificado:GabrielJG
	pos_events.evAlProcesarVenta(PKVenta);
}

function evAlCrearVenta(PKVenta)
{
	//Se ejecuta cuando se crea una venta
	pos_events.evAlCrearVenta(PKVenta);
}

function evAlSeleccionarVenta(PKVenta)
{
	//Se ejecuta cuando se selecciona una venta que estaba retenida
	pos_events.evAlSeleccionarVenta(PKVenta);
}


function evAXInput(NomControl, IDEvento,Valor)
{
	//Responde al mensaje enviado por un control ActiveX acoplado
	//eBasic.eMsgbox("Control:"+NomControl+"\rEvento:"+IDEvento+"\rValor:"+Valor);
	pos_events.evAXInput(NomControl, IDEvento,Valor);
}

function evComandoDeUsuario(sCMD)
{
/*Función obsoleta pero todavía operativa
	//Se ejecuta al introducir un comando de usuario, su ejecución es posterior a los comandos definidos en AddUserCommands

	eBasic.eMsgbox(sCMD);
*/
}



function Ticket(SysTicket,Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito)
{

	if (loadScript("prn_ticket","El sub-programa para imprimir el ticket no pudo cargarse"))
			prn_ticket.ticket(SysTicket, Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito);
		
	return 0;

}

function TicketDom(SysTicket, Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito)
{
	if (loadScript("prn_ticket","El sub-programa para imprimir el ticket no pudo cargarse"))
			prn_ticket.ticketdom(SysTicket, Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito)
			
	return 0;
}

function Arqueo(PKCorte)
{


	if (loadScript("prn_arqueo","El sub-programa para imprimir arqueo/corte no pudo cargarse"))
			prn_arqueo.arqueo(PKCorte);
	
	return 0;
	
}

function ReciboProveedor(PKDCxP)
{
	return	pos_support.ReciboProveedor(PKDCxP);

}

function ReciboCliente(PKDCxC)
{
	pos_support.ReciboCliente(PKDCxC);
}


// *************************************

function AddPosCommand()
{
	try
	{
		
		AddUserCommands();
		return -1
	}catch(e)
	{
		eBasic.eMsgbox("Error al cargar comandos del sistema.");
		return 0;
	}

}


function AddUserCommands()
{

	//Comandos definidos por el usuario

	if (loadScript("pos_usercmds","( script de la definición de comandos del usuario)" ))
		pos_usercmds.main();
	

}


/* Funciones de Soporte */

function ModuleLoaded(OName)
{
var col;

col=Application.MainForm.Engine.Modules;

for (var i=1; i<=col.Count;i++)
{
	if (col.Item(i).Name=="mdl"+OName) return true;
}

return false;
}


function loadScript(sName,Err)
{

	try
	{
		if (!ModuleLoaded(sName))
		{
			if (!Application.LoadScript(sName+".js"))
			{
				eBasic.eMsgbox("Error al intentar Cargar script: " + sName + ".js " + Err);
				return false;
			}
		}
	}catch(e)
	{
		eBasic.eMsgbox("Error al intentar Cargar script: " + sName + ".js " + Err);
		return false;
	}	
	return true;
}

function mssqldf1()
{
	try
	{
		
		//Application.Adocnn.Execute("SET DATEFORMAT ymd");
		var esFactura=ExecuteSQL("SET DATEFORMAT ymd");
		
	}
	catch(e)
	{
		
	}
}
//********************************************
//********************************************
//********************************************


function Ingreso(PKMovCaja)
{
	var ErrDesc="Error al imprimir vale de ingreso";

	if(PKMovCaja==null){ 
		eBasic.eMsgbox(ErrDesc + "(No se ha indicado la clave principal)");
		return 0;
	}
	//return ImprimirVale(PKMovCaja,"INGRESO",ErrDesc);
	if (loadScript("prn_vale","El sub-programa para imprimir vales  pudo cargarse"))
	{

		return prn_vale.ImprimirVale(PKMovCaja,"INGRESO",ErrDesc);
	}
	else
		return 0;
}

function Egreso(PKMovCaja)
{
	var ErrDesc="Error al imprimir vale de egreso";
	
	if(PKMovCaja==null){ 
		eBasic.eMsgbox(ErrDesc + "(No se ha indicado la clave principal)");
		return 0;
	}
	//return ImprimirVale(PKMovCaja,"EGRESO",ErrDesc);
	if (loadScript("prn_vale","El sub-programa para imprimir vales  pudo cargarse"))		
		return prn_vale.ImprimirVale(PKMovCaja,"EGRESO",ErrDesc);
	else
		return 0;
}

//****************************************************
//****************************************************
//****************************************************

function ImprimirOrdenCancelada(PKOrden){
	if (loadScript("prn_comanda","El sub-programa para imprimir comandas"))		
		return prn_comanda.ImprimirOrdenCancelada(PKOrden);
	else
		return 0;
}

function ImprimirDOrdenCancelado(PKOrden,PKSCancelado){
	if (loadScript("prn_comanda","El sub-programa para imprimir comandas"))		
		return prn_comanda.ImprimirDOrdenCancelado(PKOrden,PKSCancelado);
	else
		return 0;
}

function ImprimirDOrdenModificado(PKOrden,PKSModificado){
	if (loadScript("prn_comanda","El sub-programa para imprimir comandas"))		
		return prn_comanda.ImprimirDOrdenModificado(PKOrden,PKSModificado);
	else
		return 0;
}

function ImprimirOrden(PKOrden){
	if (loadScript("prn_comanda","El sub-programa para imprimir comandas"))		
		return prn_comanda.ImprimirOrden(PKOrden);
	else
		return 0;
}

function ImprimirNotasLibres(CP,Mesa,Mesero,Notas){
	if (loadScript("prn_comanda","El sub-programa para imprimir comandas"))		
		return prn_comanda.ImprimirNotasLibres(CP,Mesa,Mesero,Notas);
	else
		return 0;
}


//*************************

function generarCFD(PKVenta)
{
	/*
var pkcfd=0;
var r;
	if(!gFunciones.CFDActivo()) return 0;
	
	if(!cfd.esFactura(PKVenta)) return 0;
	
	//cfd.despuesGuardarVenta(PKVenta,"La Factura se guardó correctamente.¿Desea crear el Comprobante Fiscal Digital?");
	pkcfd=cfd.despuesGuardarVenta(PKVenta,""); //Si no es automático no creará el cfd, si se envia el parámetro 2 pregutará al usuario.
	if(pkcfd<1){
		eBasic.eMsgbox("Error, no se pudo crear el cfd. Intente desde el BackOffice.",6);
	}
	*/
	try
	{
		if(PKVenta==undefined || PKVenta==null) return;
		Application.MouseHourglass();
		
		var esFactura=ExecuteSQL("SELECT Documento FROM Venta WHERE Sys_PK="+PKVenta);
		if(esFactura==null)
		{
			Application.MouseDefault();
			return;
		}
		if(esFactura.Fields("Documento").Value!=4)
		{
			Application.MouseDefault();
			return;
		}
		
		if(NetCfdi33==null)
			NetCfdi33=eBasic.eCreateObject("induxsoft.genCFDI.GenCFDI");
		
		
		NetCfdi33.AplicationName = Application.AppInfo.Name;
		NetCfdi33.CnnQName = Application.GetQName();
		NetCfdi33.PathXsltCadOriCfdi = "cadenaoriginal.xslt";
		
		NetCfdi33.GetDoctoVenta(PKVenta);
		Application.MouseDefault();
		
		if (NetCfdi33.GetIsError()) 
			throw new Error(NetCfdi33.GetMsgLastError());
		else
		{
			Application.MouseHourglass();
			var FolioSAT=NetCfdi33.FolioSAT;
			var cmdData=ExecuteSQL("select coalesce(uf_rfc_emisor,'-') as RFCEmisor from ut_cfd where uf_FolioSAT='"+FolioSAT+"';");
			if(cmdData==null) throw new Error("El recurso solicitado no existe.");
			var Rfc=cmdData("RFCEmisor");
			NetCfdi33.DownloadCfdi(FolioSAT,Rfc,false);
			if (NetCfdi33.GetIsError()) throw new Error(NetCfdi33.GetMsgLastError());
			Application.MouseDefault();
			NetCfdi33.PrintCFDIs(FolioSAT);
			if (NetCfdi33.GetIsError()) throw new Error(NetCfdi33.GetMsgLastError());
		}
		
	}catch(e)
	{
		Application.MouseDefault();
		eBasic.eMsgbox(e.message);
	}
}

function ExecuteSQL(cmdSQL)
{
	var r=null;
	try
	{
		r=Application.ADOCnn.Execute(cmdSQL);
		if (!(r.EOF && r.BOF)) return r;
		r=null;
	}
	catch(e)
	{
		return null;
	}
}

function Factura(PKFactura){
//esta funcion es llamada solo cuando cfd esta desactivado

	//function sustituida por metodos dentro de cfd.js
	//que imprimen la factura si asi fue indicado
	//dic2010 gb
	
	if(!Impresora.PrintReport(AppVars.GetTextVar("FXCA032",""),PKFactura)){
		eBasic.eMsgBox("Error al imprimir factura.");
	}
	

	return -1;
}

// IMPRESION DEL FONDO INICIAL 
// ***********************************************

function evInicioSesion(Usuario,PKCaja,PKCajero){
	//Al iniciar sesion
	loadScript("UIRequisiciones","(Subprograma Funciones de configuración de requisiones)");
	loadScript("pos_requisiciones","(Subprograma Funciones de browser de requisiciones)");
	
	try{
	//UIRequisiciones.createObjects();
		if(LBEfectivo.CurrentPKMovCajaXFondoInicial>0){
			Ingreso(LBEfectivo.CurrentPKMovCajaXFondoInicial);	
			LBEfectivo.CurrentPKMovCajaXFondoInicial=0;
		}
	}catch(e){}
	
	AddPosCommand();
}

function evAlRealizarCorte(PKCorte)
{
	
	var R;
	var sql;
	var caja;
		sql= "Select Icaja As PKCaja From Corte Where Sys_PK="+PKCorte;
		R=ThisCnn.execute(sql);
		if(R==null){
	
			return 0;
		}
		if (R.EOF && R.BOF){			
				eBasic.eMsgbox("No se encontró Nada que cancelar");
				return saldoCaja.corteCajaTerminal();
		}
	caja=R("PKCaja").Value;
	sql= "Update venta set statusAdministrativo=99 where statusfinanciero=0 AND Formapago=0 AND Subtotal=0 AND statusAdministrativo=1 AND Icorte is null AND ICaja="+caja;
	Application.ADOCnn.Execute(sql);
	
	
	
	return saldoCaja.corteCajaTerminal();
	//evento antes de realizar corte
	//retornar -2 para cancelar el corte de caja
	//eBasic.eMsgbox(PKCorte);
}	