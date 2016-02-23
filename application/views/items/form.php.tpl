
{form_open('items/save/'|cat:$item_info->item_id, ['id'=>'item_form'])}
	<fieldset id="item_basic_info">

		<br/><div class="row">	
			{form_label($this->lang->line('items_item_number')|cat:':', 'name', ['class'=>'col-sm-4 control-label wide'])}
			<div class="col-sm-8">
				{form_input_group_addon([
					'name'=>'item_number',
					'id'=>'item_number',
					'value'=>$item_info->item_number,
					'placeholder'=> $this->lang->line('items_item_number'),
					'left_addon' => '<i class="fa fa-items"></i>'
				])}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_name')|cat:':', 'name',['class'=>'col-sm-4 control-label required wide'])}
			<div class='col-sm-8'>
				{form_input([
					'name'=>'name',
					'id'=>'name',
					'value'=>$item_info->name]
				)}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_category')|cat:':', 'category',['class'=>'col-sm-4 control-label required wide'])}
			<div class='col-sm-8'>
				{form_input([
					'name'=>'category',
					'id'=>'category',
					'value'=>$item_info->category]
				)}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_supplier')|cat:':', 'supplier', ['class'=>'col-sm-4 control-label required wide'])}
			<div class='col-sm-8'>
				{form_dropdown('supplier_id', $suppliers, $selected_supplier)}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_cost_price')|cat:':', 'cost_price',['class'=>'col-sm-4 control-label required wide'])}
			<div class='col-sm-8'>
				{form_input_group_addon([
					'name'=>'cost_price',
					'id'=>'cost_price',
					'value'=>$item_info->cost_price,
					'placeholder'=> $this->lang->line('items_cost_price'),
					'left_addon' => '<i class="fa fa-usd"></i>'
				])}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_unit_price')|cat:':', 'unit_price',['class'=>'col-sm-4 control-label required wide'])}
			<div class='col-sm-8'>
				{form_input_group_addon([
					'name'=>'unit_price',
					'id'=>'unit_price',
					'value'=>$item_info->unit_price,
					'placeholder'=> $this->lang->line('items_unit_price'),
					'left_addon' => '<i class="fa fa-usd"></i>'
				])}
			</div>
		</div>

		<br/><div class="row">
			{form_label($this->lang->line('items_tax_1')|cat: ':', 'tax_percent_1',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-4'>
				{assign "taxName" ""}
				{if isset($item_tax_info[0]["name"])}
					{$taxName=$item_tax_info[0]['name']}
				{else}
					{$taxName=$this->config->item('default_tax_1_name')}
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
				{else}
					{$taxPercent=$default_tax_1_rate}
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

		<br/><div class="row">	
			{form_label($this->lang->line('items_tax_2')|cat:':', 'tax_percent_2',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-4'>
				{assign "taxName2" ""}
				{if isset($item_tax_info[1]["name"])}
					{$taxName2=$item_tax_info[1]['name']}
				{else}
					{$taxName2=$this->config->item('default_tax_2_name')}
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
				{else}
					{$taxPercent2=$default_tax_2_rate}
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

		{foreach from=$stock_locations key=key item=location_detail}
    <br/><div class="row">	
    	{form_label($this->lang->line('items_quantity')|cat: ' '|cat: $location_detail['location_name']|cat: ':', $key|cat: '_quantity', ['class'=>'col-sm-4 control-label required wide'])}
    	<div class='col-sm-8'>
    	  {form_input([
    			'name'=>$key|cat: '_quantity',
    			'id'=>$key|cat: '_quantity',
    			'size'=>'8',
    			'value'=>$location_detail['quantity']]
    	  )}
    	</div>
    </div>
		{/foreach}

		<br/><div class="row">	
			{form_label($this->lang->line('items_receiving_quantity')|cat: ':', 'receiving_quantity',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-8'>
			  {form_input([
					'name'=>'receiving_quantity',
					'id'=>'receiving_quantity',
					'size'=>'8',
					'value'=>$item_info->receiving_quantity]
			  )}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_reorder_level')|cat: ':', 'reorder_level',['class'=>'col-sm-4 control-label required wide'])}
			<div class='col-sm-8'>
			  {form_input([
					'name'=>'reorder_level',
					'id'=>'reorder_level',
					'size'=>'8',
					'value'=>$item_info->reorder_level]
			  )}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_description')|cat: ':', 'description',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-8'>
				{form_textarea([
					'name'=>'description',
					'id'=>'description',
					'value'=>$item_info->description,
					'rows'=>'5',
					'cols'=>'17']
			  )}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_allow_alt_description')|cat: ':', 'allow_alt_description',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-8'>
				{assign "chkDescription" "0"}
				{if $item_info->allow_alt_description}
					{$chkDescription=1}
				{/if}
				{form_checkbox([
					'name'=>'allow_alt_description',
					'id'=>'allow_alt_description',
					'value'=>1,
					'checked'=>$chkDescription]
			  )}
			</div>
		</div>

		<br/><div class="row">	
			{form_label($this->lang->line('items_is_serialized')|cat: ':', 'is_serialized',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-8'>
				{assign "chkSerialized" "0"}
				{if $item_info->is_serialized}
					{$chkSerialized=1}
				{/if}
				{form_checkbox([
					'name'=>'is_serialized',
					'id'=>'is_serialized',
					'value'=>1,
					'checked'=>$chkSerialized]
			  )}
			</div>
		</div>

		<!-- Parq 131215 Start -->
		<br/><div class="row">	
			{form_label($this->lang->line('items_is_deleted')|cat: ':', 'is_deleted',['class'=>'col-sm-4 control-label wide'])}
			<div class='col-sm-8'>
				{assign "chkDeleted" "0"}
				{if $item_info->deleted}
					{$chkDeleted=1}
				{/if}	
				{form_checkbox([
					'name'=>'is_deleted',
					'id'=>'is_deleted',
					'value'=>1,
					'checked'=>$chkDeleted]
			  )}
			</div>
		</div>
		<!-- Parq End -->

		<!--  GARRISON ADDED 4/21/2013 -->
		{if ($this->config->item('custom1_name') != "")}
		<br/><div class="row">		
				{form_label($this->config->item('custom1_name')|cat: ':', 'custom1',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom1',
						'id'=>'custom1',
						'value'=>$item_info->custom1]
				  )}
				</div>
			</div>
		{/if}

		{if ($this->config->item('custom2_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom2_name')|cat: ':', 'custom2',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom2',
						'id'=>'custom2',
						'value'=>$item_info->custom2]
				  )}
				</div>
			</div>
			{/if}

		{if ($this->config->item('custom3_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom3_name')|cat: ':', 'custom3',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom3',
						'id'=>'custom3',
						'value'=>$item_info->custom3]
				  )}
				</div>
			</div>
		{/if}

		{if ($this->config->item('custom4_name') != "")}
			<br/><div class="row">
				{form_label($this->config->item('custom4_name')|cat: ':', 'custom4',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom4',
						'id'=>'custom4',
						'value'=>$item_info->custom4]
				  )}
				</div>
			</div>
		{/if}

		{if ($this->config->item('custom5_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom5_name')|cat: ':', 'custom5',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom5',
						'id'=>'custom5',
						'value'=>$item_info->custom5]
				  )}
				</div>
			</div>
		{/if}

		{if ($this->config->item('custom6_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom6_name')|cat: ':', 'custom6',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom6',
						'id'=>'custom6',
						'value'=>$item_info->custom6]
				  )}
				</div>
			</div>
		{/if}

		{if ($this->config->item('custom7_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom7_name')|cat: ':', 'custom7',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom7',
						'id'=>'custom7',
						'value'=>$item_info->custom7]
				  )}
				</div>
			</div>
		{/if}

		
		{if ($this->config->item('custom8_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom8_name')|cat: ':', 'custom8',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom8',
						'id'=>'custom8',
						'value'=>$item_info->custom8]
				  )}
				</div>
			</div>
		{/if}

		{if ($this->config->item('custom9_name') != "")}
			<br/><div class="row">	
				{form_label($this->config->item('custom9_name')|cat: ':', 'custom9',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom9',
						'id'=>'custom9',
						'value'=>$item_info->custom9]
				  )}
				</div>
			</div>
		{/if}

			
		{if ($this->config->item('custom10_name') != "")}
			<br/><div class="row">
				{form_label($this->config->item('custom10_name')|cat: ':', 'custom10',['class'=>'col-sm-4 control-label wide'])}
				<div class='col-sm-8'>
				  {form_input([
						'name'=>'custom10',
						'id'=>'custom10',
						'value'=>$item_info->custom10]
				  )}
				</div>
			</div>
		{/if}

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
		var site_url = '{site_url('items')}';
		{literal}
		$("#category").autocomplete(site_url + "/suggest_category",{max:100,minChars:0,delay:10});
	  $("#category").result(function(event, data, formatted){});
		$("#category").search();

		$("#custom1").autocomplete(site_url + "/suggest_custom1",{max:100,minChars:0,delay:10});
	  $("#custom1").result(function(event, data, formatted){});
		$("#custom1").search();

		$("#custom2").autocomplete(site_url + "/suggest_custom2",{max:100,minChars:0,delay:10});
	  $("#custom2").result(function(event, data, formatted){});
		$("#custom2").search();

		$("#custom3").autocomplete(site_url + "/suggest_custom3",{max:100,minChars:0,delay:10});
	  $("#custom3").result(function(event, data, formatted){});
		$("#custom3").search();

		$("#custom4").autocomplete(site_url + "/suggest_custom4",{max:100,minChars:0,delay:10});
	  $("#custom4").result(function(event, data, formatted){});
		$("#custom4").search();

		$("#custom5").autocomplete(site_url + "/suggest_custom5",{max:100,minChars:0,delay:10});
	  $("#custom5").result(function(event, data, formatted){});
		$("#custom5").search();

		$("#custom6").autocomplete(site_url + "/suggest_custom6",{max:100,minChars:0,delay:10});
	  $("#custom6").result(function(event, data, formatted){});
		$("#custom6").search();

		$("#custom7").autocomplete(site_url + "/suggest_custom7",{max:100,minChars:0,delay:10});
	  $("#custom7").result(function(event, data, formatted){});
		$("#custom7").search();

		$("#custom8").autocomplete(site_url + "/suggest_custom8",{max:100,minChars:0,delay:10});
	  $("#custom8").result(function(event, data, formatted){});
		$("#custom8").search();

		$("#custom9").autocomplete(site_url + "/suggest_custom9",{max:100,minChars:0,delay:10});
	  $("#custom9").result(function(event, data, formatted){});
		$("#custom9").search();

		$("#custom10").autocomplete(site_url + "/suggest_custom10",{max:100,minChars:0,delay:10});
	  $("#custom10").result(function(event, data, formatted){});
		$("#custom10").search();
		{/literal}
	/** END GARRISON ADDED **/
		
		$('#item_form').validate({
			submitHandler:function(form) {
				/*
					make sure the hidden field #item_number gets set
					to the visible scan_item_number value
				*/
				// $('#item_number').val($('#scan_item_number').val());
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
				name:"required",
				category:"required",
				cost_price: {
					required:true,
					number:true
				},
				unit_price: {
					required:true,
					number:true
				},
				tax_percent: {
					required:true,
					number:true
				},
				reorder_level: {
					required:true,
					number:true
				}
				
	 		},
			messages: {
				name:"{$this->lang->line('items_name_required')}",
				category:"{$this->lang->line('items_category_required')}",
				cost_price: {
					required:"{$this->lang->line('items_cost_price_required')}",
					number:"{$this->lang->line('items_cost_price_number')}"
				},
				unit_price: {
					required:"{$this->lang->line('items_unit_price_required')}",
					number:"{$this->lang->line('items_unit_price_number')}"
				},
				tax_percent: {
					required:"{$this->lang->line('items_tax_percent_required')}",
					number:"{$this->lang->line('items_tax_percent_number')}"
				},
				reorder_level: {
					required:"{$this->lang->line('items_reorder_level_required')}",
					number:"{$this->lang->line('items_reorder_level_number')}"
				}
			}
		});
	});
</script>