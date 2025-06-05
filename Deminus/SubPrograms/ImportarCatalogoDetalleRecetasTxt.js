Procesar();
var UIP;

function ImportarCatalogoDetalleRecetas(){
	var FSystem;
	var TextStream;
	var stArray=new Array();
	var stFile;
	var stLine;
	var itLines;
	var itCount=0;
	var stTemp;
	var codigoR="";
	var sys_pkR=0;
	var codigoP="";
	var sys_pkMP=0;
	var cant = 0;
	var insertar = "";
	
	UIP=Application.NewUIProgress();
	UIP.Caption="Importando ingredientes de recetas"
	UIP.Min=0;
	
	stFile=Application.OpenFile("Archivos de texto (*.txt)|*.txt");
	
	if (stFile==""){
		return false;
	}
	
	FSystem=Application.NewObject("Scripting.FileSystemObject");
	TextStream=FSystem.OpenTextFile(stFile);
	
	if (FSystem.FileExists(stFile)==false){
		return false;
	}
	
	itLines=LinesCount(stFile, FSystem);
	UIP.Max=itLines+1;
	UIP.Show();
	itLines=1;
	
	Application.MouseHourglass();
	Application.eDoEvents();
	
	while (TextStream.AtEndOfStream==false){
		try{
		
			stLine=TextStream.ReadLine();
			stArray=stLine.split("|");
						
			//Obtiene la Sys_pk de la receta
			codigoR = "";
			codigoR = stArray[0];
			codigoR=codigoR+"";
			codigoR=codigoR.toUpperCase();
			sys_pkR = parseInt(getCodigoReceta(codigoR) );
			
			//Obtiene Sys_pk de la materia prima
			codigoP = "";
			codigoP = stArray[1];
			codigoP=codigoP+"";
			codigoP=codigoP.toUpperCase();
			sys_pkMP = parseInt( getCodigoMateriaPrima(codigoP) );
			
			UIP.TopTitle="Almacenando Detalles de receta";
			
			cant = parseFloat("0"+stArray[2]);
			
			if( (sys_pkR>0) && (sys_pkMP>0) ){
				insertar = "INSERT INTO iensamble(sys_timestamp, sys_guid, sys_dtcreated,sys_exported, sys_dtexported, cantDemasiado, cantidad, cantMucho, cantPoco, omitible, elemento, fk_producto_elementos) VALUES(now(), replace(ucase(UUID()),'-',''), now(), 0, now(),0,"+cant+",0,0,0,"+sys_pkMP+","+sys_pkR+")";
				
				Application.adoCnn.Execute(insertar);
			
				itCount=itCount+1;
			}else{
				Log("Error al procesar fila "+itLines+". No se pudo cargar la receta con código de receta: "+stArray[0]);
			}
			
		}catch(e){
			Log("Error al procesar fila "+itLines);
		}
		itLines=itLines+1;
		UIP.Value=itLines;		
		Application.eDoEvents();
	}
	Application.CloseUIProgress(UIP);
	Application.MouseDefault();
	eBasic.eMsgbox ("Cantidad de registros importados: "+itCount,6); 	
	TextStream.Close();
	FSystem=null;
	TextStream=null;
	stArray=null;
	return true;
}

function Log(Error){
	if (Error!="")
		Application.FireEventLog(Error);
}

function LinesCount(strFile, FSystemO){
	var StreamO;
	var itCount=0;

	StreamO=FSystemO.OpenTextFile(strFile);
	
	while (StreamO.AtEndOfStream==false){
		itCount=itCount+1;
		StreamO.SkipLine();
	}
	
	StreamO.Close();
	StreamO=null;
	return itCount;
}

function Procesar(){
	try{
		return ImportarCatalogoDetalleRecetas();
	}catch(e)
	{
		if(UIP!=null){
			Application.CloseUIProgress(UIP);
			Application.MouseDefault();
		}
		Log("Error al ejecutar subprograma");
		throw e;
		return false;
	}
}

//Función para buscar la sys_pk de la receta mediante el código de la receta
function getCodigoReceta(codReceta){
	var pkReceta= null;
	
	pkReceta = Application.adoCnn.Execute("SELECT sys_pk FROM producto WHERE codigo = '" + codReceta +"' AND iclase = 2");
	
	if( (pkReceta == null) || (pkReceta.EOF == true && pkReceta.BOF==true) ){
		Log("El código de la receta que ha proporcionado no existe.");
		return 0;
	}
	return pkReceta("sys_pk").Value;
}

//Función para buscar la sys_pk de la materia prima mediante el código de la materia prima
function getCodigoMateriaPrima(codMateriaP){
	var pkMatP = null;
	
	pkMatP = Application.adoCnn.Execute("SELECT sys_pk FROM producto WHERE codigo = '" + codMateriaP +"' AND iclase = 1");
	
	if( (pkMatP == null) || (pkMatP.EOF == true && pkMatP.BOF == true) ){
		Log("El código de la materia prima que ha proporcionado no existe.");
		return 0;
	}
	return pkMatP("sys_pk").Value;
}