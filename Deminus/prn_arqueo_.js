//version 2.0.0.0

var ArqueTotal1;
var ArqueTotal2;
var RegAppName="Deminus";//agregado al parecer no necesario;

/*
	Variables creada para personalizar el Detall de Corte
*/

var cPrintTitle=true;  // Imprimir Encabezado
var DetailsCZ=true; // Imprimir Corte Z
	var LineSales=true; // Detalle x Linea
	var DepSales=true; 	// Detalle x Departamento
	var cDesgIVA =true;  //Desglozar IVA
var cPrintSeller=true; // Imprimir Vendedore;
var cAvSales=true; // Venta Promedio 
var cNoSales=true; // y Número de operaciones
var fbtipo=true;
var fbtEgreso=false;
var fnsinicial=0;


function ImprimirFacturasDelCorte(PKCorte,ErrDesc){
	var R;	
	var S;	
	var Facturado=0;	
	var XFacturar=0;
	var sImporte;
	var Val=0;
	var sql="";
		
	if(ErrDesc==null)
		ErrDesc="";
	
	sql="SELECT Venta.Referencia,Venta.StatusFacturacion,((Venta.Subtotal-Venta.Descuento1-Venta.Descuento2)+Venta.Impuesto1+ Venta.Impuesto2+ Venta.Impuesto3+ Venta.Impuesto4) AS Total FROM Venta WHERE Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte="+PKCorte+" ORDER BY Venta.Sys_PK";
	
	R=pos_support.OpenRecordset(sql,Application.Adocnn);
	
	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(No se pudieron obtener las ventas facturadas del corte indicado)");
		return 0;
	}
	S=Impresora.AligTextInStr("- FACTURAS -",30,2," ");		
	Impresora.Texto(S);
	Facturado=0;
	XFacturar=0;
	
	while(!R.EOF){		
		Val=Impresora.Redondear(R("Total").Value);
		if(R("StatusFacturacion").Value==3){
			S=Impresora.AligTextInStr(R("Referencia").Value,16,0," ");			
			sImporte=Impresora.FormatoDinero(Val);
			sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
			Impresora.Texto(S+sImporte);
			Facturado=Facturado+Val;
		}else{
			XFacturar=XFacturar+Val;
		}
		R.MoveNext();
	}
	R.Close();
	
	//TOTAL	
	//S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
	//Impresora.Texto(S);
	S=Impresora.AligTextInStr("FACTURADO",16,0," ");
	sImporte=Impresora.FormatoDinero(Facturado);
	S=S+Impresora.AligTextInStr(sImporte,14,1," "); //se suma un espacio al total para que coincida con los datos anterios donde se coloco F o C
	Impresora.Texto(S);	
		
	//POR FACTURAR
	S=Impresora.AligTextInStr("POR FACTURAR",16,0," ");
	sImporte=Impresora.FormatoDinero(XFacturar);
	S=S+Impresora.AligTextInStr(sImporte,14,1," ");		
	Impresora.Texto(S);
	S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
	Impresora.Texto(S);
	//TOTAL
	S=Impresora.AligTextInStr("TOTAL",16,0," ");
	sImporte=Impresora.FormatoDinero(Facturado+XFacturar);
	S=S+Impresora.AligTextInStr(sImporte,14,1," ");
	Impresora.Texto(S);
	Impresora.Texto("");
	return -1;
}

function ImprimirIngresosXFormaPago(PKCorte,Divisa,TCambio,DivisaPred,ErrDesc){
	var R;
	var S;
	var sImporte;
	var SumTotal=0;
	var Val=0;
	
	if(ErrDesc==null)
		ErrDesc="";
	
	R=ThisCnn.execute("SELECT SUM(MovCaja.Cheques) AS Cheques, SUM(MovCaja.Depositos) AS Depositos, SUM(MovCaja.Efectivo) AS Efectivo, SUM(MovCaja.Tarjetas) AS Tarjetas, SUM( MovCaja.Vales) AS Vales FROM MovCaja WHERE MovCaja.ICorte="+PKCorte+" AND MovCaja.IDivisa="+Divisa+" AND (MovCaja.Cheques>=0 AND  MovCaja.Depositos>=0 AND MovCaja.Efectivo>=0 AND MovCaja.Tarjetas>=0 AND MovCaja.Vales>=0);");
	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al obtener ingresos por tipo del corte)");
		return 0;
	}
			
	//DETALLE DE INGRESOS POR FORMA DE PAGO
	SumTotal=0;
	if(!(R.EOF && R.BOF)){
		//EFECTIVO
		S=Impresora.AligTextInStr(" BILLETES",16,0," ");
		Val=Impresora.Redondear(R("Efectivo").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//TARJETAS
		S=Impresora.AligTextInStr(" TARJETAS",16,0," ");
		Val=Impresora.Redondear(R("Tarjetas").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//CHEQUES
		S=Impresora.AligTextInStr(" CHEQUES",16,0," ");
		Val=Impresora.Redondear(R("Cheques").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//DEPOSITOS
		S=Impresora.AligTextInStr(" DEPOSITOS",16,0," ");
		Val=Impresora.Redondear(R("Depositos").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//VALES
		S=Impresora.AligTextInStr(" VALES",16,0," ");
		Val=Impresora.Redondear(R("Vales").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//SUMA TOTAL
		SumTotal=R("Efectivo").Value+R("Tarjetas").Value+R("Cheques").Value+R("Depositos").Value+R("Vales").Value	
		SumTotal=Impresora.Redondear(SumTotal);
	}
	R.Close();
	S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
	Impresora.Texto(S);
	//TOTAL	
	S=Impresora.AligTextInStr(" TOTAL",16,0," ");
	sImporte=Impresora.FormatoDinero(SumTotal);
	sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
	Impresora.Texto(S+sImporte);
	
	//SI NO ES DIVISA PREDETERMINADA MULTIPLICAR POR TIPO DE CAMBIO
	if(Divisa!=DivisaPred){
		S=Impresora.AligTextInStr(" X TCambio",16,1," ");
		sImporte=Impresora.FormatoDinero(TCambio);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//SUMATORIA
		S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
		Impresora.Texto(S);
		S=Impresora.AligTextInStr(" TOTAL",16,0," ");
		sImporte=Impresora.FormatoDinero(Impresora.Redondear(SumTotal*TCambio));
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
	}
	
	return -1;
}


function ImprimirIngresosXCategoria(PKCorte,PKCaja,Divisa,TCambio,DivisaPred,ErrDesc,fnsinicial,ftipo){
	var SQL;
	SQL="SELECT Categoria.Descripcion AS MovCategoria, SUM(MovCaja.Cheques+MovCaja.Depositos+MovCaja.Efectivo+ MovCaja.Tarjetas + MovCaja.Vales) AS Total FROM Categoria INNER JOIN MovCaja ON Categoria.Sys_PK = MovCaja.ICategoria WHERE MovCaja.ICorte=" + PKCorte + " AND MovCaja.IDivisa=" + Divisa + " AND (MovCaja.Cheques>=0 AND  MovCaja.Depositos>=0 AND MovCaja.Efectivo>=0 AND MovCaja.Tarjetas>=0 AND MovCaja.Vales>=0) GROUP BY Categoria.Descripcion;";
	return IngresosEgresosXCartegoria(SQL,PKCorte,PKCaja,Divisa,TCambio,DivisaPred,ErrDesc+"(Error al obtener ingresos del corte)",fnsinicial,ftipo); 
}

function ImprimirEgresosXCategoria(PKCorte,PKCaja,Divisa,TCambio,DivisaPred,ErrDesc,fbtEgreso){
	var SQL;
	var FSaldo=0;
	SQL="SELECT Categoria.Descripcion AS MovCategoria, SUM(MovCaja.Cheques+MovCaja.Depositos+MovCaja.Efectivo+ MovCaja.Tarjetas + MovCaja.Vales) AS Total FROM Categoria INNER JOIN MovCaja ON Categoria.Sys_PK = MovCaja.ICategoria WHERE MovCaja.ICorte=" + PKCorte + " AND MovCaja.IDivisa=" + Divisa + " AND (MovCaja.Cheques<=0 AND  MovCaja.Depositos<=0 AND MovCaja.Efectivo<=0 AND MovCaja.Tarjetas<=0 AND MovCaja.Vales<=0) GROUP BY Categoria.Descripcion;";
	// codigo anterior
	//return IngresosEgresosXCartegoria(SQL,PKCorte,PKCaja,Divisa,TCambio,DivisaPred,ErrDesc+"(Error al obtener egresos del corte)");
	return IngresosEgresosXCartegoria(SQL,PKCorte,PKCaja,Divisa,TCambio,DivisaPred,ErrDesc+"(Error al obtener egresos del corte)",FSaldo,fbtEgreso);
}


// 18/02/2009 Fin --> Imprimir Detalle de Abonos

function IngresosEgresosXCartegoria(SQL,PKCorte,PKCaja,Divisa,TCambio,DivisaPred,ErrDesc,fnsinicial,fbtipo){
 	var R;	
	var S;
	var sImporte;
	var SumTotal=0;
	var Val=0;
	var TempSumTotal=0;
	
	if(ErrDesc==null)
		ErrDesc="";
		
	R=ThisCnn.execute(SQL);
	if(R==null){
		eBasic.eMsgbox(ErrDesc,6);
		return 0;
	}
	
	//DETALLE DE INGRESOS POR CATEGORIA
	SumTotal=0;
	while(!R.EOF){		
		S=Impresora.AligTextInStr(" "+R("MovCategoria").Value,16,0," ");
		Val=Impresora.Redondear(R("Total").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		SumTotal=SumTotal+Val;
		R.MoveNext();
	}
	R.Close();
	S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
	Impresora.Texto(S);
	
	TempSumTotal=SumTotal;
	// codigo agrega saldo inicial	a los ingresos  10.mayo.2017  joeh  01:18 pm joeh
	if(fbtipo==true){
		TempSumTotal=TempSumTotal+fnsinicial;
	}

	
	//TOTAL	
	S=Impresora.AligTextInStr(" TOTAL",16,0," ");
	//  codigo anterior
	//sImporte=Impresora.FormatoDinero(SumTotal);
	//sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
	//Impresora.Texto(S+sImporte);
		
	sImporte=Impresora.FormatoDinero(TempSumTotal);
	sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
	Impresora.Texto(S+sImporte);
	
	
	//SI NO ES DIVISA PREDETERMINADA MULTIPLICAR POR TIPO DE CAMBIO
	if(Divisa!=DivisaPred){
		S=Impresora.AligTextInStr(" X TCambio",16,1," ");
		sImporte=Impresora.FormatoDinero(TCambio);
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		//SUMATORIA
		S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
		Impresora.Texto(S);
		S=Impresora.AligTextInStr(" TOTAL",16,0," ");		
		sImporte=Impresora.FormatoDinero(Impresora.Redondear(SumTotal*TCambio));
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);
		
		if(ArqueTotal1==null)	
			ArqueTotal1=Impresora.Redondear(SumTotal*TCambio); //PRIMERO INGRESOS
		else
			ArqueTotal2=Impresora.Redondear(SumTotal*TCambio); //SEGUNDA LLAMASA EGRESOS		
	}else{
		if(ArqueTotal1==null)	
			ArqueTotal1=Impresora.Redondear(SumTotal*TCambio); //PRIMERO INGRESOS
		else
			ArqueTotal2=Impresora.Redondear(SumTotal*TCambio); //SEGUNDA LLAMASA EGRESOS		
	} 
		
	return -1;
}

function SaldoInicial(PKCorte,PKCaja,Divisa,ErrDesc){
	//SALDO INICIAL
	var R;
	var S;
	var sImporte;
	var Saldo=0;
	var sql="";
	if(ErrDesc==null)
		ErrDesc="";
	
	sql="SELECT SUM(MovCaja.Cheques+MovCaja.Depositos+MovCaja.Efectivo+MovCaja.Tarjetas+MovCaja.Vales) AS Saldo FROM Corte INNER JOIN MovCaja ON Corte.Sys_PK = MovCaja.ICorte WHERE MovCaja.ICorte<"+PKCorte+" AND Corte.ICaja="+PKCaja+" AND MovCaja.IDivisa="+Divisa+";";
	
	R=pos_support.OpenRecordset(sql,Application.AdoCnn);
	
	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al obtener saldo inicial del corte)");
		return 0;
	}
	
	Saldo=0;
	
	if(!(R.EOF && R.BOF)){			
		S=Impresora.AligTextInStr(" SALDO INICIAL",16,0," ");
		if(R("Saldo").Value==null){
			sImporte=Impresora.FormatoDinero(0);
		}else{
			Saldo=Impresora.Redondear(R("Saldo").Value);
			sImporte=Impresora.FormatoDinero(Saldo);
		}
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);		
	}
	R.Close();
	return Saldo;
}

function ImprimirTicketsDelCorte(PKCorte,ErrDesc){
	var R;
	var Contado=0;
	var Credito=0;
	var S;
	var sImporte;
	var Tag;
	var Val=0;
	var propinas=0;
	var propinascaja=0;
	var sql="";
	if(ErrDesc==null)
		ErrDesc="";
		
	//anterior:: //R=ThisCnn.execute("SELECT Venta.Referencia, Venta.FormaPago,Venta.StatusFacturacion,Venta.StatusAdministrativo, ((Venta.Subtotal-Venta.Descuento1-Venta.Descuento2)+Venta.Impuesto1+ Venta.Impuesto2+ Venta.Impuesto3+ Venta.Impuesto4) AS Total, Venta.ImporteAdicional FROM Venta WHERE Venta.Documento=6 AND ((Venta.ICorte="+PKCorte+" And Venta.StatusAdministrativo>=3) OR Venta.StatusAdministrativo<3) ORDER BY Venta.Referencia");
	sql="SELECT Venta.Referencia, Venta.FormaPago,Venta.StatusFacturacion,Venta.StatusAdministrativo, ((Venta.Subtotal-Venta.Descuento1-Venta.Descuento2)+Venta.Impuesto1+ Venta.Impuesto2+ Venta.Impuesto3+ Venta.Impuesto4) AS Total, Venta.ImporteAdicional FROM Venta WHERE Venta.Documento=6 AND ((Venta.ICorte="+PKCorte+" And Venta.StatusAdministrativo>=3) OR Venta.StatusAdministrativo<3) ORDER BY Venta.Referencia";
	
	R=pos_support.OpenRecordset(sql,Application.Adocnn);
	
	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(No se pudieron obtener las ventas del corte indicado)");
		return -1;
	}
	S=Impresora.AligTextInStr("- VENTAS -",30,2," ");		
	Impresora.Texto(S);
	
	while(!R.EOF){		
		S=Impresora.AligTextInStr(R("Referencia").Value,16,0," ");
		Tag="";
		switch(R("StatusAdministrativo").Value){		
			case 0:
				sImporte="-SIN USO-";break;	
			case 1:
				sImporte="-ABIERTO-";break;	
			case 2:
				sImporte="-CERRADO-";break;				
			case 3:	
				Val=Impresora.Redondear(R("Total").Value);			
				sImporte=Impresora.FormatoDinero(Val);
				if(R("StatusFacturacion").Value==3){ //facturado				
					Tag="F";
				}
				switch(R("FormaPago").Value){
					case 1: //Contado
						Contado=Contado+Val;
						try
						{
						propinascaja+=(R("ImporteAdicional").Value);
						}
						catch(e)
						{
						}
						if(Tag=="")
							Tag=" ";
						break;
					case 2: //Crédito
						Credito=Credito+Val;
						Tag=Tag+"C";
				}
				//La propina
				try
				{
					propinas+=(R("ImporteAdicional").Value);
				}
				catch(e)
				{
				}
				/////////////////////////////////////////////
				sImporte=sImporte+Tag;
				break;
			case 4:
				sImporte="-POR ENTREGAR-";break;
			case 5:
				sImporte="-REPARTO-";break;
			case 99:
				sImporte="-CANCELADO-";break;			
		}
		
		sImporte=Impresora.AligTextInStr(sImporte,14,1," ");		
		Impresora.Texto(S+sImporte);				
		R.MoveNext();
	}
	R.Close();
	//TOTAL	
		
	S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
	Impresora.Texto(S);
	S=Impresora.AligTextInStr("TOTAL",16,0," ");
	sImporte=Impresora.FormatoDinero(Contado+Credito);
	S=S+Impresora.AligTextInStr(sImporte+" ",14,1," "); //se suma un espacio al total para que coincida con los datos anterios donde se coloco F o C
	Impresora.Texto(S);
	//CREDITO
	Impresora.Texto("");
	S=Impresora.AligTextInStr("CRÉDITO",16,0," ");
	sImporte=Impresora.FormatoDinero(Credito);
	S=S+Impresora.AligTextInStr(sImporte,14,1," ");		
	Impresora.Texto(S);
	//CONTADO
	S=Impresora.AligTextInStr("CONTADO",16,0," ");
	sImporte=Impresora.FormatoDinero(Contado);
	S=S+Impresora.AligTextInStr(sImporte,14,1," ");		
	Impresora.Texto(S);
	S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");
	Impresora.Texto(S);
	//TOTAL
	S=Impresora.AligTextInStr("TOTAL",16,0," ");
	sImporte=Impresora.FormatoDinero(Contado+Credito);
	S=S+Impresora.AligTextInStr(sImporte,14,1," ");
	Impresora.Texto(S);
	Impresora.Texto("");	
	//Propinas
	
	Impresora.Texto(Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," "));
	Impresora.Texto(Impresora.AligTextInStr("PROPINAS",16,0," ")+Impresora.AligTextInStr(Impresora.FormatoDinero(propinas),14,1," "));
	Impresora.Texto("");
	Impresora.Texto(Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," "));
	Impresora.Texto(Impresora.AligTextInStr("INGRESOS EN CAJA",16,0," ")+Impresora.AligTextInStr(Impresora.FormatoDinero(Contado+propinascaja),14,1," "));
	Impresora.Texto("(INCLUYE PROPINAS)");
	Impresora.Texto("");
	////////////////////
	return Contado+Credito;
}

function ImprimirEncabezado(){
var stCad;
	stCad = AppVars.GetTextVar("FXCA112", "");
	if (stCad=="") {
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

function GetConfigTicket(){

 // Imprimir Encabezado
if (NodeVars.EGetSetting(RegAppName, "POSVAR", "cPrintTitle", 0)==1) cPrintTitle=true;
else cPrintTitle=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "DetailsCZ", 0)==1) DetailsCZ=true;
else DetailsCZ=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "LineSales", 0)==1) LineSales=true;
else LineSales=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "DepSales", 0)==1) DepSales=true;
else DepSales=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "cDesgIVA", 0)==1) cDesgIVA=true;
else cDesgIVA=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "cPrintSeller", 0)==1) cPrintSeller=true;
else cPrintSeller=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "cAvSales", 0)==1) cAvSales=true;
else cAvSales=false;

if (NodeVars.EGetSetting(RegAppName, "POSVAR", "cNoSales", 0)==1) cNoSales=true;
else cNoSales=false;

}

function arqueo(PKCorte)
{
	var _xQname = Application.GetQName();
	var appExeConfig = "Devkron.exe \"her_config_mail.dkl\" qname:" + _xQname;
	eBasic.eShell(appExeConfig,0);
	
	
	var appExe = "Devkron.exe \"sendmail.dkl\" qname:" + _xQname + " pk_corte:"+ PKCorte;
	eBasic.eShell(appExe,0);
	
	_xQname = "";
	var ErrDesc="Error al imprimir arqueo";
	var R;
	var Estado,FA,HA,FC,HC;
	var Cerrado=false;
	var PKCaja=0;
	//var Corte;
	var S;
	var DivisaPred;
	var FltSaldoI=0;
	//var totalventa=0;
	var sql="";
	
	
	if(PKCorte==null){ 
		eBasic.eMsgbox(ErrDesc + "(No se ha indicado la clave principal)",6);
		return 0;
	}
	
	if(PKCorte==0){ 
		eBasic.eMsgbox(ErrDesc + "(No se ha indicado la clave principal)",6);
		return 0;
	}
	
	GetConfigTicket(); //2010
	
	//Corte=MainForm.CorteActual();		
	sql="SELECT Corte.FApertura, Corte.FCierre, Corte.HApertura, Corte.HCierre, Corte.Cerrado,Caja.Sys_PK AS PKCaja,Caja.Codigo AS CodCaja, Caja.Descripcion AS DescCaja, Cajero.Codigo AS CodCajero, Cajero.Nombre AS NombreCajero FROM Cajero INNER JOIN (Caja INNER JOIN Corte ON Caja.Sys_PK = Corte.ICaja) ON Cajero.Sys_PK = Corte.ICajero WHERE Corte.Sys_PK="+PKCorte;
	if(PKCorte>0){				
		R = pos_support.OpenRecordset(sql,Application.ADOCnn);
		
		if(R==null){
			eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron los datos del corte)",6);
			return 0;
		}
		if (R.EOF && R.BOF){			
			eBasic.eMsgbox(ErrDesc +"(No se encontró el corte indicado con clave"+ PKCorte +")",6);
			return 0;
		}

		if(!R("Cerrado").Value){
			Estado="ABIERTO";
			Cerrado=false;
		}else{
			Estado="CERRADO";				
			Cerrado=true;
		}
		
		FA=R("FApertura").Value;
		FC=R("FCierre").Value;
		HA=R("HApertura").Value;
		HC=R("HCierre").Value;
		
		PKCaja=R("PKCaja").Value;
	}else{
		eBasic.eMsgbox(ErrDesc + "(No se pudo acceder al corte)",6);
		return 0;
	}
	
	
	pos_support.ConfigImpresora(); //2010
		
	if (Cerrado)
		Impresora.Texto(Impresora.AligTextInStr("- CORTE DE CAJA -",30,2," "));
	else
		Impresora.Texto(Impresora.AligTextInStr("- ARQUEO DE CAJA -",30,2," "));
	
	Impresora.Texto(" ");
	Impresora.Texto(Impresora.SetChr(30,"="))	
	
	//********* ECABEZADO**************
	//Imprimir Titulo
	if (cPrintTitle) ImprimirEncabezado();		
	// ********************	
	Impresora.Texto(" ");
	
	Impresora.Texto("CORTE #:" + PKCorte + " " + Estado);
	Impresora.Texto("DEL:" + pos_support.Fecha(FA) + "  " + pos_support.Hora(HA));
	
	if(Cerrado)
		Impresora.Texto("AL :" + pos_support.Fecha(FC) + "  " + pos_support.Hora(HC));
	else
		Impresora.Texto("AL :" + pos_support.Fecha() + "  " + pos_support.Hora());
		
	S="CAJA: " + R("CodCaja").Value + " " + R("DescCaja").Value;
	S=Impresora.AligTextInStr(S,30,0," ");
	Impresora.Texto(S);
	
	S= "CAJERO: " + R("CodCajero").Value + " " + R("NombreCajero").Value;
	S=Impresora.AligTextInStr(S,30,0," ");
	Impresora.Texto(S);
	
	Impresora.Texto( pos_support.Fecha() + "  " + pos_support.Hora());	
	S= Impresora.SetChr(30,"=");
	Impresora.Texto(S);
	
	
	if (ImprimirTicketsDelCorte(PKCorte,ErrDesc)==0)
		return 0;
	
	DivisaPred=0;
	DivisaPred=AppVars.GetTextVar("FXCA013",0);
	
	sql="SELECT DISTINCT Divisa.Descripcion,MovCaja.IDivisa, MovCaja.TipoCambio FROM Divisa INNER JOIN MovCaja ON Divisa.Sys_PK = MovCaja.IDivisa WHERE MovCaja.ICorte="+PKCorte+" GROUP BY Divisa.Descripcion,MovCaja.IDivisa,MovCaja.TipoCambio;";
	
	R=pos_support.OpenRecordset(sql,Application.Adocnn);
	
	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron divisas del corte)");
		return 0;
	}
	
	while(!R.EOF){
		S= Impresora.SetChr(30,"-");
		Impresora.Texto(S);		
		S=Impresora.AligTextInStr(R("Descripcion").Value,30,0," ");	//DIVISA
		Impresora.Texto(S);
		S= Impresora.SetChr(30,"-");
		Impresora.Texto(S);
		Impresora.Texto("");
		
		ArqueTotal1=null;
		ArqueTotal2=null;
		
		S=Impresora.AligTextInStr("- INGRESOS -",30,2," ");
		Impresora.Texto(S);
		Impresora.Texto("");
		FltSaldoI=0;
		FltSaldoI=SaldoInicial(PKCorte,PKCaja,R("IDivisa").Value,ErrDesc);		
		fnsinicial=FltSaldoI;
		Impresora.Texto("");
		
		
		// codigo anterior
		//if (ImprimirIngresosXCategoria(PKCorte,PKCaja,R("IDivisa").Value,R("TipoCambio").Value,DivisaPred,ErrDesc)==0)
			
		//  INGRESOS	
		fbtipo==true;
		if (ImprimirIngresosXCategoria(PKCorte,PKCaja,R("IDivisa").Value,R("TipoCambio").Value,DivisaPred,ErrDesc,fnsinicial,fbtipo)==0)
			return 0;
		Impresora.Texto("");
		if (ImprimirIngresosXFormaPago(PKCorte,R("IDivisa").Value,R("TipoCambio").Value,DivisaPred,ErrDesc)==0)
			return 0;
		Impresora.Texto("");
		S=Impresora.AligTextInStr("- EGRESOS -",30,2," ");
		Impresora.Texto(S);
		Impresora.Texto("");
		
		// codigo anterior
		//if (ImprimirEgresosXCategoria(PKCorte,PKCaja,R("IDivisa").Value,R("TipoCambio").Value,DivisaPred,ErrDesc)==0)
			
		//  EGRESOS	
		fbtEgreso==false;
		fbtipo==false;
		
		if (ImprimirEgresosXCategoria(PKCorte,PKCaja,R("IDivisa").Value,R("TipoCambio").Value,DivisaPred,ErrDesc,fbtEgreso)==0)
			return 0;		
		
		Impresora.Texto("");
		S=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");		
		Impresora.Texto(S);
		S=Impresora.AligTextInStr(" TOTAL NETO",16,0," ");
		//ArqueTotal2 son egresos y estan en negativo
		S=S+Impresora.AligTextInStr(Impresora.FormatoDinero(FltSaldoI+ArqueTotal1+ArqueTotal2),14,1," ");		
		Impresora.Texto(S);		
				
		Impresora.Texto("");
		R.MoveNext();
	}
	R.Close();
	
	if(ImprimirFacturasDelCorte(PKCorte,ErrDesc)==0)
		return 0;
	
	
	if (DetailsCZ) ImprimirCorteZ(PKCorte);		
	
	if (LineSales) ImprimirDLineas(PKCorte);
	
	if(DepSales) ImprimirDDepartamentos(PKCorte);
	
	if (cPrintSeller) ImprimirDVendedores(PKCorte);
	
	if (cAvSales || cNoSales) ImprimirVNTPromedioOper(PKCorte);
	
	if (cDesgIVA) ImprimirDesgloseIVA(PKCorte);
	
	//falta agregar configuracion en POS
	ImprimirAbono(PKCorte, ErrDesc); // 18/02/2009 Adal
	
	Impresora.Terminar();		
}

// 18/02/2009 Inicio --> Imprimir Detalle de Abonos
//********************************************************
function ImprimirAbono(PKCorte, ErrDesc){
	var SQ;
	var R;
	var Val=0;
	var sumAbonos=0;
	var sImporte;
	
	if(ErrDesc==null)
		ErrDesc="";
	
	Impresora.Texto(""); // 18/02/2009 Adal
	Impresora.Texto(Impresora.AligTextInStr("- ABONOS A CLIENTES -",30,2," ")); // 18/02/2009 Adal
	Impresora.Texto(""); // 18/02/2009 Adal
	
	SQ="SELECT DCxC.Referencia AS Referencia, MovCaja.Cheques+MovCaja.Depositos+MovCaja.Efectivo+MovCaja.Tarjetas+MovCaja.Vales AS Abonos, Cliente.Nombre AS Cliente, Categoria.Descripcion AS MovCategoria FROM Categoria INNER JOIN (Cliente INNER JOIN (MovCaja INNER JOIN DCxC ON MovCaja.Sys_PK = DCxC.IMovCaja) ON Cliente.Sys_PK = DCxC.ICliente) ON Categoria.Sys_PK = MovCaja.ICategoria WHERE MovCaja.ICorte=" + PKCorte +";";
	R=ThisCnn.execute(SQ);
	
	if(R==null){
		eBasic.eMsgbox(ErrDesc,6);
		return 0;
	}
	
	sumAbonos=0;
	
	while(!R.EOF){		
		Val=Impresora.Redondear(R("Abonos").Value);
		sImporte=Impresora.FormatoDinero(Val);
		sImporte=Impresora.AligTextInStr(sImporte,21,1," ");		
		sumAbonos+=Val;
		Impresora.Texto (Impresora.AligTextInStr(R("Cliente"),30,0," "));
		//Impresora.Texto( Impresora.AligTextInStr(sImporte,30,1, " "));
		Impresora.Texto( Impresora.AligTextInStr(R("Referencia")+sImporte,30,1, " "));
		R.MoveNext();
	}
	R.Close();
	Impresora.Texto (Impresora.AligTextInStr("=============",30,1," "));
	Impresora.Texto (Impresora.AligTextInStr(Impresora.FormatoDinero(sumAbonos),30,1," "));
	Impresora.Texto("");
}
//********************************************************

//******************************************************
//*********************funciones 2010 ******************
//******************************************************
function ImprimirCorteZ(PKCorte){
// by JFrank -> 03 Sept 09
var sql;
var R;
var sDetalle;
var cStr;

var SumTotal;
var Impuestos;
var SubTotal;
var TotalDetalle;

sql="Select Producto.Descripcion as Descripcion,DVenta.TipoCambio,DVenta.Unidad,Sum(DVenta.Cantidad) as TVentas,Sum((DVenta.Precio*DVenta.cantidad)-DVenta.Descuento1-DVenta.Descuento2+DVenta.Impuesto1+DVenta.Impuesto2+DVenta.Impuesto3+DVenta.Impuesto4) as Monto  FROM  (DVenta INNER JOIN Producto ON DVenta.IProducto=Producto.Sys_PK) INNER JOIN  VENTA ON DVenta.FK_Venta_Detalle=Venta.Sys_PK  Where Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte =" + PKCorte + " Group BY Producto.Descripcion,DVenta.TipoCambio,DVenta.Unidad";

R=ThisCnn.execute(sql);

	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron los productos del corte)");
		return 0;
	}

	SumTotal=0;
	
	Impresora.Texto("");
	cStr= Impresora.SetChr(30,"-");
	Impresora.Texto(cStr);
	Impresora.Texto(Impresora.AligTextInStr("- DETALLE DE CORTE -",30,2," ") );
	cStr= Impresora.SetChr(30,"-");
	Impresora.Texto(cStr);
	
	// Imprimir detalle de Productos.
	//************************************************
	TotalDetalle=0;
	while(!R.EOF){
		sDetalle ="";
		cStr="";
		
		cStr = R("Descripcion").Value;
		cStr = Impresora.AligTextInStr(cStr,30,0," ");
		Impresora.Texto(cStr);		
		
		cStr =  R("TVentas").Value;
		cStr = Impresora.AligTextInStr(cStr,13,1," ");
		sDetalle=cStr;
		
		cStr = R("Unidad").Value+"";
		cStr = Impresora.AligTextInStr(cStr,5,1," ");
		sDetalle=sDetalle+cStr;
		
		cStr = Impresora.FormatoDinero(R("Monto").Value);
		cStr = Impresora.AligTextInStr(cStr,12,1," ");
		sDetalle=sDetalle+cStr;
		
		SumTotal = SumTotal + R("Monto").Value;
		TotalDetalle= TotalDetalle +  R("Monto").Value;
		Impresora.Texto (sDetalle);
		//***************
		R.MoveNext();
	}
	
	// Imprimir Total de Productos
	cStr=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");		
		Impresora.Texto(cStr);
	
	cStr=Impresora.AligTextInStr(" TOTAL: ",12,0," ");
		cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(TotalDetalle),18,1," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
	
}

function ImprimirDLineas(PKCorte){

var cStr="";
var sql="";
var R;
var sDetalle;
var TotalDetalle;

		Impresora.Texto("");
		cStr=Impresora.AligTextInStr("- LINEAS -",30,2," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
	
	sql = "Select Linea.Descripcion as Linea,Sum((DVenta.Precio*DVenta.cantidad)-DVenta.Descuento1-DVenta.Descuento2+DVenta.Impuesto1+DVenta.Impuesto2+DVenta.Impuesto3+DVenta.Impuesto4) as Monto FROM  (DVenta INNER JOIN (PRODUCTO INNER JOIN Linea ON Producto.ILinea=Linea.Sys_PK) ON DVenta.IProducto=Producto.Sys_PK) INNER JOIN  VENTA ON DVenta.FK_Venta_Detalle=Venta.Sys_PK Where Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte =" + PKCorte + " Group BY Linea.Descripcion";
	
	R=ThisCnn.execute(sql);

	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron los productos del corte)");
		return 0;
	}
		TotalDetalle=0;
		while(!R.EOF){
			sDetalle ="";
			cStr="";
			
			cStr = R("Linea").Value;
			cStr = Impresora.AligTextInStr(cStr,16,0," ");
			sDetalle = cStr;	
					
			cStr = Impresora.FormatoDinero(R("Monto").Value);
			cStr = Impresora.AligTextInStr(cStr,14,1," ");
			sDetalle=sDetalle+cStr;
			
			TotalDetalle= TotalDetalle +  R("Monto").Value;
			Impresora.Texto (sDetalle);
		//***************
		R.MoveNext();
	
		}
	
		// Total de LInea
		cStr=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");		
		Impresora.Texto(cStr);
		
		cStr=Impresora.AligTextInStr(" TOTAL: ",12,0," ");
		cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(TotalDetalle),18,1," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");


}

function ImprimirDDepartamentos(PKCorte){

var cStr="";
var sql="";
var R;
var sDetalle;
var TotalDetalle;


	     cStr=Impresora.AligTextInStr("- DEPARTAMENTOS -",30,2," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
		
		sql="Select Departamento.Descripcion as Departamento,Sum((DVenta.Precio*DVenta.cantidad)-DVenta.Descuento1-DVenta.Descuento2+DVenta.Impuesto1+DVenta.Impuesto2+DVenta.Impuesto3+DVenta.Impuesto4) as Monto FROM  (DVenta INNER JOIN (PRODUCTO LEFT JOIN Departamento ON Producto.IDepartamento=Departamento.Sys_PK) ON DVenta.IProducto=Producto.Sys_PK) INNER JOIN  VENTA ON DVenta.FK_Venta_Detalle=Venta.Sys_PK Where Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte =" + PKCorte + " Group BY Departamento.Descripcion Order BY Departamento.Descripcion DESC";
		
	R=ThisCnn.execute(sql);

	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron los departamentos del corte)");
		return 0;
	}
		TotalDetalle=0;
		while(!R.EOF){
			sDetalle ="";
			cStr="";
			
			cStr = R("Departamento").Value;
			if (R("Departamento").Value==null) cStr="NO CLASIFICADOS";
			cStr = Impresora.AligTextInStr(cStr,16,0," ");
					
			sDetalle = cStr;	
			cStr = Impresora.FormatoDinero(R("Monto").Value);
			cStr = Impresora.AligTextInStr(cStr,14,1," ");
			sDetalle=sDetalle+cStr;
			
			TotalDetalle= TotalDetalle +  R("Monto").Value;
			Impresora.Texto (sDetalle);
		//***************
		R.MoveNext();
	
		}
	
		// Total de DEpartamento
		cStr=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");		
		Impresora.Texto(cStr);
		
		cStr=Impresora.AligTextInStr(" TOTAL: ",12,0," ");
		cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(TotalDetalle),18,1," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
	
}

function ImprimirDVendedores(PKCorte){

var cStr="";
var sql="";
var R;
var sDetalle;
var TotalDetalle;

		cStr=Impresora.AligTextInStr("- MESEROS -",30,2," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
		
		sql="Select Agente.Nombre as Agente, Sum(Venta.Subtotal-Venta.Descuento1-Venta.Descuento2+Venta.Impuesto1+Venta.Impuesto2+Venta.Impuesto3+Venta.Impuesto4) AS MONTO,COUNT(*) as TVentas FROM Venta LEFT JOIN Agente ON Venta.Iagente=Agente.Sys_PK WHERE Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte=" + PKCorte + " GROUP BY Agente.Nombre;"
	
	R=ThisCnn.execute(sql);

	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron los vendedores del corte)");
		return 0;
	}
		TotalDetalle=0;
		while(!R.EOF){
			sDetalle ="";
			cStr="";
			
			cStr = R("Agente").Value;
			if (R("Agente").Value==null) cStr="MESERO NO ASIGNADO";
			cStr = Impresora.AligTextInStr(cStr,30,0," ");
			Impresora.Texto(cStr);		
			
			cStr =  R("TVentas").Value;
			cStr = Impresora.AligTextInStr(cStr,13,1," ");
			sDetalle=cStr;
			
			cStr = "VNT";
			cStr = Impresora.AligTextInStr(cStr,5,1," ");
			sDetalle=sDetalle+cStr;
					
			cStr = Impresora.FormatoDinero(R("Monto").Value);
			cStr = Impresora.AligTextInStr(cStr,12,1," ");
			sDetalle=sDetalle+cStr;
			
			TotalDetalle= TotalDetalle +  R("Monto").Value;
			Impresora.Texto (sDetalle);
		//***************
		R.MoveNext();
	
		}
	
		// Total de Vendedores
		cStr=Impresora.AligTextInStr(Impresora.SetChr(12,"="),30,1," ");		
		Impresora.Texto(cStr);
		
		cStr=Impresora.AligTextInStr(" TOTAL: ",12,0," ");
		cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(TotalDetalle),18,1," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
}

function ImprimirVNTPromedioOper(PKCorte){


var cStr="";
var sql="";
var R;
var Count=0;
var Total=0;

	sql="Select Count(*) As Operaciones,SUM(Subtotal-Descuento1-Descuento2 + Impuesto1+Impuesto2+Impuesto3+Impuesto4) as Total FROM Venta Where Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte =" + PKCorte;
		
	//cAvSales
	//cNoSales
	if (cAvSales && cNoSales){
		cStr=Impresora.AligTextInStr("=VNT PROMEDIO/No. OPERACIONES=",30,2," ");		
		Impresora.Texto(cStr);
		Impresora.Texto("");
	}
	else{
	
		cStr=Impresora.AligTextInStr(Impresora.SetChr(30,"-"),30,1," ");		
		Impresora.Texto(cStr);
	}
	
	
	R=ThisCnn.execute(sql);

	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron las ventas del corte)");
		return 0;
	}
	
	
	if (R.EOF && R.BOF){			
			eBasic.eMsgbox(ErrDesc +"(No se encontró el corte indicado con clave"+ PKCorte +")",6);
			return 0;
	}
	
	
	Total=R("Total").Value;
	Count=R("Operaciones").Value;
	
	
	
	Total = Total/Count;
	Total = Impresora.Redondear(Total,2);
	
	
	if (cAvSales){
		cStr=Impresora.AligTextInStr("VENTA PROMEDIO: ",16,0," ");
		cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(Total),14,1," ");		
		Impresora.Texto(cStr);
		Impresora.Texto(" ");
	}
	
	if (cNoSales){
		cStr=Impresora.AligTextInStr("No. OPERACIONES: ",16,0," ");
		cStr=cStr+Impresora.AligTextInStr(Count,14,1," ");		
		Impresora.Texto(cStr)
		Impresora.Texto(" ");;
	}

}

function ImprimirDesgloseIVA(PKCorte){

var cStr="";
var sql="";
var R;
var SubTotal=0;
var Impuesto=0;
var Total=0;
	

	cStr=Impresora.AligTextInStr("== DESGLOSE DE IMPUESTOS ==",30,2," ");		
	Impresora.Texto(cStr);
	Impresora.Texto("");
	
	
	
	sql="Select SUM(Subtotal-Descuento1-Descuento2) as Subtotal, SUM(Impuesto1+Impuesto2+Impuesto3+Impuesto4) as Impuestos FROM Venta Where Venta.Documento=6 AND Venta.StatusAdministrativo=3 AND Venta.ICorte =" + PKCorte;

	R=ThisCnn.execute(sql);

	if(R==null){
		eBasic.eMsgbox(ErrDesc + "(Error al acceder a la base de datos no se obtuvieron los impuestos del corte)");
		return 0;
	}
	
	
	if (R.EOF && R.BOF){			
			eBasic.eMsgbox(ErrDesc +"(No se encontró el corte indicado con clave"+ PKCorte +")",6);
			return 0;
	}
	
	SubTotal=R("Subtotal").Value;
	Impuesto=R("Impuestos").Value;
	Total= SubTotal + Impuesto;
	
	cStr=Impresora.AligTextInStr(" SUBTOTAL: ",12,0," ");
	cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(SubTotal),18,1," ");		
	Impresora.Texto(cStr);
	
	cStr=Impresora.AligTextInStr(" IVA: ",12,0," ");
	cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(Impuesto),18,1," ");		
	Impresora.Texto(cStr);
	
	cStr=Impresora.AligTextInStr(" TOTAL: ",12,0," ");
	cStr=cStr+Impresora.AligTextInStr(Impresora.FormatoDinero(Total),18,1," ");		
	Impresora.Texto(cStr);
	Impresora.Texto("");
	
}


//******************************************************
//*********************** termina 2010 *****************
//******************************************************

