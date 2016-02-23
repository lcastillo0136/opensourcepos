<div id="required_fields_message">
	{$this->lang->line('common_fields_required_message')}
</div>
<ul id="error_message_box"></ul>
{form_open('item_kits/save/'|cat: $item_kit_info->item_kit_id, ['id'=>'item_kit_form'])}
	<fieldset id="item_kit_info">
		<br>
		<div class="row">
			{form_label($this->lang->line('item_kits_name')|cat: ':', 'name', ['class'=>'col-sm-3 control-label required'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'name',
					'id'=>'name',
					'value'=>$item_kit_info->name]
				)}
			</div>
		</div>
		<br/>
		<div class="row">
			{form_label($this->lang->line('item_kits_description')|cat: ':', 'description', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_textarea([
					'name'=>'description',
					'id'=>'description',
					'value'=>$item_kit_info->description,
					'rows'=>'5',
					'cols'=>'17']
				)}
			</div>
		</div>
		<br/>

		<div class="row">
			{form_label($this->lang->line('item_kits_add_item')|cat: ':', 'item', ['class'=>'col-sm-3 control-label'])}
			<div class='col-sm-9'>
				{form_input([
					'name'=>'item',
					'id'=>'item'
				])}
			</div>
		</div>
		<br>

		<table id="item_kit_items" class="table table-hover">
			<tr>
				<th>{$this->lang->line('common_delete')}</th>
				<th>{$this->lang->line('item_kits_item')}</th>
				<th>{$this->lang->line('item_kits_quantity')}</th>
			</tr>
	
			{foreach from=$this->Item_kit_items->get_info($item_kit_info->item_kit_id) item=item_kit_item}
			<tr>
				{assign "item_info" $this->Item->get_info($item_kit_item['item_id'])}
				<td><a href="#" onclick='return deleteItemKitRow(this);'>X</a></td>
				<td>{$item_info->name}</td>
				<td><input class='quantity' id='item_kit_item_{$item_kit_item['item_id']}' type='text' size='3' name=item_kit_item[{$item_kit_item['item_id']}] value='{$item_kit_item['quantity']}'/></td>
			</tr>
			{/foreach}
		</table>
		{form_submit([
			'name'=>'submit',
			'id'=>'submit',
			'value'=>$this->lang->line('common_submit'),
			'class'=>'submit_button float_right']
		)}
	</fieldset>
{form_close()}
<script type='text/javascript'>

	$("#item").autocomplete('{site_url("items/item_search")}', {
		minChars:0,
		max:100,
		selectFirst: false,
   	delay:10,
		formatItem: function(row) {
			return row[1];
		}
	});

	$("#item").result(function(event, data, formatted) {
		$("#item").val("");
		
		if ($("#item_kit_item_"+data[0]).length ==1) {
			$("#item_kit_item_"+data[0]).val(parseFloat($("#item_kit_item_"+data[0]).val()) + 1);
		} else {
			$("#item_kit_items").append("<tr><td><a href='#' onclick='return deleteItemKitRow(this);'>X</a></td><td>"+data[1]+"</td><td><input class='quantity' id='item_kit_item_"+data[0]+"' type='text' size='3' name=item_kit_item["+data[0]+"] value='1'/></td></tr>");
		}
	});

	//validation and submit handling
	$(document).ready(function() {
		$('#item_kit_form').validate({
			submitHandler:function(form) {
				$(form).ajaxSubmit({
					success:function(response) {
						$('{$modal_id}').modal('toggle');
						post_item_kit_form_submit(response);
					},
					dataType:'json'
				});
			},
			errorLabelContainer: "#error_message_box",
 			wrapper: "li",
			rules: {
				name:"required",
				category:"required"
			},
			messages: {
				name:"{$this->lang->line('items_name_required')}",
				category:"{$this->lang->line('items_category_required')}"
			}
		});
	});

	function deleteItemKitRow(link) {
		$(link).parent().parent().remove();
		return false;
	}
</script>