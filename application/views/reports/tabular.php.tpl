

{if $export_excel == 1}
	{if ob_start()}
	{/if}
	{include file="partial/header_excel.php"}
{else}
	{include file="partial/header.php"}
{/if} 

<div id="page_title" style="margin-bottom:8px;">{$title}</div>
<div id="page_subtitle" style="margin-bottom:8px;">{$subtitle}</div>
<div id="table_holder">
	<table class="tablesorter report table table-hover table-striped" id="sortable_table">
		<thead>
			<tr>
				{foreach from=$headers item=header}
				<th>{$header}</th>
				{/foreach}
			</tr>
		</thead>
		<tbody>
			{foreach from=$data item=row}
			<tr>
				{foreach from=$row item=cell}
				<td>{$cell}</td>
				{/foreach}
			</tr>
			{foreachelse}
			<tr>
				<td colspan="8">No Results</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
<div id="report_summary">
{foreach from=$summary_data key=name item=value}
	<div class="summary_row">{$this->lang->line('reports_'|cat: $name)}: {to_currency($value)}</div>
{/foreach}
</div>
{if ($export_excel == 1)}
	{include file="partial/footer_excel.php"}
	{assign "content" ob_end_flush()}
	{$filename = trim($filename)}
	{$filename = str_replace(array(' ', '/', '\\'), '', $title)}
	{$filename = $filename|cat: "_Export.xls"}
	{header('Content-type: application/ms-excel')}
	{header('Content-Disposition: attachment; filename='|cat: $filename)}
	{$content}
{else}
	{include file="partial/footer.php"}
<script type="text/javascript" language="javascript">
	function init_table_sorting() {
		//Only init if there is more than one row
		if($('.tablesorter tbody tr').length >1) {
			$("#sortable_table").tablesorter(); 
		}
	}

	$(document).ready(function() {
		init_table_sorting();
	});

</script>
{/if}