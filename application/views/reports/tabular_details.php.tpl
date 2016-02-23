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
	<table class="table tablesorter report" id="sortable_table">
		<thead>
			<tr>				
				<th><a href="#" class="expand_all" style="color: #fff;"><i class="fa fa-plus-square"></i></a></th>
				{foreach from=$headers['summary'] item=header}
				<th>{$header}</th>
				{/foreach}
			</tr>
		</thead>
		<tbody>
			{foreach from=$summary_data key=key item=row}
			<tr>
				<td><a href="#" class="expand"><i class="fa fa-plus-square"></i></a></td>
				{foreach from=$row item=cell}
				<td>{$cell}</td>
				{/foreach}
			</tr>
			<tr>
				<td colspan="100">
				<table class="innertable table">
					<thead>
						<tr>
							{foreach from=$headers['details'] item=header}
							<th>{$header}</th>
							{/foreach}
						</tr>
					</thead>
				
					<tbody>
						{foreach from=$details_data[$key] item=row2}
							<tr>
								{foreach from=$row2 item=cell}
								<td>{$cell}</td>
								{/foreach}
							</tr>
						{foreachelse}
							<tr>
								<td class="text-center" colspan="20">No Results</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
				
				</td>
			</tr>
			{foreachelse}
			<tr>
				<td class="text-center" colspan="20">No Results</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
<div id="report_summary">
{foreach from=$overall_summary_data key=name item=value}
	<div class="summary_row">{$this->lang->line('reports_'|cat: $name)}: {to_currency($value)}</div>
{/foreach}
</div>

{if (isset($editable))}
<div id="feedback_bar"></div>
{/if}


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
	{if (isset($editable))}
		function post_form_submit(response, row_id) {
			if(!response.success) {
				set_feedback(response.message,'danger',true);
			} else {
				var row_id = response.id
				$.get('{site_url("reports/get_detailed_"|cat: $editable|cat: "_row")}/'+row_id, function(response) {
					//Replace previous row
					var row = get_table_row(row_id).parent().parent();
					var sign = row.find("a.expand").html();
					row.replaceWith(response);	
					row = get_table_row(row_id).parent().parent();
					update_sortable_table();
					animate_row(row);
					row.find("a.expand").click(expand_handler).html(sign);
					//tb_init(row.find("a.thickbox"));
				});
				set_feedback(response.message,'success',false);
			}
		}
	{/if}

	function expand_handler(event) {
		$(this).parent().parent().next().find('.innertable').toggle();
   
		if (this.open) {
			$(this).html('<i class="fa fa-plus-square"></i>');
		} else {
			$(this).html('<i class="fa fa-minus-square"></i>');
		}
    
    this.open = !this.open;
		return false;
	};

	$(document).ready(function() {
		$(".tablesorter a.expand_all").click(function(event) {
			var $inner_elements = $(".tablesorter .innertable");
			if ($inner_elements.is(":visible")) {
				$inner_elements.hide();
				$("a.expand, a.expand_all").html('<i class="fa fa-plus-square"></i>');
			} else {
				$inner_elements.show();
				$("a.expand, a.expand_all").html('<i class="fa fa-minus-square"></i>');
			} 
			return false;
		});
	
		$(".tablesorter a.expand").click(expand_handler);
	});
</script>
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
{/if}