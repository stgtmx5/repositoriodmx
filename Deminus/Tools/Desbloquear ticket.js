
function DesbloquearTickets(){
	var P;
	P=Application.InternalObject("Procesos");
	if(P==null){
		eBasic.eMsgbox("Error al crear obtener objeto 'Procesos'",6);
		return 0;
	}
	P.qTicektsBloqueados();
}

DesbloquearTickets();