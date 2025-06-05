ChangePwd();
function ChangePwd(){
	var obj=null;
	var usr;
	obj=Application.NewObject("eUISS.cAppSubSys");
	
	if (obj==null)
	{
		eBasic.eMsgbox("No se pudo inicializar el componente.");
		return 0;
	}
	
	if(obj.ChangePWD(Application.UIUsers.CurrentUser))
	{	
		if(!Application.UIUsers.CurrentUser.Update())
		{
			Log("Error al guardar datos.");
			obj=null;
			return -1;
		}
		else
		{
			eBasic.eMsgbox("La contraseña ha sido modificada correctamente, los cambios se aplicarán las siguiente vez que inicie el sistema.");
			obj=null;
			return -1;
		}
	}
	
}

