{include file='partial/header.php'}
<div id="page_title" style="margin-bottom:8px;">{$this->lang->line('recvs_register')}</div>
{if (isset($error))}
  <div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
    <span class="sr-only">Error:</span>{$error}
  </div>
{/if}

{if (isset($warning))}
  <div class="alert alert-warning alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <span class="glyphicon glyphicon-alert" aria-hidden="true"></span>
    <span class="sr-only">Warning:</span>{$warning}
  </div>
{/if}

{if (isset($success))}
  <div class="alert alert-success alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
    <span class="sr-only">Success:</span>{$success}
  </div>
{/if}
<div class="container-fluid">
<div class="row">
  <div class="col-md-9">
    {form_open("receivings/change_mode", ['id'=>'mode_form', 'role'=>'form'])}
  		<div class="row">
        <div class="col-md-6">
          <span>{$this->lang->line('recvs_mode')}</span>
        </div>
        <div class="col-md-6 text-right">
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          {form_dropdown('mode', $modes, $mode, 'onchange="$(\'#mode_form\').submit();"')}
		      {if ($show_stock_locations) }
            <span>{$this->lang->line('recvs_stock_source')}</span>
            {form_dropdown('stock_source',$stock_locations,$stock_source,'onchange="$(\'#mode_form\').submit();"')}
            {if ($mode=='requisition') }
              <span>{$this->lang->line('recvs_stock_destination')}</span>
              {form_dropdown('stock_destination',$stock_locations,$stock_destination,'onchange="$(\'#mode_form\').submit();"')}       
            {/if}
          {/if}
        </div>
      </div>
    {form_close()}
    {form_open("receivings/add",['id'=>'add_item_form'])}
  		<div class="row">
        <div class="col-md-6">
          <label id="item_label" for="item">
            {if ($mode=='receive' or $mode=='requisition') }
              {$this->lang->line('recvs_find_or_scan_item')}
            {else}
              {$this->lang->line('recvs_find_or_scan_item_or_receipt')}
            {/if}
          </label>
        </div>
        <div class="col-md-6 text-right">
          {form_button([
              'class'=>'btn btn-info none',
              'title'=>$this->lang->line('sales_new_item'),
              'data-url' => "items/view/-1/?width:425",
              "data-toggle" => "modal",
              "data-target" => "#myModal",
              "data-title" => $this->lang->line('sales_new_item')
            ], 
            $this->lang->line('sales_new_item')
          )}
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          {form_input(['name'=>'item','id'=>'item','size'=>'40','placeholder'=>$this->lang->line('sales_start_typing_item_name')])}
        </div>
      </div>
    {form_close()}

    <!-- Receiving Items List -->
    <div class="" style="overflow-x: auto;">
      <table id="register" class="table table-hover table-streaped">
    		<thead>
    			<tr>
    				<th style="width:11%;">{$this->lang->line('common_delete')}</th>
    				<th style="width:30%;">{$this->lang->line('recvs_item_name')}</th>
    				<th style="width:11%;">{$this->lang->line('recvs_cost')}</th>
    				<th style="width:5%;">{$this->lang->line('recvs_quantity')}</th>
    				<th style="width:6%;"></th>
    				<th style="width:11%;">{$this->lang->line('recvs_discount')}</th>
    				<th style="width:15%;">{$this->lang->line('recvs_total')}</th>
    				<th style="width:11%;">{$this->lang->line('recvs_edit')}</th>
    			</tr>
    		</thead>
    		<tbody id="cart_contents">
    		{if (count($cart)==0)}
    			<tr><td colspan='8'>
    				<div class='warning_message' style='padding:7px;'>{$this->lang->line('sales_no_items_in_cart')}</div>
    			</td></tr>
    		{else}
    			{foreach from=array_reverse($cart, true) key=line item=item}
            {form_open("receivings/edit_item/$line")}
    	    		<tr>
    	    			<td>
    	    				{anchor("receivings/delete_item/$line",'['|cat: $this->lang->line('common_delete')|cat: ']')}
    	    			</td>
    						<td style="align:center;">
    							{$item['name']}<br /> 
    							[{$item['in_stock']} in {$item['stock_name']}]
                	{form_hidden('location', $item['item_location'])}
                </td>
    						{if ($items_module_allowed && !$mode=='requisition')}
    							<td>{form_input(['name'=>'price','value'=>$item['price'],'size'=>'6'])}</td>
    						{else}
    							<td>{$item['price']}</td>
    							{form_hidden('price',$item['price'])}
    						{/if}
    						<td>
    							{form_input(['name'=>'quantity','value'=>$item['quantity'],'size'=>'2'])}
                	{if ($item['receiving_quantity'] > 1)}
    								</td>
            				<td>x {$item['receiving_quantity']}</td>	
    							{else}
    								</td><td></td>
    							{/if}
    						{if ($items_module_allowed && $mode!='requisition')}
    					    <td>{form_input(['name'=>'discount','value'=>$item['discount'],'size'=>'3'])}</td>
    						{else}
    						  <td>{$item['discount']}</td>
    						  {form_hidden('discount',$item['discount'])}
    						{/if}
    						<td>
    							{to_currency($item['price']*$item['quantity']-$item['price']*$item['quantity']*$item['discount']/100)}
    						</td>
    						<td>
    							{form_submit("edit_item", $this->lang->line('sales_edit_item'))}
    						</td>
    					</tr>
    					<tr>
                {if ($item['allow_alt_description']==1)}
    			        <td style="color: #2F4F4F;">{$this->lang->line('sales_description_abbrv')}:</td>
                {else}
                  <td></td>
                {/if}
    			      <td colspan="2" style="text-align: left;">
    				      {if ($item['allow_alt_description']==1)}
    		        	  {form_input(['name'=>'description','value'=>$item['description'],'size'=>'20'])}
    		        	{elseif ($item['description']!='')} 
    						    {$item['description']}
    		        		{form_hidden('description',$item['description'])}
    		        	{else}
    		        		{$this->lang->line('sales_no_description')}
    		           	{form_hidden('description','')}
    		        	{/if}
    			      </td>
    						<td colspan="5"></td>
    					</tr>
    				{form_close()}
    			{/foreach}
    		{/if}
    		</tbody>
    	</table>
    </div>
  </div>

<!-- Overall Receiving -->

  <div class="col-md-3" style="background-color: #BBBBBB">
    {if (isset($supplier))}
      {$this->lang->line("recvs_supplier")}: <b>{$supplier}</b><br />
      {anchor("receivings/delete_supplier",'['|cat: $this->lang->line('common_delete')|cat: ' '|cat: $this->lang->line('suppliers_supplier')|cat: ']')}
    {else}
      {form_open("receivings/select_supplier", ['id'=>'select_supplier_form'])}
        <label id="supplier_label" for="supplier">{$this->lang->line('recvs_select_supplier')}</label>
        {form_input(['name'=>'supplier','id'=>'supplier','size'=>'30','placeholder'=>$this->lang->line('recvs_start_typing_supplier_name')])}
      {form_close()}
      <div style="margin-top:5px;text-align:center;">
        <h3 style="margin: 5px 0 5px 0">{$this->lang->line('common_or')}</h3>
        {form_button([
            'class'=>'btn btn-info none',
            'title'=>$this->lang->line('recvs_new_supplier'),
            'data-url' => "suppliers/view/-1/?width:425",
            "data-toggle" => "modal",
            "data-target" => "#myModal",
            "data-title" => $this->lang->line('recvs_new_supplier')
          ], 
          $this->lang->line('recvs_new_supplier')
        )}
      </div>
		  <div class="clearfix">&nbsp;</div>
    {/if}
  	{if ($mode != 'requisition')}
  		<div id='sale_details'>
  			<div class="row">
          <div class="col-xs-6">{$this->lang->line('sales_total')}:</div>
  		    <div class="col-xs-6"><strong>{to_currency($total)}</strong></div>
        </div>
  		</div>
  	{/if}
	
    {if (count($cart) > 0)}
      {if ($mode == 'requisition')}
        <div  style='border-top:2px solid #000;' />
        <div id="finish_sale">
          {form_open("receivings/requisition_complete", ['id'=>'finish_receiving_form'])}
            <br />
            <label id="comment_label" for="comment">[$this->lang->line('common_comments')]:</label>
            {form_textarea(['name'=>'comment','id'=>'comment','value'=>$comment,'rows'=>'4','cols'=>'23'])}
            <br /><br />
            <div class='small_button' id='finish_receiving_button' style='float:right;margin-top:5px;'>
              <span>{$this->lang->line('recvs_complete_receiving')}</span>
            </div>
		      {form_close()}  
		      {form_open("receivings/cancel_receiving", ['id'=>'cancel_receiving_form'])}
            <div class='small_button' id='cancel_receiving_button' style='float:left;margin-top:5px;'>
              <span>{$this->lang->line('recvs_cancel_receiving')}</span>
            </div>
          {form_close()}
        </div>
      {else}
        <div id="finish_sale">
          {form_open("receivings/complete", ['id'=>'finish_receiving_form'])}
            <br />
            <label id="comment_label" for="comment">{$this->lang->line('common_comments')}:</label>
            {form_textarea(['name'=>'comment','id'=>'comment','value'=>$comment,'rows'=>'4','cols'=>'23'])}
            <br /><br />
            <table width="100%" class="table">
              {if ($mode == "receive")}
              <tr>
                <td>
                  <label id="recv_invoice_enable_label" for="recv_invoice_enable">{$this->lang->line('recvs_invoice_enable')}</label>
                </td>
                <td>
                {if ($invoice_number_enabled)}
                  {form_checkbox(['name'=>'recv_invoice_enable','id'=>'recv_invoice_enable','size'=>10,'checked'=>'checked'])}
                {else}
								  {form_checkbox(['name'=>'recv_invoice_enable','id'=>'recv_invoice_enable','size'=>10])}
                {/if}
                </td>
              </tr>
              <tr>
                <td>
                  {$this->lang->line('recvs_invoice_number')}:&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                  {form_input(['name'=>'recv_invoice_number','id'=>'recv_invoice_number','value'=>$invoice_number,'size'=>10])}
                </td>
              </tr>
              {/if}
              <tr>
                <td>
                  {$this->lang->line('sales_payment')}:&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                  {form_dropdown('payment_type',$payment_options)}
                </td>
              </tr>
              <tr>
                <td>
                  {$this->lang->line('sales_amount_tendered')}:&nbsp;&nbsp;&nbsp;   
                </td>
                <td>
                  {form_input(['name'=>'amount_tendered','value'=>'','size'=>'10'])}
                </td>
              </tr>
            </table>
            <br />
            <div class='btn btn-info' id='finish_receiving_button'>
              <span>{$this->lang->line('recvs_complete_receiving')}</span>
            </div>
          {form_close()}
	    	  {form_open("receivings/cancel_receiving", ['id'=>'cancel_receiving_form'])}
            <div class="clearfix" style="">&nbsp;</div>
            <div class='btn btn-info' id='cancel_receiving_button'>
              <span>{$this->lang->line('recvs_cancel_receiving')}</span>
            </div>
          {form_close()}
        </div>
        <div class="clearfix" style="">&nbsp;</div>
      {/if}
    {/if}
  </div>
</div>
</div>
  <div class="clearfix" style="margin-bottom:30px;">&nbsp;</div>

  <script type="text/javascript" language="javascript">
  $(document).ready(function() {
    $("#item").autocomplete('{site_url("receivings/item_search")}', {
    	minChars:0,
    	max:100,
     	delay:10,
     	selectFirst: false,
    	formatItem: function(row) {
        return row[1];
      }
    });

    $("#item").result(function(event, data, formatted) {
      $("#add_item_form").submit();
    });

    $('#item').blur(function() {
    });

    $('#comment').keyup(function() {
      $.post('{site_url("receivings/set_comment")}', {literal}{comment: $('#comment').val()}{/literal});
    });

    $('#recv_invoice_number').keyup(function() {
      $.post('{site_url("receivings/set_invoice_number")}', {literal}{recv_invoice_number: $('#recv_invoice_number').val()}{/literal});
    });

    var enable_invoice_number = function() {
		  var enabled = $("#recv_invoice_enable").is(":checked");
		  if (enabled) {
        $("#recv_invoice_number").removeAttr("disabled").parents('tr').show();
		  } else {
        $("#recv_invoice_number").attr("disabled", "disabled").parents('tr').hide();
      }
		  return enabled;
    }

    enable_invoice_number();

    $("#recv_invoice_enable").change(function() {
      var enabled = enable_invoice_number();
      $.post('{site_url("receivings/set_invoice_number_enabled")}', {literal}{recv_invoice_number_enabled: enabled}{/literal});
    });

    $('#item,#supplier').click(function() {
    	$(this).attr('value','');
    });

    $("#supplier").autocomplete('{site_url("receivings/supplier_search")}', {
    	minChars:0,
    	delay:10,
    	max:100,
    	formatItem: function(row) {
        return row[1];
      }
    });

    $("#supplier").result(function(event, data, formatted) {
      $("#select_supplier_form").submit();
    });

    $('#supplier').blur(function() {
    	
    });

    $("#finish_receiving_button").click(function() {
    	if (confirm('{$this->lang->line("recvs_confirm_finish_receiving")}')) {
    		$('#finish_receiving_form').submit();
    	}
    });

    $("#cancel_receiving_button").click(function() {
    	if (confirm('{$this->lang->line("recvs_confirm_cancel_receiving")}')) {
    		$('#cancel_receiving_form').submit();
    	}
    });
  });

  function post_item_form_submit(response) {
  	if(response.success) {
  		$("#item").attr("value",response.item_id);
  		$("#add_item_form").submit();
  	}
  }

  function post_person_form_submit(response) {
  	if(response.success) {
  		$("#supplier").attr("value",response.person_id);
  		$("#select_supplier_form").submit();
  	}
  }
</script>
<div id="feedback_bar"></div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content panel-primary">
      <div class="modal-header panel-heading">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Información de Clientes</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    
  </div>
</div>
{include file='partial/footer.php'}