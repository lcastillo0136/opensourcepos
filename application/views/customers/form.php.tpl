{form_open('customers/save/'|cat:$person_info->person_id, ['id'=>'customer_form'])}
	<div id="required_fields_message">
		{$this->lang->line('common_fields_required_message')}
	</div>
	<ul id="error_message_box"></ul>
	<fieldset id="customer_basic_info">
		{include file='people/form_basic_info.php.tpl'}
		<br>
		<div class="row">	
			{form_label($this->lang->line('customers_account_number')|cat:':', 'account_number', ['class' => 'col-sm-2 control-label'])}
			<div class='col-sm-10'>
				{form_input([
					'name'=>'account_number',
					'id'=>'account_number',
					'value'=>$person_info->account_number]
				)}
			</div>
		</div>
		<br>
		<div class="row">	
			{form_label($this->lang->line('customers_taxable')|cat:':', 'taxable', ['class' => 'col-sm-2 control-label'])}
			<div class='col-sm-10'>
				{assign var="is_taxable" value=''}
				{if ($person_info->taxable == '') }
					{$is_taxable= TRUE}
				{else}
					{$is_taxable=(boolean)$person_info->taxable}
				{/if}
				{form_checkbox('taxable', '1', $is_taxable )}
			</div>
		</div>

		{form_submit([
			'name'=>'submit',
			'id'=>'submit',
			'value'=>$this->lang->line('common_submit'),
			'class'=>'submit_button float_right']
		)}
	</fieldset>
{form_close()}

<script type='text/javascript'>
	//validation and submit handling
	$(document).ready(function() {
		$('#customer_form').validate({
			submitHandler:function(form) {
				$(form).ajaxSubmit({
					success:function(response) {
						$('{$modal_id}').modal('toggle');
						post_person_form_submit(response);
					},
					dataType:'json'
				});
			},
			errorLabelContainer: "#error_message_box",
	 		wrapper: "li",
			rules: {
				first_name: "required",
				last_name: "required",
	  		email: "email"
	 		},
			messages: {
	   		first_name: "{$this->lang->line('common_first_name_required')}",
	   		last_name: "{$this->lang->line('common_last_name_required')}",
	   		email: "{$this->lang->line('common_email_invalid_format')}"
			}
		});
	});
</script>