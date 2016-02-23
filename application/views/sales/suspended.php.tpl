<div class="table-responsive">
<table id="suspended_sales_table" class="table table-hover table-bordered">
	<tr>
		<th>{$this->lang->line('sales_suspended_sale_id')}</th>
		<th>{$this->lang->line('sales_date')}</th>
		<th>{$this->lang->line('sales_customer')}</th>
		<th>{$this->lang->line('sales_comments')}</th>
		<th>{$this->lang->line('sales_unsuspend_and_delete')}</th>
	</tr>
	
	{foreach from=$suspended_sales item=suspended_sale}
		<tr>
			<td>{$suspended_sale['sale_id']}</td>
			<td>{date('m/d/Y',strtotime($suspended_sale['sale_time']))}</td>
			<td>
				{if (isset($suspended_sale['customer_id']))}
					{assign "customer" $this->Customer->get_info($suspended_sale['customer_id'])}
					{$customer->first_name} {$customer->last_name}
				{else}
					&nbsp;
				{/if}
			</td>
			<td>{$suspended_sale['comment']}</td>
			<td class="text-right">
				{form_open('sales/unsuspend')}
          {form_hidden('suspended_sale_id', $suspended_sale['sale_id'])}
          {form_submit([
              'class'=>'btn btn-info submit_button',
              'title'=>$this->lang->line('sales_unsuspend'),
              'name'=>"submit",
              'id'=>"submit"
            ], 
            $this->lang->line('sales_unsuspend')
          )}
        {form_close()}  
      </td>
		</tr>
  {foreachelse}
    <tr>
      <td colspan="5" class="alert-warning text-center">No result</td>
    </tr>
	{/foreach}
</table>
</div>