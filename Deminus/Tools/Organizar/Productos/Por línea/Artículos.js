
function OrganizarProductosXLinea(){	
    var Struct;
	var DMCat;
	var Catalogos;
	Catalogos=Application.InternalObject("Catalogos");		
	DMCat=Application.InternalObject("DMCatalogos");			
	Struct = DMCat.StructTypeProductos();
    Catalogos.ShowDlgOneToMany(Struct,Application.adoCnn, "Organizar artículos por línea","where Clase>2", "Iclase>2");	
}
OrganizarProductosXLinea();