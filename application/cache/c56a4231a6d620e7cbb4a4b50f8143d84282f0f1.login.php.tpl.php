<?php
/* Smarty version 3.1.29, created on 2016-01-05 14:38:56
  from "/home/onixsoft/public_html/pos/application/views/login.php.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_568c1bd0140ff5_31737625',
  'file_dependency' => 
  array (
    'c56a4231a6d620e7cbb4a4b50f8143d84282f0f1' => 
    array (
      0 => '/home/onixsoft/public_html/pos/application/views/login.php.tpl',
      1 => 1452022734,
      2 => 'file',
    ),
  ),
  'cache_lifetime' => 3600,
),true)) {
function content_568c1bd0140ff5_31737625 ($_smarty_tpl) {
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="http://pos.onix-software.com/assets/css/bootstrap.css" />
	<link rel="stylesheet" rev="stylesheet" href="http://pos.onix-software.com/css/login.css" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Open Source Point Of Sale Iniciar Sesión</title>
	<script src="http://pos.onix-software.com/assets/js/jquery-1.11.3.min.js" type="text/javascript" ></script>
	<script src="http://pos.onix-software.com/assets/js/bootstrap.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#login_form input:first").focus();
	    $('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
		 		$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
		 		$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
		});
	</script>
</head>
<body>
	<div class="container">
  	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Iniciar Sesión</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<!--// Login form -->
								<form action="http://pos.onix-software.com/index.php/login" method="post" accept-charset="utf-8" id="login-form" role="form" style="display: block;">
																			<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span>Usuario/Contraseña inválidos</div>

																		3
									<div class="form-group">
										<input type="text" name="username" value="" id="username" tabindex="1" class="form-control" placeholder="Usuario" size="20"  />
									</div>
									<div class="form-group">
										<input type="password" name="password" value="" id="password" tabindex="2" class="form-control" placeholder="Contraseña" size="20"  />
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="loginButton" value="Go" id="loginButton" tabindex="4" class="form-control btn btn-login"  />
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form><!--// Close form-->
								<!--// Register form-->
								<form id="register-form" action="http://phpoll.com/register/process" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form><!--// Close form -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<?php }
}
