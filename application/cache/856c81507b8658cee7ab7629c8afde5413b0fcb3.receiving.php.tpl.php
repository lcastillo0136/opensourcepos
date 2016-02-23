<?php
/* Smarty version 3.1.29, created on 2016-01-05 10:50:47
  from "/home/onixsoft/public_html/pos/application/views/receivings/receiving.php.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_568be657563cc2_17230528',
  'file_dependency' => 
  array (
    '856c81507b8658cee7ab7629c8afde5413b0fcb3' => 
    array (
      0 => '/home/onixsoft/public_html/pos/application/views/receivings/receiving.php.tpl',
      1 => 1452008595,
      2 => 'file',
    ),
    'fbb32042377614f305242c7cdfa3e987c94ab38d' => 
    array (
      0 => '/home/onixsoft/public_html/pos/application/views/partial/header.php',
      1 => 1452009040,
      2 => 'file',
    ),
    '7d5b8654cd0db7f51f258a03900d152bf97fe219' => 
    array (
      0 => '/home/onixsoft/public_html/pos/application/views/partial/footer.php',
      1 => 1451945568,
      2 => 'file',
    ),
  ),
  'cache_lifetime' => 3600,
),true)) {
function content_568be657563cc2_17230528 ($_smarty_tpl) {
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base href="http://pos.onix-software.com/" />
	<title>OS Point Of Sale</title>
	<link rel="stylesheet" rev="stylesheet" href="http://pos.onix-software.com/css/ospos.css" />
	<link rel="stylesheet" rev="stylesheet" href="http://pos.onix-software.com/css/ospos_print.css"  media="print"/>
	<link rel="stylesheet" href="http://pos.onix-software.com/assets/css/bootstrap.css" />
	<script>BASE_URL = 'http://pos.onix-software.com/index.php';</script>
	<script src="http://pos.onix-software.com/js/jquery-1.2.6.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/assets/js/jquery-1.11.3.min.js" type="text/javascript" ></script>
	<script src="http://pos.onix-software.com/js/jquery-migrate-1.2.1.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.color.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.metadata.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.form.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.tablesorter.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.ajax_queue.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.bgiframe.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.autocomplete.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.validate.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/jquery.jkey-1.1.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/thickbox.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/common.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/manage_tables.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/swfobject.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/date.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/js/datepicker.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="http://pos.onix-software.com/assets/js/bootstrap.js" type="text/javascript"></script>
<style type="text/css">
html {
    overflow: auto;
}
</style>

</head>
<body>
<div id="menubar">
	<div id="menubar_container">
		<div id="menubar_company_info">
		<span id="company_title">
			Open Source Point of Sale
		</span><br />
		<span style='font-size:8pt;'>Open Source Point Of Sale</span>
	</div>

		<div id="menubar_navigation">
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/customers">
				<img src="http://pos.onix-software.com/images/menubar/customers.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/customers">
										Clientes
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/items">
				<img src="http://pos.onix-software.com/images/menubar/items.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/items">
										Artículos
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/item_kits">
				<img src="http://pos.onix-software.com/images/menubar/item_kits.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/item_kits">
										Kits de Artículos
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/suppliers">
				<img src="http://pos.onix-software.com/images/menubar/suppliers.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/suppliers">
										Proveedores
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/reports">
				<img src="http://pos.onix-software.com/images/menubar/reports.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/reports">
										Reportes
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/receivings">
				<img src="http://pos.onix-software.com/images/menubar/receivings.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/receivings">
										Recepción
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/sales">
				<img src="http://pos.onix-software.com/images/menubar/sales.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/sales">
										Ventas
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/employees">
				<img src="http://pos.onix-software.com/images/menubar/employees.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/employees">
										Empleados
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/giftcards">
				<img src="http://pos.onix-software.com/images/menubar/giftcards.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/giftcards">
										Tarjetas de Regalo
				</a>
			</div>
						<div class="menu_item">
				<a href="http://pos.onix-software.com/index.php/config">
				<img src="http://pos.onix-software.com/images/menubar/config.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/config">
										Configuración de la Tienda
				</a>
			</div>
					</div>

		<div id="menubar_footer">
		Bienvenido(a) John Doe! | 
		<a href="http://pos.onix-software.com/index.php/home/logout">Salir</a>
		</div>

		<div id="menubar_date">
		January 05, 2016 10:50 am
		</div>

	</div>
</div>
<div id="content_area_wrapper">
<div id="content_area">


<div id="page_title" style="margin-bottom:8px;">Entrada de Artículos</div>


<div id="register_wrapper">
	<form action="http://pos.onix-software.com/index.php/receivings/change_mode" method="post" accept-charset="utf-8" id="mode_form">
		<span>Modo de Entradas</span>
	  <select name="mode" onchange="$('#mode_form').submit();">
<option value="receive" selected="selected">Recibir</option>
<option value="return">Devolver</option>
</select>
			</form>
	<form action="http://pos.onix-software.com/index.php/receivings/add" method="post" accept-charset="utf-8" id="add_item_form">
		<label id="item_label" for="item">
						  Encontrar/Escanear Artículo
					</label>
		<input type="text" name="item" value="" id="item" size="40"  />
		<div id="new_item_button_register" >
		  <a href="http://pos.onix-software.com/index.php/items/view/-1/width:360" class="thickbox none" title="Artículo Nuevo"><div class='small_button'><span>Artículo Nuevo</span></div></a>
	  </div>
	</form>

	<!-- Receiving Items List -->
	<table id="register">
		<thead>
			<tr>
				<th style="width:11%;">Borrar</th>
				<th style="width:30%;">Nombre del Artículo</th>
				<th style="width:11%;">Costo</th>
				<th style="width:5%;">Cant.</th>
				<th style="width:6%;"></th>
				<th style="width:11%;">Descuento %</th>
				<th style="width:15%;">Total</th>
				<th style="width:11%;">Editar</th>
			</tr>
		</thead>
		<tbody id="cart_contents">
					<tr><td colspan='8'>
				<div class='warning_message' style='padding:7px;'>No hay artículos en el carrito</div>
			</td></tr>
				</tbody>
	</table>
</div>

<!-- Overall Receiving -->

<div id="overall_sale">
			<form action="http://pos.onix-software.com/index.php/receivings/select_supplier" method="post" accept-charset="utf-8" id="select_supplier_form">
			<label id="supplier_label" for="supplier">Seleccionar Proveedor (Opcional)</label>
			<input type="text" name="supplier" value="Empieza a escribir el nombre del proveedor..." id="supplier" size="30"  />
		</form>
		<div style="margin-top:5px;text-align:center;">
			<h3 style="margin: 5px 0 5px 0">Ó</h3>
			<a href="http://pos.onix-software.com/index.php/suppliers/view/-1/width:350" class="thickbox none" title="Nuevo Proveedor"><div class='small_button' style='margin:0 auto;'><span>Nuevo Proveedor</span></div></a>
		</div>
		<div class="clearfix">&nbsp;</div>
				<div id='sale_details'>
			<div class="float_left" style='width:55%;'>Total:</div>
			<div class="float_left" style="width:45%;font-weight:bold;">$0.00</div>
		</div>
		
	</div>
<div class="clearfix" style="margin-bottom:30px;">&nbsp;</div>

<script type="text/javascript" language="javascript">
$(document).ready(function()
{
    $("#item").autocomplete('http://pos.onix-software.com/index.php/receivings/item_search',
    {
    	minChars:0,
    	max:100,
       	delay:10,
       	selectFirst: false,
    	formatItem: function(row) {
			return row[1];
		}
    });

    $("#item").result(function(event, data, formatted)
    {
		$("#add_item_form").submit();
    });

	$('#item').blur(function()
    {
    	$(this).attr('value',"Empieza a escribir o escanea el código de barras...");
    });

	$('#comment').keyup(function() 
	{
		$.post('http://pos.onix-software.com/index.php/receivings/set_comment', {comment: $('#comment').val()});
	});

	$('#recv_invoice_number').keyup(function() 
	{
		$.post('http://pos.onix-software.com/index.php/receivings/set_invoice_number', {recv_invoice_number: $('#recv_invoice_number').val()});
	});

	var enable_invoice_number = function() 
	{
		var enabled = $("#recv_invoice_enable").is(":checked");
		if (enabled)
		{
			$("#recv_invoice_number").removeAttr("disabled").parents('tr').show();
		}
		else
		{
			$("#recv_invoice_number").attr("disabled", "disabled").parents('tr').hide();
		}
		return enabled;
	}

	enable_invoice_number();

	$("#recv_invoice_enable").change(function() {
		var enabled = enable_invoice_number();
		$.post('http://pos.onix-software.com/index.php/receivings/set_invoice_number_enabled', {recv_invoice_number_enabled: enabled});
		
	});

	$('#item,#supplier').click(function()
    {
    	$(this).attr('value','');
    });

    $("#supplier").autocomplete('http://pos.onix-software.com/index.php/receivings/supplier_search',
    {
    	minChars:0,
    	delay:10,
    	max:100,
    	formatItem: function(row) {
			return row[1];
		}
    });

    $("#supplier").result(function(event, data, formatted)
    {
		$("#select_supplier_form").submit();
    });

    $('#supplier').blur(function()
    {
    	$(this).attr('value',"Empieza a escribir el nombre del proveedor...");
    });

    $("#finish_receiving_button").click(function()
    {
    	if (confirm('¿Estás seguro(a) de querer procesar esta entrada? Ésto no puede ser deshecho.'))
    	{
    		$('#finish_receiving_form').submit();
    	}
    });

    $("#cancel_receiving_button").click(function()
    {
    	if (confirm('¿Estás seguro(a) de querer limpiar esta entrada? Todos los artículos serán limpiados.'))
    	{
    		$('#cancel_receiving_form').submit();
    	}
    });


});

function post_item_form_submit(response)
{
	if(response.success)
	{
		$("#item").attr("value",response.item_id);
		$("#add_item_form").submit();
	}
}

function post_person_form_submit(response)
{
	if(response.success)
	{
		$("#supplier").attr("value",response.person_id);
		$("#select_supplier_form").submit();
	}
}

</script>
</div>
</div>
<div id="footer"> 
  Estás usando Open Source Point Of Sale Versión 
  2.3.1
  Por favor, visita mi
  <a href="http://sourceforge.net/projects/opensourcepos/" target="_blank">
    sitio
  </a>
  para leer la información más reciente acerca del proyecto.
</div>
</body>
</html><?php }
}
