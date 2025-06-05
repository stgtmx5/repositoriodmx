
asignarLineasgrupos();
function asignarLineasgrupos()
{
	var obj=eBasic.eCreateObject("tpntUICat.UI");
	obj.init(Application.ADOCnn);	
	obj.asociar_cc_lineas();
}