Procesar();
var UIP;

function ImportarCatalogoDetalleRecetas(){
	var EFile;
	var ESheet;
	var lgItems;
	var itRows;
	var stFile;
	var stTemp;
	var itCount=0;
	var codigoR="";
	var sys_pkR=0;
	var codigoP="";
	var sys_pkMP=0;
	var cant = 0;
	var insertar = "";
	
	stFile=Application.OpenFile("Archivos de excel (*.xls)|*.xls");	
	if (stFile==""){		
		return false;
	}
		
	UIP=Application.NewUIProgress();
	UIP.Caption="Importando ingredientes de recetas";
	UIP.Min=0;
	
	EFile=Application.NewObject("Excel.Application");
	EFile.WorkBooks.Open (stFile);
	
    // si es la versión de Excel 97, asigna la hoja activa ( ActiveSheet )
	if (EFile.Application.Version>=8){
		ESheet = EFile.ActiveSheet;
	}
	else{
		ESheet = EFile;
	}
	
	itRows=ESheet.UsedRange.Rows.Count;
	UIP.Max=itRows;
	UIP.Show();
	
	Application.MouseHourglass();
		
	for (lgItems=2;lgItems<=itRows;lgItems++){
		try{
			
			//Obtiene la sys_pk de la receta
			codigoR="";
			codigoR=ESheet.Cells(lgItems,1);						
			codigoR=codigoR+"";
			codigoR=codigoR.toUpperCase();
			sys_pkR = parseInt(getCodigoReceta(codigoR) );
			
			//Obtiene la sys_pk de la materia prima
			codigoP="";
			codigoP=ESheet.Cells(lgItems,2);						
			codigoP=codigoP+"";
			codigoP=codigoP.toUpperCase();
			sys_pkMP = parseInt(getCodigoMateriaPrima(codigoP) );
			
			UIP.TopTitle="Almacenando Detalles de receta";
			
			cant = ESheet.Cells(lgItems,3);
			
			if( (sys_pkR>0) && (sys_pkMP>0) ){
				insertar = "INSERT INTO iensamble(sys_timestamp, sys_guid, sys_dtcreated,sys_exported, sys_dtexported, cantDemasiado, cantidad, cantMucho, cantPoco, omitible, elemento, fk_producto_elementos) VALUES(now(), replace(ucase(UUID()),'-',''), now(), 0, now(),0,"+cant+",0,0,0,"+sys_pkMP+","+sys_pkR+")";
				
				Application.adoCnn.Execute(insertar);
			
				itCount=itCount+1;
			}else{
				Log("Error al procesar fila "+lgItems+". No se pudo cargar la receta con código de receta: "+ESheet.Cells(lgItems,1));
			}
			
		}catch(e){
			Log("Error al procesar fila "+lgItems);
		}
		UIP.Value=lgItems;
		Application.eDoEvents();
	}
	
	Application.CloseUIProgress(UIP);
	Application.MouseDefault();
	eBasic.eMsgbox("Cantidad de registros importados "+itCount,6);
	EFile.ActiveWorkBook.Close(false);
	EFile.Quit();
	EFile=null;
	ESheet=null;
	return true;
}

function Log(Error){
	if (Error!="")
		Application.FireEventLog(Error);
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