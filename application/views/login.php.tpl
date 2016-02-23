<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="{base_url("assets/css/bootstrap.css")}" />
	<link rel="stylesheet" rev="stylesheet" href="{base_url()}css/login.css" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Open Source Point Of Sale {$this->lang->line('login_login')}</title>
	<script src="{base_url("assets/js/jquery-1.11.3.min.js")}" type="text/javascript" ></script>
	<script src="{base_url("assets/js/bootstrap.js")}" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$("#login_form input:first").focus();
	    $('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
		 		$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				if ($('#register-form #username').val() != '' && $('#login-form #username').val() == '') {
					$('#login-form #username').val($('#register-form #username').val());
				}
				if ($('#register-form #password').val() != '' && $('#login-form #password').val() == '') {
					$('#login-form #password').val($('#register-form #password').val());
				}
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
		 		$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');

				if ($('#login-form #username').val() != '' && $('#register-form #username').val() == '') {
					$('#register-form #username').val($('#login-form #username').val());
				}
				if ($('#login-form #password').val() != '' && $('#register-form #password').val() == '') {
					$('#register-form #password').val($('#login-form #password').val());
					$('#register-form #confirm-password').val($('#login-form #password').val());
				}

				
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
								<a href="#" class="active" id="login-form-link">{$this->lang->line('login_login')}</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">{$this->lang->line('login_register')}</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<!--// Login form -->
								{form_open('login', ["id" => 'login-form', "role" => 'form', "style" => 'display: block;'])}
									{validation_errors()}
									<div class="form-group">
										{form_input([
											'name'=>'username',
											'id' => 'username',
											'tabindex' => '1',
											'class' => 'form-control',
											'placeholder' => $this->lang->line('login_username'), 
											'value' => 'admin', 
											'size'=>'20']
										)}
										{* 'value' => $this->input->post('username') *}
									</div>
									<div class="form-group">
										{form_input([
											'type' => 'password',
											'name'=>'password',
											'id' => 'password',
											'tabindex' => '2',
											'class' => 'form-control',
											'placeholder' => $this->lang->line('login_password'),
											'value' => 'pointofsale',
											'size'=>'20']
										)}
									</div>
									<div class="form-group text-center hide">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> {$this->lang->line('login_remember_me')}</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												{form_submit([
													'name' => 'loginButton',
													'id' => 'loginButton',
													'tabindex' => '4',
													'class' => 'form-control btn btn-login',
													'value' => 'Go'
												])}
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">{$this->lang->line('login_forgot_password')}</a>
												</div>
											</div>
										</div>
									</div>
								{form_close()}<!--// Close form-->
								<!--// Register form-->
								{form_open('register', ["id" => 'register-form', "role" => 'form', "style" => 'display: none;'])}
									<div class="form-group">
										{form_input([
											'type' => 'text',
											'name'=>'username',
											'id' => 'username',
											'tabindex' => '0',
											'class' => 'form-control',
											'placeholder' => $this->lang->line('login_username'),
											'size'=>'20']
										)}
									</div>
									<div class="form-group">
										{form_input([
											'type' => 'email',
											'name'=>'email',
											'id' => 'email',
											'tabindex' => '1',
											'class' => 'form-control',
											'placeholder' => $this->lang->line('login_email_address'),
											'size'=>'20']
										)}
									</div>
									<div class="form-group">
										{form_input([
											'type' => 'password',
											'name'=>'password',
											'id' => 'password',
											'tabindex' => '2',
											'class' => 'form-control',
											'placeholder' => $this->lang->line('login_password'),
											'size'=>'20']
										)}
									</div>
									<div class="form-group">
										{form_input([
											'type' => 'password',
											'name'=>'confirm-password',
											'id' => 'confirm-password',
											'tabindex' => '3',
											'class' => 'form-control',
											'placeholder' => $this->lang->line('login_confirm_password'),
											'size'=>'20']
										)}
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												{form_submit([
													'name' => 'register-submit',
													'id' => 'register-submit',
													'tabindex' => '4',
													'class' => 'form-control btn btn-register',
													'value' => $this->lang->line('login_register_now')
												])}
											</div>
										</div>
									</div>
								{form_close()}<!--// Close form -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
