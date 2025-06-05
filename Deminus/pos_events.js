//NOTA: EVENTOS INCLUIDOS POR COMPATIBILIDAD PARA MAXICOMERCIO. 
//		NO ESTAN IMPLEMENTADOS EN DEMINUS 2010


function evAntesProducto(PKProducto,CodigoProducto, Cantidad)
{
	//Se ejecuta antes de que un producto se agregue o se modifique su cantidad con los comandos ++,+X y *X en la venta actual
	//Si la función retorna 1 el producto no se agregará o modificará
	return 0;
}

function evAntesQuitarProducto(PKProducto)
{
	//Se ejecuta antes de quitarse un producto
	//Si la función retorna 1 el producto no se quitará
	return 0;
}

function evAlAgregarProducto(PKProducto, CodigoProducto,Cantidad)
{
	//Se ejecuta cuando el producto se ha agregado por primera vez
}

function evAntesProcesarVenta(PKVenta)
{
	//Si la función devuelve 1 la venta no se procesará
	return 0;
}

function evAlGuardarCotizacion(PKVenta)
{
	//Se ejecuta al guardarse una cotización
}

function evAlProcesarVenta(PKVenta)
{
	//Se ejecuta cuando la venta ha sido procesada (contado, crédito o facturada)
	//Application.Eval("pos_events.evAlProcesarVenta(");
	//Probar si esta sintaxis funciona:	pos_events.eVAlProcesarVenta();
}

function evAlCrearVenta(PKVenta)
{
	//Se ejecuta cuando se crea una venta
}

function evAlSeleccionarVenta(PKVenta)
{
	//Se ejecuta cuando se selecciona una venta que estaba retenida
}


function evAXInput(NomControl, IDEvento,Valor)
{
	//Responde al mensaje enviado por un control ActiveX acoplado
	//eBasic.eMsgbox("Control:"+NomControl+"\rEvento:"+IDEvento+"\rValor:"+Valor);
}