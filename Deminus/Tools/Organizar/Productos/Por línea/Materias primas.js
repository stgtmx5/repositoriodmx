
function OrganizarMateriaPrimaXLinea(){	
    var Inventario;
	Inventario=Application.InternalObject("UIInventario");
	if(Inventario==null){
		eBasic.eMsgbox("No se pudo obtener el objeto UIInventario",6);
		return 0;
	}
	Inventario.OrganizarMatPrimasXLinea();	
}
OrganizarMateriaPrimaXLinea();