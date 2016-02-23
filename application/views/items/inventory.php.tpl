<div id="required_fields_message">{$this->lang->line('common_fields_required_message')}</div>
<ul id="error_message_box"></ul>
{form_open('items/save_inventory/'|cat: $item_info->item_id, ['id'=>'item_form'])}
	<fieldset id="item_basic_info">
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_item_number')|cat: ':', 'name', ['class'=>'col-sm-3 control-label'])}
			<div class="col-sm-9">
				{form_input_group_addon([
					'name'=>'item_number',
					'id'=>'item_number',
					'value'=>$item_info->item_number,
					'placeholder'=> $this->lang->line('items_item_number'),
					'left_addon' => '<i class="fa fa-items"></i>',
					'readonly' => 'readonly'
				])}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_name')|cat: ':', 'name', ['class'=>'col-sm-3 control-label'])}
			<div class="col-sm-9">	
				{form_input([
					'name'=>'name',
					'id'=>'name',
					'value'=>$item_info->name,
					'style'       => 'border:none',
					'readonly' => 'readonly'
				])}
			</div>
		</div>
		<br/>
		<div class="row">
			{form_label($this->lang->line('items_category')|cat: ':', 'category', ['class'=>'col-sm-3 control-label'])}
			<div class="col-sm-9">
				{form_input([		
					'name'=>'category',
					'id'=>'category',
					'value'=>$item_info->category,
					'style'       => 'border:none',
					'readonly' => 'readonly'
				])}
			</div>
		</div>
		<br/>
		<div class="row">
			{form_label($this->lang->line('items_stock_location')|cat: ':', 'stock_location', ['class'=>'col-sm-3 control-label'])}
			<div class="col-sm-9">
				{form_dropdown('stock_location',$stock_locations,current($stock_locations),'onchange="fill_quantity(this.value)"')} 
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_current_quantity')|cat: ':', 'quantity', ['class'=>'col-sm-3 control-label'])}
			<div class="col-sm-9">
				{form_input([	
					'name'=>'quantity',
					'id'=>'quantity',
					'value'=>current($item_quantities),
					'style'       => 'border:none',
					'readonly' => 'readonly'
				])}
			</div>
		</div>
<br/>
		<div class="row">	
			{form_label($this->lang->line('items_add_minus')|cat: ':', 'quantity', ['class'=>'required col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'newquantity',
					'id'=>'newquantity'
				])}
			</div>
		</div>
<br/>
		<div class="row">	
			{form_label($this->lang->line('items_inventory_comments')|cat: ':', 'description', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_textarea([
					'name'=>'trans_comment',
					'id'=>'trans_comment',
					'rows'=>'3',
					'cols'=>'17']
				)}
			</div>
		</div>
		<br/>
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
	$('#item_form').validate({
		submitHandler:function(form) {
			$(form).ajaxSubmit({
				success:function(response) {
					$('{$modal_id}').modal('toggle');
					post_item_form_submit(response);
				},
				dataType:'json'
			});
		},
		errorLabelContainer: "#error_message_box",
 		wrapper: "li",
		rules: {
			newquantity: {
				required:true,
				number:true
			}
 		},
		messages: {
			newquantity: {
				required:"{$this->lang->line('items_quantity_required')}",
				number:"{$this->lang->line('items_quantity_number')}"
			}
		}
	});
});

function fill_quantity(val) {   
    var item_quantities= {json_encode($item_quantities)}
    document.getElementById("quantity").value = item_quantities[val];
}
</script>