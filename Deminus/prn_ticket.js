
//version 2.0.0.0

var RegAppName="Deminus";
var cImprimirDomicilio=false;
var CodDivisa;
var DescDivisa;



function ticketdom(SysTicket, Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito)
{
	cImprimirDomicilio=true;
	ticket(SysTicket, Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito);
	cImprimirDomicilio=false;
}

function ticket(SysTicket, Referencia,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito){
	
	if (SysTicket==null) return 0;

	// configurar Impresora.
	pos_support.ConfigImpresora();

 
	// Imprimir encabezado de Ticket
	ImprimirEncabezado();
	
	ImprimirPrincipal(SysTicket,Referencia);
	
	//Imprimir Detalle de Ticket	
	ImprimirDetalle(SysTicket,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito);


	//Imprimir Pie de ticket
	ImprimirPie();
	
	PrintCodeKiosco(SysTicket);

	Impresora.Terminar();

	return -1;
}


function importepropina(PKVenta)
{
	var r;
	var v=0;
	try
	{

		r=ThisCnn.Execute ("Select ImporteAdicional From Venta Where Sys_PK=" + PKVenta);
		if (r==null) return 0;
		if (r.EOF && r.BOF) return 0;
		if (r("ImporteAdicional").Value==null) 
			v =0;
		else
			v= r("ImporteAdicional").Value;
		r.Close();
		r=null;
		return v;
	}
	catch(e)
	{
		return 0;
	}
}

function PrintCodeKiosco(Ticket)
{
	try
	{
		CodeTicket=eBasic.eCreateObject("r5.ToolsFunctions.Main");
		if(CodeTicket!=null)
		{
			var sql="select Fecha,Sys_DTCreated from venta where StatusAdministrativo=3 and StatusFinanciero=2 and sys_pk="+Ticket;
			data = pos_support.OpenRecordset(sql,Application.AdoCnn);
			if (data!=null)
			{
				var sCode=CodeTicket.GenCodeTicket(data("Fecha").Value,data("Sys_DTCreated").Value,Ticket);
				if(sCode!="")
				{
					Impresora.Texto("Folio de Facturacion");
					Impresora.Texto("# "+sCode);
					Impresora.Texto(" ");
				}
			}
		}
		else
			eBasic.eMsgbox("No se creo: r5.ToolsFunctions.Main");
	}catch(ex){eBasic.eMsgbox("PrintCodeKiosco: "+ ex.message);}	
}

function ImprimirPie(){
var stCad;
	stCad = AppVars.GetTextVar("FXCA113", ""); //pide de ticket

	if (stCad=="") {
		Impresora.Texto (Impresora.SetChr(30,"=")); //Imprime 30 veces el caracter "-"
		return 0;
	}

	//Descomponer la cadena en Lineas.      Impresora.getTextMultiLine(notas,30,0);
	
				//referencias = Impresora.getTextMultiLine(R("Referencias"),30,0);
		//	Impresora.Texto(referencias);
	stCad = eBasic.ReplaceStrChars(stCad, String.fromCharCode(10), "");
	stCad = Impresora.getTextMultiLine(stCad,30,0);
		Impresora.Texto(stCad);


	Impresora.Texto(Impresora.AligTextInStr("Deminus R5",30,2," "));
	Impresora.Texto(" ");

	return 0;
}



function ImprimirDetalle(SysPK,Cambio,Efectivo,Cheque,Tarjeta,Vale,Deposito,Credito){

var Rst;
var Precio;
var sDetalle; // Cadena de Detalle de producto
var cStr;
var bIva;
var Desc;
var Imp;
var SumPrecio;
var Total=0;
var entero;
var Letras;	
var PrecioTotalXProducto=0;
var DescuentoIncluido;	
var X;
var CantidadProd=0;

var propina=0;
var sql="";

	if (Cambio==null) Cambio=0;
	if (Efectivo==null) Efectivo =0;
	if (Cheque==null) Cheque=0;
	if (Tarjeta==null) Tarjeta =0;
	if (Vale ==null) Vale =0;
	if (Deposito==null) Deposito=0;
	if (Credito ==null) Credito=0;
	


	bIva=false;
	if(NodeVars.EGetSetting(RegAppName, "NodeVars", "FXCT119", 0)==-1) 
		bIva=true; // Determina si se desglosa los impuestos. True: Dezglosar

		
	sql="Select Precio,Descuentos,Impuestos,Cantidad,Unidad,Codigo,Descripcion From qryDetalleTicket Where Venta=" + SysPK;

	
	Rst = pos_support.OpenRecordset(sql,Application.Adocnn);
	
	if (Rst==null) return 0;
	if (Rst.EOF && Rst.BOF) return 0;
	
	Desc=0;
	Imp=0;
	SumPrecio=0;
	Precio=0;
	
	while(!Rst.EOF){

		
		PrecioTotalXProducto=0;
		CantidadProd=Impresora.Redondear(Rst("Cantidad").Value,4);
		Precio = Rst("Precio").Value * CantidadProd;
		SumPrecio = SumPrecio + Precio;
		Desc =Desc + Impresora.Redondear(Rst("Descuentos").Value);		
		Imp =Imp + Impresora.Redondear(Rst("Impuestos").Value);	
		
		Total=Total+Impresora.Redondear((Precio - Rst("Descuentos").Value)+Rst("Impuestos").Value);	
		
		if(bIva)
			PrecioTotalXProducto=Precio;
		else
			PrecioTotalXProducto=(Precio-Rst("Descuentos").Value)+Rst("Impuestos").Value;
		
		PrecioTotalXProducto=Impresora.Redondear(PrecioTotalXProducto);

		/********** Codigo.. 
		cStr = Rst("Codigo").Value;
		if (cStr.length >=7)
			cStr= cStr.substring(0,7);º
		else
			cStr = Impresora.AligTextInStr(cStr,7,0," ");
		
		sDetalle =  cStr;
	         */			
		sDetalle ="";

		//************************************************
		cStr="";
		cStr = Rst("Descripcion").Value;
		cStr = Impresora.AligTextInStr(cStr,30,0," ");
		Impresora.Texto(cStr);		


		//************************************************
		cStr = CantidadProd+"";//Rst("Cantidad").Value+" ";		
		cStr = Impresora.AligTextInStr(cStr,13,1," ");
		sDetalle=cStr;
		
		cStr = Rst("Unidad").Value+"";
		cStr = Impresora.AligTextInStr(cStr,5,1," ");
		sDetalle=sDetalle+cStr;
		
		cStr = Impresora.FormatoDinero(PrecioTotalXProducto);
		cStr = Impresora.AligTextInStr(cStr,12,1," ");
		sDetalle=sDetalle+cStr;
		
		Impresora.Texto (sDetalle);
		
		//************************************************

	Rst.MoveNext();
	}

	SumPrecio=Impresora.Redondear(SumPrecio);
	Desc=Impresora.Redondear(Desc);
	Imp=Impresora.Redondear(Imp);
	
	Rst.Close();
	Impresora.Texto (Impresora.SetChr(30,"="));
	Impresora.Texto (" ");
	
	//  ***************  totales  *********	
	Total=Impresora.Redondear(Total);
	propina=importepropina(SysPK);
	
	if(bIva)
		Impresora.Texto (Impresora.AligTextInStr("Subtotal:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(SumPrecio),12,1," "));	
	if(Desc!=0){		
		if(bIva){
			Impresora.Texto(Impresora.AligTextInStr("Descuento:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Desc),12,1," "));			
		}else{
			//calcular descuentos que incluye el total con impuestos.			
			DescuentoIncluido=0;
			X=1-(Desc/SumPrecio)
			DescuentoIncluido=(Total/X)-Total;		
			DescuentoIncluido=Impresora.Redondear(DescuentoIncluido);
			Impresora.Texto(Impresora.AligTextInStr("Descuento:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(DescuentoIncluido),12,1," "));			
		}
	}
	if (bIva)		
		Impresora.Texto (Impresora.AligTextInStr("IVA:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Imp),12,1," "));
	
	Impresora.Texto (Impresora.AligTextInStr("Total:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Total),12,1," "));
	
	
	//********************************
	
	Impresora.Texto("");
	
	if (propina>0)
	{
		Impresora.Texto (Impresora.AligTextInStr("Consumo:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Total),12,1," "));
		Impresora.Texto (Impresora.AligTextInStr("Propina:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(propina),12,1," "));
		Impresora.Texto (Impresora.AligTextInStr("",18,1," ") + Impresora.AligTextInStr("------------",12,1," "));
		Impresora.Texto (Impresora.AligTextInStr("A PAGAR:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(propina+Total),12,1," "));
		
		Impresora.Texto("");
		
		entero = eBasic.IntVal(Total+propina);		
		if(CodDivisa.toLowerCase()=="pmx"){
			CodDivisa="M.N.";
		}
		Impresora.Texto(" ");	
		Letras=eBasic.NumbersToWords(entero) +" "+ DescDivisa +" "+ eBasic.eFormat(((Total+propina)-entero)*100,"00") + "/100 "+CodDivisa;
		Letras=Impresora.getTextMultiLine(Letras,30,0);
		Impresora.Texto(Letras);
		
	}
	else
	{
		entero = eBasic.IntVal(Total);		
		if(CodDivisa.toLowerCase()=="pmx"){
			CodDivisa="M.N.";
		}
		Impresora.Texto(" ");	
		Letras=eBasic.NumbersToWords(entero) +" "+ DescDivisa +" "+ eBasic.eFormat((Total-entero)*100,"00") + "/100 "+CodDivisa;
		Letras=Impresora.getTextMultiLine(Letras,30,0);
		Impresora.Texto(Letras);
	}
	Impresora.Texto(" ");
	

	
	if(Cambio==-1){ //REIMPRESION DE TICKETS
		Impresora.Texto ("*DUPLICADO "+pos_support.Fecha()+"  "+pos_support.Hora()+"*");
		Cambio=0;
	}

	//Imprimir Detalle de Pago
	Impresora.Texto(" ");
	Impresora.Texto(Impresora.AligTextInStr("-Forma de Pago-",30,2," "));
	Impresora.Texto(" ");

	if (Efectivo+Cheque+Tarjeta+Vale+Deposito+Credito+Cambio==0) 
		Impresora.Texto ("*NO ES UN COMPROBANTE DE PAGO*");


	if (Efectivo>0) Impresora.Texto(Impresora.AligTextInStr("Efectivo:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Efectivo),12,1," "));

	if (Tarjeta>0) Impresora.Texto(Impresora.AligTextInStr("Tarjeta:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Tarjeta),12,1," "));

	if (Vale>0) Impresora.Texto(Impresora.AligTextInStr("Vale:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Vale),12,1," "));

	if (Cheque>0) Impresora.Texto(Impresora.AligTextInStr("Cheque:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Cheque),12,1," "));

	if (Deposito>0) Impresora.Texto(Impresora.AligTextInStr("Depósito:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Deposito),12,1," "));

	if (Credito>0) Impresora.Texto(Impresora.AligTextInStr("Crédito:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Credito),12,1," "));

	if (Cambio!=0) Impresora.Texto(Impresora.AligTextInStr("Cambio:",18,1," ") + Impresora.AligTextInStr(Impresora.FormatoDinero(Cambio),12,1," "));




	Impresora.Texto(" ");
	
	return 0;
}


function ImprimirPrincipal(PKTicket,Referencia)
{
	
	var rcst;
	var rcst2;
	//var rrep;
	var descaja="";
	var nomcliente="";
	var NomAgente="";
	var NomMesa="";
	//var movcajas;
	var nomcajero="";
	var Corte;
	var ErrDesc="Error al imprimir ticket";
	var Buscar;
	var R2;
	var R3;
	var cveRep=0;	
	var Nombrepartidor="";
	var Telrepartidor=" ";
	var LetrasNomR="";
	var stCad="";
	var notas = "";
	
	var sql="";
	
	
	if(Referencia==null)	
		Referencia="REIMPRESIÓN";

	sql ="SELECT venta.notas as notas, Venta.ICliente, Venta.Sys_DTCreated, Venta.dmnsMesa As NomMesa, Venta.Fecha,Venta.ICorte, Venta.Irepartidor As ClaveR, Agente.Codigo As CodAgente, Agente.Nombre As NomAgente, Divisa.Codigo As CodDivisa, Divisa.Descripcion As DescDivisa, Cliente.Codigo As Cliente, Cliente.Nombre As NomCliente, Cliente.RFC As rfc, Caja.Codigo As Caja, Caja.Descripcion As DescCaja FROM (((Venta inner join Cliente On Venta.ICliente=Cliente.Sys_PK) inner join Divisa On Venta.IDivisa=Divisa.Sys_PK) left join Caja On Venta.ICaja=Caja.Sys_PK) left join Agente On Venta.IAgente=Agente.Sys_PK where Venta.Sys_PK=" +PKTicket;

	rcst=pos_support.OpenRecordset(sql,Application.AdoCnn);
	if (rcst==null){
		eBasic.eMsgbox(ErrDesc+"(Sin acceso a base de datos)");
		return 0;
	}
	if (rcst.EOF && rcst.BOF){
		eBasic.eMsgbox(ErrDesc+"(No se encontró el elemento con clave primaria= "+PKTicket+")");
		return 0;
	}
	
	Impresora.Texto(pos_support.Fecha(rcst("Fecha").Value)+"  " + pos_support.Hora(rcst("Sys_DTCreated").Value));

	nomcliente = rcst("NomCliente").Value;
	NomAgente = rcst("NomAgente").Value;
	NomMesa = rcst("NomMesa").Value;
	cveRep= rcst("ClaveR").Value;
	notas= rcst("notas").Value;
   if(rcst("notas").Value==null)notas="";

	// ********** Asignar Codigo y descripcion de Divisa  a variables globales para su uso en detalle de ticket
	

	CodDivisa=rcst("CodDivisa").Value;
	DescDivisa=rcst("DescDivisa").Value;
	

	Buscar=false;
	
	
	
	//   Modificacion Mostar el Nombre y Telefono del Repartidor Servicio a Domicilio  RPF: A835B08E09DA11E7982E6C0B84A7A5FC
	//   Lun 8.Mayo.2017  2:48pm  Joeh
    //	
	
	sql="SELECT nombre As NRepartidor, domicilio1 from repartidor  where sys_pk=" +cveRep;
	R3=pos_support.OpenRecordset(sql,Application.AdoCnn);
	cveRep=0;
	if (R3!=null)
	{
		Nombrepartidor= R3("NRepartidor").Value;
		cveRep=eBasic.intval(R3("domicilio1").Value);
		NomAgente='';
		NomMesa='';
		R3=null;
	}
	
	
	//eBasic.eMsgbox(ErrDesc+"( CLAVE DEL Domicilio1=  )"  + cveRep);
	
	
	
	//   checando el telefono del repartidor
	
	
	if(cveRep>0){
		sql="";
		sql="SELECT telefonos As TRepartidor from domicilio  where sys_pk=" +cveRep;
		R3=pos_support.OpenRecordset(sql,Application.AdoCnn);
		
		if (R3==null) return 0;
		if (R3.EOF && R3.BOF) return 0;		
		Telrepartidor=R3("TRepartidor").Value;
		R3=null;
	}	
	

	
	
	//   FIN DE CODIGO NUEVO


	
	

	//Corte=MainForm.CorteActual();
	
	try{
		// Previene error al utilizar prn_ticket desde el backOffice, MainForm no tiece CorteActual.
		Corte=Application.MainForm.CorteActual();
	 }catch(e){
		Corte=null; 
		Buscar =true; 
	}
	
	if(Corte!=null){
		if(rcst("ICorte").Value!=null){
			if(Corte.Sys_PK==rcst("ICorte").Value){
				descaja = Corte.ICaja.Descripcion; //rcst("DescCaja").Value;	
				nomcajero = Corte.ICajero.Nombre; //rcst2("Nombre").Value;


			}else{
				Buscar=true;
			}
		}
	}
	
	
	
	if(Buscar){
		sql ="SELECT Corte.Sys_PK, Caja.Codigo AS CodCaja, Caja.Descripcion AS DescCaja, Cajero.Codigo AS CodCajero, Cajero.Nombre AS NombreCajero FROM Cajero INNER JOIN (Caja INNER JOIN Corte ON Caja.Sys_PK = Corte.ICaja) ON Cajero.Sys_PK = Corte.ICajero WHERE Corte.Sys_PK="+rcst("ICorte").Value;
	
	
		R2 = pos_support.OpenRecordset(sql,Application.Adocnn);
		
		if(R2!=null){
			if(!(R2.BOF && R2.EOF)){
				descaja = R2("DescCaja").Value; //rcst("DescCaja").Value;	
				nomcajero = R2("NombreCajero").Value; //rcst2("Nombre").Value;
			}
			R2=null;
		}
	}
	
	Impresora.Texto (Impresora.AligTextInStr("Ticket: " +Referencia,30,0," "));
	Impresora.Texto (Impresora.AligTextInStr("Cajero: " +nomcajero,30,0," "));
	Impresora.Texto (Impresora.AligTextInStr("Caja: "+descaja,30,0," "));
	Impresora.Texto (Impresora.AligTextInStr("Cliente: "+nomcliente,30,0," "));
	Impresora.Texto (Impresora.AligTextInStr("Mesero: "+NomAgente,30,0," "));
	Impresora.Texto (Impresora.AligTextInStr("Mesa: "+NomMesa,30,0," "));
	
	//  Modificacion mostar nombre,Telefono del Repartidor Servicio a Domicilio RPF: A835B08E09DA11E7982E6C0B84A7A5FC  Lun 8.may.2017 Joeh
	Impresora.Texto(Impresora.SetChr(30,"=")); //Imprime 30 veces el caracter "-"	
	stCad = "     - DATOS REPARTIDOR -";
	Impresora.Texto(stCad);
	
	LetrasNomR=Impresora.getTextMultiLine(Nombrepartidor,30,0);
	Impresora.Texto(LetrasNomR);	  //	Impresora.Texto (Impresora.AligTextInStr(""+Nombrepartidor,30,0," ")); //   
	Impresora.Texto (Impresora.AligTextInStr(""+Telrepartidor,30,0," "));
	Impresora.Texto(" ");
	
	if (cImprimirDomicilio)
	{
		//Domicilio completo 
		ImprimirDomicilio(rcst("ICliente").Value);
	}
	
	//	Impresora.Texto(Impresora.SetChr(30,"=")); //Imprime 30 veces el caracter "-"	
	    
		Impresora.Texto("     - NOTAS RAPIDAS -");
		
		notas=Impresora.getTextMultiLine(notas,30,0);
		//Impresora.Texto (Impresora.AligTextInStr(""+notas,30,0," "));
	    Impresora.Texto(notas);
			Impresora.Texto(" ");

	//Imprimir Titulos de columnas
	ImprimirColumnas();
	Impresora.Texto(" ");	
	
}

function ImprimirDomicilio (PKCliente){

	var R=null;
	var ErrDesc="Error al imprimir Domicilio";
	var stCad;

	var sql="";
	
	stCad = Impresora.SetChr(30,"=");
	Impresora.Texto(stCad);	

	
	if(PKCliente==null){ 
		eBasic.eMsgbox(ErrDesc + "(No se ha indicado la clave principal)",6);
		return 0;
	}
	
	if(PKCliente==0){ 
		eBasic.eMsgbox(ErrDesc + "(No se ha indicado la clave principal)",6);
		return 0;
	}
	
	if(PKCliente>0){ 
	
		try
		{
			sql=" SELECT Cliente.Sys_PK,Cliente.Nombre, Domicilio.CodPos AS CodigoPostal, Domicilio.Colonia AS Colonia, Concat('Dirección: ',replace(Domicilio.Direccion,'|',' ')) AS Direccion, Domicilio.Telefonos AS Telefonos, concat('Referencia: ', replace(Domicilio.Notas,'|',' ')) AS Referencias, Ciudad.Nombre AS Ciudad FROM Cliente INNER JOIN (Domicilio INNER JOIN Ciudad ON Domicilio.ICiudad=Ciudad.Sys_PK) ON Cliente.Domicilio1=Domicilio.Sys_PK WHERE Cliente.Sys_PK="+PKCliente;
			
			R=pos_support.OpenRecordset(sql,Application.Adocnn);
			
			if (R==null) return 0;
			if (R.EOF && R.BOF) return 0;
			
			//printM (R("Direccion").Value,30,0);
			//printM (R("Referencias").Value,30,0);
			//printM (R("Colonia").Value,30,0);
		var domicilio ="";
		var referencias = "";
			Impresora.Texto("     - ENVIAR A: -  ");
			Impresora.Texto (Impresora.AligTextInStr("Cliente:"+R("Nombre"),30,0," "));
			Impresora.Texto (Impresora.AligTextInStr("Ciudad:"+R("Ciudad"),30,0," "));
			Impresora.Texto (Impresora.AligTextInStr("Colonia:"+R("Colonia"),30,0," "));
			Impresora.Texto (Impresora.AligTextInStr("CodPos:"+R("CodigoPostal"),30,0," "));
			Impresora.Texto (Impresora.AligTextInStr("Telefonos:"+R("Telefonos"),30,0," "));
			domicilio=Impresora.getTextMultiLine(R("Direccion"),30,0);
			Impresora.Texto(domicilio);
			referencias = Impresora.getTextMultiLine(R("Referencias"),30,0);
			Impresora.Texto(referencias);
			//Impresora.Texto (Impresora.AligTextInStr("Referencia:"+referencias,30,0," "));
			stCad = Impresora.SetChr(30,"=");
			Impresora.Texto(stCad);	
		}catch(e){
			eBasic.eMsgbox(e);
		}
	}
}
function printM(s,col, alig)
{
	var stCad = eBasic.ReplaceStrChars(s, String.fromCharCode(10), "");
	Impresora.Texto(stCad,String.fromCharCode(13),col,alig);
}
function ImprimirEncabezado()
{
	var stCad="";
	stCad = AppVars.GetTextVar("FXCA112", "");
	
	if (stCad=="") 
	{

		Impresora.Texto(Impresora.SetChr(30,"=")); //Imprime 30 veces el caracter "-"
		return 0;
	}
	
	//Descomponer la cadena en Lineas.
	stCad = eBasic.ReplaceStrChars(stCad, String.fromCharCode(10), "");
	Impresora.MTexto(stCad,String.fromCharCode(13),30,2);


	Impresora.Texto(" ");
	Impresora.Texto(Impresora.SetChr(30,"=")); //Imprime 30 veces el caracter "-"
	return 0;
	
}


function ImprimirColumnas(){
var stCad;

		// stCad = "Codigo    ";
	stCad = "- DETALLE DE SU COMPRA-  ";


	Impresora.Texto(Impresora.AligTextInStr(stCad,30,2," "));	
	stCad = Impresora.SetChr(30,"=");	
	Impresora.Texto(stCad);	
	Impresora.Texto("DESCRIP CANT  UNID     IMPORTE");
}
//****************************************






