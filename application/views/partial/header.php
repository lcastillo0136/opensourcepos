<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base href="{{base_url()}}" />
	<title>OS Point Of Sale</title>
	<link rel="stylesheet" rev="stylesheet" href="{{base_url()}}css/ospos.css" />
	<link rel="stylesheet" rev="stylesheet" href="{{base_url()}}css/ospos_print.css"  media="print"/>
	<link rel="stylesheet" href="{{base_url("assets/css/bootstrap.css")}}" />
	<link rel="stylesheet" href="{{base_url("assets/css/font-awesome.css")}}" />
  <link rel="stylesheet" type="text/css" media="all" href="{{base_url("assets/css/daterangepicker.css")}}" />

	<script>BASE_URL = '';</script>
	<script src="{{base_url()}}js/jquery-1.2.6.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url("assets/js/jquery-1.11.3.min.js")}}" type="text/javascript" ></script>
	<script src="{{base_url()}}js/jquery-migrate-1.2.1.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.color.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.metadata.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.form.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.tablesorter.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.ajax_queue.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.bgiframe.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.autocomplete.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.validate.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/jquery.jkey-1.1.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/thickbox.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/common.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/manage_tables.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/swfobject.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/date.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/datepicker.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url()}}js/moment-with-locales.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
	<script src="{{base_url("assets/js/bootstrap.js")}}" type="text/javascript"></script>
	<script type="text/javascript" src="{{base_url("assets/js/daterangepicker.js")}}"></script>
	<style type="text/css">
		html {
		    overflow: auto;
		}

		.user-info {
	    background-color: #eee;
	    position: relative;
	    z-index: 15;
	    margin-top: -20px;
	    height: 22px;
	    padding: 0px 11px;
		}
	</style>
	<script type="text/javascript">
		(function($) {
			$(function() {
				function timedUpdate () {
					moment.locale("{$this->config->item('language')}");
	        var obj = moment();
	        $('#menubar_date').text(obj.format('MMMM D, YYYY hh:mm:ss a'));
	        setTimeout(timedUpdate, 1000);
	      }

		    timedUpdate();
			});
		})(jQuery);
	</script>
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-42414683-14', 'auto');
	  ga('send', 'pageview', 'download');
	
	</script>
</head>
<body>
	<header>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">{$this->config->item('company')}</a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav navbar-right">
		        {foreach from=$allowed_modules->result() item=module}

		        {if ($module->module_id == $selected_module) }
		        	<li class="active selected">
        		{else}
        			<li>
		        {/if}
							<a href="{site_url($module->module_id)}">
								<i class="fa fa-{$module->module_id}"></i>
								{assign var="module_literal" value=$module->module_id}
								{$this->lang->line("module_$module_literal")}
							</a>
						</li>
						{/foreach}
		      </ul>
		      <ul class="nav navbar-nav ">
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</header>
	<div class="user-info">
		<div id="menubar_footer">
			{$this->lang->line('common_welcome')}&nbsp;{$user_info->first_name}&nbsp;{$user_info->last_name}! | 
			{anchor("home/logout", $this->lang->line("common_logout"))}
		</div>

		<div id="menubar_date">
			{date('F d, Y h:i a')}
		</div>
	</div>
<div id="content_area_wrapper" class="container-fluid">
	<div id="content_area" class="">
