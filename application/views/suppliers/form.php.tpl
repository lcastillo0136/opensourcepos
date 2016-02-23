{form_open('suppliers/save/'|cat:$person_info->person_id, ['id'=>'supplier_form'])}
	<div id="required_fields_message">{$this->lang->line('common_fields_required_message')}</div>
	<ul id="error_message_box"></ul>
	<fieldset id="supplier_basic_info">

		<div class="row">	
			{form_label($this->lang->line('suppliers_company_name')|cat:':', 'company_name', ['class'=>'col-sm-4 control-label required'])}
			<div class='col-sm-8'>
				{form_input([
					'name'=>'company_name',
					'id'=>'company_name_input',
					'value'=>$person_info->company_name]
				)}
			</div>
		</div>
<br>
		{include file='people/form_basic_info.php.tpl'}
		<br>
		<div class="row">
			{form_label($this->lang->line('suppliers_account_number')|cat:':', 'account_number', ['class'=>'col-sm-2 control-label'])}
			<div class='col-sm-10'>
				{form_input([
					'name'=>'account_number',
					'id'=>'account_number',
					'value'=>$person_info->account_number]
				)}
			</div>
		</div>
		<br>
		{form_submit([
			'name'=>'submit',
			'id'=>'submit',
			'value'=>$this->lang->line('common_submit'),
			'class'=>'submit_button float_right']
		)}
	</fieldset>
{form_close()}
<script type='text/javascript'>
	var my_modal = '{$modal_id}';
	var messages = {
		company_name: "{$this->lang->line('suppliers_company_name_required')}",
		last_name: "{$this->lang->line('common_last_name_required')}",
		email: "{$this->lang->line('common_email_invalid_format')}"
	};
	{literal}
	//validation and submit handling
	$(document).ready(function() {
		$('#supplier_form').validate({
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					success:function(response) {
						$(my_modal).modal('toggle');
						post_person_form_submit(response);
					},
					dataType:'json'
				});
			},
			errorLabelContainer: "#error_message_box",
			wrapper: "li",
			rules: {
				company_name: "required",
				first_name: "required",
				last_name: "required",
				email: "email"
			},
			messages: messages
		});
	});
	{/literal}
</script>
