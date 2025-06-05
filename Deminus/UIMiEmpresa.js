//Versión: 1.0.0.0
var DMTemplate="PMD.sys"; //Template para exportar plano de mesas

var home_page_items;
var Counter;

function CrearPanel(){	
var ActionCat = "UIMiEmpresa.ProcesarAccion";

	Application.UIShortCuts.CreatePane("P_HOME","Mi Restaurante","","","ICON_HOME","",0 );
	Application.UIShortCuts.Pane("P_HOME").CreateGroup(0,"Explorer","","","",0);
	Application.UIShortCuts.Pane("P_HOME").CreateGroup(2,"Links","Ver","","",0);
	
	Application.UIShortCuts.CreateAction("Root","Mi Restaurante",0,"","SMICON_HOME","ICON32","UIMiEmpresa.FrmMiEmpresa",0,"","","Haga click aquí",0);
	
	//********************************************
	//20/11/2013 - Versión 2014
	//JV
	//Application.UIShortCuts.CreateAction("N_01","Atención a clientes",0,"","","","UICRM.ShowCRM",0,"","","Haga click aquí",0);
	//Application.UIShortCuts.CreateAction("N_02","Requisiciones",0,"","","","UIRequisiciones.MainRequisiciones",0,"","","Haga click aquí",0);
	//********************************************
	Application.UIShortCuts.CreateAction("R_02","Contabilidad y finanzas",0,"","","","UIFinanzas.qCuentas",0,"","","Haga click aquí",0);
	Application.UIShortCuts.CreateAction("R_03","Ventas",0,"","","","UIVentas.QVentas",0,"","","Haga click aquí",0);
	Application.UIShortCuts.CreateAction("R_04","Clientes y cuentas por cobrar",0,"","","","UICxC.QCxC",0,"","","Haga click aquí",0);
	Application.UIShortCuts.CreateAction("R_05","Inventario, productos y servicios",0,"","","","UIInventario.QProductosXLinea",0,"","","Haga click aquí",0);
	Application.UIShortCuts.CreateAction("R_06","Compras",0,"","","","UICompras.QCompras",0,"","","Haga click aquí",0);
	Application.UIShortCuts.CreateAction("R_07","Proveedores y cuentas por pagar",0,"","","","UICxP.QCxP",0,"","","Haga click aquí",0);
	
	Application.UIShortCuts.CreateAction("L_01","Plano de mesas",0,"","","","UIMiEmpresa.PlanoMesas",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_01A","Guardar diseño",0,"","","","UIMiEmpresa.GuardarDisenno",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_01B","Recargar diseño",0,"","","","UIMiEmpresa.CargarDisenno",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_01C","Exportar",0,"","","","UIMiEmpresa.ExportarDisenno",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_01D","Importar",0,"","","","UIMiEmpresa.ImportarDisenno",0,"","","",0);
	
	Application.UIShortCuts.CreateAction("L_02","Recetario de alimentos y bebidas",0,"","","","UIInventario.QRecetasXLinea",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_03","Catálogo de materias primas",0,"","","","UIInventario.QMateriasPrimasXLinea",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_04","Meseros",0,"","","","UIMiEmpresa.Meseros",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_05","Cajas",0,"","","","UIMiEmpresa.Cajas",0,"","","",0);
	Application.UIShortCuts.CreateAction("L_06","Centros de producción y consumo",0,"","","","UIMiEmpresa.CentrosProduccionConsumo",0,"","","",0);
	
	
	// Agregar Acciones	
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddItem("Root");
	
	//********************************************
	//20/11/2013 - Versión 2014
	//JV
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","N_01");
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","N_02");
	//********************************************
	
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","R_02");
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","R_03");
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","R_04");
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","R_05");
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","R_06");
	Application.UIShortCuts.Pane("P_HOME").Group("Explorer").AddChild("Root","R_07");
	
	
	Application.UIShortCuts.Pane("P_HOME").Group("Links").AddItem("L_01");
	Application.UIShortCuts.Pane("P_HOME").Group("Links").AddItem("L_02");
	Application.UIShortCuts.Pane("P_HOME").Group("Links").AddItem("L_03");
	Application.UIShortCuts.Pane("P_HOME").Group("Links").AddItem("L_04");
	Application.UIShortCuts.Pane("P_HOME").Group("Links").AddItem("L_05");
	Application.UIShortCuts.Pane("P_HOME").Group("Links").AddItem("L_06");
	
		
}

function hidegroups_ToolBar()
{
// Devuelve una cadena con los grupos que se ocultara el panel
var sql;
var sV;
var sGroups;

	sGroups = "";
	sV ="s";
	sql = "SELECT tuser.UserID, usergroup.GroupID, user_usergroup_.Groups,user_usergroup_.Users ,usergroup.uf_hidetoolbar FROM (user_usergroup_ Inner JOIN usergroup on user_usergroup_.Groups=usergroup.Sys_PK) Inner Join tuser ON user_usergroup_.Users=tuser.Sys_PK Where uf_hidetoolbar is null or uf_hidetoolbar='"+ sV+ "';";
	
	R = Application.Adocnn.Execute(sql);
	
	if (R==null) return sGroups;
	if (R.EOF && R.BOF) return sGroups;
	
	while (!R.EOF)
	{
		if (sGroups=="")
			sGroups =  R.Fields("GroupID").Value;
		
		else
			sGroups =  sGroups + ";" +  R.Fields("GroupID").Value;
			
		R.MoveNext();
	}
	
	R = null;
	return sGroups;

}

function GetInfoHomePanel()
{
// Recuperar Información de Home Panel
var Cnn;
var R;

Cnn = Application.Adocnn;

	try{
		R =  Cnn.Execute("Select Sys_PK,uf_Tipo,uf_Titulo,uf_Imagen,uf_funcion, uf_grupos  FROM  ut_HomePage Order By uf_Orden");
		Counter=0
		home_page_items = new Array(6);
		
			//LLenar con información de RecordSet
			home_page_items[0]=FieldToArray("uf_Tipo",R);
			home_page_items[1]=FieldToArray("uf_Titulo",R);	
			home_page_items[2]=FieldToArray("uf_Imagen",R);	
			home_page_items[3]=FieldToArray("uf_funcion",R);
			home_page_items[4]=FieldToArray("uf_grupos",R);
			home_page_items[5]=FieldToArray("Sys_PK",R);
			
			
		R =null;
		return 0;
	}
	catch(e){
		eBasic.eMsgbox("Error al intentar cargar información de Página de Inicio");
	}
}

function FieldToArray(FieldName,Rst){
var Arr = new Array();
var Cnt;
Cnt =0;

	Rst.MoveFirst();
	while(!Rst.EOF)
	{
		if (Rst.Fields(FieldName).Value==null){
			Arr[Cnt]= "";
		}
		else
		{
			if(FieldName == "uf_Titulo" && Rst.Fields("uf_Tipo").Value != 0)
				Arr[Cnt]= "";
			else
				Arr[Cnt]= Rst.Fields(FieldName).Value;
		}
		
		
		Cnt = Cnt + 1;
		Rst.MoveNext();
	}
	
	if (Cnt>Counter) Counter  = Cnt;
	return Arr;
}
/*
function FrmMiEmpresa(){
var ButtonMenu;
var Frm;	
Frm=null;
Frm=Application.AXForms.AXForm("FMiEmpresa");
	if (Frm==null){
		Frm=Application.AXForms.CreateForm("FormButtonMenu","FMiEmpresa");
		Frm.CmdOnEvent="UIMiEmpresa.OnClick_MiEmpresa";
		if (Frm==null){
			eBasic.eMsgbox("Error al crear ventana de inicio.",6);
			return 0;
		}
		
		Application.MouseHourglass();
		Frm.Caption="Mi Restaurante";		
		ButtonMenu=Frm.GetAXObject();			
		ButtonMenu.CreateTitle ("Mi Empresa");				
		ButtonMenu.CreateButton ("1", "Contactos",Application.LoadImage("\\iconos\\contactos.jpg"));
		ButtonMenu.CreateButton ("2", "Proveedores",Application.LoadImage("\\iconos\\proveedor.jpg"));
		ButtonMenu.CreateButton ("3", "Compras",Application.LoadImage("\\iconos\\Compras.jpg"));
		
		ButtonMenu.CreateButton ("4_2", "Materias primas",Application.LoadImage("\\iconos\\materiaprima.jpg"));
		ButtonMenu.CreateButton ("4_3", "Recetas",Application.LoadImage("\\iconos\\recetas.jpg"));
		ButtonMenu.CreateButton ("4", "Artículos y servicios",Application.LoadImage("\\iconos\\inventario.jpg"));
			
		ButtonMenu.CreateButton ("5", "Clientes",Application.LoadImage("\\iconos\\cliente.jpg"));
		ButtonMenu.CreateButton ("6", "Ventas",Application.LoadImage("\\iconos\\ventas.jpg"));
		ButtonMenu.CreateButton ("30", "Promociones",Application.LoadImage("\\iconos\\promociones.jpg"));
		ButtonMenu.CreateButton ("7", "Cuentas de Cheques", Application.LoadImage("\\iconos\\Chequera.bmp"));
		ButtonMenu.CreateButton ("8", "Cuentas Contables",Application.LoadImage("\\iconos\\ccontable.jpg"));
		ButtonMenu.CreateButton ("9", "Pólizas",Application.LoadImage("\\iconos\\polizas.jpg"));
		
		
		ButtonMenu.CreateTitle ("Mis Empleados");
		ButtonMenu.CreateButton ("11", "Meseros", Application.LoadImage("\\iconos\\mesero1.jpg"));
		ButtonMenu.CreateButton ("12", "Cajeros", Application.LoadImage("\\iconos\\cajero1.jpg"));
		ButtonMenu.CreateButton ("13", "Repartidores", Application.LoadImage("\\iconos\\repartidor1.jpg"));
		
		ButtonMenu.CreateTitle ("Mis Catálogos");
		ButtonMenu.CreateButton ("21", "Centros de producción y consumo", Application.LoadImage("\\iconos\\centro de consumo.jpg"));
		ButtonMenu.CreateButton ("22", "Almacenes",Application.LoadImage("\\iconos\\almacen.jpg"));
		
		ButtonMenu.CreateButton ("23_2", "Líneas de materias primas",Application.LoadImage("\\iconos\\generico.jpg"));
		ButtonMenu.CreateButton ("23_3", "Líneas de recetas",Application.LoadImage("\\iconos\\generico.jpg"));
		ButtonMenu.CreateButton ("23", "Líneas de artículos y servicios",Application.LoadImage("\\iconos\\generico.jpg"));
		
		ButtonMenu.CreateButton ("24", "Marcas", Application.LoadImage("\\iconos\\generico.jpg"));
		ButtonMenu.CreateButton ("25", "Departamentos",Application.LoadImage("\\iconos\\generico.jpg"));
		
		ButtonMenu.CreateButton ("27", "Categorias",Application.LoadImage("\\iconos\\generico.jpg"));
		ButtonMenu.CreateButton ("28", "Divisas",Application.LoadImage("\\iconos\\divisas.jpeg"));
		ButtonMenu.CreateButton ("32", "Bancos",Application.LoadImage("\\iconos\\banco.jpg"));	
		ButtonMenu.CreateButton ("26", "Tarjetas de Credito",Application.LoadImage("\\iconos\\tarjetas.JPG"));
		
		ButtonMenu.CreateButton ("31", "Cajas",Application.LoadImage("\\iconos\\cajas.jpg"));	
		
		//ButtonMenu.CreateButton ("51", "Porteadores (Mensajerías)",Application.LoadImage("\\iconos\\porteador.jpg"));
		
		ButtonMenu.CreateButton ("29", "Zonas",Application.LoadImage("\\iconos\\generico.jpg"));
		ButtonMenu.CreateButton ("50", "Países, estados y ciudades",Application.LoadImage("\\iconos\\paises.jpg"));
		ButtonMenu.CreateButton ("55", "Configuración de impuestos",Application.LoadImage("\\iconos\\impuestos.jpg"));
		ButtonMenu.Draw();
		Application.MouseDefault();
	}else
		Frm.Zorder();	
	
}


function OnClick_MiEmpresa(obj)
{
	var opt;
	if(obj==null)
		return 0;
	if (obj.Name == "OnClick") 
	{
	opt=(obj.EventParameters(0).Value);
		switch(opt){
			case "1": Catalogos.BrwContactos();break;			
			case "2": UICxP.QCxP();break;					
			case "3": UICompras.QCompras();break;			
			case "4": UIInventario.QProductosXLinea();break;
			case "4_2": UIInventario.QMateriasPrimasXLinea();break;	
			case "4_3": UIInventario.QRecetasXLinea();break;				
			case "5": UICxC.QCxC();break;				
			case "6": UIVentas.QVentas();break;					
			case "7": UIFinanzas.QAdminCuentasCheques();break;					
			case "8": UIFinanzas.qCuentas();break;					
			case "9": UIFinanzas.QPoliza();break;					
			case "11": DMCatalogos.BrwAgentes();break;			
			case "12": Catalogos.BrwCajeros();break;				
			case "13": Catalogos.BrwRepartidor();break;			
			case "21": DMCatalogos.dlgCProduccionCConsumo();break;			
			case "22": UIInventario.CatalogoAlmacenes();break;			//almacenes			
			case "23": DMCatalogos.BrwLineas();break;//lineas			
			case "23_2": DMCatalogos.BrwLineas(1);break;//lineas			
			case "23_3": DMCatalogos.BrwLineas(2);break;//lineas			
			case "24": UIInventario.CatalogoMarcas();break;//marcas			
			case "25": UIInventario.CatalogoDepartamentos();break;//departamentos			
			case "26": Catalogos.BrwTarjetacredito();break;			
			case "27": Catalogos.BrwCategorias(0);break;//categorias			
			case "28": Catalogos.BrwDivisas();break;			
		 	case "29": Catalogos.BrwZonas();break;
			case "30": UIVentas.QPromociones();break;
			case "31": Catalogos.BrwCajas();break;
			case "32": Catalogos.BrwBancos();break;					
			case "50": Paises.ExplorerCountry();break;
			//case "51": Catalogos.BrwPorteador(); break;
			case "55": Catalogos.BrwCfgImpuestos(); break;
			
					
		}
		//eBasic.eMsgbox(obj.EventParameters(0).Value);
	}
}


*/


function FrmMiEmpresa()
{
var ButtonMenu;
var Frm;
var NoArr;
var sGroupID;
var sHideGroups;
var grupoPermitido;

Frm = null;
Frm=Application.AXForms.AXForm("FMiEmpresa");

	if (Frm==null)
	{
		Frm=Application.AXForms.CreateForm("FormButtonMenu","FMiEmpresa");
		Frm.CmdOnEvent="UIMiEmpresa.OnClick_MiEmpresa";
		GetInfoHomePanel();
	
		//Obtener lista de grupos del usuario.
		sGroupsID= get_usergroups(Application.UIUsers.CurrentUser.UserID);
		//Obtener lista de grupos con panel bloqueado
		sHideGroups = hidegroups_ToolBar();
				
		if (find_cad1_in_cad2(sGroupsID,sHideGroups))
		{
			Application.MainForm.ShowMenuBar();
			Application.MainForm.ShowShortcutPane();
		}
		else
		{
			// Ocultar Barra y Panel en pantalla princiapal, dependiendo del Grupo  
			Application.MainForm.HideMenuBar();
			Application.MainForm.HideShortcutPane();
		}
		
		if (Frm==null)
			{
			eBasic.eMsgbox("Error al crear ventana de inicio.",6);
			return 0;
			}
		
			
		Application.MouseHourglass();
		Frm.Caption="Mi Restaurante";
		ButtonMenu=Frm.GetAXObject();

		//eBasic.SaveStrToFile("C:\\grupos.txt",home_page_items);//
		
		/* Configurar con Base a Tabla  ut_homepage */
		for (var i=0;i<Counter;i++)
		{
															
			if (home_page_items[0][i]==0){
				//Es un titulo
				ButtonMenu.CreateTitle (home_page_items[1][i]);
			}
			else{
				// Es un Boton
				
				if(home_page_items[4][i]!=null){													
					if(find_cad1_in_cad2(sGroupsID+";*",home_page_items[4][i]))
						ButtonMenu.CreateButton(home_page_items[5][i],home_page_items[1][i],Application.LoadImage(eBasic.AddSlashPath(Application.GetPath(0))+home_page_items[2][i],false));
				}
			}
			
		}
		
		ButtonMenu.Draw();
		Application.MouseDefault();	
		
	}else
		Frm.Zorder();	
}

function OnClick_MiEmpresa(obj)
{
	var opt;
	if(obj==null)
		return 0;
	if (obj.Name == "OnClick") 
	{
	opt=(obj.EventParameters(0).Value);
		
		for (var i=0;i<Counter;i++)
		{
			if (home_page_items[5][i]==opt)
			{
			Application.Eval(home_page_items[3][i]);
			return 0;
			}
		}
		
	}
}


// se colocaron en funciones ya que necesitan regresar y valor entero de lo contrario marca error el script.
function Meseros(){
	DMCatalogos.BrwAgentes();
	return -1;
}
function Cajas(){
	Catalogos.BrwCajas();
	return -1;
}

function CentrosProduccionConsumo(){
	DMCatalogos.dlgCProduccionCConsumo();
	return -1;
}
//*************************************

function PlanoMesas(){
	var dlg;
	//Permiso
	if(!Application.UIUsers.CheckItem("FX1-90-10-000")) return 0;
	
	Application.MouseHourglass();
	dlg=null;
	dlg=Application.AXForms.AXForm("dlgPlanoMesas");
	if(dlg!=null){
		dlg.ZOrder();
		Application.MouseDefault();
		Application.eDoEvents();	
		return -1;
	}
	
	dlg=Application.AXForms.CreateForm("ConfigMesas","dlgPlanoMesas");		
	dlg.GetAXObject().SetObjects(Application.UIUsers);
	dlg.CmdProxyEvent="";	
	dlg.Caption = "Plano de mesas";
	//dlg.CmdPreview="UIVentas.PrevisualizarDocumento";
	//dlg.CmdPrint="UIVentas.ImprimirDocumento";		
	//dlg.CmdKeyDown="UIVentas.Command_KeyDown";
	dlg.AddButton("Guardar diseño","L_01A");
	//dlg.AddButton("Recargar diseño","L_01B");
	dlg.AddButton("Exportar","L_01C");
	dlg.AddButton("Importar","L_01D");	
	dlg.ShowButtons();
	AgregarListaMeseros(dlg);
	CargarDisenno(null);
	dlg.ZOrder();	
	Application.MouseDefault();
}

function AgregarListaMeseros(Ctr){
	var R;
	var Mesero;
	try{
		R=Application.ADOCnn.Execute("SELECT Codigo,Nombre FROM Agente ORDER BY Nombre");
		while(!R.EOF){
			Mesero=Application.NewObject("eVMesas.cInfoMesero");
			Mesero.Nombre=R("Nombre").Value;
			Mesero.ID=R("Codigo").Value;
			Ctr.GetAXObject().ListaMeseros.Add(Mesero);
			Mesero=null;
			R.Movenext();
		}
	}catch(e){
		Log("Error al cagar meseros. " + e.description);
	}
	R=null;
}
function GuardarDisenno(){
var Ctr;
	Ctr=Application.AXForms.AXForm("dlgPlanoMesas");
	if(Ctr==null){
		eBasic.eMsgbox("Error al guardar diseño del plano de mesas (No se puede acceder al plano de mesas).",6);
		return 0;
	}	
	if(lgMesas.SaveToDB(Ctr.GetAXObject().Zonas,Application.adocnn)){
		eBasic.eMsgbox("El plano de mesas se guardó correctamente.",6);
	}else{
		eBasic.eMsgbox("Error al guardar diseño del plano de mesas. "+lgMesas.LastErrorDescript,6);
	}
}

function CargarDisenno(A){
	var Ctr;
	var Zonas;
	
	if(A!=null){
		//La llamada se esta haciendo desde un boton
		if(eBasic.eMsgbox("¿Está seguro que desea cargar nuevamente el plano de mesas? Se perderán los cambios realizados.",4)==7){
			return 0;
		}
	}
	
	Ctr=Application.AXForms.AXForm("dlgPlanoMesas");
	if(Ctr==null){
		eBasic.eMsgbox("Error al cargar diseño del plano de mesas (No se puede acceder al plano de mesas).",6);
		return 0;
	}
	Zonas=lgMesas.LoadFromDB(Application.ADOCnn);
	if(Zonas!=null){
		Ctr.GetAXObject().Zonas=Zonas;
	}else{
		eBasic.eMsgbox("Error al cargar diseño del plano de mesas.",6);
	}	
}

function ExportarDisenno(){
	var UbicacionTemplate="";
	var GuardarEn="";
	var CnnDestino;
	var Ctr;
	//Permiso exportar
	if(!Application.UIUsers.CheckItem("FX1-90-22-000")) return 0;
	
	UbicacionTemplate=eBasic.AddSlashPath(Application.GetPath(0))+DMTemplate;
	
	//pmd = plano de mesas de deminus - extensión para base de datos de plano de mesas
	
	GuardarEn=Application.SaveAs("Plano de mesas *.pmd|*.pmd",UbicacionTemplate);
	if(GuardarEn==""){ 
		eBasic.eMsgbox("El proceso se ha cancelado.",6);
		return 0;
	}
	Application.eDoEvents();
	Application.MouseHourglass();
		
	CnnDestino = Application.NewObject("ADODB.Connection");
    CnnDestino.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + GuardarEn + ";Persist Security Info=False";
    CnnDestino.open();
    if(CnnDestino.State!=1){
        Application.MouseDefault();
		eBasic.eMsgbox("Error al conectar con la base de datos:" +GuardarEn,6);
		return 0;
    }
		
	Ctr=Application.AXForms.AXForm("dlgPlanoMesas");
	if(Ctr==null){
		Application.MouseDefault();
		eBasic.eMsgbox("Error al guardar diseño del plano de mesas (No se puede acceder al plano de mesas).",6);
		return 0;
	}
	if(lgMesas.SaveToDB(Ctr.GetAXObject().Zonas,CnnDestino)){
		Application.MouseDefault();
		eBasic.eMsgbox("El plano de mesas se exportó correctamente.",6);
		CnnDestino.Close();
		return -1;
	}else{
		Application.MouseDefault();
		CnnDestino.Close();
		eBasic.eMsgbox("Error al guardar diseño del plano de mesas.",6);		
		return 0;
	}
	
	
}

function ImportarDisenno(){
	var Ubicacion="";
	var CnnPlano;
	var Ctr;
	var Zonas;
	
	//Permiso exportar
	if(!Application.UIUsers.CheckItem("FX1-90-23-000")) return 0;
	
	Ubicacion=Application.OpenFile("Plano de mesas *.pmd|*.pmd");	
	//pmd = plano de mesas de deminus - extensión para base de datos de plano de mesas		
	if(Ubicacion==""){
		eBasic.eMsgbox("Proceso cancelado.",6);
		return 0;
	}
	
	Application.eDoEvents();
	Application.MouseHourglass();
		
	CnnPlano = Application.NewObject("ADODB.Connection");
    CnnPlano.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Ubicacion + ";Persist Security Info=False";
    CnnPlano.open();
    if(CnnPlano.State!=1){
        Application.MouseDefault();
		eBasic.eMsgbox("Error al conectar con la base de datos:" +Ubicacion,6);
		return 0;
    }
		
	Ctr=Application.AXForms.AXForm("dlgPlanoMesas");
	if(Ctr==null){
		Application.MouseDefault();
		CnnPlano.Close();
		eBasic.eMsgbox("Error al cargar diseño del plano de mesas (No se puede acceder al plano de mesas).",6);
		return 0;
	}
	Zonas=lgMesas.LoadFromDB(CnnPlano);
	if(Zonas!=null){		
		Ctr.GetAXObject().Zonas=Zonas;
		Application.MouseDefault();
		CnnPlano.Close();		
		eBasic.eMsgbox("El diseño del plano de mesas se importó correctamente.",6);
	}else{
		Application.MouseDefault();
		CnnPlano.Close();
		eBasic.eMsgbox("Error al cargar diseño del plano de mesas.",6);
	}	
}

function Log(Error){
	if (Error!="")
		Application.FireEventLog(Error);
}