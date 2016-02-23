{include file='partial/header.php'}
<div id="page_title">
	{$this->lang->line('module_config')}
</div>
{form_open('config/save/', ['id'=>'config_form'])}
	<div id="config_wrapper">
		<fieldset id="config_info">
			<div id="required_fields_message">
				{$this->lang->line('common_fields_required_message')}
			</div>
			<ul id="error_message_box"></ul>
			<div id="feedback_bar">
				
			</div>
			<legend>
				{$this->lang->line("config_info")}
			</legend>

			<div class="row ">	
				
					{form_input([
						'name'=>'company',
						'id'=>'company',
						'value'=>$this->config->item('company'),
						'label' => [
							'text' => $this->lang->line('config_company')|cat:':',
							'class' => 'col-sm-2 control-label required'
						]
					])}
				
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_address')|cat:':', 'address', ['class'=>'col-sm-2 control-label required'])}
				<div class='col-sm-10'>
					{form_textarea([
						'name'=>'address',
						'id'=>'address',
						'rows'=>4,
						'cols'=>17,
						'value'=>$this->config->item('address')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				
					{form_input([
						'name'=>'phone',
						'id'=>'phone',
						'value'=>$this->config->item('phone'),
						'label' => [
							'text' => $this->lang->line('config_phone')|cat:':',
							'class' => 'col-sm-2 control-label required'
						]
					])}
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_default_tax_rate_1')|cat: ':', 'default_tax_1_rate', ['class'=>'col-sm-2 control-label required'])}

				{assign var="tax_value" value=""}
				{if ($this->config->item('default_tax_1_name')!==FALSE)}
					{$tax_value=$this->config->item('default_tax_1_name')}
				{else}
					{$tax_value=$this->lang->line('items_sales_tax_1')}
				{/if}
				<div class="col-sm-5">
					{form_input([
						'name'=>'default_tax_1_name',
						'id'=>'default_tax_1_name',
						'size'=>'10',
						'value'=> $tax_value,
						'placeholder' => 'Name'
					])}
				</div>
				<div class="col-sm-5">
					{form_input_group_addon([
						'name'=>'default_tax_1_rate',
						'id'=>'default_tax_1_rate',
						'size'=>'4',
						'value'=>$this->config->item('default_tax_1_rate'), 
						'placeholder'=> 'value (n%)',
						'right_addon' => '%'
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_default_tax_rate_2')|cat:':', 'default_tax_1_rate', ['class'=>'col-sm-2 control-label'])}
				
				<div class="col-sm-5">
					{assign var="tax_value2" value=""}
					{if ($this->config->item('default_tax_2_name')!==FALSE)}
						{$tax_value2=$this->config->item('default_tax_2_name')}
					{else}
						{$tax_value2=$this->lang->line('items_sales_tax_2')}
					{/if}
					{form_input([
						'name'=>'default_tax_2_name',
						'id'=>'default_tax_2_name',
						'size'=>'10',
						'value'=> $tax_value2,
						'placeholder' => 'Name'
					])}
				</div>
				<div class="col-sm-5">
					{form_input_group_addon([
						'name'=>'default_tax_2_rate',
						'id'=>'default_tax_2_rate',
						'size'=>'4',
						'value'=>$this->config->item('default_tax_2_rate'), 
						'placeholder'=> 'value (n%)',
						'right_addon' => '%'
					])}
				</div>
			</div>
			<br>
			<!-- GARRISON MODIFIED 4/13/2013 -->
			<div class="row">	
				{form_label($this->lang->line('config_currency_symbol')|cat:':', 'currency_symbol', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-5'>
					{form_input([
						'name'=>'currency_symbol',
						'id'=>'currency_symbol',
						'value'=>$this->config->item('currency_symbol')
					])}
				</div>
				<div class='col-sm-5'>
					{form_checkbox([
						'name'=>'currency_side',
						'id'=>'currency_side',
						'value'=>'currency_side',
						'checked'=>$this->config->item('currency_side'),
						'label' => $this->lang->line('config_currency_side')
					])}
				</div>
			</div>
			<!-- END MODIFIED -->
			<br>
			<div class="row">	
					{form_input_group_addon([
						'name'=>'email',
						'id'=>'email',
						'type' => 'email',
						'value'=>$this->config->item('email'),
						'label' => [
							'text' => $this->lang->line('common_email')|cat:':',
							'class' => "col-sm-2 control-label"
						],
						'left_addon' => '<i class="fa fa-envelope"></i>'
					])}
			</div>
			<br>
			<div class="row">	
					{form_input([
						'name'=>'fax',
						'id'=>'fax',
						'value'=>$this->config->item('fax'),
						'label' => [
							'text' => $this->lang->line('config_fax')|cat:':',
							'class' => 'col-sm-2 control-label'
						]
					])}
			</div>
			<br>
			<div class="row">
					{form_input([
						'name'=>'website',
						'id'=>'website',
						'value'=>$this->config->item('website'),
						'label'=> [
							'text'=> $this->lang->line('config_website')|cat:':',
							'class'=> 'col-sm-2 control-label'
						]
					])}
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('common_return_policy')|cat:':', 'return_policy', ['class'=>'col-sm-2 control-label required'])}
				<div class='col-sm-10'>
					{form_textarea([
						'name'=>'return_policy',
						'id'=>'return_policy',
						'rows'=>'4',
						'cols'=>'17',
						'value'=>$this->config->item('return_policy')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_language')|cat:':', 'language', ['class'=>'col-sm-2 control-label required'])}
				<div class='col-sm-10'>
					{form_dropdown('language', [
						'en'    => 'English',
						'es'    => 'Spanish',
						'ru'    => 'Russian',
						'nl-BE' => 'Dutch',
						'zh'    => 'Chinese',
						'id'    => 'Indonesian',
						'fr'	=> 'French',
						'th'	=> 'Thai'
					], 
					$this->config->item('language'))}
				</div>
			</div>

			<br>
			<div class="row">	
				{form_label($this->lang->line('config_timezone')|cat:':', 'timezone', ['class'=>'col-sm-2 control-label required'])}
				<div class='col-sm-10'>
				 	{assign var="time_zone" value=""}
					{if ($this->config->item('timezone')) }
						{$time_zone= $this->config->item('timezone')}
					{else}
						{$time_zone= date_default_timezone_get()}
					{/if}
					{form_dropdown('timezone', [
							'Pacific/Midway'=>'(GMT-11:00) Midway Island, Samoa',
							'America/Adak'=>'(GMT-10:00) Hawaii-Aleutian',
							'Etc/GMT+10'=>'(GMT-10:00) Hawaii',
							'Pacific/Marquesas'=>'(GMT-09:30) Marquesas Islands',
							'Pacific/Gambier'=>'(GMT-09:00) Gambier Islands',
							'America/Anchorage'=>'(GMT-09:00) Alaska',
							'America/Ensenada'=>'(GMT-08:00) Tijuana, Baja California',
							'Etc/GMT+8'=>'(GMT-08:00) Pitcairn Islands',
							'America/Los_Angeles'=>'(GMT-08:00) Pacific Time (US & Canada)',
							'America/Denver'=>'(GMT-07:00) Mountain Time (US & Canada)',
							'America/Chihuahua'=>'(GMT-07:00) Chihuahua, La Paz, Mazatlan',
							'America/Dawson_Creek'=>'(GMT-07:00) Arizona',
							'America/Belize'=>'(GMT-06:00) Saskatchewan, Central America',
							'America/Cancun'=>'(GMT-06:00) Guadalajara, Mexico City, Monterrey',
							'Chile/EasterIsland'=>'(GMT-06:00) Easter Island',
							'America/Chicago'=>'(GMT-06:00) Central Time (US & Canada)',
							'America/New_York'=>'(GMT-05:00) Eastern Time (US & Canada)',
							'America/Havana'=>'(GMT-05:00) Cuba',
							'America/Bogota'=>'(GMT-05:00) Bogota, Lima, Quito, Rio Branco',
							'America/Caracas'=>'(GMT-04:30) Caracas',
							'America/Santiago'=>'(GMT-04:00) Santiago',
							'America/La_Paz'=>'(GMT-04:00) La Paz',
							'Atlantic/Stanley'=>'(GMT-04:00) Faukland Islands',
							'America/Campo_Grande'=>'(GMT-04:00) Brazil',
							'America/Goose_Bay'=>'(GMT-04:00) Atlantic Time (Goose Bay)',
							'America/Glace_Bay'=>'(GMT-04:00) Atlantic Time (Canada)',
							'America/St_Johns'=>'(GMT-03:30) Newfoundland',
							'America/Araguaina'=>'(GMT-03:00) UTC-3',
							'America/Montevideo'=>'(GMT-03:00) Montevideo',
							'America/Miquelon'=>'(GMT-03:00) Miquelon, St. Pierre',
							'America/Godthab'=>'(GMT-03:00) Greenland',
							'America/Argentina/Buenos_Aires'=>'(GMT-03:00) Buenos Aires',
							'America/Sao_Paulo'=>'(GMT-03:00) Brasilia',
							'America/Noronha'=>'(GMT-02:00) Mid-Atlantic',
							'Atlantic/Cape_Verde'=>'(GMT-01:00) Cape Verde Is.',
							'Atlantic/Azores'=>'(GMT-01:00) Azores',
							'Europe/Belfast'=>'(GMT) Greenwich Mean Time : Belfast',
							'Europe/Dublin'=>'(GMT) Greenwich Mean Time : Dublin',
							'Europe/Lisbon'=>'(GMT) Greenwich Mean Time : Lisbon',
							'Europe/London'=>'(GMT) Greenwich Mean Time : London',
							'Africa/Abidjan'=>'(GMT) Monrovia, Reykjavik',
							'Europe/Amsterdam'=>'(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna',
							'Europe/Belgrade'=>'(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague',
							'Europe/Brussels'=>'(GMT+01:00) Brussels, Copenhagen, Madrid, Paris',
							'Africa/Algiers'=>'(GMT+01:00) West Central Africa',
							'Africa/Windhoek'=>'(GMT+01:00) Windhoek',
							'Asia/Beirut'=>'(GMT+02:00) Beirut',
							'Africa/Cairo'=>'(GMT+02:00) Cairo',
							'Asia/Gaza'=>'(GMT+02:00) Gaza',
							'Africa/Blantyre'=>'(GMT+02:00) Harare, Pretoria',
							'Asia/Jerusalem'=>'(GMT+02:00) Jerusalem',
							'Europe/Minsk'=>'(GMT+02:00) Minsk',
							'Asia/Damascus'=>'(GMT+02:00) Syria',
							'Europe/Moscow'=>'(GMT+03:00) Moscow, St. Petersburg, Volgograd',
							'Africa/Addis_Ababa'=>'(GMT+03:00) Nairobi',
							'Asia/Tehran'=>'(GMT+03:30) Tehran',
							'Asia/Dubai'=>'(GMT+04:00) Abu Dhabi, Muscat',
							'Asia/Yerevan'=>'(GMT+04:00) Yerevan',
							'Asia/Kabul'=>'(GMT+04:30) Kabul',
						 	'Asia/Baku'=>'(GMT+05:00) Baku',
						 	'Asia/Yekaterinburg'=>'(GMT+05:00) Ekaterinburg',
							'Asia/Tashkent'=>'(GMT+05:00) Tashkent',
							'Asia/Kolkata'=>'(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi',
							'Asia/Katmandu'=>'(GMT+05:45) Kathmandu',
							'Asia/Dhaka'=>'(GMT+06:00) Astana, Dhaka',
							'Asia/Novosibirsk'=>'(GMT+06:00) Novosibirsk',
							'Asia/Rangoon'=>'(GMT+06:30) Yangon (Rangoon)',
							'Asia/Bangkok'=>'(GMT+07:00) Bangkok, Hanoi, Jakarta',
							'Asia/Krasnoyarsk'=>'(GMT+07:00) Krasnoyarsk',
							'Asia/Hong_Kong'=>'(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi',
							'Asia/Irkutsk'=>'(GMT+08:00) Irkutsk, Ulaan Bataar',
							'Australia/Perth'=>'(GMT+08:00) Perth',
							'Australia/Eucla'=>'(GMT+08:45) Eucla',
							'Asia/Tokyo'=>'(GMT+09:00) Osaka, Sapporo, Tokyo',
							'Asia/Seoul'=>'(GMT+09:00) Seoul',
							'Asia/Yakutsk'=>'(GMT+09:00) Yakutsk',
							'Australia/Adelaide'=>'(GMT+09:30) Adelaide',
							'Australia/Darwin'=>'(GMT+09:30) Darwin',
							'Australia/Brisbane'=>'(GMT+10:00) Brisbane',
							'Australia/Hobart'=>'(GMT+10:00) Hobart',
							'Asia/Vladivostok'=>'(GMT+10:00) Vladivostok',
							'Australia/Lord_Howe'=>'(GMT+10:30) Lord Howe Island',
							'Etc/GMT-11'=>'(GMT+11:00) Solomon Is., New Caledonia',
							'Asia/Magadan'=>'(GMT+11:00) Magadan',
							'Pacific/Norfolk'=>'(GMT+11:30) Norfolk Island',
							'Asia/Anadyr'=>'(GMT+12:00) Anadyr, Kamchatka',
							'Pacific/Auckland'=>'(GMT+12:00) Auckland, Wellington',
							'Etc/GMT-12'=>'(GMT+12:00) Fiji, Kamchatka, Marshall Is.',
							'Pacific/Chatham'=>'(GMT+12:45) Chatham Islands',
							'Pacific/Tongatapu'=>'(GMT+13:00) Nuku\'alofa',
							'Pacific/Kiritimati'=>'(GMT+14:00) Kiritimati'
						], 
						$time_zone
					)}
				</div>
			</div>

			<br>
			<div class="row">
				{form_label($this->lang->line('config_stock_location')|cat:':', 'stock_location', ['class'=>'col-sm-2 control-label required '])}
    		<div class='col-sm-10'>
    			{form_input([
        		'name'=>'stock_location',
        		'id'=>'stock_location',
        		'value'=>$location_names
    			])}
    		</div>
			</div>
			<br>

			<div class="row">    
				{form_label($this->lang->line('config_sales_invoice_format')|cat:':', 'sales_invoice_format', ['class'=>'col-sm-2 control-label'])}
		    <div class='col-sm-10'>
			    {form_input([
		        'name'=>'sales_invoice_format',
		        'id'=>'sales_invoice_format',
		        'value'=>$this->config->item('sales_invoice_format')
	        ])}
		    </div>
			</div>
			<br>

			<div class="row">    
				{form_label($this->lang->line('config_recv_invoice_format')|cat:':', 'recv_invoice_format', ['class'=>'col-sm-2 control-label'])}
    		<div class='col-sm-10'>
    			{form_input([
        		'name'=>'recv_invoice_format',
        		'id'=>'recv_invoice_format',
        		'value'=>$this->config->item('recv_invoice_format')
      		])}
    		</div>
			</div>
			<br>

			<div class="row">	
				{form_label($this->lang->line('config_print_after_sale')|cat:':', 'print_after_sale', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_checkbox([
						'name'=>'print_after_sale',
						'id'=>'print_after_sale',
						'value'=>'print_after_sale',
						'checked'=>$this->config->item('print_after_sale')
					])}
				</div>
			</div>
			<br>

			<div class="row">	
				{form_label($this->lang->line('config_tax_included')|cat:':', 'tax_included', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_checkbox([
						'name'=>'tax_included',
						'id'=>'tax_included',
						'value'=>'tax_included',
						'checked'=>$this->config->item('tax_included')
					])}
				</div>
			</div>
			<br>

			<div class="row">	
				{form_label($this->lang->line('config_custom1')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom1_name',
						'id'=>'custom1_name',
						'value'=>$this->config->item('custom1_name')
					])}
				</div>
			</div>
			<br>

			<div class="row">	
				{form_label($this->lang->line('config_custom2')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom2_name',
						'id'=>'custom2_name',
						'value'=>$this->config->item('custom2_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom3')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom3_name',
						'id'=>'custom3_name',
						'value'=>$this->config->item('custom3_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom4')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom4_name',
						'id'=>'custom4_name',
						'value'=>$this->config->item('custom4_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom5')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom5_name',
						'id'=>'custom5_name',
						'value'=>$this->config->item('custom5_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom6')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom6_name',
						'id'=>'custom6_name',
						'value'=>$this->config->item('custom6_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom7')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom7_name',
						'id'=>'custom7_name',
						'value'=>$this->config->item('custom7_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom8')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom8_name',
						'id'=>'custom8_name',
						'value'=>$this->config->item('custom8_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom9')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom9_name',
						'id'=>'custom9_name',
						'value'=>$this->config->item('custom9_name')
					])}
				</div>
			</div>
			<br>
			<div class="row">	
				{form_label($this->lang->line('config_custom10')|cat:':', 'website', ['class'=>'col-sm-2 control-label'])}
				<div class='col-sm-10'>
					{form_input([
						'name'=>'custom10_name',
						'id'=>'custom10_name',
						'value'=>$this->config->item('custom10_name')
					])}
				</div>
			</div>

			{form_submit([
				'name'=>'submit_form',
				'id'=>'submit',
				'value'=>$this->lang->line('common_submit'),
				'class'=>'submit_button float_right'
			])}
		</fieldset>
	</div>
{form_close()}
<script type='text/javascript'>
	//validation and submit handling
	$(document).ready(function() {
		$('#config_form').validate({
			submitHandler:function(form) {
				$(form).ajaxSubmit({
					success:function(response) {
						if(response.success) {
							set_feedback(response.message,'success', true);		
						} else {
							set_feedback(response.message,'danger', true);		
						}
					},
					dataType:'json'
				});
			},
			errorLabelContainer: "#error_message_box",
			wrapper: "li",
			rules: {
				company: "required",
				address: "required",
  			phone: "required",
  			default_tax_rate: {
  				required:true,
  				number:true
  			},
  			email:"email",
  			return_policy: "required",
  			stock_location:"required"    	 		
 			},
			messages: {
   			company: "{$this->lang->line('config_company_required')}",
   			address: "{$this->lang->line('config_address_required')}",
   			phone: "{$this->lang->line('config_phone_required')}",
   			default_tax_rate: {
  				required:"{$this->lang->line('config_default_tax_rate_required')}",
  				number:"{$this->lang->line('config_default_tax_rate_number')}"
  			},
   			email: "{$this->lang->line('common_email_invalid_format')}",
   			return_policy:"{$this->lang->line('config_return_policy_required')}",
   			stock_location:"{$this->lang->line('config_stock_location_required')}"	
			}
		});
	});
</script>
{include file='partial/footer.php'}