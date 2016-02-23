{form_open_multipart('customers/do_excel_import/', ['id'=>'item_form'])}
	<div id="required_fields_message">Import customers from Excel sheet</div>
	<ul id="error_message_box"></ul>
	<b>{anchor(site_url('customers/excel'), "Download Import Excel Template (CSV)")}</b>
	<br>
	<fieldset id="item_basic_info">
		<div class="row">	
			{form_label('File path:', 'name', ['class'=>'col-sm-2 control-label'])}
			<div class='col-sm-10'>
				{form_upload([
					'name'=>'file_path',
					'id'=>'file_path',
					'value'=>'']
				)}
			</div>
		</div>
		<br>
		{form_submit([
			'name'=>'submitf',
			'id'=>'submitf',
			'value'=>$this->lang->line('common_submit'),
			'class'=>'submit_button float_right']
		)}
	</fieldset>
{form_close()}
<script type='text/javascript'>
var my_modal = '{$modal_id}';
{literal}
	//validation and submit handling
	$(document).ready(function() {	
		$('#item_form').validate({
			submitHandler:function(form) {
				$(form).ajaxSubmit({
					success:function(response) {
						$(my_modal).modal('toggle');
						post_person_form_submit(response);
					},
					error: function() {
						alert('Error');
						$(my_modal).modal('toggle');
						post_person_form_submit(response);
					},
					dataType:'json'
				});
				//$(my_modal).modal('toggle');
				//post_person_form_submit({success: true});
			},
			errorLabelContainer: "#error_message_box",
 			wrapper: "li",
			rules: {
				file_path:"required"
   		},
			messages: {
   			file_path:"Full path to excel file required"
			}
		});
	});

{/literal}
</script>