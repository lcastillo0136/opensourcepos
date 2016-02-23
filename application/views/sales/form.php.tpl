<div id="edit_sale_wrapper">
	<div id="required_fields_message">{$this->lang->line('common_fields_required_message')}</div>
	<ul id="error_message_box"></ul>
	
	<fieldset id="sale_basic_info">
    {form_open("sales/save/"|cat: $sale_info['sale_id'], ['id'=>'sales_edit_form'])}
      
      <br/>
      <div class="row">
        {form_label($this->lang->line('sales_receipt_number')|cat: ':', 'customer', ['class'=>'control-label col-md-3'])}
        <div class='col-md-9'>
          {anchor('sales/receipt/'|cat: $sale_info['sale_id'], $this->lang->line('sales_receipt_number')|cat: $sale_info['sale_id'], ['target' => '_blank'])}
        </div>
      </div>
      <br/>
      <div class="row">
        {form_label($this->lang->line('sales_date')|cat: ':', 'date', ['class'=>'required control-label col-md-3'])}
        <div class='col-md-9'>
          {form_input(['name'=>'date','value'=>date('m/d/Y', strtotime($sale_info['sale_time'])), 'id'=>'date'])}
        </div>
      </div>
      <br/>
      <div class="row">
        {form_label($this->lang->line('sales_invoice_number')|cat: ':', 'invoice_number', ['class'=>'control-label col-md-3'])}
        <div class='col-md-9'>
          {form_input(['name' => 'invoice_number', 'value' => $sale_info['invoice_number'], 'id' => 'invoice_number'])}
        </div>
      </div>
      <br/>
      <div class="row">
        {form_label($this->lang->line('sales_customer')|cat: ':', 'customer', ['class' => 'control-label col-md-3'])}
        <div class='col-md-9'>
          {form_input(['name' => 'customer_id', 'value' => $selected_customer, 'id' => 'customer_id'])}
        </div>
      </div>
      <br/>
      <div class="row">
        {form_label($this->lang->line('sales_employee')|cat: ':', 'employee', ['class'=>'control-label col-md-3'])}
        <div class='col-md-9'>
          {form_dropdown('employee_id', $employees, $sale_info['employee_id'], 'id="employee_id"')}
        </div>
      </div>
      <br/>
      <div class="row">
        {form_label($this->lang->line('sales_comment')|cat: ':', 'comment', ['class'=>'control-label col-md-3'])}
        <div class='col-md-9'>
          {form_textarea(['name'=>'comment','value'=>$sale_info['comment'],'rows'=>'4','cols'=>'23', 'id'=>'comment'])}
        </div>
      </div>
      <br/>
      {form_submit([
        'name'=>'submit',
        'value'=>$this->lang->line('common_submit'),
        'class'=> 'submit_button float_right']
      )}
    {form_close()}
	
    {form_open("sales/delete/"|cat: $sale_info['sale_id'], ['id'=>'sales_delete_form'])}
      {form_hidden('sale_id', $sale_info['sale_id'])}
      {form_submit([
        'name'=>'submit',
        'value'=>$this->lang->line('sales_delete_entire_sale'),
        'class'=>'delete_button float_right']
      )}
    {form_close()}
	</fieldset>
</div>

<script type="text/javascript" language="javascript">
  var invoice_number_url = "{site_url($controller_name|cat: "/check_invoice_number")}";
  var invoice_number_duplicate = "{$this->lang->line("sales_invoice_number_duplicate")}";
  var sales_delete_confirm = "{$this->lang->line("sales_delete_confirmation")}";
  var customer_search_url = "{site_url("sales/customer_search")}";
  var sales_date_required = "{$this->lang->line('sales_date_required')}";
  var sales_date_type = "{$this->lang->line('sales_date_type')}";
  var modal_id = '{$modal_id}';
  {literal}
  $(document).ready(function() {	
    $.validator.addMethod("invoice_number", function(value, element) {
      var id = $("input[name='sale_id']").val();

      return JSON.parse($.ajax({
			  type: 'POST',
			  url: invoice_number_url,
			  data: {'sale_id' : id, 'invoice_number' : $(element).val() },
			  success: function(response) {
				  success=response.success;
			  },
			  async:false,
			  dataType: 'json'
      }).responseText).success;
    }, invoice_number_duplicate);
    
    
    $('#date').daterangepicker({
        singleDatePicker: true
    }, 
    function(start, end, label) {
        
    });

    $("#sales_delete_form").submit(function() {
      if (!confirm(sales_delete_confirm)) {
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
  
    var autocompleter = $("#customer_id").autocomplete(customer_search_url, {
      minChars:0,
      delay:15, 
      max:100,
      cacheLength: 1,
      formatItem: format_item,
      formatResult : format_item
    });

    // declare submitHandler as an object.. will be reused
    var submit_form = function(selected_customer) { 
      $(this).ajaxSubmit({
        success:function(response) {
          $(modal_id).modal('toggle');
          post_form_submit(response);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          selected_customer && autocompleter.val(selected_customer);
          post_form_submit({message: errorThrown});
        },
        dataType:'json'
      });
    };
  
    $('#sales_edit_form').validate({
      submitHandler : function(form) {
        var selected_customer = autocompleter.val();
        var selected_customer_id = selected_customer.replace(/(\w)\|.*/, "$1");
        selected_customer_id && autocompleter.val(selected_customer_id);
        submit_form.call(form, selected_customer);
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
          required: sales_date_required,
          date: sales_date_type
        }
      }
    });
  
    $('#sales_delete_form').submit(function() {
      var id = $("input[name='sale_id']").val();
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