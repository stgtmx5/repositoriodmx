Inventario.RedondearSaldoCantidad=1;

//Versión: 2.0.0.0
//var CmdSQLQProductoxLinea = "SELECT * FROM qryCatProductos WHERE KLinea=@PKlinea";
//var CmdSQLQProductoxDepto = "SELECT * FROM qryCatProductos WHERE PKDepartamento=@PKDepto";
//var CmdSQLQProductos = "SELECT * FROM qryCatProductos";
//SELECT Fecha, IAlmacen, Almacen, Categoria, Referencia, IProducto, Producto, Entradas, Salidas, Debe, Haber, CostoPromedio, Divisa, TipoCambio, Debe_DivisaPred, Haber_DivisaPred, Notas, Mes, Anio FROM qrycardexxproducto;
//SELECT Sys_PK, Numero, Almacen, Existencia, FEntrada, FCaducidad, IProducto FROM qrylotes;
var CmdSQLQCardex= "SELECT Fecha, IAlmacen, Almacen, IProducto, Producto, Entradas, Salidas, Resto, Debe, Haber, CostoPromedio, TipoCambio, Mes, Anio  FROM qryCardex WHERE Anio=@Anio";
var CmdSQLQCardexXProducto= "SELECT Fecha, IAlmacen, Almacen, Categoria, Referencia, IProducto, Producto, Entradas, Salidas, Debe, Haber, CostoPromedio, Divisa, TipoCambio, Debe_DivisaPred, Haber_DivisaPred, Notas, Mes, Anio FROM qryCardexXProducto WHERE IProducto=@PKProducto AND Anio=@Anio";
var CmdSQLQLotes="Select Sys_PK, Numero, Almacen, Existencia, FEntrada, FCaducidad, IProducto from qrylotes WHERE IProducto=@PKProducto";
var CmdSQLVarios="SELECT qryCatProductos.Sys_PK, qryCatProductos.KLinea, qryCatProductos.PKDepartamento, qryCatProductos.Codigo AS Codigo, qryCatProductos.Descripcion AS Descripcion, qryCatProductos.Marca, qryCatProductos.Unidad AS Unidad, qryCatProductos.Existencia AS Existencia, qryCatProductos.Precio1 AS Precio1, qryCatProductos.Precio2 AS Precio2, qryCatProductos.Precio3 AS Precio3, qryCatProductos.Precio4 AS Precio4, qryCatProductos.Precio5 AS Precio5, qryCatProductos.Saldo AS Saldo,qryCatProductos.CostoUltimo,qryCatProductos.Clase,qryCatProductos.Divisa, qryCatProductos.Linea,Departamento.Descripcion AS Departamento,ut_Color.uf_Color FROM (qryCatProductos LEFT JOIN Departamento ON qryCatProductos.PKDepartamento=Departamento.Sys_PK) LEFT JOIN ut_Color ON (qryCatProductos.Sys_PK=ut_Color.uf_PK AND ut_Color.uf_Tabla='producto')";




//var CmdSQLQProductos = "Select Klinea, Codigo, Descripcion1, Unidad, MarcaDescrip, Precio1, Precio2, Precio3, Precio4, Precio5, Existencia  From qryCatProductos";

function CrearPanel(){

    Application.UIShortCuts.CreatePane("P_Inv","Inventario y recetas","","","ICON_INVENTARIO","",0); 
    
	Application.UIShortCuts.Pane("P_Inv").CreateGroup(2,"P_Inv_G_01","Ver:","","",0);
	Application.UIShortCuts.Pane("P_Inv").CreateGroup(2,"P_Inv_G_02","Acciones","","",0);
	Application.UIShortCuts.Pane("P_Inv").CreateGroup(2,"P_Inv_G_03","","","",0);
	Application.UIShortCuts.Pane("P_Inv").CreateGroup(2,"P_Inv_G_04","Catálogos","","",0);
	Application.UIShortCuts.Pane("P_Inv").CreateGroup(2,"P_Inv_G_05","Organizar","","",0);

	Application.UIShortCuts.CreateAction("P_Inv_A01_2","Materias primas",0,"","","","UIInventario.QMateriasPrimasXLinea",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A01_3","Recetario de alimentos y bebidas",0,"","","","UIInventario.QRecetasXLinea",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A01","Artículos y servicios",0,"","","","UIInventario.QProductosXLinea",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A02_2","Agregar línea de materias primas",0,"","","","UIInventario.AgregarLineaMateriaPrima",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A02_3","Agregar línea de recetas",0,"","","","UIInventario.AgregarLineaReceta",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A02","Agregar línea de artículos y servicios",0,"","","","UIInventario.AgregarLinea",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A03_2","Agregar materia prima",0,"","","","UIInventario.AgregarMateriaPrima",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A03_3","Agregar receta",0,"","","","UIInventario.AgregarReceta",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A03","Agregar artículo o servicio",0,"","","","UIInventario.AgregarProducto",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A03b","Agregar varios (materia prima,artículo o servicio)",0,"","","","UIInventario.AgregarVariosProductos",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A04","Entrada de mercancías",0,"","","","UIInventario.Entrada",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A05","Salida de mercancías",0,"","","","UIInventario.Salida",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A06","Traspasos entre almacenes",0,"","","","UIInventario.Traspaso",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A07","Ensamblar productos",0,"","","","UIInventario.Ensamble",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A08","Des-ensamblar productos",0,"","","","UIInventario.DesEnsamble",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A09","Almacenes",0,"","","","UIInventario.CatalogoAlmacenes",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A10_2","Líneas de materias primas",0,"","","","UIInventario.CatalogoLineasMPrimas",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A10_3","Líneas de recetas",0,"","","","UIInventario.CatalogoLineasRecetas",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A10","Líneas de artículos y servicios",0,"","","","UIInventario.CatalogoLineas",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A11","Marcas",0,"","","","UIInventario.CatalogoMarcas",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A12","Departamentos",0,"","","","UIInventario.CatalogoDepartamentos",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A13","Categorías",0,"","","","UIInventario.CatalogoCategorias",0,"","","",0);

	
	Application.UIShortCuts.CreateAction("P_Inv_A14","Productos por Grupos",0,"","","","UIInventario.OrganizarProductosXGrupo",0,"","","",0);	
	Application.UIShortCuts.CreateAction("P_Inv_A15","Productos por Líneas",0,"","","","UIInventario.OrganizarProductosXLinea",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A16","Productos por Departamentos",0,"","","","UIInventario.OrganizarProductosXDepartamento",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_Org01","Materias primas por línea",0,"","","","UIInventario.OrganizarMatPrimasXLinea",0,"","","",0);	
	Application.UIShortCuts.CreateAction("P_Inv_Org02","Materias primas por departamento",0,"","","","UIInventario.OrganizarMatPrimasXDepto",0,"","","",0);	
	Application.UIShortCuts.CreateAction("P_Inv_Org03","Recetas por línea",0,"","","","UIInventario.OrganizarRecetasXLinea",0,"","","",0);	
	Application.UIShortCuts.CreateAction("P_Inv_Org04","Recetas por grupo",0,"","","","UIInventario.OrganizarRecetasXGrupo",0,"","","",0);	
	
	
	//NO BORRAR   //Application.UIShortCuts.CreateAction("P_Inv_A17","Cardex de productos",0,"","","","UIInventario.QCardexProductos",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A18","Cardex de un producto",0,"","","","UIInventario.QCardex_Producto",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A19","Lotes y Numeros de Series",0,"","","","UIInventario.loteserie",0,"","","",0);
	
	//Acción asociada al Botón "Más opciones"
	Application.UIShortCuts.CreateAction("P_Inv_A98","Agregar ...",0,"","","","UIInventario.AsistenteAgregar",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A99","Más opciones",0,"","","","UIInventario.MasOpciones",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A97","Editar",0,"","","","UIInventario.EditarInventario",0,"","","",0);	
	
	//jv - Requisiciones 2014
	Application.UIShortCuts.CreateAction("P_Inv_A50","Importar requisicion",0,"","","","UIInventario.ImportarRequisicion",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("P_Inv_A100","Agregar ...",0,"","","","UIInventario.AsistenteAgregarMateriaPrima",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A101","Agregar ...",0,"","","","UIInventario.AsistenteAgregarReceta",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A102","Editar",0,"","","","UIInventario.EditarInventarioMPrimas",0,"","","",0);
	Application.UIShortCuts.CreateAction("P_Inv_A103","Editar",0,"","","","UIInventario.EditarInventarioRecetas",0,"","","",0);
	
	
	
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_01").AddItem("P_Inv_A01_2");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_01").AddItem("P_Inv_A01_3");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_01").AddItem("P_Inv_A01");
	
	//NO BORRAR //Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_01").AddItem("P_Inv_A17");  					
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A02_2");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A02_3");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A02");
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A03_2");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A03_3");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A03");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_02").AddItem("P_Inv_A03b");
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_03").AddItem("P_Inv_A04");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_03").AddItem("P_Inv_A05");
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_03").AddItem("P_Inv_A06");
	//Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_03").AddItem("P_Inv_A07");
	//Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_03").AddItem("P_Inv_A08");
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A09");
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A10_2");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A10_3");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A10");
	
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A11");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A12");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_04").AddItem("P_Inv_A13");
	
	//Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_A14");
	//Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_A15");
	//Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_A16");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_Org01");
	//Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_Org02");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_Org03");
	Application.UIShortCuts.Pane("P_Inv").Group("P_Inv_G_05").AddItem("P_Inv_Org04");
	

}

function AgregarVariosProductos(A){
	try{
		MXCAsistentes.AsistenteCapturaRapidaProds();
		ActualizarBrowser("qProductosXLinea");
		ActualizarBrowser("QMateriasPrimasXLinea");
	}catch(e){
		
	}
}
function AsistenteAgregar(A)
{
	var ask;
	var upd=true;
	
	ask=Application.NewAsk();
	ask.SetOption(1,"Agregar/Modificar varias Líneas de productos","Use esta opción para capturar muchas líneas de forma fácil.");	
	ask.SetOption(2,"Agregar varios Productos o Servicios (Asistente para captura rápida)","Use este asistente para capturar rápidamente una lista de productos.");
	ask.SetOption(7,"Agregar Producto o Servicio","Capture productos de uno en uno.");
	ask.SetOption(3,"Importar desde archivo (Hoja de cálculo o Texto plano)","Le permitirá importar una lista de productos desde un archivo de Excel o texto");
	ask.SetOption(4,"Asistente para tallas y colores","Utilice esta opción para agregar productos en un rango de tallas tallas y con colores diferentes.");
	ask.SetOption(5,"Agregar/Modificar varias Marcas","Seleccione esta opción para capturar y editar varias marcas de productos");	
	ask.SetOption(6,"Agregar/Modificar varios Departamentos","Seleccione esta opción para capturar y editar varios departamentos de productos.");	
	
	switch (ask.Ask())
	{
		case 1:
			MXCAsistentes.CapturarVariasLineas(4);break;
		case 2:
			MXCAsistentes.AsistenteCapturaRapidaProds();break;
		case 3:
			MXCAsistentes.AsistenteImportarProds();break;			
		case 4:
			MXCAsistentes.AsistenteTallasYColores();break;		
		case 5:
			MXCAsistentes.CapturarVariasMarcas();break;
		case 6:
			MXCAsistentes.CapturarVariosDepartamentos();break;		
		case 7:
			AgregarProducto();break;		
		case 0:
			upd=false; break
	}
	
	if(upd) ActualizarBrowser("qProductosXLinea");
	ask=null;
}

function AsistenteAgregarMateriaPrima(A)
{
	var ask;
	var upd=true;
	
	ask=Application.NewAsk();	
	ask.SetOption(10,"Agregar Materia Prima","Seleccione esta opción si desea agregar un nuevo registro de materia prima.");
	ask.SetOption(1,"Agregar/Modificar varias Líneas de Materias Primas","Use esta opción para capturar muchas líneas de forma fácil.");	
	ask.SetOption(2,"Agregar varias Materias Primas (Asistente para captura rápida)","Use este asistente para capturar rápidamente una lista de materias primas de una misma línea.");	
	ask.SetOption(5,"Agregar/Modificar varias Marcas","Seleccione esta opción para capturar y editar varias marcas");	
	ask.SetOption(6,"Agregar/Modificar varios Departamentos","Seleccione esta opción para capturar y editar varios departamentos.");	
	
	switch (ask.Ask())
	{
		case 10:
			AgregarMateriaPrima(A);
			upd=false;
			break;
		case 1:
			MXCAsistentes.CapturarVariasLineas(1);break;
		case 2:
			MXCAsistentes.AsistenteCapturaRapidaProds(1);break;		
		case 5:
			MXCAsistentes.CapturarVariasMarcas();break;
		case 6:
			MXCAsistentes.CapturarVariosDepartamentos();break;				
		case 0:
			upd=false; break
	}
	if(upd) ActualizarBrowser("QMateriasPrimasXLinea");
	ask=null;
}

function AsistenteAgregarReceta(A)
{
	var ask;
	var upd=true;
	ask=Application.NewAsk();	
	ask.SetOption(10,"Agregar Receta","Seleccione esta opción si desea agregar una nueva Recetas.");
	ask.SetOption(1,"Agregar/Modificar varias Líneas de Recetas","Use esta opción para capturar muchas líneas de forma fácil.");			
	ask.SetOption(6,"Agregar/Modificar varios Departamentos","Seleccione esta opción para capturar y editar varios departamentos.");	
	
	switch (ask.Ask())
	{
		case 10:
			AgregarReceta(A);
			upd=false;
			break;
		case 1:
			MXCAsistentes.CapturarVariasLineas(2);break;				
		case 6:
			MXCAsistentes.CapturarVariosDepartamentos();break;		
		case 0:
			upd=false; break
	}	
	if(upd) ActualizarBrowser("QRecetasXLinea");
	ask=null;	
}

//Definición del botón "Más opciones" 
function MasOpciones(A){
	var ask;
	var upd=false;
	ask=Application.NewAsk();
	ask.SetOption(10,"Agregar producto o servicio","Seleccione esta opción si desea agregar un nuevo producto o servicio.");
	ask.SetOption(20,"Agregar línea de productos","Use esta opción para crear una nueva línea. Las líneas permiten clasificar el catálogo de productos.");
	ask.SetOption(30,"Editar catálogo de Líneas","Agregar, modificar o eliminar Líneas.");
	ask.SetOption(40,"Editar catálogo de Almacenes","Agregar, modificar o eliminar Almacenes.");
	ask.SetOption(50,"Editar catálogo de Marcas","Agregar, modificar o eliminar Marcas.");
	ask.SetOption(60,"Editar catálogo de Departamentos","Agregar, modificar o eliminar Departamentos.");
	ask.SetOption(70,"Organizar productos por Líneas","Abre una ventana diseñada para ayudarle a clasificar fácilmente los productos por líneas.");
	ask.SetOption(80,"Organizar productos por Departamentos","Abre una ventana diseñada para ayudarle a clasificar facilmente los productos por departamentos.");
	ask.SetOption(90,"Organizar productos por Grupos","Abre una ventana diseñada para ayudarle a clasificar facilmente los productos por Grupos. Los grupos son una forma muy útil de clasificar el catálogo.");
	
	ask.SetOption(1,"Agregar/Modificar varias Líneas de productos","Use esta opción para capturar muchas líneas de forma fácil.");	
	ask.SetOption(5,"Agregar/Modificar varias Marcas","Seleccione esta opción para capturar y editar varias marcas de productos");	
	ask.SetOption(6,"Agregar/Modificar varios Departamentos","Seleccione esta opción para capturar y editar varios departamentos de productos.");	
	
	switch(ask.Ask())
	{
		case 10: 
			AgregarProducto(A);break;			
		case 20:
			AgregarLinea(A);break;			
		case 30:
			CatalogoLineas();break;			
		case 40:
			CatalogoAlmacenes();break;			
		case 50:
			CatalogoMarcas();break;			
		case 60:
			CatalogoDepartamentos();break;			
		case 70:
			OrganizarProductosXLinea();break;
		case 80:
			OrganizarProductosXDepartamento();break;
		case 90:
			OrganizarProductosXGrupo();break;
		case 1:
			MXCAsistentes.CapturarVariasLineas(4);
			upd=true;
			break;
		case 5:
			MXCAsistentes.CapturarVariasMarcas();
			upd=true;
			break;
		case 6:
			MXCAsistentes.CapturarVariosDepartamentos();
			upd=true;
			break;
		case 0:
			upd=false; break
	}
		
	if(upd) ActualizarBrowser("qProductosXLinea");
	ask=null;
}


function EditarInventario(A)
{
	var ask;
	var upd=true;
	var pk;
	
	ask=Application.NewAsk();
	ask.SetOption(1,"Editar línea seleccionada","Utilice esta opción para modificar la línea seleccionada");	
	ask.SetOption(2,"Editar varias líneas","Seleccione esta opción para modificar el catálogo de lineas de productos");
	ask.SetOption(3,"Editar producto seleccionado","Use esta opción para realizar cambios al producto actual");
	ask.SetOption(5,"Editar conjunto de productos","Utilice esta herramienta para editar productos de una línea, marca, departamento o grupo seleccionado.");
	ask.SetOption(4,"Cambio masivo de precios","Use esta herramienta para actualizar los precios de productos de acuerdo a porcentajes de utilidad.");
	
	switch (ask.Ask())
	{
		case 1:
			pk=A.Context.ActiveWindow.LeftListSelectedValue;
			if(pk<1)pk=null;			
			EditarLinea(pk);
			break;
		case 2:
			MXCAsistentes.CapturarVariasLineas(4);
			break;
		case 3:
			EditarProducto(A.Context.ActiveWindow.PrimaryKeyvalue);
			break;
		case 4:
			CambioMasivoDePrecios();
			break;
		case 5:
			MXCAsistentes.EditarListaProductos(FXConfig.UtilizarImpuestoFrontera(),4);			
			upd=false;
	}
	
	if(upd) ActualizarBrowser("qProductosXLinea");
	ask=null;	
}

function EditarInventarioRecetas(A)
{
	var ask;
	var upd=true;
	var pk;
	
	ask=Application.NewAsk();
	ask.SetOption(1,"Editar línea seleccionada","Utilice esta opción para modificar la línea seleccionada");	
	ask.SetOption(2,"Editar varias líneas","Seleccione esta opción para modificar el catálogo de lineas de recetas");
	ask.SetOption(3,"Editar receta seleccionada","Use esta opción para realizar cambios en la receta actual");
	ask.SetOption(5,"Editar conjunto de recetas","Utilice esta herramienta para editar recetas de una línea, departamento o grupo seleccionado.");
	ask.SetOption(4,"Cambio masivo de precios","Use esta herramienta para actualizar los precios de productos de acuerdo a porcentajes de utilidad.");
	
	switch (ask.Ask())
	{
		case 1:
			pk=A.Context.ActiveWindow.LeftListSelectedValue;
			if(pk<1)pk=null;			
			EditarLineaReceta(pk);
			break;
		case 2:
			MXCAsistentes.CapturarVariasLineas(2);
			break;
		case 3:
			EditarReceta(A.Context.ActiveWindow.PrimaryKeyvalue);
			break;
		case 4:
			CambioMasivoDePrecios();
			break;
		case 5:
			MXCAsistentes.EditarListaProductos(FXConfig.UtilizarImpuestoFrontera(),2);			
			upd=false;
	}
	
	if(upd) ActualizarBrowser("qProductosXLinea");
	ask=null;	
}

function EditarInventarioMPrimas(A)
{
	var ask;
	var upd=true;
	var pk;
	
	ask=Application.NewAsk();
	ask.SetOption(1,"Editar línea seleccionada","Utilice esta opción para modificar la línea seleccionada");	
	ask.SetOption(2,"Editar varias líneas","Seleccione esta opción para modificar el catálogo de lineas de materias primas");
	ask.SetOption(3,"Editar materia prima seleccionada","Use esta opción para realizar cambios en la materia prima actual");
	ask.SetOption(5,"Editar conjunto de materias primas","Utilice esta herramienta para editar materias primas de una línea, marca, departamento o grupo seleccionado.");
	ask.SetOption(4,"Cambio masivo de precios","Use esta herramienta para actualizar los precios de productos de acuerdo a porcentajes de utilidad.");
	
	switch (ask.Ask())
	{
		case 1:
			pk=A.Context.ActiveWindow.LeftListSelectedValue;
			if(pk<1)pk=null;			
			EditarLineaMateriaPrima(pk);
			break;
		case 2:
			MXCAsistentes.CapturarVariasLineas(1);
			break;
		case 3:
			EditarMateriaPrima(A.Context.ActiveWindow.PrimaryKeyvalue);
			break;
		case 4:
			CambioMasivoDePrecios();
			break;
		case 5:
			MXCAsistentes.EditarListaProductos(FXConfig.UtilizarImpuestoFrontera(),1);			
			upd=false;
	}
	
	if(upd) ActualizarBrowser("qProductosXLinea");
	ask=null;	
}
function AgregarLinea(A){
	if (Catalogos.dlgLinea()){
		if(A!=null)
			ActualizarProductos();
		else
			return -1;
	}else		
		return 0;
}

//D
function AgregarLineaMateriaPrima(A){
	if (DMCatalogos.dlgLineaMateriaPrima()){
		ActualizarBrw("QMateriasPrimasXLinea");
		return -1;
	}else		
		return 0;
} 
//D
function AgregarLineaReceta(A){
	if (DMCatalogos.dlgLineReceta()){
		ActualizarBrw("QRecetasXLinea");
		return -1;
	}else		
		return 0;
}

function EditarLinea(PK){
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una línea");
		return 0;
	}
	if (Catalogos.dlgLinea_BySysPK(PK)) 
		return -1;
	else
		return 0;
}
//D
function EditarLineaMateriaPrima(PK){
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una línea");
		return 0;
	}
	if (DMCatalogos.dlgLineaMateriaPrima(PK)) 
		return -1;
	else
		return 0;
}
//D
function EditarLineaReceta(PK){
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una línea");
		return 0;
	}
	if (DMCatalogos.dlgLineReceta(PK)) 
		return -1;
	else
		return 0;
}

function EliminarLinea(PK){
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una línea");
		return 0;
	}
	
	if(Catalogos.DelLinea_BySysPK(PK))
		return -1;
	else
		return 0;
}


function AdLinea(){
var ask;
var Brw=null;

	ask=Application.NewAsk();
	ask.SetOption(1,"Agregar Línea","Crear una nueva línea para clasificar productos.");
	ask.SetOption(2,"Agregar Producto","Agregar un nuevo Productos o servicio.");
	switch(ask.Ask())
	{
		case 1:
			return AgregarLinea(null);break;
		case 2:
			return AgregarProducto();break;
	}
}

function EdLinea(PK){
var ask;
var Brw=null;

	ask=Application.NewAsk();
	ask.SetOption(1,"Editar Línea","Modificar la línea seleccionada en la lista a la izquierda en la ventana de Productos y servicios.");
	ask.SetOption(2,"Editar Producto","Modificar el producto o servicio en la lista a la derecha en la ventana de Productos y servicios.");
	switch(ask.Ask())
	{
		case 1:			
			return EditarLinea(PK);break;
		case 2:
			Brw=Application.Browsers.GetBrowser("qProductosXLinea");
			if (Brw==null){
				 Log("Error al editar producto: No se obtuvo la clave de producto")
				 return 0;
			}else{
				return EditarProducto(Brw.PrimaryKeyValue);
			}			
			break;
	}
}

function ElLinea(PK){
var ask;
var Brw=null;

	ask=Application.NewAsk();
	ask.SetOption(1,"Eliminar Línea","Eliminar definitivamente la línea seleccionada en la lista a la izquierda en la ventana de Productos y servicios.");
	ask.SetOption(2,"Eliminar Producto","Eliminar definitivamente el producto o servicio en la lista a la derecha en la ventana de Productos y servicios.");
	switch(ask.Ask())
	{
		case 1:
			return EliminarLinea(PK);break;
		case 2:
			Brw=Application.Browsers.GetBrowser("qProductosXLinea");
			if (Brw==null){
				Log("Error al obtener clave de producto");
				return 0;
			}else{
				return EliminarProducto(Brw.PrimaryKeyValue);
			}
			break;
	}
}
//Funciones de edición del catálogo de productos

function ActualizarProductos(A){
//Actualiza todas la ventana que muestra productos y líneas
	var Brw=null;
	if(A!=null){
		Brw=A.Context.ActiveWindow;
	}else{	
		Brw=Application.Browsers.GetBrowser("qProductosXLinea");
	}
	if (Brw!=null)		
		Brw.RefreshRst();			
}

//D
function ActualizarBrw(Nombre){
var Brw;
	Brw=Application.Browsers.GetBrowser(Nombre);	
	if (Brw!=null)		
		Brw.RefreshRst();			
}

function AgregarProducto(A){
	if (Catalogos.dlgProducto()){			
		//if(A!=null)
		//	ActualizarProductos(A);			
		ActualizarBrw("qProductosXLinea");
		return -1;
	}else
		return 0;
}

//D
function AgregarReceta(A){
	if (DMCatalogos.dlgReceta()){			
		ActualizarBrw("QRecetasXLinea");
		return -1;
	}else
		return 0;
}
//D
function AgregarMateriaPrima(A){
	if (DMCatalogos.dlgMateriaPrima()){			
		ActualizarBrw("QMateriasPrimasXLinea");
		return -1;
	}else
		return 0;
}

function EditarProducto(PK){
	//Application.StartGraphProcess(1000);
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione un producto");
		return 0;
	}
	if(Catalogos.dlgProducto_BySysPK(PK))
		return -1;
	else	
		return 0;
}


//D
function EditarMateriaPrima(PK){
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una materia prima");
		return 0;
	}
	if(DMCatalogos.dlgMateriaPrima_BySysPK(PK))
		return -1;
	else	
		return 0;
}
//D
function EditarReceta(PK){
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una receta");
		return 0;
	}
	if(DMCatalogos.dlgReceta_BySysPK(PK))
		return -1;
	else	
		return 0;
}

function EliminarProducto(PK){
var obj;
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione un producto");
		return 0;
	}
	
/* 	if(Catalogos.DelProducto_BySysPK(PK))
		return -1;
	else
		return 0; */
		
	if(LBInventario.Existencia(PK)>0){
		eBasic.eMsgbox("No se puede eliminar un producto con existencias.",6);
		return 0;
	}
	
	if(eBasic.eMsgbox("¿Está seguro que desea eliminar el elemento seleccionado?",4)==7)
		return 0;
	
	if(Catalogos.DelProducto_BySysPK(PK,false))
		return -1;
	else{
		if(MXCAsistentes.DarBajaElemento(1,PK))
			return -1;
		else
			return 0;
	}
	
	/*
	obj=eBasic.eCreateObject("EDOFx.Producto");
	if(obj.LoadFromADOConnection(PK,"", Application.adocnn)){
		if(Catalogos.DelProducto(obj,false)){
			return -1;
		}else{
			return BajaElemento(obj);
		}
	}*/
}


//D
function EliminarMateriaPrima(PK){
var obj;
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione un producto");
		return 0;
	}
	
/* 	if(DMCatalogos.DelMateriaPrima_BySysPK(PK))
		return -1;
	else
		return 0; */
	
	if(LBInventario.Existencia(PK)>0){
		eBasic.eMsgbox("No se puede eliminar un producto con existencias.",6);
		return 0;
	}	
	
	if(eBasic.eMsgbox("¿Está seguro que desea eliminar el elemento seleccionado?",4)==7)
		return 0;
	
	if(DMCatalogos.DelMateriaPrima_BySysPK(PK,false))
		return -1;
	else{
		if(MXCAsistentes.DarBajaElemento(1,PK))
			return -1;
		else
			return 0;
	}
		
	/*obj=eBasic.eCreateObject("EDOFx.Producto");
	if(obj.LoadFromADOConnection(PK,"", Application.adocnn)){
		if(DMCatalogos.DelMateriaPrima(obj,false)){
			return -1;
		}else{
			return BajaElemento(obj);
		}
	}*/
}
//D
function EliminarReceta(PK){
var obj;
	if(PK==null) PK=0;	
	if(PK==0){
		Log("Seleccione una receta");
		return 0;
	}
	
	/* if(DMCatalogos.DelReceta_BySysPK(PK))
		return -1;
	else
		return 0; */
	
	if(LBInventario.Existencia(PK)>0){
		eBasic.eMsgbox("No se puede eliminar un producto con existencias.",6);
		return 0;
	}
	
	if(eBasic.eMsgbox("¿Está seguro que desea eliminar el elemento seleccionado?",4)==7)
		return 0;
	
	if(DMCatalogos.DelReceta_BySysPK(PK,false))
		return -1;
	else{
		if(MXCAsistentes.DarBajaElemento(1,PK))
			return -1;
		else
			return 0;
	}
	/*obj=eBasic.eCreateObject("EDOFx.Producto");
	if(obj.LoadFromADOConnection(PK,"", Application.adocnn)){
		if(DMCatalogos.DelReceta(obj,false)){
			return -1;
		}else{
			return BajaElemento(obj);
		}
	}*/
}

function BajaElemento(obj){	
var objGUID;
var sGUID;
var s;
var c;
	if(obj==null) return 0;
	try{
		if(LBInventario.Existencia(obj.Sys_PK)>0){
			return 0;
		}else{
			if(eBasic.eMsgbox("Imposible eliminar pueden existir transacciones relacionadas. ¿Desea continar y dar de baja (mover a otra clasificación) el elemento seleccionado?",4)==7){
				return 0;
			}else{			
				objGUID=eBasic.eCreateObject("eSQLBD.eGUID");
				if(objGUID==null){
					eBasic.eMsgbox("Error al generar GUID. No se puede continuar.",6);
					return 0;
				}			
				sGUID=objGUID.GetGUID();				
				s="zz"+sGUID+"|"+obj.Codigo+"|"+obj.Descripcion+"|"+obj.CodBar1+"|"+obj.CodBar2+"|"+obj.CodBar3;
				c="zz"+sGUID;
				if(c.length>34){
					c=c.substr(0,34);					
				}
				obj.Codigo=c;
				if(s.length>149){
					s=s.substr(0,149);					
				}
				obj.Descripcion=s;
				obj.CodBar1=sGUID;
				obj.CodBar2=sGUID;
				obj.CodBar3=sGUID;	
				obj.Visible=false;
				if(!obj.Update()){
					return 0;
				}else{					
					Application.adocnn.Execute("UPDATE Producto SET IClase=999 WHERE Sys_PK="+obj.Sys_PK);
					return -1;
				}
			}
		}				
	}catch(e){
		eBasic.eMsgbox("Imposible continuar ha ocurrido un error.",6);
		return 0;
	}
}

//Funciones para edición de catálogos relacionados

function CatalogoLineas(){
	DMCatalogos.BrwLineas();
	ActualizarProductos();
}

function CatalogoLineasRecetas(){
	DMCatalogos.BrwLineas(2);	
}
function CatalogoLineasMPrimas(){
	DMCatalogos.BrwLineas(1);	
}

function CatalogoAlmacenes()
{
	Catalogos.BrwAlmacenes();
}

function CatalogoMarcas()
{
	Catalogos.BrwMarca();
}

function CatalogoDepartamentos()
{
	Catalogos.BrwDepartamentos();
}

function CatalogoCategorias()
{
	//CATEGORIA 3 ES PARA INVENTARIOS
	Catalogos.BrwCategorias(3);
}

//Funciones de operaciones de inventario
function Entrada(A){
var PKCardex;
	PKCardex=0;
	PKCardex=Inventario.Entrada();	
	if(PKCardex>0){
		if (eBasic.eMsgbox("¿Desea imprimir el Vale de Entrada?", 4)==6)
			Reportes.EjecutarReporte(FXConfig.FormatoValeDeEntrada(),2,PKCardex,true,"", null, 	"","Cardex");
			//Reportes.EjecutarReporte(FXConfig.FormatoValeDeEntrada(),2,PKCardex,true);		
		ActualizarProductos(A);
	}else
		Log(Inventario.LastErrorDescrip);	
}
function Salida(A){
var PKCardex;
	PKCardex=0;
	PKCardex=Inventario.Salida();
	if(PKCardex>0){
		if (eBasic.eMsgbox("¿Desea imprimir el Vale de Salida?", 4)==6)
			Reportes.EjecutarReporte(FXConfig.FormatoValeDeSalida(),2,PKCardex,true,"", null, "","Cardex");						
			//Reportes.EjecutarReporte(FXConfig.FormatoValeDeSalida(),2,PKCardex,true);						
		ActualizarProductos(A);
	}else
		Log(Inventario.LastErrorDescrip);
		
}
function Traspaso(A){
	//	if(Inventario.Traspaso())
//ActualizarProductos(A);
	var Ref;
	var Formato;
	var FormatoDiferenciaSurtido;
	var pkDoc;
	var boolDiferencia;
	var uiInventario;
	Ref=gFunciones.ReferenciaAleatoria();
	if(Inventario.Traspaso(Application.CurrentDate(),Ref))
	{	
		Ref=Inventario.ultimaReferenciaPorTraspaso;
			ActualizarProductos(A);
		Formato=eBasic.AddSlashPath(Application.GetPath(0)) + "Reports\\Inventario\\Traspasos.xpd";
		Reportes.EjecutarReporte(Formato,1,0,false,"","pPrimarykey",Ref+"-T","Producto");
		pkDoc=Inventario.pkUltimaRequisicion;
			if(pkDoc>0)
		{
			boolDiferencia=Inventario.boolEjercido;
			if(boolDiferencia==true)
			{
				FormatoDiferenciaSurtido=eBasic.AddSlashPath(Application.GetPath(0)) + "Reports\\Requisiciones\\Formato requisicion diferencias.xpd";				
				Reportes.EjecutarReporte(FormatoDiferenciaSurtido,1,pkDoc,true);
			}
		}
	}else
	{
		if(Inventario.LastErrorDescrip!="") eBasic.eMsgbox(Inventario.LastErrorDescrip,6);
	}	
}
function Ensamble(A){
	if(Inventario.Ensamble())
		ActualizarProductos(A);
}

function DesEnsamble(A){
	if(Inventario.DesEnsamble())
		ActualizarProductos(A);
}

//Funciones para organizar

function OrganizarProductosXGrupo(){	
    var Struct;        
    Struct=Catalogos.StructProd();
    Catalogos.ShowDlgOrgGpo(Struct,Application.adoCnn, "Organizar productos por grupo");
	ActualizarProductos();
}

function OrganizarProductosXLinea(){	
    var Struct;        
    Struct=Catalogos.StructTypeProductos();	
    Catalogos.ShowDlgOneToMany(Struct,Application.adoCnn, "Organizar productos por líneas");		
	ActualizarProductos();
}

function OrganizarProductosXDepartamento(){	
    var Struct;        
    Struct=Catalogos.StructTypeDepartamentos();	
    Catalogos.ShowDlgOneToMany(Struct,Application.adoCnn, "Organizar productos por departamento");		
	ActualizarProductos();
}

//Ventana de productos y servicios
function QProductosXLinea(){
var Brw;
Brw=null;

var CmdSQLQProductoxLinea =CmdSQLVarios+ " WHERE (qryCatProductos.IClase=3 OR qryCatProductos.IClase=4 OR qryCatProductos.IClase=5) AND qryCatProductos.KLinea=@PKlinea ORDER BY qryCatProductos.Descripcion";
var CmdSQLQProductos = CmdSQLVarios+" WHERE (qryCatProductos.IClase=3 OR qryCatProductos.IClase=4 OR qryCatProductos.IClase=5) ORDER BY qryCatProductos.Descripcion;";

Brw=Application.Browsers.GetBrowser("qProductosXLinea");
if (Brw==null)
	{
		//FX1-40-01-000: permiso de inventarios
		if(!Application.UIUsers.CheckItem("FX1-10-240-000A"))  //PERMITIR ACCESO
			return 0;
		
		Application.MouseHourglass();
		Application.MouseDefault();
		
		Brw=Application.Browsers.CreateBrowser("qProductosXLinea");
		Brw.Caption="Artículos y servicios";
		Brw.sqlCommand.CmdType=1;
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKlinea",0));
		Brw.sqlCommand.CmdSQL=CmdSQLQProductoxLinea;
		Brw.KeyField = "Sys_PK";
		Brw.CmdAfterRetriveFields="UIInventario.RedimensionarColumnas";
		
		Brw.ReportsFolder=Reportes.CarpetaInventario;		
		Brw.ObjectTypeName="Producto";		
		Brw.CmdAddNew="UIInventario.AgregarProducto";
		Brw.CmdEdit="UIInventario.EditarProducto";
		Brw.CmdDelete = "UIInventario.EliminarProducto";
		Brw.CmdDblClick="UIInventario.EditarProducto";
		Brw.CmdLeftAddNew="UIInventario.AdLinea";		
		Brw.CmdLeftEdit="UIInventario.EditarLinea";
		Brw.CmdLeftDelete = "UIInventario.ElLinea";
		Brw.CmdLeftDblClick=Brw.CmdLeftEdit;
		Brw.SubTitle1="Líneas";
		Brw.SubTitle2="Artículos, servicios y ensambles";
		
		Brw.FilterList.sqlQuery="Select Sys_PK, Descripcion From Linea Where Clase=3 or Clase=4 or Clase=5 Order By Descripcion";
		Brw.FilterList.KeyField="Sys_PK";
		Brw.FilterList.ListField="Descripcion";
		Brw.FilterList.Parameter="PKLinea";
		Brw.FilterList.HaveFirstItem=-1;
		Brw.FilterList.TextFirsItem="< Todos los productos >";
		Brw.FilterList.FirstItemValue=0;
		Brw.FilterList.FirstItemSQL=CmdSQLQProductos;		
		Brw.ShowToolBar();
		Brw.AddButton("Agregar ...","P_Inv_A98");
		Brw.AddButton("Editar...","P_Inv_A97");
		Brw.AddButton("Entradas","P_Inv_A04");
		Brw.AddButton("Salidas","P_Inv_A05");
		Brw.AddButton("Traspasos","P_Inv_A06");
		Brw.AddButton("Ensamblar","P_Inv_A07");
		Brw.AddButton("Des-ensamblar","P_Inv_A08");
		Brw.AddButton("Cardex","P_Inv_A18");
		Brw.AddButton("Lotes/series","P_Inv_a19");
		if(UIDef.inDataBaseType != 3) Brw.AddButton("Importar requisición","P_Inv_A50"); 
		Brw.AddButton("Más opciones ...","P_Inv_A99");		
		
		Brw.ShowFilterList();
		Brw.FillFilterList();
		Brw.SetItemList(0);
		//Brw.RetriveFields();
		
		//Ocultar columnas
		Brw.HideFields("Sys_PK;KLinea;PKDepartamento;uf_Color");
		
		//Asignar nombre de Columna
		Brw.SetCaptionByFieldName("CostoUltimo","Costo ultimo");
		//Brw.SetCaptionByFieldName("Descripcion1","Descripción");		
		Brw.ShowFindBar();	

		//Función para el panel de detalles
		Brw.DetailFunction="UIInventario.Detail";
		Application.GetDetailPanel().DoWith(Brw.PrimaryKeyValue);
		
		Brw.ColorFieldName="uf_Color";
		Brw.ColorTableName="ut_Color";
		Brw.BrwKeyFieldName="Sys_PK";
		Brw.BrwTableName="Producto";
		
		onLoadBrowser("qProductosXLinea");
	}
	else
		Brw.Zorder();

}

/* function QProductosXDepto(){
var Brw;
Brw=null;

Brw=Application.Browsers.GetBrowser("qProductosXDepto");
if (Brw==null)
	{
		Brw=Application.Browsers.CreateBrowser("qProductosXDepto");
		Brw.Caption="Productos y servicios por departamento";
		Brw.sqlCommand.CmdType=1;
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKDepto",0));
		Brw.sqlCommand.CmdSQL=CmdSQLQProductoxDepto;
		Brw.KeyField = "Sys_PK";
		Brw.CmdAfterRetriveFields="UIInventario.RedimensionarColumnas";
		
		Brw.CmdAddNew="UIInventario.AgregarProducto";
		Brw.CmdEdit="UIInventario.EditarProducto";
		Brw.CmdDelete = "UIInventario.EliminarProducto";
		Brw.CmdDblClick="UIInventario.EditarProducto";
		Brw.CmdLeftAddNew="UIInventario.AskDepartamento";		
		Brw.CmdLeftEdit="UIInventario.ModificarDepartamento";
		Brw.CmdLeftDelete = "UIInventario.EliminarDepartamento";
		Brw.CmdLeftDblClick=Brw.CmdLeftEdit;
		Brw.SubTitle1="Departamentos";
		Brw.SubTitle2="Artículos, servicios y ensambles";
		
		Brw.FilterList.sqlQuery="Select Sys_PK, Descripcion From Departamento Order By Descripcion";
		Brw.FilterList.KeyField="Sys_PK";
		Brw.FilterList.ListField="Descripcion";
		Brw.FilterList.Parameter="PKDepto";
		Brw.FilterList.HaveFirstItem=-1;
		Brw.FilterList.TextFirsItem="< Todos los productos >";
		Brw.FilterList.FirstItemValue=0;
		Brw.FilterList.FirstItemSQL=CmdSQLQProductos;		
		Brw.ShowToolBar();
		Brw.AddButton("Plantillas de captura","P_01");
		Brw.AddButton("Entradas","P_Inv_A04");
		Brw.AddButton("Salidas","P_Inv_A05");
		Brw.AddButton("Traspasos","P_Inv_A06");
		Brw.AddButton("Ensamblar","P_Inv_A07");
		Brw.AddButton("Des-ensamblar","P_Inv_A08");
		Brw.AddButton("Más opciones...","P_Inv_A99");				
		
		Brw.ShowFilterList();
		Brw.FillFilterList();
		Brw.SetItemList(0);
		//Brw.RetriveFields();
		
		//Ocultar columnas
		Brw.HideFields("Sys_PK;KLinea;PKDepartamento");
		
		//Asignar nombre de Columna
		Brw.SetCaptionByFieldName("MarcaDescrip","Marca");
		Brw.SetCaptionByFieldName("Descripcion1","Descripcion");		
		Brw.ShowFindBar();
	}
	else
		Brw.Zorder();

} */


function RedimensionarColumnas(BrwName){
	var Brw;
	Brw=null;
	Brw=Application.Browsers.GetBrowser(BrwName);	
	if (Brw!=null){		
		Brw.SetColumnWidth("Codigo",80);
		Brw.SetColumnWidth("Descripcion",200);
		Brw.SetColumnWidth("Marca",145);
		Brw.SetColumnWidth("Unidad",55);
		Brw.SetColumnWidth("Existencia",60);
		Brw.SetColumnWidth("Precio1",80);
		Brw.SetColumnWidth("Precio2",80);
		Brw.SetColumnWidth("Precio3",80);
		Brw.SetColumnWidth("Precio4",80);
		Brw.SetColumnWidth("Precio5",80);				
		Brw.SetColumnWidth("Saldo",100);		
		Brw.SetColumnWidth("CostoUltimo",100);
		Brw.SetColumnWidth("Clase",85);
		Brw.SetColumnWidth("Divisa",150);
		Brw.SetColumnWidth("Linea",200);
		Brw.SetColumnWidth("Departamento",200);
		
		try{
			Brw.SetColumnFormat("Precio1",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
			Brw.SetColumnFormat("Precio2",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
			Brw.SetColumnFormat("Precio3",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
			Brw.SetColumnFormat("Precio4",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
			Brw.SetColumnFormat("Precio5",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
			Brw.SetColumnFormat("Saldo",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
			Brw.SetColumnFormat("CostoUltimo",FXConfig.NDecsMonto(),FXConfig.FormatoMonto());
		}catch(e){}
	}
}


function AskDepartamento(){
	var ask;
	var Brw=null;

	ask=Application.NewAsk();
	ask.SetOption(10,"Agregar Departamento","Crear un nuevo departamento para los productos.");
	ask.SetOption(20,"Agregar Producto o Servicio","Agregar un nuevo elemento a la lista de Productos o servicios.");
	switch(ask.Ask())
	{
		case 10:
			AgregarDepartamento();
			break;
		case 20:
			AgregarProducto();
			break;
	}
	
	
	
}

function AgregarDepartamento(){
	if(Catalogos.dlgDepartamento())
		return -1;
	else
		return 0;
}


function ModificarDepartamento(PK){
	if(Catalogos.dlgDepartamento_BySysPK(PK))
		return -1;
	else
		return 0;
}
function EliminarDepartamento(PK){
	if (Catalogos.DelDepartamento_BySysPK(PK))
		return -1;
	else
		return 0;
}

function QCardexProductos(){
var Brw;
var Fecha;

Brw=null;
Brw=Application.Browsers.GetBrowser("qCardex");
if (Brw==null)
	{
		if(!Application.UIUsers.CheckItem("FX1-40-02-000"))  //PERMITIR ACCESO
			return 0;
			
		Brw=Application.Browsers.CreateBrowser("qCardex");
				
		Brw.Caption="Cardex de Productos";
		Brw.sqlCommand.CmdType=1;		
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKAlmacen",0));
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("Mes",1));
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("Anio",0));
		Brw.sqlCommand.CmdSQL=CmdSQLQCardex;
		Brw.KeyField = "IProducto";
		
		Brw.ReportsFolder=Reportes.CarpetaInventario;		
		Brw.ObjectTypeName="Producto";
		Brw.CmdAddNew="UIInventario.AgregarProducto";
		Brw.CmdEdit="UIInventario.EditarProducto";
		Brw.CmdDelete = "UIInventario.EliminarProducto";
		Brw.CmdDblClick="UIInventario.EditarProducto";		
		Brw.CmdAfterRetriveFields="UIInventario.RedimensionarColumnascardex";				
		Brw.TopTabParameter="PKAlmacen";		
		Brw.CmdTopTabClick="UIInventario.FiltrarCardex_PorAlmacen";
		Brw.CmdBottomTabClick="UIInventario.FiltrarCardex_PorAlmacen";
		CargarAlmacenes(Brw);			
		Brw.ShowTopTabsBar();
		
		
		Brw.ShowToolBar();
		Brw.AddButton("Agregar ...","P_Inv_A98");
		Brw.AddButton("Entradas","P_Inv_A04");
		Brw.AddButton("Salidas","P_Inv_A05");
		Brw.AddButton("Traspasos","P_Inv_A06");
		Brw.AddButton("Ensamblar","P_Inv_A07");
		Brw.AddButton("Des-ensamblar","P_Inv_A08");
		Brw.AddButton("Cardex","P_Inv_A18");
		Brw.AddButton("Lotes y Series","P_Inv_a19");
		Brw.AddButton("Más opciones...","P_Inv_A99");	
		Brw.SubTitle2="Artículos, servicios y ensambles";
		
		Brw.BottomTabParameter="Mes";	
		Brw.AddBottomTab("Enero",1);
		Brw.AddBottomTab("Febrero",2);
		Brw.AddBottomTab("Marzo",3);
		Brw.AddBottomTab("Abril",4);
		Brw.AddBottomTab("Mayo",5);
		Brw.AddBottomTab("Junio",6);
		Brw.AddBottomTab("Julio",7);
		Brw.AddBottomTab("Agosto",8);
		Brw.AddBottomTab("Septiembre",9);
		Brw.AddBottomTab("Octubre",10);
		Brw.AddBottomTab("Noviembre",11);
		Brw.AddBottomTab("Diciembre",12);			
		Brw.AddBottomTab("Todos",0);		
		Brw.ShowBottomTabsBar();
		
		Brw.ShowBottomCombo();
		Brw.BottomComboParameter="Anio";
		UIDef.FillComboYears(Brw,false,true,true);	
		
		Fecha=new Date();
		Brw.SelectBottomTab(Fecha.getMonth());
		Brw.ShowFindBar();
		FiltrarCardex_PorAlmacen();
		Brw.RefreshRst();
	}
	else
		Brw.Zorder();

}

function CargarAlmacenes(Brw){
	var R;
	R=Application.Database.OpenRecordset("SELECT SYS_PK,DESCRIPCION FROM ALMACEN WHERE uf_inhabilitado <> 1 order by Descripcion",Application.adoCnn);
	if(R==null){
		Log("Error al cargar almacenes");
		return 0;
	}
	if(R.BOF && R.EOF){
		Log("No existen almacenes");
		return 0;
	}
	while(!R.EOF){
		Brw.AddTopTab(R("DESCRIPCION"),R("SYS_PK"));
		R.MoveNext();
	}
	Brw.AddTopTab("Todos",0);
	Brw.SelectTopTab(0);
	R.MoveFirst();
	Brw.Parameter("PKAlmacen").Value=R("SYS_PK");
	R=null;
}

function FiltrarCardex_PorAlmacen(){
	var Brw;	
	Brw=null;	
	Brw=Application.Browsers.GetBrowser("qCardex");
	if (Brw==null)
		return 0;	
	if(Brw.Parameter("PKAlmacen").Value==0){
		//Todos los almacenes
		if(Brw.Parameter("Mes").Value==0)
			Brw.sqlCommand.CmdSQL=CmdSQLQCardex;
		else
			Brw.sqlCommand.CmdSQL=CmdSQLQCardex + " AND Mes=@Mes";
	}else{
		//Por almacen		
		if(Brw.Parameter("Mes").Value==0)
			Brw.sqlCommand.CmdSQL=CmdSQLQCardex + " AND IAlmacen=@PKAlmacen";
		else
			Brw.sqlCommand.CmdSQL=CmdSQLQCardex + " AND IAlmacen=@PKAlmacen AND Mes=@Mes";
	}
}

function RedimensionarColumnascardex(BrwName){
var Brw;
	Brw=null;

	Brw=Application.Browsers.GetBrowser(BrwName);	
	if (Brw!=null){	
		Brw.HideFields("IProducto;IAlmacen;Almacen;Mes;Anio",false);		
		if(Brw.Parameter("PKAlmacen").Value==0)
			Brw.ShowFields("Almacen");
		
		Brw.SetColumnWidth("Fecha",70);		
		Brw.SetColumnWidth("Almacen",110);
		Brw.SetColumnWidth("Producto",200);
		Brw.SetColumnWidth("Entradas",80);		
		Brw.SetColumnWidth("Salidas",80);		
		Brw.SetColumnWidth("Debe",80);		
		Brw.SetColumnWidth("Haber",80);				
		Brw.SetColumnWidth("Resto",80);
		Brw.SetColumnWidth("TipoCambio",80);
		Brw.SetCaptionByFieldName("TipoCambio","Tipo cambio");		
		Brw.SetColumnWidth("CostoPromedio",80);
		Brw.SetCaptionByFieldName("CostoPromedio","Costo promedio");
		Brw.GroupBy("Producto");
	}
}

function QCardex_Producto(ObjAction){
var Brw;
var Fecha;
var PK;
	
PK=ObjAction.Context.ActiveWindow.PrimaryKeyValue;
if(PK==null){
	Log("Error al obtener clave primaria del producto");
	return 0;
}
Brw=null;
Brw=Application.Browsers.GetBrowser("qCardexProducto"+PK);
if (Brw==null)
	{
		Brw=Application.Browsers.CreateBrowser("qCardexProducto"+PK);		
		Brw.Caption="Cardex";
		if (ObjAction.Context.ActiveWindow.MyName=="qProductosXLinea")
			Brw.SubTitle2=ObjAction.Context.ActiveWindow.GetFieldValue("Descripcion");
		else
			Brw.SubTitle2=ObjAction.Context.ActiveWindow.GetFieldValue("Producto");
		
		Brw.sqlCommand.CmdType=1;
		//Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKCardex",0));
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKProducto",PK));
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKAlmacen",0));
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("Mes",1));
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("Anio",0));
		Brw.sqlCommand.CmdSQL=CmdSQLQCardexXProducto;
		Brw.KeyField = "IProducto";
		
		Brw.ReportsFolder=Reportes.CarpetaInventario;		
		Brw.ObjectTypeName="Producto";
		
		Brw.CmdAfterRetriveFields="UIInventario.RedimensionarColumnasCardexProd";				
		Brw.TopTabParameter="PKAlmacen";		
		Brw.CmdTopTabClick="UIInventario.FiltrarCdxProducto_PorAlmacen";
		Brw.CmdBottomTabClick="UIInventario.FiltrarCdxProducto_PorAlmacen";
		CargarAlmacenes(Brw);	
		Brw.ShowTopTabsBar();
		
		Brw.BottomTabParameter="Mes";	
		Brw.AddBottomTab("Enero",1);
		Brw.AddBottomTab("Febrero",2);
		Brw.AddBottomTab("Marzo",3);
		Brw.AddBottomTab("Abril",4);
		Brw.AddBottomTab("Mayo",5);
		Brw.AddBottomTab("Junio",6);
		Brw.AddBottomTab("Julio",7);
		Brw.AddBottomTab("Agosto",8);
		Brw.AddBottomTab("Septiembre",9);
		Brw.AddBottomTab("Octubre",10);
		Brw.AddBottomTab("Noviembre",11);
		Brw.AddBottomTab("Diciembre",12);			
		Brw.AddBottomTab("Todos",0);		
		Brw.ShowBottomTabsBar();
		
		Brw.ShowBottomCombo();
		Brw.BottomComboParameter="Anio";	
		UIDef.FillComboYears(Brw,false,true,true);	
		
		Fecha=new Date();
		Brw.SelectBottomTab(Fecha.getMonth());		
		FiltrarCdxProducto_PorAlmacen();
		Brw.RefreshRst();
	}
	else
		Brw.Zorder();
}

function FiltrarCdxProducto_PorAlmacen(){
	var Brw;	
	Brw=null;	
	//Brw=Application.Browsers.GetBrowser("qCardexProducto");
	Brw=Application.ActiveWindow();
	if (Brw==null)
		return 0;
	
	if(Brw.Parameter("PKAlmacen").Value==0){
		//Todos los almacenes
		if(Brw.Parameter("Mes").Value==0)
			Brw.sqlCommand.CmdSQL=CmdSQLQCardexXProducto;
		else
			Brw.sqlCommand.CmdSQL=CmdSQLQCardexXProducto + " AND Mes=@Mes";
	}else{
		//Por almacen		
		if(Brw.Parameter("Mes").Value==0)
			Brw.sqlCommand.CmdSQL=CmdSQLQCardexXProducto + " AND IAlmacen=@PKAlmacen";
		else
			Brw.sqlCommand.CmdSQL=CmdSQLQCardexXProducto + " AND IAlmacen=@PKAlmacen AND Mes=@Mes";
	}	
}

function RedimensionarColumnasCardexProd(BrwName){
var Brw;
var PKProd;
var PKAlmacen;
//var Mes;
var Anio;
var Debe;
var Haber;
var Saldo;

	Brw=null;

	Brw=Application.Browsers.GetBrowser(BrwName);	
	if (Brw!=null){	
		
		//Brw.Caption="Cardex: "+Brw.GetFieldValue("Producto");
		PKProd=Brw.Parameter("PKProducto").Value;
		PKAlmacen=Brw.Parameter("PKAlmacen").Value;
		//Mes=Brw.Parameter("Mes").Value;
		Anio=Brw.Parameter("Anio").Value;
		//Simepre muestra el debe y haber total del año
		Debe=LBInventario.Debe(PKProd,0,PKAlmacen,Anio);
		Haber=LBInventario.Haber(PKProd,0,PKAlmacen,Anio);
		Saldo=Debe-Haber;		
		
		Brw.SetGridTitle("Existencias= "+LBInventario.Existencia(PKProd,PKAlmacen)+"    Debe= "+eBasic.eFormat(Debe,Inventario.FormatoMontos)+"    Haber= "+eBasic.eFormat(Haber,Inventario.FormatoMontos)+"    Saldo= "+eBasic.eFormat(Saldo,Inventario.FormatoMontos));
		
		Brw.HideFields("IProducto;Producto;IAlmacen;Almacen;Mes;Anio",false);		
		if(Brw.Parameter("PKAlmacen").Value==0)
			Brw.ShowFields("Almacen");
			
		Brw.SetColumnWidth("Fecha",70);		
		Brw.SetColumnWidth("Almacen",110);
		Brw.SetColumnWidth("Categoria",110);		
		Brw.SetColumnWidth("Referencia",90);
		Brw.SetColumnWidth("Entradas",80);		
		Brw.SetColumnWidth("Salidas",80);		
		Brw.SetColumnWidth("Debe",80);	
		Brw.SetColumnWidth("Haber",80);		
		Brw.SetColumnWidth("CostoPromedio",80);
		Brw.SetColumnWidth("Divisa",50);
		Brw.SetColumnWidth("TipoCambio",70);
		Brw.SetColumnWidth("Debe_DivisaPred",80);	
		Brw.SetColumnWidth("Haber_DivisaPred",80);	
		Brw.SetColumnWidth("Notas",500);
		Brw.SetCaptionByFieldName("CostoPromedio","Costo promedio");
		Brw.SetCaptionByFieldName("Debe_DivisaPred","Debe en Divisa predeterminada");
		Brw.SetCaptionByFieldName("Haber_DivisaPred","Haber en Divisa predeterminada");
	}
}











function loteserie(ObjAction){
var pk;
pk=ObjAction.Context.ActiveWindow.PrimaryKeyValue;
if(pk==null) pk=0;
if(pk==0){
	Log("Seleccione un producto");
	return 0;
}

	if (!Inventario.ListaSeriesYLotes(pk))
		if(Inventario.LastErrorDescrip!="")
			eBasic.eMsgbox(Inventario.LastErrorDescrip,6);
}

//DEMINUS 
function QMateriasPrimasXLinea(){
var Brw;

var CmdSQLQMateriasPrimas=CmdSQLVarios+" WHERE qryCatProductos.IClase=1 ORDER BY qryCatProductos.Descripcion;";
var CmdSQLQMateriasPrimasXLinea=CmdSQLVarios+" WHERE qryCatProductos.IClase=1 AND qryCatProductos.KLinea=@PKlinea ORDER BY qryCatProductos.Descripcion;";

Brw=null;

Brw=Application.Browsers.GetBrowser("QMateriasPrimasXLinea");
if (Brw==null)
	{
		if(!Application.UIUsers.CheckItem("FX1-10-241-001"))  //PERMITIR ACCESO
			return 0;
		
		Application.MouseHourglass();
		Application.MouseDefault();
				
		Brw=Application.Browsers.CreateBrowser("QMateriasPrimasXLinea");
		Brw.Caption="Materias primas";
		Brw.sqlCommand.CmdType=1;
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKlinea",0));
		Brw.sqlCommand.CmdSQL=CmdSQLQMateriasPrimasXLinea;
		Brw.KeyField = "Sys_PK";
		Brw.CmdAfterRetriveFields="UIInventario.RedimensionarColumnas";
		
		Brw.ReportsFolder=Reportes.CarpetaInventario;		
		Brw.ObjectTypeName="Producto";		
		Brw.CmdAddNew="UIInventario.AgregarMateriaPrima";
		Brw.CmdEdit="UIInventario.EditarMateriaPrima";
		Brw.CmdDelete = "UIInventario.EliminarMateriaPrima";
		Brw.CmdDblClick="UIInventario.EditarMateriaPrima";
		Brw.CmdLeftAddNew="UIInventario.AgregarLineaMateriaPrima"//"UIInventario.AdLinea";		
		Brw.CmdLeftEdit="UIInventario.EditarLineaMateriaPrima";
		Brw.CmdLeftDelete = "UIInventario.ElLinea";
		Brw.CmdLeftDblClick=Brw.CmdLeftEdit;
		Brw.SubTitle1="Líneas";
		Brw.SubTitle2="Materias primas";
		
		Brw.FilterList.sqlQuery="Select Sys_PK, Descripcion From Linea Where Clase=1 Order By Descripcion";
		Brw.FilterList.KeyField="Sys_PK";
		Brw.FilterList.ListField="Descripcion";
		Brw.FilterList.Parameter="PKLinea";
		Brw.FilterList.HaveFirstItem=-1;
		Brw.FilterList.TextFirsItem="< Todos los productos >";
		Brw.FilterList.FirstItemValue=0;
		Brw.FilterList.FirstItemSQL=CmdSQLQMateriasPrimas;		
		Brw.ShowToolBar();
		Brw.AddButton("Agregar...","P_Inv_A100");
		Brw.AddButton("Editar...","P_Inv_A102");
		Brw.AddButton("Entradas","P_Inv_A04");
		Brw.AddButton("Salidas","P_Inv_A05");
		Brw.AddButton("Traspasos","P_Inv_A06");
		//Brw.AddButton("Ensamblar","P_Inv_A07");
		//Brw.AddButton("Des-ensamblar","P_Inv_A08");
		Brw.AddButton("Cardex","P_Inv_A18");
		//Brw.AddButton("Lotes y series","P_Inv_a19");
		//Brw.AddButton("Más opciones ...","P_Inv_A99");		
		
		Brw.ShowFilterList();
		Brw.FillFilterList();
		Brw.SetItemList(0);
		//Brw.RetriveFields();
		
		//Ocultar columnas
		Brw.HideFields("Sys_PK;KLinea;PKDepartamento;Precio1;Precio2;Precio3;Precio4;Precio5;uf_Color");
		
		//Asignar nombre de Columna
		Brw.SetCaptionByFieldName("CostoUltimo","Costo ultimo");
		//Brw.SetCaptionByFieldName("Descripcion1","Descripción");		
		Brw.ShowFindBar();		
		
		//Función para el panel de detalles
		Brw.DetailFunction="UIInventario.Detail";
		Application.GetDetailPanel().DoWith(Brw.PrimaryKeyValue);
		
		Brw.ColorFieldName="uf_Color";
		Brw.ColorTableName="ut_Color";
		Brw.BrwKeyFieldName="Sys_PK";
		Brw.BrwTableName="Producto";
		
		onLoadBrowser("QMateriasPrimasXLinea");
	}
	else
		Brw.Zorder();

}

function QRecetasXLinea(){
var Brw;

var CmdSQLRecetas=CmdSQLVarios+" WHERE qryCatProductos.IClase=2 ORDER BY qryCatProductos.Descripcion;";
var CmdSQLRecetasXLinea=CmdSQLVarios+" WHERE qryCatProductos.IClase=2 AND qryCatProductos.KLinea=@PKlinea ORDER BY qryCatProductos.Descripcion;";

Brw=null;

Brw=Application.Browsers.GetBrowser("QRecetasXLinea");
if (Brw==null)
	{
		if(!Application.UIUsers.CheckItem("FX1-10-242-001"))  //PERMITIR ACCESO
			return 0;
		
		Application.MouseHourglass();
		Application.MouseDefault();
				
		Brw=Application.Browsers.CreateBrowser("QRecetasXLinea");
		Brw.Caption="Recetario de alimentos y bebidas";
		Brw.sqlCommand.CmdType=1;
		Brw.sqlCommand.Parameters.Add(Brw.sqlCommand.NewNumericParameter("PKlinea",0));
		Brw.sqlCommand.CmdSQL=CmdSQLRecetasXLinea;
		Brw.KeyField = "Sys_PK";
		Brw.CmdAfterRetriveFields="UIInventario.RedimensionarColumnas";
		
		Brw.ReportsFolder=Reportes.CarpetaInventario;		
		Brw.ObjectTypeName="Producto";		
		Brw.CmdAddNew="UIInventario.AgregarReceta";
		Brw.CmdEdit="UIInventario.EditarReceta";
		Brw.CmdDelete = "UIInventario.EliminarReceta";
		Brw.CmdDblClick="UIInventario.EditarReceta";
		Brw.CmdLeftAddNew="UIInventario.AgregarLineaReceta"//"UIInventario.AdLinea";		
		Brw.CmdLeftEdit="UIInventario.EditarLineaReceta";
		Brw.CmdLeftDelete = "UIInventario.ElLinea";
		Brw.CmdLeftDblClick=Brw.CmdLeftEdit;
		Brw.SubTitle1="Líneas";
		Brw.SubTitle2="Recetario de alimentos y bebidas";
		
		Brw.FilterList.sqlQuery="Select Sys_PK, Descripcion From Linea Where Clase=2 Order By Descripcion";
		Brw.FilterList.KeyField="Sys_PK";
		Brw.FilterList.ListField="Descripcion";
		Brw.FilterList.Parameter="PKLinea";
		Brw.FilterList.HaveFirstItem=-1;
		Brw.FilterList.TextFirsItem="< Todos los productos >";
		Brw.FilterList.FirstItemValue=0;
		Brw.FilterList.FirstItemSQL=CmdSQLRecetas;		
		Brw.ShowToolBar();
		Brw.AddButton("Agregar...","P_Inv_A101");
		Brw.AddButton("Editar...","P_Inv_A103");
		Brw.AddButton("Entradas","P_Inv_A04");
		Brw.AddButton("Salidas","P_Inv_A05");
		Brw.AddButton("Traspasos","P_Inv_A06");
		Brw.AddButton("Ensamblar","P_Inv_A07");
		Brw.AddButton("Des-ensamblar","P_Inv_A08");
		Brw.AddButton("Cardex","P_Inv_A18");
		//Brw.AddButton("Lotes y series","P_Inv_a19");
		//Brw.AddButton("Más opciones ...","P_Inv_A99");		
		
		Brw.ShowFilterList();
		Brw.FillFilterList();
		Brw.SetItemList(0);
		//Brw.RetriveFields();
		
		//Ocultar columnas
		Brw.HideFields("Sys_PK;KLinea;PKDepartamento;uf_Color");
		
		//Asignar nombre de Columna
		Brw.SetCaptionByFieldName("CostoUltimo","Costo ultimo");
		//Brw.SetCaptionByFieldName("Descripcion1","Descripción");		
		Brw.ShowFindBar();	

		//Función para el panel de detalles
		Brw.DetailFunction="UIInventario.Detail";
		Application.GetDetailPanel().DoWith(Brw.PrimaryKeyValue);		
		
		Brw.ColorFieldName="uf_Color";
		Brw.ColorTableName="ut_Color";
		Brw.BrwKeyFieldName="Sys_PK";
		Brw.BrwTableName="Producto";
		
		onLoadBrowser("QRecetasXLinea");
	}
	else
		Brw.Zorder();

}

//DEMINUS

function OrganizarMatPrimasXLinea(){
	var Struct;
	Struct = DMCatalogos.StructTypeProductos(1);
	Catalogos.ShowDlgOneToMany(Struct,Application.adoCnn, "Organizar marias primas por línea", "where Clase=1", "Iclase=1");	
}

function OrganizarRecetasXLinea(){
	var Struct;
	Struct=DMCatalogos.StructTypeProductos(2);
	Catalogos.ShowDlgOneToMany(Struct,Application.adoCnn, "Organizar recetas por línea", "where Clase=2", "Iclase=2");    
}

function OrganizarRecetasXGrupo(){
	var Struct;
	Struct=DMCatalogos.StructProdXGrupo(2);
    Catalogos.ShowDlgOrgGpo(Struct,Application.adoCnn, "Organizar recetas por grupo","where Clase=2", "Iclase=2");
}

//******************************************v2010*********************
function Detail()
{
	
	var r=null;
	var p;
	try
	{
	
		p=Application.GetDetailPanel();
		p.SetCaption("Existencias por almacén del producto: " + DescripcionProducto(p.CurrentValue));
		r=Application.Database.OpenRecordset("SELECT Almacen.Sys_PK, Almacen.Codigo, Almacen.Descripcion AS Almacen, Almacen.Telefonos, Existencias.Existencia, Producto.Unidad, Existencias.Saldo FROM (Existencias Inner Join Producto On Existencias.FK_Producto_IExistencias=Producto.Sys_PK) inner Join Almacen On Almacen.Sys_PK=Existencias.IAlmacen WHERE Producto.Sys_PK="+p.CurrentValue,Application.adoCnn);
		
		//Poner datos en el panel
	
		p.SetDataSource(r,"Sys_PK");
		p.HideFields("Sys_PK");
		p.SetColumnWidth("Codigo",100);
		p.SetColumnWidth("Almacen",300);
		p.SetColumnWidth("Telefonos",150);
		p.SetColumnWidth("Existencia",90);
		p.SetColumnWidth("Unidad",90);
		p.SetColumnWidth("Saldo",90);
	}
	catch(e)
	{
		Log("Error al obtener información para el panel de detalle");
		return;
	}
	
	
}

function DescripcionProducto(PK)
{
	var r=null;
	var s;
	try
	{
		r=Application.Database.OpenRecordset("SELECT Producto.Descripcion FROM Producto WHERE Producto.Sys_PK="+PK,Application.adoCnn);
		if (!(r.EOF && r.BOF))
			s=r.Fields("Descripcion").Value;
		else
			s="No se encontró el producto";
		r.Close();
		return s;
	}
	catch(e)
	{
		return "Error al buscar el producto";
	}
}
//*************************************************


function ActualizarBrowser(BrwName){
	var Brw=null;
	Brw=Application.Browsers.GetBrowser(BrwName);	
	if (Brw!=null){
		Brw.RefreshRst();
	}		
}

function onLoadBrowser(BrwName){
	var Brw=null;
	Brw=Application.Browsers.GetBrowser(BrwName);	
	if (Brw!=null){
		if(Brw.RecordCount==0){
			switch(BrwName.toLowerCase()){
				case "qproductosxlinea":
					AsistenteAgregar(); break;
				case "qrecetasxlinea":
					AsistenteAgregarReceta(); break;
				case "qmateriasprimasxlinea":
					AsistenteAgregarMateriaPrima(); break;
			}
		}
	}			
}

function CambioMasivoDePrecios(){    
	var CambioPrecios;
	var	Opt;
	var Ubicacion;
	var CodigoImportar;
	CambioPrecios=Application.NewObject("fxCmbPrecios.CmbPrecios");
	if(CambioPrecios==null){
		eBasic.eMsgbox("Error al crear fxCmbPrecios.CmbPrecios",6);
		return 0;
	}
	CambioPrecios.SetObjects(Application.adoCnn,Application.UIUsers);	
	Opt=CambioPrecios.ShowCambioPrecios();
	if(Opt==2){ //Importar desde archivo.
		Ubicacion=eBasic.AddSlashPath(Application.ReplaceMacros("$AppPath$"))+"Subprograms\\ActualizarListaPreciosTxt.js";		
		CodigoImportar= Application.VerifyFileSource(Ubicacion);
		if(CodigoImportar==""){
			eBasic.eMsgbox("Error al cargar script "+Ubicacion);
			return 0;
		}
		eval(CodigoImportar);						
	}
	return -1;
}

function Log(Error){
	if (Error!="")
		Application.FireEventLog(Error);
}

function ImportarRequisicion()
{
	if(!Application.UIUsers.CheckItem("FX1-20-40-301"))  //PERMITIR ACCESO
		return 0;
			
	if(Inventario.importarRequisiciones()){
		ActualizarProductos();
	    Ref=Inventario.ultimaReferenciaPorTraspaso;
        Formato=eBasic.AddSlashPath(Application.GetPath(0)) + "Reports\\Inventario\\Traspasos.xpd";
        Reportes.EjecutarReporte(Formato,1,0,false,"","pPrimarykey",Ref+"-T","Producto");
	}
	
}