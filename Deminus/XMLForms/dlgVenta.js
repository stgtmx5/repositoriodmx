/****************************************************************
Objetos disponibles:
	ThisForm	- Instancia de la clase eForm que maneja la ventana
	ADOCnn	- Referencia al objeto ADO.Connection 
	eBasic 	- Biblioteca de funciones de propósito general
****************************************************************/

//Referencia al objeto del formulario
var Form=ThisForm.VBForm().getObject();

//Referencia al objeto principal de la aplicación
var Application=Form.Application();


//Al inicializar el formulario
function initInterface()
{	
	ThisForm.ControlObject("cuf_condicionesDePago1").Enabled =false;
}

function DocTypeChange(){
	
}



//Al validar los datos ingresados
function validate()
{
	if(ThisForm.ControlObject("cuf_incluir_condicionesDePago1").Value!=0){		
		
		var v=ThisForm.ControlObject("cuf_condicionesDePago1").Value;
		if(v==null) v="";
		if(v=='undefined') v="";
		if(v==""){
			eBasic.eMsbox("Escriba las condiciones de pago.",6);
			return false;
		}		
	}
	return true;
}

//Manejador genérico de eventos de controles
//CName=Nombre del control que genera el evento
//EName=Nombre del evento
function ControlEvent(CName, EName)
{
	switch(EName){
		case "Click":			
			if(CName=="cuf_incluir_condicionesDePago1"){
				var v;
				if(ThisForm.ControlObject("cuf_incluir_condicionesDePago1").Value==0)
					v=false;
				else
					v=true;
				
				if(!v){
					ThisForm.ControlObject("cuf_condicionesDePago1").Value="";									
				}
				ThisForm.ControlObject("cuf_condicionesDePago1").Enabled=v;				
			}
			break;		
	}	
}

//Al descartar el formulario (Cancelar)
function OnDiscard()
{


}

//Al completar con éxito la actualización de los datos
function Saved(action, PK)
{

}

//Al destruir la instancia de la clase
function OnDispose()
{
	
}

//Al pasar datos desde los controles hacia el objeto de datos
function OnGetData()
{
	return true;
}

//Al pasar datos desde el objeto de datos hacia los controles
function OnPutData()
{
	
}

//Al limpiar el formulario
function OnClear()
{
	
}

//Al debloquear los controles
function OnUnlock()
{		
	
	if(ThisForm.ControlObject("cuf_incluir_condicionesDePago1").Value!=0){
		ThisForm.ControlObject("cuf_condicionesDePago1").Enabled=true;
	}else{
		ThisForm.ControlObject("cuf_condicionesDePago1").Enabled=false;
	}	
}

//Al bloquear los controles
function OnLock()
{
	
}