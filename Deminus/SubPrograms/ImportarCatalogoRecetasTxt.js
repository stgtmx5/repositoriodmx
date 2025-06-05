Procesar();

var UIP;

function ImportarCatalogoRecetas(){	
	var IReceta;
	var FSystem;
	var TextStream;
	var stArray=new Array();
	var stFile;
	var stLine;
	var itLines;
	var itCount=0;
	var stTemp;
	var codigoP="";
	
	var getSys_pkR=0;
	var getSys_pkCP = "";
	var cProd ="";
	var insertar = "";
	
	UIP=Application.NewUIProgress();
	UIP.Caption="Importando recetas"
	UIP.Min=0;
	
	var unidad="";
	var factor = "";
	var unidadB = "";
	
	stFile=Application.OpenFile("Archivos de texto (*.txt)|*.txt");
	
	if (stFile==""){
		return false;
	}
	
	FSystem=Application.NewObject("Scripting.FileSystemObject");
	IReceta=Application.NewObject("EDOFx.Producto");
	IReceta.ADOCnn=Application.adoCnn;
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
			stArray=stLine.split(",");
			
			IReceta.AddNew();
			
			cProd=stArray[20];
			cProd=cProd+"";
			cProd=cProd.toUpperCase();
				
			getSys_pkCP = parseInt(getCProduccion(cProd));
				
			if(getSys_pkCP>0){
			
				if (IReceta.LoadFromADOCByCodigo(stArray[0])==false){
					codigoP="";
					codigoP=stArray[0];
					codigoP=codigoP+"";
					codigoP=codigoP.toUpperCase();
					IReceta.Codigo=codigoP;
					
					unidad=stArray[2];
					factor= stArray[3];					
					unidadB=stArray[4];
					
					if(unidad == null || unidad == ""){
						Log("Error al procesar fila "+itLines+". Debe indicar una unidad");
					}else{
						if(factor == "" || factor == null){
							Log("Error al procesar fila "+itLines+". Debe indicar un factor de unidad");
						}else{
							if(unidadB == "" || unidadB == null){
								Log("Error al procesar fila "+itLines+". Debe indicar una unidad de compra");
							}
							else{
							
								IReceta.Descripcion=stArray[1];
								
								IReceta.Unidad = unidad;
								IReceta.FactorB = factor;
								IReceta.UnidadB= unidadB;
								
								UIP.TopTitle="Almacenando "+IReceta.Descripcion;
					
								if (IReceta.IDivisa.LoadFromADOCByCodigo(stArray[5])==true){
									if (IReceta.ILinea.LoadFromADOCByCodigo(stArray[6])==true){
										stTemp=stArray[7]+"";
										switch (stTemp.toUpperCase()){
											case "I":
												IReceta.ITipo = 2;//Inventariable
												break;
											case "NI":
												IReceta.ITipo = 1;//No inventariable
												break;						
											default:
												IReceta.ITipo = 2;//Inventariable
												break;
										}
							
										IReceta.IClase = 2;//Clase cReceta
														
										if(stArray[8]>=1 && stArray[8]<=4){						
											IReceta.MetodoValuacion=stArray[8];
										}else{
											IReceta.MetodoValuacion=99;
										}
										
										stTemp=stArray[9]+"";
										
										switch (stTemp.toUpperCase()){
											case "G16":
												IReceta.Impuestos.LoadFromADOCByNombre("IVA 16% (México)");
												break;
											case "G15":
												IReceta.Impuestos.LoadFromADOCByNombre("IVA 15% (México)");
												break;
											case "G0":
												IReceta.Impuestos.LoadFromADOCByNombre("IVA 0% (México)");
												break;
											case "E":
												IReceta.Impuestos.LoadFromADOCByNombre("Exento");
												break;
											default:
												IReceta.Impuestos.LoadFromADOCByNombre("IVA 0% (México)");
												break;
										}
						
										IReceta.CostoUltimo=parseFloat("0"+stArray[10]);					
										IReceta.Precio1=parseFloat("0"+stArray[11]);
										IReceta.Precio2=parseFloat("0"+stArray[12]);
										IReceta.Precio3=parseFloat("0"+stArray[13]);
										IReceta.Precio4=parseFloat("0"+stArray[14]);
										IReceta.Precio5=parseFloat("0"+stArray[15]);
										
										IReceta.IDepartamento.LoadFromADOCByCodigo(stArray[16]);
										IReceta.CodBar1=stArray[17];
										IReceta.CodBar2=stArray[18];
										IReceta.CodBar3=stArray[19];
						
										IReceta.Visible=true;
										if (!IReceta.Update()){
											Log("Error al procesar fila "+itLines+". Error al guardar receta ("+IReceta.Descripcion+") "+IReceta.lastErrDescrip);
										}
										else{
											
											getSys_pkR = parseInt(getLastProducto());//Obtener la receta
											
											insertar = "INSERT INTO cproduccion_producto_(sys_timeStamp, iproductos, icentrosProduccion) VALUES (NOW()," + getSys_pkR +"," +getSys_pkCP +")";
											
											Application.adoCnn.Execute(insertar);
											insertar = "";
											
											itCount=itCount+1;
										}
									}else{
										Log("Error al procesar fila "+itLines+". No se pudo cargar la receta con código: "+stArray[0]);
									}
								}else{
									Log("Error al procesar fila "+itLines+". No se pudo cargar la divisa de la receta con código: "+stArray[0]);
								}
							}
						}
					}
				}else{
					Log("Error al procesar fila "+itLines+". La receta con código "+stArray[0]+" ya se encuentra registrado.");
				}
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
	IReceta=null;
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
		return ImportarCatalogoRecetas();
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

function getLastProducto(){
	var exist = "";
	
	exist = Application.adoCnn.Execute("SELECT sys_pk FROM producto ORDER BY sys_pk DESC limit 1");
	
	if( (exist == null) || (exist.EOF == true && exist.BOF == true) ){
		return 0;
	}
	return exist("sys_pk").value;
}

function getCProduccion(cProd){
	var exist = "";
	
	exist = Application.adoCnn.Execute("SELECT sys_pk FROM cProduccion where Descripcion = '" +cProd+ "'");
	
	if( (exist == null) || (exist.EOF == true && exist.BOF == true) ){
		return Log("El centro de producción ingresado no existe");
	}
	return exist("sys_pk").value;
}
