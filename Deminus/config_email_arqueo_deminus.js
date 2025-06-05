var QName="";
var AppName="";
var appExe = "";

function configLoad()
{
	if (!loadScript("config_email_arqueo_deminus"))
	{
		eBasic.eMsgbox("Error al cargar el script");
		return 0;
	}
	
	Application.Eval("config_email_arqueo_deminus.configValues()");
}

function configValues()
{
	var FXGFactNet=null;
	try
	{
		if(Application.UIUsers.CheckItem("FX1-20-10-006"))
		{
			GetQName();
			appExe = "EnvioCorreo_Config.exe " + QName;
			eBasic.eShell(appExe,1);
		}
	}
	catch(e)
	{
		Log(e.message);
	}
}

function GetQName()
{
	QName = Application.GetQName();
}

function Log(Error){
	if (Error!="")
		Application.FireEventLog(Error);
}
