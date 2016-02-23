<div id="edit_sale_wrapper">
	<div id="required_fields_message">{$this->lang->line('common_fields_required_message')}</div>
	<ul id="error_message_box"></ul>
	
	<fieldset id="receiving_basic_info">
		{form_open("receivings/save/"|cat: $receiving_info['receiving_id'], ['id'=>'recvs_edit_form'])}
			<div class="row">
				{form_label($this->lang->line('recvs_receipt_number')|cat: ':', 'supplier', ['class'=>'control-label col-md-3'])}
				<div class='col-md-9'>
					{anchor('receivings/receipt/'|cat: $receiving_info['receiving_id'], $receiving_info['receiving_id'], ['target' => '_blank'])}
				</div>
			</div>
			<br/>
			<div class="row">
				{form_label($this->lang->line('recvs_date')|cat: ':', 'date', ['class'=>'required control-label col-md-3'])}
				<div class='col-md-9'>
					{form_input(['name'=>'date','value'=>date('m/d/Y', strtotime($receiving_info['receiving_time'])), 'id'=>'date'])}
				</div>
			</div>
			<br/>
			<div class="row">
				{form_label($this->lang->line('recvs_supplier')|cat: ':', 'supplier', ['class'=>'control-label col-md-3'])}
				<div class='col-md-9'>
					{form_input(['name' => 'supplier_id', 'value' => $selected_supplier, 'id' => 'supplier_id'])}
				</div>
			</div>
			<br/>
			<div class="row">
				{form_label($this->lang->line('recvs_invoice_number')|cat: ':', 'invoice_number', ['class'=>'control-label col-md-3'])}
				<div class='col-md-9'>
					{form_input(['name' => 'invoice_number', 'value' => $receiving_info['invoice_number'], 'id' => 'invoice_number'])}
				</div>
			</div>
			<br/>
			<div class="row">
				{form_label($this->lang->line('recvs_employee')|cat: ':', 'employee', ['class'=>'control-label col-md-3'])}
				<div class='col-md-9'>
					{form_dropdown('employee_id', $employees, $receiving_info['employee_id'], 'id="employee_id"')}
				</div>
			</div>
			<br/>
			<div class="row">
				{form_label($this->lang->line('recvs_comments')|cat: ':', 'comment', ['class'=>'control-label col-md-3'])}
				<div class='col-md-9'>
					{form_textarea(['name'=>'comment','value'=>$receiving_info['comment'],'rows'=>'4','cols'=>'23', 'id'=>'comment'])}
				</div>
			</div>
			<br/>
			{form_submit([
				'name'=>'submit',
				'value'=>$this->lang->line('common_submit'),
				'class'=> 'submit_button float_right']
			)}
		{form_close()}
		
		{form_open("receivings/delete/"|cat: $receiving_info['receiving_id'], ['id'=>'recvs_delete_form'])}
			{form_hidden('receiving_id', $receiving_info['receiving_id'])}
			{form_submit([
				'name'=>'submit',
				'value'=>$this->lang->line('recvs_delete_entire_sale'),
				'class'=>'delete_button float_right']
			)}
		{form_close()}
	</fieldset>
</div>

<script type="text/javascript" language="javascript">
	var url_invoice_number = '{site_url($controller_name|cat: "/check_invoice_number")}';
	var message_invoice_number_duplicate = '$this->lang->line("recvs_invoice_number_duplicate")}';
	var delete_confirm_message = '$this->lang->line("recvs_delete_confirmation")}';
	var url_supplier_search = '{site_url("receivings/supplier_search")}';
	var date_required = "{$this->lang->line('recvs_date_required')}";
	var date_type = "{$this->lang->line('recvs_date_type')}";
	var modal_id = '{$modal_id}';

	{literal}
	$(document).ready(function() {	
		$.validator.addMethod("invoice_number", function(value, element) {
			var id = $("input[name='receiving_id']").val();
			return JSON.parse($.ajax({
			  type: 'POST',
			  url: url_invoice_number,
			  data: {'receiving_id' : id, 'invoice_number' : $(element).val() },
			  success: function(response) {
				  success=response.success;
			  },
			  async:false,
			  dataType: 'json'
      }).responseText).success;
  	}, message_invoice_number_duplicate);
	
		$('#date').daterangepicker({
        singleDatePicker: true
    }, 
    function(start, end, label) {
        
    });

		$("#recvs_delete_form").submit(function() {
			if (!confirm(delete_confirm_message)) {
				return false;
			}
		});
	
		var format_item = function(row) {
    	var result = [row[0], "|", row[1]].join("");
    	// if more than one occurence
    	if (row[2] > 1 && row[3] && row[3].toString().trim()) {
				// display zip code
    		result += ' - ' + row[3];
    	}
			return result;
		};

		var autocompleter = $("#supplier_id").autocomplete(url_supplier_search, {
    	minChars:0,
    	delay:15, 
    	max:100,
     	cacheLength: 1,
      formatItem: format_item,
      formatResult : format_item
    });

		// declare submitHandler as an object.. will be reused
		var submit_form = function(selected_supplier) { 
			$(this).ajaxSubmit({
				success:function(response) {
					$(modal_id).modal('toggle');
					post_form_submit(response);
				},
				error: function(jqXHR, textStatus, errorThrown) {
					selected_supplier && autocompleter.val(selected_supplier);
					post_form_submit({message: errorThrown});
				},
				dataType:'json'
			});
		};

		$('#recvs_edit_form').validate({
			submitHandler : function(form) {
				var selected_supplier = autocompleter.val();
				var selected_supplier_id = selected_supplier.replace(/(\w)\|.*/, "$1");
				selected_supplier_id && autocompleter.val(selected_supplier_id);
				submit_form.call(form, selected_supplier);
			},
			errorLabelContainer: "#error_message_box",
			wrapper: "li",
			rules: {
				date: {
					required:true,
					date:true
				},
				invoice_number: {
					invoice_number: true
				}
			},
			messages: {
				date: {
					required: date_required,
					date: date_type
				}
			}
		});

		$('#recvs_delete_form').submit(function() {
			var id = $("input[name='receiving_id']").val();
			$(this).ajaxSubmit({
				success:function(response) {
					$(modal_id).modal('toggle');
					set_feedback(response.message,'success',false);
					var $element = get_table_row(id).parent().parent();
					$element.find("td").animate({backgroundColor:"green"},1200,"linear")
					.end().animate({opacity:0},1200,"linear",function() {
						$element.next().remove();
						$(this).remove();
						//Re-init sortable table as we removed a row
						update_sortable_table();
					});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					set_feedback(textStatus,'danger',true);
				},
				dataType:'json'
			});
			return false;
		});
	});
	{/literal}
</script>