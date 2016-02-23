{include file="partial/header.php"}
{if (isset($error_message))}
	<h1 style="text-align: center;">{$error_message}</h1>
{else}
	<div id="receipt_wrapper">
		<div id="receipt_header">
			<div id="company_name">{$this->config->item('company')}</div>
			<div id="company_address">{nl2br($this->config->item('address'))}</div>
			<div id="company_phone">{$this->config->item('phone')}</div>
			<div id="sale_receipt">{$receipt_title}</div>
			<div id="sale_time">{$transaction_time}</div>
		</div>
		<div id="receipt_general_info">
			{if (isset($customer))}
				<div id="customer">{$this->lang->line('customers_customer')}: {$customer}</div>
			{/if}
			<div id="sale_id">{$this->lang->line('sales_id')}: {$sale_id}</div>
			{if (!empty($invoice_number))}
				<div id="invoice_number">{$this->lang->line('recvs_invoice_number')}: {$invoice_number}</div>	
			{/if}
			<div id="employee">{$this->lang->line('employees_employee')}: {$employee}</div>
		</div>
		<div class="table-responsive">
			<table id="receipt_items" class="table table-hover table-streaped">
				<tr>
					<th style="width:25%;">{$this->lang->line('sales_item_number')}</th>
					<th style="width:25%;">{$this->lang->line('items_item')}</th>
					<th style="width:17%;">{$this->lang->line('common_price')}</th>
					<th style="width:16%;text-align:center;">{$this->lang->line('sales_quantity')}</th>
					<th style="width:16%;text-align:center;">{$this->lang->line('sales_discount')}</th>
					<th style="width:17%;text-align:right;">{$this->lang->line('sales_total')}</th>
				</tr>
				{foreach from=$cart|@array_reverse key=line item=item}
				<tr>
					<td>{$item['item_number']}</td>
					<td><span class='long_name'>{$item['name']}</span><span class='short_name'>{character_limiter($item['name'],10)}</span></td>
					<td>{to_currency($item['price'])}</td>
					<td style='text-align:center;'>
						{assign "stock_name" ""}
						{if $show_stock_locations}
							{$stock_name=" ["|cat: $item['stock_name']|cat: "]"}
						{/if}
						{$item['quantity']} {$stock_name}
					</td>
					<td style='text-align:center;'>{$item['discount']}</td>
					<td style='text-align:right;'>{to_currency($item['price']*$item['quantity']-$item['price']*$item['quantity']*$item['discount']/100)}</td>
				</tr>
				<tr>
		    	<td colspan="2" align="center">{$item['description']}</td>
					<td colspan="2">{$item['serialnumber']}</td>
					<td colspan="2">&nbsp;</td>
		    </tr>
	    	{/foreach}
				<tr>
					<td colspan="4" style='text-align:right;border-top:2px solid #000000;'>{$this->lang->line('sales_sub_total')}</td>
					<td colspan="2" style='text-align:right;border-top:2px solid #000000;'>{to_currency($subtotal)}</td>
				</tr>
				{foreach from=$taxes key=name item=value}
				<tr>
					<td colspan="4" style='text-align:right;'>{$name}:</td>
					<td colspan="2" style='text-align:right;'>{to_currency($value)}</td>
				</tr>
				{/foreach}
				<tr>
					<td colspan="4" style='text-align:right;'>{$this->lang->line('sales_total')}</td>
					<td colspan="2" style='text-align:right'>{to_currency($total)}</td>
				</tr>
		    <tr><td colspan="6">&nbsp;</td></tr>
				{foreach from=$payments key=payment_id item=payment}
				<tr>
					<td colspan="2" style="text-align:right;">{$this->lang->line('sales_payment')}</td>
					<td colspan="2" style="text-align:right;">{$splitpayment=explode(':',$payment['payment_type'])} {$splitpayment[0]}</td>
					<td colspan="2" style="text-align:right">{to_currency( $payment['payment_amount'] * -1 )}</td>
		    </tr>
				{/foreach}
	    	<tr><td colspan="6">&nbsp;</td></tr>
				<tr>
					<td colspan="4" style='text-align:right;'>{$this->lang->line('sales_change_due')}</td>
					<td colspan="2" style='text-align:right'>{$amount_change}</td>
				</tr>
			</table>
		</div>
		<div id="sale_return_policy">
			{nl2br($this->config->item('return_policy'))}
		</div>
		<div id='barcode'>
			<img src='{site_url("barcode")}?barcode={$sale_id}&text={$sale_id}&width=250&height=50' />
		</div>
	</div>

	{if ($this->Appconfig->get('print_after_sale'))}
	<script type="text/javascript">
		$(window).load(function() {
			window.print();
		});
	</script>
	{/if}
{/if}
{include file="partial/footer.php"}