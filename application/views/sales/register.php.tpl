{include file="partial/header.php"}
<div id="page_title" style="margin-bottom: 8px;">{$this->lang->line('sales_register')}</div>
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
		{form_open("sales/change_mode", ['id'=>'mode_form', 'role'=>'form'])}
			<div class="row">
				<div class="col-md-6">
					<span>{$this->lang->line('sales_mode')}</span>
				</div>
				<div class="col-md-6 text-right">
					{form_button([
		          'class'=>'btn btn-info none',
		          'title'=>$this->lang->line('sales_suspended_sales'),
		          'data-url' => "sales/suspended/?width:425",
		          "data-toggle" => "modal",
		          "data-target" => "#myModal",
		          "data-title" => $this->lang->line('sales_suspended_sales')
		        ], 
		        $this->lang->line('sales_suspended_sales')
		      )}
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				{if (count($stock_locations) > 1)}
					<span>{$this->lang->line('sales_stock_location')}</span>
					{form_dropdown('stock_location',$stock_locations,$stock_location,'onchange="$(\'#mode_form\').submit();"')}
				{/if}
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					{form_dropdown('mode',$modes,$mode,'onchange="$(\'#mode_form\').submit();"')}
				</div>
			</div>
		{form_close()}
		{form_open("sales/add", ['id'=>'add_item_form', 'role'=>'form'])}
			<div class="row">
				<div class="col-md-6">
					<label id="item_label" for="item">
						{$this->lang->line('sales_find_or_scan_item_or_receipt')}
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
					{form_input(['name'=>'item','id'=>'item','size'=>'40', 'placeholder'=>$this->lang->line('sales_start_typing_item_name')])}
				</div>
			</div>
		{form_close()}
		<div class="" style="overflow-x: auto;">
			<table id="register" class="table table-hover table-streaped">
				<thead>
					<tr>
						<th style="width: 11%;">{$this->lang->line('common_delete')}</th>
						<th style="width: 30%;">{$this->lang->line('sales_item_number')}</th>
						<th style="width: 30%;">{$this->lang->line('sales_item_name')}</th>
						<th style="width: 11%;">{$this->lang->line('sales_price')}</th>
						<th style="width: 11%;">{$this->lang->line('sales_quantity')}</th>
						<th style="width: 11%;">{$this->lang->line('sales_discount')}</th>
						<th style="width: 15%;">{$this->lang->line('sales_total')}</th>
						<th style="width: 11%;">{$this->lang->line('sales_edit')}</th>
					</tr>
				</thead>
				<tbody id="cart_contents">
					{if (count($cart)==0)}
		      <tr>
						<td colspan='8'>
							<div class='warning_message' style='padding: 7px;'>{$this->lang->line('sales_no_items_in_cart')}</div>
						</td>
					</tr>
					{else}
						{foreach from=$cart key=line item=item}
							{form_open("sales/edit_item/$line", ["role"=>"form"])}
								<tr>
									<td>{anchor("sales/delete_item/$line",'['|cat: $this->lang->line('common_delete')|cat: ']')}</td>
									<td>{$item['item_number']}</td>
									<td style="align: center;">{$item['name']}<br /> [{$item['in_stock']} in {$item['stock_name']}]
										{form_hidden('location', $item['item_location'])}
									</td>
									{if ($items_module_allowed)}
										<td>{form_input(['name'=>'price','value'=>$item['price'],'size'=>'6'])}</td>
									{else}
										<td>{to_currency($item['price'])}</td>
										{form_hidden('price',$item['price'])}
									{/if}
									<td>
									{if ($item['is_serialized']==1)}
		        				{$item['quantity']}
		        				{form_hidden('quantity',$item['quantity'])}
		        			{else}
		        				{form_input(['name'=>'quantity','value'=>$item['quantity'],'size'=>'2'])}
		        			{/if}
									</td>
									<td>{form_input(['name'=>'discount','value'=>$item['discount'],'size'=>'3'])}</td>
									<td>{to_currency($item['price']*$item['quantity']-$item['price']*$item['quantity']*$item['discount']/100)}</td>
									<td>{form_submit("edit_item", $this->lang->line('sales_edit_item'), "id='edit_item' class='btn btn-info'")}</td>
								</tr>
								<tr>
									{if ($item['allow_alt_description']==1)}
									<td style="color: #2F4F4F;">{$this->lang->line('sales_description_abbrv')}:</td>
									{/if}
									<td colspan=2 style="text-align: left;">
										{if ($item['allow_alt_description']==1)}
			        				{form_input(['name'=>'description','value'=>$item['description'],'size'=>'20'])}
			        			{else}
			        				{if ($item['description']!='')}
												{$item['description']}
			        					{form_hidden('description',$item['description'])}
			        				{else}
			        					{$this->lang->line('sales_no_description')}
		           					{form_hidden('description','')}
			        				{/if}
			        			{/if}
									</td>
									<td>&nbsp;</td>
									<td style="color: #2F4F4F;">
									{if ($item['is_serialized']==1)}
			        			{$this->lang->line('sales_serial')}:
		        			{/if}
									</td>
									<td colspan="4" style="text-align: left;">
									{if ($item['is_serialized']==1)}
			        			{form_input(['name'=>'serialnumber','value'=>$item['serialnumber'],'size'=>'20'])}
									{else}
										{form_hidden('serialnumber', '')}
									{/if}
									</td>
								</tr>
								<tr style="height: 3px">
									<td colspan=8 style="background-color: white"></td>
								</tr>
							{form_close()}
						{/foreach}
					{/if}
				</tbody>
			</table>
		</div>	
	</div>

	<div class="col-md-3" style="background-color: #BBBBBB">
		<br/>
		{if (isset($customer))}
			<span>{$this->lang->line("sales_customer")}: 
				<br/></span>&nbsp;&nbsp;<label>{$customer}</label>
			{anchor("sales/remove_customer",'['|cat: $this->lang->line('common_remove')|cat: ' '|cat: $this->lang->line('customers_customer')|cat: ']')}
		{else}
			{form_open("sales/select_customer", ['id'=>'select_customer_form', "role"=>"form"])}
				<label id="customer_label" for="customer">{$this->lang->line('sales_select_customer')}</label>
				{form_input(['name'=>'customer','id'=>'customer','size'=>'30','placeholder'=>$this->lang->line('sales_start_typing_customer_name')])}
			{form_close()}
			<div style="margin-top: 5px; text-align: center;">
				<h3 style="margin: 5px 0 5px 0">{$this->lang->line('common_or')}</h3>
				{form_button([
	          'class'=>'btn btn-info none',
	          'title'=>$this->lang->line('sales_new_customer'),
	          'data-url' => "customers/view/-1/?width:425",
	          "data-toggle" => "modal",
	          "data-target" => "#myModal",
	          "data-title" => $this->lang->line('sales_new_customer')
	        ], 
	        $this->lang->line('sales_new_customer')
	      )}
			</div>
			<div class="clearfix">&nbsp;</div>
		{/if}
		<div id='sale_details'>
			<div class="row">
				<div class="col-xs-6">{$this->lang->line('sales_sub_total')}:</div>
				<div class="col-xs-6"><strong>{to_currency($subtotal)}</strong></div>
			</div>

			{foreach from=$taxes key=name item=value}
				<div class="row">
					<div class="col-xs-6">{$name}:</div>
					<div class="col-xs-6"><strong>{to_currency($value)}</strong></div>
				</div>
			{/foreach}

			<div class="row">
				<div class="col-xs-6">{$this->lang->line('sales_total')}:</div>
				<div class="col-xs-6"><strong>{to_currency($total)}</strong></div>
			</div>
		</div>

		{* Only show this part if there are Items already in the sale. *}
		{if (count($cart) > 0)}
		<div>
			{form_open("sales/cancel_sale", ['id'=>'cancel_sale_form', "role"=>"form"])}
				<div class='btn btn-info' id='cancel_sale_button' style='margin-top: 5px;'>
					<span>{$this->lang->line('sales_cancel_sale')}</span>
				</div>
			{form_close()}
		</div>

		<div class="clearfix" style="margin-bottom: 1px;">&nbsp;</div>
		{* // Only show this part if there is at least one payment entered. *}
		{if (count($payments) > 0)}
		<div id="finish_sale">
			{form_open("sales/complete", ['id'=>'finish_sale_form', "role"=>"form"])}
				<label id="comment_label" for="comment">{$this->lang->line('common_comments')}:</label>
				{form_textarea(['name'=>'comment', 'id' => 'comment', 'value'=>$comment,'rows'=>'4','cols'=>'23'])}
				<br />
				<br />
					
				{if (!empty($customer_email))}
					{$this->lang->line('sales_email_receipt')}: {form_checkbox([
				    'name'        => 'email_receipt',
				    'id'          => 'email_receipt',
				    'value'       => '1',
				    'checked'     => $email_receipt
			    ])}<br />({$customer_email})<br />
				{/if}
					 
				{if ($payments_cover_total)}
					<div class='btn btn-info' id='finish_sale_button' style='float:left;margin-top:5px;'><span>{$this->lang->line('sales_complete_sale')}</span></div>
				{/if}
				<div class='btn btn-info' id='suspend_sale_button' style='float:right;margin-top:5px;'><span>{$this->lang->line('sales_suspend_sale')}</span></div><br/>
			{form_close()}
		</div>
		{/if}

	  <table width="100%" class="table table-hover table-straped">
			<tr>
				<td style="width: 55%;">
					<div class="pull-left">{$this->lang->line('sales_payments_total')}:</div>
				</td>
				<td style="width: 45%; text-align: right;">
					<div class="pull-left" style="text-align: right; font-weight: bold;">{to_currency($payments_total)}</div>
				</td>
			</tr>
			<tr>
				<td style="width: 55%;">
					<div class="pull-left">{$this->lang->line('sales_amount_due')}:</div>
				</td>
				<td style="width: 45%; text-align: right;">
					<div class="pull-left" style="text-align: right; font-weight: bold;">{to_currency($amount_due)}</div>
				</td>
			</tr>
		</table>

		<div id="payment_details">
			<div>
				{form_open("sales/add_payment", ['id'=>'add_payment_form', "role"=>"form"])}
				<table width="100%" class="table table-hover table-straped">
					{if ($mode == "sale")}
					<tr>
						<td>
							{form_label($this->lang->line('sales_invoice_enable'), 'sales_invoice_enable')}
						</td>
						<td>
							{if ($invoice_number_enabled)}
								{form_checkbox(['name'=>'sales_invoice_enable','id'=>'sales_invoice_enable','size'=>10,'checked'=>'checked'])}
							{else}
								{form_checkbox(['name'=>'sales_invoice_enable','id'=>'sales_invoice_enable','size'=>10])}
							{/if}
						</td>
					</tr>
					<tr>
						<td>
							{$this->lang->line('sales_invoice_number')|cat: ':   '}
						</td>
						<td>
							{form_input(['name'=>'sales_invoice_number','id'=>'sales_invoice_number','value'=>$invoice_number,'size'=>10])}
						</td>
					</tr>
					{/if}
					<tr>
						<td>
							{$this->lang->line('sales_payment')|cat: ':   '}
						</td>
						<td>
							{form_dropdown( 'payment_type', $payment_options, [], 'id="payment_types"' )}
						</td>
					</tr>
					<tr>
						<td><span id="amount_tendered_label">{$this->lang->line( 'sales_amount_tendered' )}: </span>
						</td>
						<td>
							{form_input([ 'name'=>'amount_tendered', 'id'=>'amount_tendered', 'value'=>to_currency_no_money($amount_due), 'size'=>'10' ] )}
						</td>
					</tr>
				</table>
				<div class="text-right" style="margin-right: 10px;">
					<div class='btn btn-info' id='add_payment_button'>
						<span>{$this->lang->line('sales_add_payment')}</span>
					</div>
				</div>
				{form_close()}
			</div>

			{* // Only show this part if there is at least one payment entered. *}
			{if (count($payments) > 0)}
			<br/>
			<table id="register" class="table table-hover table-straped">
				<thead>
					<tr>
						<th style="width: 11%;">{$this->lang->line('common_delete')}</th>
						<th style="width: 60%;">{$this->lang->line('sales_payment_type')}</th>
						<th style="width: 18%;">{$this->lang->line('sales_payment_amount')}</th>
					</tr>
				</thead>
				<tbody id="payment_contents">
					{foreach from=$payments key=payment_id item=payment}
						{form_open("sales/edit_payment/$payment_id", ['id'=>'edit_payment_form'|cat: $payment_id])}
	            <tr>
								<td>{anchor( "sales/delete_payment/$payment_id", '['|cat: $this->lang->line('common_delete')|cat: ']' )}</td>
								<td>{$payment['payment_type']}</td>
								<td style="text-align: right;">{to_currency( $payment['payment_amount'] )}</td>
							</tr>
						{form_close()}
					{/foreach}
				</tbody>
			</table>
			<br />
			{/if}
		</div>
		{/if}
		<br/>
	</div>
</div>
</div>
<div class="clearfix" style="margin-bottom: 30px;">&nbsp;</div>

<script type="text/javascript" language="javascript">
	var search_url = '{site_url("sales/item_search")}';
	var search_customer = '{site_url("sales/customer_search")}';
	var post_comment = '{site_url("sales/set_comment")}';
 	var post_invoice_number = '{site_url("sales/set_invoice_number")}';
 	var post_invoice_enabled = '{site_url("sales/set_invoice_number_enabled")}';
 	var post_email_receipt = '{site_url("sales/set_email_receipt")}';
 	var confirm_finish_sale = '{$this->lang->line("sales_confirm_finish_sale")}';
 	var confirm_suspend_sale = '{$this->lang->line("sales_confirm_suspend_sale")}';
 	var action_sale_suspend = '{site_url("sales/suspend")}';
 	var confirm_sale_cancel = '{$this->lang->line("sales_confirm_cancel_sale")}';

	{literal}
	$(document).ready(function() {
    $("#item").autocomplete(search_url, {
    	minChars:0,
    	max:100,
    	selectFirst: false,
     	delay:10,
    	formatItem: function(row) {
				return row[1];
			}
    });

    $("#item").result(function(event, data, formatted) {
			$("#add_item_form").submit();
    });

    $("#customer").autocomplete(search_customer, {
    	minChars:0,
    	delay:10,
    	max:100,
    	formatItem: function(row) {
				return row[1];
			}
    });

    $("#customer").result(function(event, data, formatted) {
			$("#select_customer_form").submit();
    });
	
		$('#comment').keyup(function() {
			$.post(post_comment, {comment: $('#comment').val()});
		});

		$('#sales_invoice_number').keyup(function() {
			$.post(post_invoice_number, {sales_invoice_number: $('#sales_invoice_number').val()});
		});

		var enable_invoice_number = function() {
			var enabled = $("#sales_invoice_enable").is(":checked");
			if (enabled) {
				$("#sales_invoice_number").removeAttr("disabled").parents('tr').show();
			} else {
				$("#sales_invoice_number").attr("disabled", "disabled").parents('tr').hide();
			}
			return enabled;
		}

		enable_invoice_number();
	
		$("#sales_invoice_enable").change(function() {
			var enabled = enable_invoice_number();
			$.post(post_invoice_enabled, {sales_invoice_number_enabled: enabled});
		});
	
		$('#email_receipt').change(function() {
			$.post(post_email_receipt, {email_receipt: $('#email_receipt').is(':checked') ? '1' : '0'});
		});
	
    $("#finish_sale_button").click(function() {
    	if (confirm(confirm_finish_sale)) {
    		$('#finish_sale_form').submit();
    	}
    });

		$("#suspend_sale_button").click(function() { 	
			if (confirm(confirm_suspend_sale)) {
				$('#finish_sale_form').attr('action', action_sale_suspend);
    		$('#finish_sale_form').submit();
    	}
		});

    $("#cancel_sale_button").click(function() {
    	if (confirm(confirm_sale_cancel)) {
    		$('#cancel_sale_form').submit();
    	}
    });

		$("#add_payment_button").click(function() {
	  	$('#add_payment_form').submit();
    });

		$("#payment_types").change(check_payment_type_gifcard).ready(check_payment_type_gifcard);
	});
	{/literal}

	function post_item_form_submit(response) {
		if(response.success) {
      var $stock_location = $("select[name='stock_location']").val();
      $("#item_location").val($stock_location);
			$("#item").val(response.item_id);
			$("#add_item_form").submit();
		}
	}

	function post_person_form_submit(response) {
		if(response.success) {
			$("#customer").val(response.person_id);
			$("#select_customer_form").submit();
		}
	}

	function check_payment_type_gifcard() {
		if ($("#payment_types").val() == "{$this->lang->line('sales_giftcard')}") {
			$("#amount_tendered_label").html("{$this->lang->line('sales_giftcard_number')}");
			$("#amount_tendered").val('');
			$("#amount_tendered").focus();
		} else {
			$("#amount_tendered_label").html("{$this->lang->line('sales_amount_tendered')}");		
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
{include file="partial/footer.php"}