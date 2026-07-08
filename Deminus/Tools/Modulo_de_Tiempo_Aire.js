var QName="";
var AppName="";
var sessionId="";

GetSessionId();
RecargasAdmin();

function RecargasAdmin()
{
	var FXGFactNet = null;
	var QName = "";
	var QNameEval = "";
	var urlBase = "";

	try {
		QName = Application.GetQName();
		Log(QName + " - " + sessionId);

		QNameEval = String(QName).toLowerCase();

		urlBase = "http://comercial.recargas/";

		if (QNameEval.indexOf("comercial") != -1) {
			urlBase = "http://comercial.recargas/";
		}
		else if (QNameEval.indexOf("one") != -1) {
			urlBase = "http://tone.recargas/";
		}


		var appExe = "browser/EnterpriseBrowser.exe \"" + urlBase + "?ids=" + sessionId + "&qname=" + QName + "\" maximized topmost";

		eBasic.eShell(appExe, 1);
	}
	catch(e) {
		Log(e.message);
	}
}

/*
function RecargasAdmin()
{
	var FXGFactNet=null;
	try{
		QName=Application.GetQName();
		Log(QName + " - " + sessionId);
		var appExe = "browser/EnterpriseBrowser.exe \"http://comercial.recargas/?ids="+sessionId+"&qname="+QName+"\" maximized topmost";
		eBasic.eShell(appExe,1);
	}
	catch(e){
		Log(e.message);
	}
}

*/ 

function GetSessionId()
{
	var currUser = Application.UIUsers.CurrentUser.Sys_PK;
	// SQLSERVER:
	// var query = "SELECT TOP(1) s.sys_guid FROM sys_session s INNER JOIN tuser u ON s.iuser = u.Sys_PK WHERE s.sys_deleted IS NULL AND u.Sys_PK = " + currUser + ";";
	// MySQL:
	var query = "SELECT s.sys_guid FROM sys_session s INNER JOIN tuser u ON s.iuser = u.sys_pk WHERE s.sys_deleted IS NULL AND u.sys_pk = " + currUser + " LIMIT 1;";
	var obj = Application.UIUsers.CurrentUser.ADOCnn.Execute(query);
	
	if(obj != null && !obj.EOF && !obj.BOF)
		sessionId = obj("sys_guid").Value;
	else{
		// SQLSERVER:
		// var querySession = "INSERT INTO sys_session(sys_timestamp, sys_guid, sys_dtcreated, iuser, clientinfo) VALUES(GETDATE(), LOWER(REPLACE(NEWID(), '-', '')), GETDATE(), "+currUser+", 'Unknow');"
		// MySQL:
		var querySession = "INSERT INTO sys_session(sys_timestamp, sys_guid, sys_dtcreated, iuser, clientinfo) VALUES(NOW(), LOWER(REPLACE(UUID(), '-', '')), NOW(), "+currUser+", 'Unknow');"
		Application.UIUsers.CurrentUser.ADOCnn.Execute(querySession);
		var obj = Application.UIUsers.CurrentUser.ADOCnn.Execute(query);
		sessionId = obj("sys_guid").Value;
	}
}
function Log(Error){
	if (Error!="")
		Application.FireEventLog(Error);
}
