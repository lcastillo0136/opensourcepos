<?php
/* Smarty version 3.1.29, created on 2016-01-05 14:14:06
  from "/home/onixsoft/public_html/pos/application/views/home.php.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_568c15fe2cf049_95022278',
  'file_dependency' => 
  array (
    'e9a499f80e44b83c374a4df3ab68d8e89144e43b' => 
    array (
      0 => '/home/onixsoft/public_html/pos/application/views/home.php.tpl',
      1 => 1451948068,
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
function content_568c15fe2cf049_95022278 ($_smarty_tpl) {
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
		January 05, 2016 02:14 pm
		</div>

	</div>
</div>
<div id="content_area_wrapper">
<div id="content_area">

<br />
<h3>Bienvenido(a) a Open Source Point Of Sale. ¡Haz click en algún módulo debajo, para empezar!</h3>
<div id="home_module_list">
									<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/customers">
				<img src="http://pos.onix-software.com/images/menubar/customers.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/customers">
					Clientes
				</a>
			 	- Agregar, Actualizar, Borrar y Buscar clientes
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/items">
				<img src="http://pos.onix-software.com/images/menubar/items.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/items">
					Artículos
				</a>
			 	- Agregar, Actualizar, Borrar y Buscar artículos
			</div>
														<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/suppliers">
				<img src="http://pos.onix-software.com/images/menubar/suppliers.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/suppliers">
					Proveedores
				</a>
			 	- Agregar, Actualizar, Borrar y Buscar proveedores
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/reports">
				<img src="http://pos.onix-software.com/images/menubar/reports.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/reports">
					Reportes
				</a>
			 	- Ver y generar reportes
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/receivings">
				<img src="http://pos.onix-software.com/images/menubar/receivings.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/receivings">
					Recepción
				</a>
			 	- Procesar órdenes de compra
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/sales">
				<img src="http://pos.onix-software.com/images/menubar/sales.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/sales">
					Ventas
				</a>
			 	- Procesar ventas y devoluciones
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/employees">
				<img src="http://pos.onix-software.com/images/menubar/employees.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/employees">
					Empleados
				</a>
			 	- Agregar, Actualizar, Borrar y Buscar empleados
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/giftcards">
				<img src="http://pos.onix-software.com/images/menubar/giftcards.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/giftcards">
					Tarjetas de Regalo
				</a>
			 	- Agregar, Actualizar, Borrar y Buscar Tarjetas de Regalo
			</div>
											<div class="module_item">
				<a href="http://pos.onix-software.com/index.php/config">
				<img src="http://pos.onix-software.com/images/menubar/config.png" border="0" alt="Menubar Image" /></a><br />
				<a href="http://pos.onix-software.com/index.php/config">
					Configuración de la Tienda
				</a>
			 	- Cambiar la configuración de la tienda
			</div>
			</div>
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
