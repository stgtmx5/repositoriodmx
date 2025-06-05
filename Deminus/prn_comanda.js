//***************************** SOLO DEMINUS ********************************

var v_eGUID=eBasic.eCreateObject("eSQLBD.eGUID");
var RegAppName="Deminus";//"Maxicomercio";
var NewAppName="Deminus";
var Refe;

function ImprimirOrdenCancelada(PKOrden){
var R;
var E;
var S;
var CP;
var x;

	if(PKOrden==null) return 0;
	if(PKOrden<1) return 0;
	
	//configurar Impresora.
	pos_support.ConfigImpresora();
	E=EncabezadoOrden(PKOrden," CANCELACIÓN COMPLETA DE ORDEN ");	
	R=NewRecordSet("SELECT ICProduccion FROM Orden WHERE Sys_PK="+PKOrden);
	
	if(R==null) return 0;
	if(R.EOF && R.BOF) return 0;
	CP=0;
	CP=R("ICProduccion").Value;
	//aqui la llamada  de funcion
	
	if(E!=""){
		E=E+"\r\n"+NotasCancelaciones(PKOrden);
		E=E+Impresora.SetChr(30,"=");
		ImprimirACentroProduccion(CP,E);
	}
	R.Close();
	R=null;
}

function ImprimirDOrdenCancelado(PKOrden,PKSCancelado){
//PKS =cadena de dorden.Sys_pk separadas por coma
var R;
var E;
var S;
var CP;
var D;
	if(PKOrden==null) return 0;
	if(PKOrden<1) return 0;
	if(PKSCancelado==null) return 0;
	if(PKSCancelado=="") return 0;
	//configurar Impresora.
	pos_support.ConfigImpresora();	
	E=EncabezadoOrden(PKOrden," MODIFICACIÓN DE ORDEN ");	
	R=NewRecordSet("SELECT ICProduccion FROM Orden WHERE Sys_PK="+PKOrden);
	
	if(R==null) return 0;
	if(R.EOF && R.BOF) return 0;
	CP=0;
	CP=R("ICProduccion").Value;
	R.Close();
	R=null;
	if(PKSCancelado!=""){
		D=ObtenerDOrden(PKSCancelado);
		if(D==null){
			msg("No se pudo imprimir la modificación de orden "+PKOrden);
			return 0;
		}
		S=Impresora.AligTextInStr("FAVOR DE CANCELAR PREPARACIÓN",30,2,"*");
		S=S+"\r\n\n";
		S=E+S+D+NotasCancelaciones(PKOrden);
		ImprimirACentroProduccion(CP,S);
	}		
}

function ImprimirDOrdenModificado(PKOrden,PKSModificado){
//PKSModificado =cadena de dorden.Sys_pk separadas por coma
var R;
var E;
var S;
var CP;
var D;



	if(PKOrden==null) return 0;
	if(PKOrden<1) return 0;	
	if(PKSModificado==null) return 0;
	if(PKSModificado=="") return 0;
	//configurar Impresora.
	pos_support.ConfigImpresora();	
	E=EncabezadoOrden(PKOrden," MODIFICACIÓN DE ORDEN ");	
	R=NewRecordSet("SELECT ICProduccion FROM Orden WHERE Sys_PK="+PKOrden);
	
	if(R==null) return 0;
	if(R.EOF && R.BOF) return 0;
	CP=0;
	CP=R("ICProduccion").Value;
	R.Close();
	R=null;	
	
	if(PKSModificado!=""){
		D=ObtenerDOrden(PKSModificado);
		if(D==null){
			msg("No se pudo imprimir la modificación de orden "+PKOrden);
			return 0;
		}
		S=Impresora.AligTextInStr("FAVOR DE MODIFICAR PREPARACIÓN",30,2,"*");
		S=S+"\r\n\n";
		S=E+S+D+NotasCancelaciones(PKOrden);;
		ImprimirACentroProduccion(CP,S);
	}
	return -1;
}

function ObtenerDOrden(PKLista){
var R;
var PKS;
var i;
var m;
var E;
var S;
	if(PKLista==null) return null;
	if(PKLista=="") return null;
	PKS=PKLista.split(",");
	if(PKS==null){
		msg("Error al obtener el detalle de orden modificado. La lista está vacía o no tiene un formato correcto.",6);
		return null;		
	}
	E="";
	m=PKS.length;	
	if(m<1) return null;
	for(i=0;i<m;i++){		
		R=NewRecordSet("SELECT Producto.Descripcion,Producto.Unidad,DOrden.Cantidad FROM DOrden INNER JOIN Producto ON DOrden.IProducto=Producto.Sys_PK WHERE DOrden.Sys_PK="+PKS[i]);		
		if(R==null) return null;
		if(R.EOF && R.BOF) return null;
		S=StringValue(R,"Cantidad")+" "+StringValue(R,"Unidad")+" "+StringValue(R,"Descripcion");
		S=Impresora.getTextMultiLine(S,30,0);
		E=E+S+"\r\n";
		R.Close();
		R=null;
	}
	if(E=="") E=null;
	return E;
}

function ImprimirOrden(PKOrden){
	var R;
	var SQL;
	var S;		
	var TextoACProduccion="";	
	var Notas;
	var Especificaciones="";
	var CP;
	var TiempoServicio=""; // By Frank 09 Jun  09
	
	if(PKOrden==null) return 0;
	if(PKOrden<1) return 0;
	
	// configurar Impresora.
	pos_support.ConfigImpresora();		
	TextoACProduccion=EncabezadoOrden(PKOrden," PRODUCCION ");
	
	R=NewRecordSet("SELECT ICProduccion,Notas FROM Orden WHERE Sys_PK="+PKOrden);
	
	if(R==null) return 0;
	if(R.EOF && R.BOF) return 0;
	CP=0;
	CP=R("ICProduccion").Value;
	Notas=StringValue(R,"Notas");	
	
	if(Notas!=""){
		Notas="\r\n\nNotas:"+Notas;
	}
		
	// By Frank 09 Jun 09 - Se agrego Campo TiempoS, para imprimir el valor de tiempo de servucio	
	
		
	SQL="SELECT DOrden.Sys_PK AS PKDOrden,DOrden.TiempoServicio as TiempoS,DOrden.Especificaciones, Producto.Sys_PK AS PKProducto,Producto.Codigo,Producto.Descripcion,Producto.Unidad,DOrden.Cantidad FROM DOrden INNER JOIN Producto ON DOrden.IProducto=Producto.Sys_PK WHERE DOrden.FK_Orden_Detalle=" +PKOrden;
	R=NewRecordSet(SQL);
	if(R==null) return 0;
	while(!R.EOF){
		S="";				
		S=R("Cantidad").Value+" "+R("Unidad").Value+" "+R("Descripcion").Value;		
		S=Impresora.getTextMultiLine(S,30,0);
		S=S+ObtenerCantidadesVariadas(R("PKDOrden").Value)+ObtenerAdicionales(R("PKDOrden").Value);
		
		Especificaciones=ObtenerIndicaciones(StringValue(R,"Especificaciones"));
		if(Especificaciones!=""){
			Especificaciones="\r\nInstrucciones adicionales:\r\n"+Especificaciones;
			Especificaciones=Impresora.getTextMultiLine(Especificaciones,30,0);
			S=S+Especificaciones;
		}	
		// by Frank
		
		TiempoServicio = GetTiempoServicio(StringValue(R,"TiempoS"));
		
		if (TiempoServicio!=""){
		   TiempoServicio = Impresora.getTextMultiLine(TiempoServicio,30,0);
		   S=S+TiempoServicio;
		} 
		
		//
		
		TextoACProduccion =TextoACProduccion+S+"\r\n";
		R.Movenext();
	}	
	R.Close();
	R=null;
	
	TextoACProduccion=TextoACProduccion+Notas;
	
	if(TextoACProduccion!=""){
		TextoACProduccion=TextoACProduccion+"\r\n"+Impresora.SetChr(30,"=");
		ImprimirACentroProduccion(CP,TextoACProduccion);
	}
}

function EncabezadoOrden(PKOrden,Titulo){
	var SQL;
	var R;
	var E;
	var ss="";
	

	SQL="SELECT Orden.ICProduccion,Orden.Fecha,Orden.Hora, Agente.Nombre AS Mesero,Venta.StatusAdministrativo AS EstadoA,Venta.dmnsMesa AS Mesa,Venta.Referencia AS Refti,CProduccion.Descripcion AS CPDesc FROM (Orden INNER JOIN (Venta LEFT JOIN Agente ON Venta.IAgente=Agente.Sys_PK) ON Orden.IVenta=Venta.Sys_PK) INNER JOIN CProduccion ON Orden.ICProduccion=CProduccion.Sys_PK WHERE Orden.Sys_PK=" + PKOrden;
	R=NewRecordSet(SQL);
	if(R==null) return 0;
	if(R.EOF && R.BOF) return 0;
	//ENCABEZADO
	E=Impresora.AligTextInStr(Titulo,30,2,"=")+"\r\n";
	E=E+Impresora.SetChr(30,"=")+"\r\n";
	if(StringValue(R,"Mesa")==""&& R("EstadoA").Value==1)ss="Comida Rapida";
	if(StringValue(R,"Mesa")==""&& R("EstadoA").Value==4)ss="Servicio a Domicilio";
	if(StringValue(R,"Mesa")!=""&& R("EstadoA").Value==1)ss="Servicio a Mesa";
	
	S="ORDEN: "+ eBasic.eFormat(PKOrden,"00000000");
	S=Impresora.AligTextInStr(S,30,2," ")+"\r\n\n";		
	E=E+S;
	
	S="CP:"+StringValue(R,"CPDesc");
	S=Impresora.AligTextInStr(S,30,0," ")+"\r\n";		
	E=E+S;
	
	S=ss;
	S=Impresora.AligTextInStr(S,30,0," ")+"\r\n";		
	E=E+S;
	
	S="MESA:"+StringValue(R,"Mesa");
	S=Impresora.AligTextInStr(S,30,0," ")+"\r\n";		
	E=E+S;
		
	S="MESERO:"+StringValue(R,"Mesero");
	S=Impresora.AligTextInStr(S,30,0," ")+"\r\n";	
	E=E+S;
	
	S="FECHA:"+pos_support.Fecha(R("Fecha").Value)+" "+pos_support.Hora(R("Hora").Value);
	S=Impresora.AligTextInStr(S,30,0," ")+"\r\n";	
	E=E+S;

	S="Ticket:"+StringValue(R,"Refti");
	S=Impresora.AligTextInStr(S,30,0," ")+"\r\n";	
	E=E+S;
	
	R.Close();
	R=null;
	
	return E;
}

// by Frank  - 09 jun 09 -  Devuelve el Tiempo de Servicio
function GetTiempoServicio(sTiempo){
var S="";	
	if (sTiempo=="")  return S;
	return "\r\n " +  sTiempo + " Tiempo \r\n";
	
} 


function ObtenerIndicaciones(E){
	var S;		
	if(E=="") return "";	
	S=E.replace("*@@*","\r\n");
	return S;
}

function ObtenerAdicionales(PKDOrden){
	var SQL;
	var R;
	var Adic;
	var S;
	SQL="SELECT DAdicionales.Sys_PK,DAdicionales.Cantidad,Producto.Unidad, Producto.Descripcion FROM DOrden INNER JOIN (DAdicionales INNER JOIN Producto ON DAdicionales.IProducto=Producto.Sys_PK) ON DOrden.Sys_PK=DAdicionales.FK_DOrden_Adicionales WHERE DOrden.Sys_PK="+PKDOrden;
	R=NewRecordSet(SQL);
	if(R==null){
		msg("Error al imprimir ingredientes adicionales.");
		return "";
	}
	Adic="";
	while(!R.EOF){
		S="";
		S="\r\n +"+StringValue(R,"Cantidad")+" "+StringValue(R,"Unidad")+" "+StringValue(R,"Descripcion");		
		S=Impresora.getTextMultiLine(S,30,0);
		S=S+ObtenerAdicionales2(R("Sys_PK").Value);		
		Adic=Adic+S;
		R.Movenext();
	}	
	R.Close();
	R=null;
	
	if(Adic!="") Adic="\r\n"+Impresora.AligTextInStr(" Adicionales:",30,0," ")+Adic;
	return Adic;
}

function ObtenerAdicionales2(PKDAdic){
	var SQL;
	var R;
	var Adic2;
	var S;
	
	SQL="SELECT DAdic2.Cantidad,Producto.Unidad, Producto.Descripcion FROM DAdicionales INNER JOIN (DAdic2 INNER JOIN Producto ON DAdic2.IProducto=Producto.Sys_PK) ON DAdicionales.Sys_PK=DAdic2.FK_DAdicionales_IAdicionales WHERE DAdicionales.Sys_PK="+PKDAdic;
	R=NewRecordSet(SQL);
	if(R==null){
		msg("Error al imprimir ingredientes adicionales 2.");
		return "";
	}
	Adic2="";
	while(!R.EOF){
		S="";
		S="\r\n  +"+StringValue(R,"Cantidad")+" "+StringValue(R,"Unidad")+" "+StringValue(R,"Descripcion");
		Adic2=Adic2+Impresora.getTextMultiLine(S,30,0);
		R.Movenext();
	}	
	R.Close();
	R=null;
	
	if(Adic2!="") Adic2="\r\n"+Impresora.AligTextInStr("  Adicionales:",30,0," ")+Adic2;
	return Adic2;
}

function ObtenerCantidadesVariadas(PKDOrden){
	var SQL;
	var R;
	var c;
	var cant;
	var S;
	SQL="SELECT DCantidades.Cantidad AS enumCantidad,Producto.Descripcion FROM DOrden INNER JOIN (DCantidades INNER JOIN Producto ON DCantidades.IProducto=Producto.Sys_PK) ON DOrden.Sys_PK=DCantidades.FK_DOrden_CantidadesVariadas WHERE DOrden.Sys_PK="+PKDOrden;
	R=NewRecordSet(SQL);
	if(R==null){
		msg("Error al imprimir cantidades variadas de ingredientes.");
		return "";
	}
	cant="";
	while(!R.EOF){
		S="";
		c="";
		switch(R("enumCantidad").Value){
			case 0: c="Estandar";break;
			case 1: c="Poco";break;
			case 2: c="Mucho";break;
			case 3: c="Demasiado";break;
			case 99:c="Omitir";break;
		}
		S="\r\n *"+c+" "+StringValue(R,"Descripcion");		
		S=Impresora.getTextMultiLine(S,30,0);		
		cant=cant+S;
		R.Movenext();
	}	
	R.Close();
	R=null;
	
	if(cant!="") cant="\r\n"+Impresora.AligTextInStr(" Cantidades de ingredientes:",30,0," ")+cant;
	return cant;
}

function ImprimirACentroProduccion(PKCProduccion,Texto,Recursivo){
	if(PKCProduccion<1) return 0;
	if(Recursivo==null) Recursivo=false;
	
	var Envio;
	var V;
	var	Dup;
	var DefaultPrinter;
	
		
		Envio=NodeVars.EGetSetting(NewAppName, "Config", "EnviarComandaA$"+PKCProduccion, "0@@-1;-1");
		V=Envio.split("@");
		
		switch(parseInt(V[0])){
			case 0: //NO ENVIAR
				return -1;
			case 1: //A IMPRESORA
				DefaultPrinter=Impresora.ePrinter.DeviceName;
				Impresora.SetPrinter(V[1]);				
				Impresora.Texto(Texto);
				Impresora.Terminar();
				Impresora.SetPrinter(DefaultPrinter);
				break;
			case 2: //A ARCHIVO
				eBasic.SaveStrToFile(eBasic.AddSlashPath(V[1])+"CP"+PKCProduccion+"-"+NombreTemporal()+".txt",Texto);
		}
		if(!Recursivo){
			Dup=V[2].split(";");
			if(parseInt(Dup[0])>0) ImprimirACentroProduccion(parseInt(Dup[0]),Texto,true);
			if(parseInt(Dup[1])>0) ImprimirACentroProduccion(parseInt(Dup[1]),Texto,true);
		}
		return -1;	
}
function NombreTemporal(){
	var f=new Date();
	var n;
	n=v_eGUID.GetGUID();
	//n=eBasic.eFormat(f.getMonth()+1,"00")+eBasic.eFormat(f.getDate(),"00")+eBasic.eFormat(f.getHours(),"00")+eBasic.eFormat(f.getMinutes(),"00")+eBasic.eFormat(f.getSeconds(),"00");
	return n;
}
function RecordsetOK(R){
	if(R==null) return false;
	if(R.State!=1) return false;	
	return 	true;
}
function StringValue(R,sField){
	if(R(sField).Value!=null)
		return R(sField).Value;
	else
		return "";
}
function NewRecordSet(SQL){
	var R;
	R=new ActiveXObject("ADODB.Recordset");
	if(R==null) return null;
	R.ActiveConnection=ThisCnn;
	R.CursorLocation=3;
	R.Source=SQL;
	R.Open();
	if(RecordsetOK(R))
		return R;
	else
		return null;
}
function msg(S){
	eBasic.eMsgbox(S,6);
}

function NotasCancelaciones(PKOrden){
	var RRR;
	var E="\r\n";
	var ErrDesc="Error al acceder";
	
	RRR=ThisCnn.execute("select ut_DmCancel.Detalle As Detalle,ut_DmCancel.Notas As Notas, ut_DmCancel.Usuario from ut_DmCancel where ut_DmCancel.IOrden=" +PKOrden);
	
	if(RRR==null){
		msg("Sin acceso a base de datos" );
		return "";
	}
	if(RRR.EOF && RRR.BOF){
		//eBasic.eMsgbox(ErrDesc + "(No se pudieron obtener los datos "+PKOrden+")");
		return "";
	}

	while(!RRR.EOF)
	{
		E=E+Impresora.getTextMultiLine(RRR("Notas").Value+"("+RRR("Usuario").Value+")",30,0) +"\r\n"+Impresora.getTextMultiLine(RRR("Detalle").Value,30,0)+"\r\n";
		RRR.MoveNext();
	};
	
	return E+"\r\n";
		
}
