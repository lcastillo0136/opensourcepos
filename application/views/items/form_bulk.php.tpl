<div id="required_fields_message">
	{$this->lang->line('items_edit_fields_you_want_to_update')}
</div>
<ul id="error_message_box"></ul>
{form_open('items/bulk_update/', ['id'=>'item_form'])}
	<fieldset id="item_basic_info">
		<legend>{$this->lang->line("items_basic_information")}</legend>
		<br/>
		<div class="row">
			{form_label($this->lang->line('items_name')|cat: ':', 'name', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'name',
					'id'=>'name']
				)}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_category')|cat: ':', 'category', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'category',
					'id'=>'category']
				)}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_supplier')|cat: ':', 'supplier', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_dropdown('supplier_id', $suppliers, '')}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_cost_price')|cat: ':', 'cost_price', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input_group_addon([
					'name'=>'cost_price',
					'id'=>'cost_price',
					'placeholder'=> $this->lang->line('items_cost_price'),
					'left_addon' => '<i class="fa fa-usd"></i>'
				])}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_unit_price')|cat: ':', 'unit_price', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input_group_addon([
					'name'=>'unit_price',
					'id'=>'unit_price',
					'placeholder'=> $this->lang->line('items_unit_price'),
					'left_addon' => '<i class="fa fa-usd"></i>'
				])}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_tax_1')|cat: ':', 'tax_percent_1', ['class'=>'col-sm-4 control-label'])}
			<div class='col-sm-4'>
				{assign "taxName" $this->lang->line('items_sales_tax')}
				{if isset($item_tax_info[0]["name"])}
					{$taxName=$item_tax_info[0]['name']}
				{/if}
				{form_input([
					'name'=>'tax_names[]',
					'id'=>'tax_name_1',
					'size'=>'8',
					'value'=> $taxName]
				)}
			</div>
			<div class='col-sm-4'>
				{assign "taxPercent" ""}
				{if isset($item_tax_info[0]["percent"])}
					{$taxPercent=$item_tax_info[0]['percent']}
				{/if}

				{form_input_group_addon([
					'name'=>'tax_percents[]',
					'id'=>'tax_percent_name_1',
					'size'=>'3',
					'value'=>$taxPercent, 
					'placeholder'=> 'value (n%)',
					'right_addon' => '%'
				])}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_tax_2')|cat: ':', 'tax_percent_2', ['class'=>'col-sm-4 control-label'])}
			<div class='col-sm-4'>
				{assign "taxName2" ""}
				{if isset($item_tax_info[1]["name"])}
					{$taxName2=$item_tax_info[1]['name']}
				{/if}
				{form_input([
					'name'=>'tax_names[]',
					'id'=>'tax_name_2',
					'size'=>'8',
					'value'=> $taxName2]
				)}
			</div>
			<div class='col-sm-4'>
				{assign "taxPercent2" ""}
				{if isset($item_tax_info[1]["percent"])}
					{$taxPercent2=$item_tax_info[1]['percent']}
				{/if}

				{form_input_group_addon([
					'name'=>'tax_percents[]',
					'id'=>'tax_percent_name_2',
					'size'=>'3',
					'value'=>$taxPercent2, 
					'placeholder'=> 'value (n%)',
					'right_addon' => '%'
				])}
			</div>
		</div>
				<br/>
		<div class="row">	
			{form_label($this->lang->line('items_reorder_level')|cat: ':', 'reorder_level', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'reorder_level',
					'id'=>'reorder_level']
				)}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_location')|cat: ':', 'location', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'location',
					'id'=>'location']
				)}
			</div>
		</div>
		<br/>
		<div class="row">	
			{form_label($this->lang->line('items_description')|cat: ':', 'description', ['class'=>'col-sm-3'])}
			<div class='col-sm-9'>
				{form_textarea([
					'name'=>'description',
					'id'=>'description',
					'rows'=>'5',
					'cols'=>'17']
				)}
			</div>
		</div>
		<br/>
		<div class="row">
			{form_label($this->lang->line('items_allow_alt_description')|cat: ':', 'allow_alt_description', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_dropdown('allow_alt_description', $allow_alt_description_choices)}
			</div>
		</div>
		<br/>
		<div class="row">
			{form_label($this->lang->line('items_is_serialized')|cat: ':', 'is_serialized', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_dropdown('is_serialized', $serialization_choices)}
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
	var site_url = "{site_url('items')}";
	var messages = {
		unit_price: {
			number:"{$this->lang->line('items_unit_price_number')}"
		},
		tax_percent: {
			number:"{$this->lang->line('items_tax_percent_number')}"
		},
		quantity: {
			number:"{$this->lang->line('items_quantity_number')}"
		},
		reorder_level: {
			number:"{$this->lang->line('items_reorder_level_number')}"
		}
	};

	//validation and submit handling
	$(document).ready(function() {	
		{literal}
		$("#category").autocomplete(site_url+"/suggest_category",{max:100,minChars:0,delay:10});
    $("#category").result(function(event, data, formatted) {});
		$("#category").search();
		{/literal}

		$('#item_form').validate({
			submitHandler:function(form) {
				if(confirm("{$this->lang->line('items_confirm_bulk_edit')}")) {
					//Get the selected ids and create hidden fields to send with ajax submit.
					var selected_item_ids=get_selected_values();
					for(k=0;k<selected_item_ids.length;k++) {
						$(form).append("<input type='hidden' name='item_ids[]' value='"+selected_item_ids[k]+"' />");
					}

					$(form).ajaxSubmit({
						success:function(response) {
							debugger;
							$('{$modal_id}').modal('toggle');
							post_bulk_form_submit(response);
						},
						dataType:'json'
					});
				}
			},
			errorLabelContainer: "#error_message_box",
 			wrapper: "li",
			rules: {
				unit_price: {
					number:true
				},
				tax_percent: {
					number:true
				},
				quantity: {
					number:true
				},
				reorder_level: {
					number:true
				}
   		},
			messages: messages
		});
	});
</script>