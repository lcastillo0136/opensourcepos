{include file="partial/header.php"}
<div id="page_title" style="margin-bottom:8px;">
	{$this->lang->line('reports_report_input')}
</div>
{if (isset($error))}
	<div class='error_message'>{$error}</div>
{/if}
<div class="well">
  <form>
    <div class="row">
			<div class="col-md-12">
				{form_label("Export to Excel:", 'reports_sale_type_label', ['class'=>'required'])}
				<div id='report_sale_type'>
					<input type="radio" name="export_excel" id="export_excel_yes" value='1' /> Yes
					<input type="radio" name="export_excel" id="export_excel_no" value='0' checked='checked' /> No
				</div>
			</div>
    </div>
  </form>
</div>

{form_button([
	'name'=>'generate_report',
	'id'=>'generate_report',
	'content'=>$this->lang->line('common_submit'),
	'class'=>'submit_button']
)}

{include file="partial/footer.php"}

<script type="text/javascript" language="javascript">
$(document).ready(function() {
	$("#generate_report").click(function() {
		var export_excel = 0;
		if ($("#export_excel_yes").attr('checked')) {
			export_excel = 1;
		}
		
		window.location = window.location+'/' + export_excel;
	});
});
</script>