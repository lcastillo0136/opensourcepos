{include file="partial/header.php"}
{if (isset($error_message))}
	<div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
    <span class="sr-only">Error:</span>{$error_message}
  </div>
{else}
	<div id="receipt_wrapper">
		<div id="receipt_header">
			<div id="company_name">{$this->config->item('company')}</div>
			<div id="company_address">{nl2br($this->config->item('address'))}</div>
			<div id="company_phone">{$this->config->item('phone')}</div>
			<div id="sale_receipt">{$receipt_title}</div>
			<div id="sale_time">{$transaction_time}</div>
		</div>
		
		<table id="receipt_items" class="table table-hover table-streaped">
			<tr>
				<th style="width:50%;">{$this->lang->line('items_item')}</th>
				<th style="width:17%;">{$this->lang->line('common_price')}</th>
				<th style="width:10%;text-align:center;">{$this->lang->line('sales_quantity')}</th>
				<th style="width:6%;"></th>
				<th style="width:16%;text-align:center;">{$this->lang->line('sales_discount')}</th>
				<th style="width:17%;text-align:right;">{$this->lang->line('sales_total')}</th>
			</tr>
			{foreach from=$cart|@array_reverse key=line item=item}
			<tr>
				<td><span class='long_name'>{$item['name']}</span><span class='short_name'>{character_limiter($item['name'],10)}</span></td>
				<td>{to_currency($item['price'])}</td>
				<td style='text-align:center;'>
					{assign "stock_name" ""}
					{if $show_stock_locations}
						{$stock_name=" ["|cat: $item['stock_name']|cat: "]"}
					{/if}
					{$item['quantity']} {$stock_name}</td>
        <td>
        	{assign "receiving_quantity" "1"}
        	{if $item['receiving_quantity'] != 0}
        		{$receiving_quantity=$item['receiving_quantity']}
        	{/if}
        	x {$receiving_quantity}
        </td>	
				<td style='text-align:center;'>{$item['discount']}</td>
				<td style='text-align:right;'>{to_currency($item['price']*$item['quantity']-$item['price']*$item['quantity']*$item['discount']/100)}</td>
			</tr>
	    <tr>
				<td colspan="2" align="center">{$item['description']}</td>
				<td colspan="3" >{$item['serialnumber']}</td>
				<td colspan="1">---------</td>
	    </tr>
			{/foreach}
			<tr>
				<td colspan="4" style='text-align:right;'>{$this->lang->line('sales_total')}</td>
				<td colspan="3" style='text-align:right'>{to_currency($total)}</td>
			</tr>
			{if ($mode!='requisition')}
				<tr>
					<td colspan="4" style='text-align:right;'>{$this->lang->line('sales_payment')}</td>
					<td colspan="3" style='text-align:right'>{$payment_type}</td>
				</tr>
				{if (isset($amount_change))}
					<tr>
						<td colspan="4" style='text-align:right;'>{$this->lang->line('sales_amount_tendered')}</td>
						<td colspan="3" style='text-align:right'>{to_currency($amount_tendered)}</td>
					</tr>
					<tr>
						<td colspan="4" style='text-align:right;'>{$this->lang->line('sales_change_due')}</td>
						<td colspan="3" style='text-align:right'>{$amount_change}</td>
					</tr>
				{/if}
			{/if}
		</table>

		<div id="sale_return_policy">
			{nl2br($this->config->item('return_policy'))}
		</div>
		<div id='barcode'>
			<img src='{site_url("barcode")}?barcode={$receiving_id}&text={$receiving_id}&width=250&height=50' />
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