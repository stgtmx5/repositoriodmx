Procesar();

var UIP;

function ImportarCatalogoRecetas(){	
	var IReceta;
	var EFile;
	var ESheet;
	var lgItems;
	var itRows;
	var stFile;
	var stTemp;
	var itCount=0;
	var codigoP="";
	
	var getSys_pkR=0;
	var getSys_pkCP = "";
	var cProd ="";
	var insertar = "";
	
	var unidad="";
	var factor = "";
	var unidadB = "";
	
	stFile=Application.OpenFile("Archivos de excel (*.xls)|*.xls");	
	if (stFile==""){		
		return false;
	}
		
	UIP=Application.NewUIProgress();
	UIP.Caption="Importando recetas";
	UIP.Min=0;
	
	EFile=Application.NewObject("Excel.Application");
	EFile.WorkBooks.Open (stFile);
	IReceta=Application.NewObject("EDOFx.Producto");
	IReceta.ADOCnn=Application.adoCnn;
	
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
		
			IReceta.AddNew();
			
			cProd=ESheet.Cells(lgItems,21);
			cProd=cProd+"";
			cProd=cProd.toUpperCase();
			
			getSys_pkCP = getCProduccion(cProd);
			
			if(getSys_pkCP>0){
			
				if (IReceta.LoadFromADOCByCodigo(ESheet.Cells(lgItems,1))==false){
					codigoP="";
					codigoP=ESheet.Cells(lgItems,1);						
					codigoP=codigoP+"";
					codigoP=codigoP.toUpperCase();
					IReceta.Codigo=codigoP;
					
					unidad = ESheet.Cells(lgItems,3);
					factor = ESheet.Cells(lgItems,4)+"";
					unidadB = ESheet.Cells(lgItems,5)+"";
					
					if(unidad == null || unidad == ""){
						Log("Error al procesar fila "+lgItems+". Debe indicar una unidad");
					}else{
						if(factor == "undefined"){
							Log("Error al procesar fila "+lgItems+". Debe indicar un factor de unidad");
						}else{
							if(unidadB == "undefined"){
								Log("Error al procesar fila "+lgItems+". Debe indicar una unidad de compra");
							}else{
								IReceta.Descripcion=ESheet.Cells(lgItems,2);					
								/*IReceta.Unidad=ESheet.Cells(lgItems,3);
								IReceta.FactorB = ESheet.Cells(lgItems,4);
								IReceta.UnidadB= ESheet.Cells(lgItems,5);*/
								IReceta.Unidad = unidad;
								IReceta.FactorB = factor;
								IReceta.UnidadB= unidadB;
								
								UIP.TopTitle="Almacenando "+IReceta.Descripcion;
								
								if (IReceta.IDivisa.LoadFromADOCByCodigo(ESheet.Cells(lgItems,6))==true){

									if (IReceta.ILinea.LoadFromADOCByCodigo(ESheet.Cells(lgItems,7))==true){
								
										stTemp=ESheet.Cells(lgItems,8)+"";
										
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
										stTemp=ESheet.Cells(lgItems,9);					
							
										if (stTemp>=1 && stTemp<=4){
											IReceta.MetodoValuacion=stTemp;
										}else{
											IReceta.MetodoValuacion=99;
										}
							
										stTemp=ESheet.Cells(lgItems,10)+"";
										
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
							
										IReceta.CostoUltimo=ESheet.Cells(lgItems,11);
										IReceta.Precio1=ESheet.Cells(lgItems,12);
										IReceta.Precio2=ESheet.Cells(lgItems,13);
										IReceta.Precio3=ESheet.Cells(lgItems,14);
										IReceta.Precio4=ESheet.Cells(lgItems,15);
										IReceta.Precio5=ESheet.Cells(lgItems,16);
										
										IReceta.IDepartamento.LoadFromADOCByCodigo(ESheet.Cells(lgItems,17));
										IReceta.CodBar1=ESheet.Cells(lgItems,18);
										IReceta.CodBar2=ESheet.Cells(lgItems,19);
										IReceta.CodBar3=ESheet.Cells(lgItems,20);
										
										IReceta.Visible=true;
							
										if (!IReceta.Update()){
											Log("Error al procesar fila "+lgItems+". Error al guardar receta ("+IReceta.Descripcion+") "+IReceta.lastErrDescrip);
										}
										else{
											getSys_pkR = getLastProducto();
											
											insertar = "INSERT INTO cproduccion_producto_(sys_timeStamp, iproductos, icentrosProduccion) VALUES (NOW()," + getSys_pkR +"," +getSys_pkCP +")";
											
											Application.adoCnn.Execute(insertar);
											insertar = "";
											
											itCount=itCount+1;
										}
									}else{
										Log("Error al procesar fila "+lgItems+". No se pudo cargar la receta con código: "+ESheet.Cells(lgItems,1));
									}
								}else{
									Log("Error al procesar fila "+lgItems+". No se pudo cargar la divisa de la receta con código: "+ESheet.Cells(lgItems,1));
								}
							}
						}
					}
				}else{
					Log("Error al procesar fila "+lgItems+". La receta con código "+ESheet.Cells(lgItems,1)+" ya se encuentra registrado.");
				}
			}//CentroProduccion
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
	IReceta=null;
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
	
	exist = Application.adoCnn.Execute("SELECT sys_pk FROM cProduccion where descripcion = '" +cProd+ "'");
	
	if( (exist == null) || (exist.EOF == true && exist.BOF == true) ){
		return Log("El centro de producción ingresado no existe");
	}
	return exist("sys_pk").value;
}