
function RevaluarRecetas(){
	var obj=null;
	obj=Application.NewObject("DmnsCalcs.Funciones");
	if (obj==null)
	{
		eBasic.eMsgbox("No se pudo inicializar el componente.");
		return 0;
	}
	
	obj.DlgReValuarRecetas(Application.adoCnn);
}

RevaluarRecetas();