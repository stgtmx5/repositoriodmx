function ProducirOrdenes(){
	var BL;
	var ModoProduccion=0;
	var Cfg;
	var EDO;
	var LBInv;
	var Func;
	var Configuracion;
	
	BL=new ActiveXObject("BLdmns.cActions");
	if(BL==null){
		eBasic.eMsgbox("Error al crear objeto 'BLdmns.cActions'",6);
		return 0;
	}
	
	Configuracion=Application.InternalObject("Configuracion");
	if(Configuracion==null){
		eBasic.eMsgbox("Error al obtener objeto 'Configuracion'",6);
		return 0;
	}
	Cfg=Application.InternalObject("FXConfig");
	if(Cfg==null){
		eBasic.eMsgbox("Error al obtener objeto 'FXConfig'",6);
		return 0;
	}
	
	EDO=Application.InternalObject("DataAccess");
	if(EDO===null){
		eBasic.eMsgbox("Error al obtener objeto 'DataAccess'",6);
		return 0;
	}
	LBInv=Application.InternalObject("LBInventario");
	if(LBInv==null){
		eBasic.eMsgbox("Error al obtener objeto 'LBInventario'",6);
		return 0;
	}
	Func=Application.InternalObject("gFunciones");
	if(Func==null){
		eBasic.eMsgbox("Error al obtener objeto 'gFunciones'",6);
		return 0;
	}
	
	BL.SetObjects(EDO,LBInv,eBasic,Func,Application.UIUsers);
	BL.DecPreMontos=Configuracion.eApplicationVars.FXCA001;	
	BL.ImpuestoFrontera=Configuracion.eApplicationVars.FXCT116;
	BL.VenderSinExistencias=Configuracion.eLocalVars.FXCT111;
	BL.Categoria_ProcesoProduccion=Configuracion.eLocalVars.FXCT206;
	
	//ModoProduccion=Cfg.ModoProduccion();
	BL.ProducirOrdenesPendientes(1);
}
ProducirOrdenes();