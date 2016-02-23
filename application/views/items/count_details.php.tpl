{form_open('items/save_inventory/'|cat: $item_info->item_id, ['id'=>'item_form'])}
<fieldset id="inv_item_basic_info">
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
      {form_dropdown('stock_location',$stock_locations,current($stock_locations),'onchange="display_stock(this.value)" readonly="readonly" disabled="disabled"')}
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
</fieldset>
{form_close()}

<div class="table-responsive">
    <table id="inventory_result" border="0" align="center" class="table table-hover">
      <thead>
        <tr bgcolor="#FF0033" align="center" style="font-weight:bold">
          <td colspan="4" style="color: #FFF; text-shadow: 0px 0px 3px #000;">Inventory Data Tracking</td>
        </tr>
        <tr align="center" style="background-color: #EEE">
          <td width="15%">Date</td>
          <td width="25%">Employee</td>
          <td width="15%">In/Out Qty</td>
          <td width="45%">Remarks</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="4" align="center">No data available</td>
        </tr>
      </tbody>
    </table>
  </div>
<script type='text/javascript'>
$(document).ready(function() {
    display_stock({json_encode(key($stock_locations))});
});

function display_stock(location_id) {
    var item_quantities= {json_encode($item_quantities )};
    
    var inventory_data = {json_encode($inventory_array)};
    var employee_data = {json_encode($employee_name)};

    {literal}
    $("#quantity").val(item_quantities[location_id]);
    var $table = $("#inventory_result tbody");
    
    if (inventory_data.length > 0) {
        $table_html= $('<tbody></tbody>');
        $(inventory_data).each(function(i, e) {
            var data = e;
             if(data['trans_location'] == location_id) {
                var tr = $('<tr></tr>');
                tr.attr({"bgColor": "", 'align': "center"})

                moment.locale("{$this->config->item('language')}");
                var obj = moment(data["trans_date"]);
                var tds = $('<td title="' + obj.format('hh:mm:ss a') + '">' + obj.format('D/MMM/YYYY') + '</td><td>' + employee_data[i] + '</td><td>' + data['trans_inventory'] + '</td><td>' + data['trans_comment'] + '</td>');

                tr.append(tds);

                $table_html.append(tr);
             }
        });
        if ($table_html.find('tr').length > 0) {
            $table.html('');
            $table.append($table_html.html());
        }
    }

    {/literal}
}  
</script>