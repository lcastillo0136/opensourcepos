{include file='partial/header.php'}
<div id="page_title" style="margin-bottom:8px;">{$this->lang->line('reports_reports')}</div>
<div id="welcome_message">
	{$this->lang->line('reports_welcome_message')}
	<ul id="report_list">
		<li>
			<h3>{$this->lang->line('reports_graphical_reports')}</h3>
			<ul>
				{foreach from=$grants item=grant}
					{if !preg_match('/reports_(inventory|receivings)/', $grant['permission_id'])}
						{show_report('graphical_summary',$grant['permission_id'])}
					{/if}
				{/foreach}
			</ul>
		</li>
		<li>
			<h3>{$this->lang->line('reports_summary_reports')}</h3>
			<ul>
				{foreach from=$grants item=grant}
					{if !preg_match('/reports_(inventory|receivings)/', $grant['permission_id'])}
						{show_report('summary',$grant['permission_id'])}
					{/if}
				{/foreach}
			</ul>
		</li>	
		<li>
			<h3>{$this->lang->line('reports_detailed_reports')}</h3>
			<ul>
				{assign var="person_id" $this->session->userdata('person_id')}
				{show_report_if_allowed('detailed', 'sales', $person_id)}
				{show_report_if_allowed('detailed', 'receivings', $person_id)}
				{show_report_if_allowed('specific', 'customer', $person_id, 'reports_customers')}
				{show_report_if_allowed('specific', 'discount', $person_id, 'reports_discounts')}
				{show_report_if_allowed('specific', 'employee', $person_id, 'reports_employees')}
			</ul>
		</li>
		{if $this->Employee->has_grant('reports_inventory', $this->session->userdata('person_id'))}
		<li>
			<h3>{$this->lang->line('reports_inventory_reports')}</h3>
			<ul>
				{show_report('', 'reports_inventory_low')}
				{show_report('', 'reports_inventory_summary')}
			</ul>
		</li>
		{/if}
	</ul>
	{if isset($error)}
		<div class='error_message'>{$error}</div>
	{/if}
{include file='partial/footer.php'}