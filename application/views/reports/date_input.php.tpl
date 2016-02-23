{include file="partial/header.php"}
<div id="page_title" style="margin-bottom:8px;">{$this->lang->line('reports_report_input')}</div>
{if isset($error)}
  <div class='error_message'>{$error}</div>
{/if}



<div class="well">
  <form>
    <div class="row">
      <div class="col-md-12 text-center">
        {form_label($this->lang->line('reports_date_range'), 'report_date_range_label', ['class'=>'required'])}
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-2 text-center">
            {form_radio([
              'type' => 'radio',
              'name' => 'report_type',
              'id' => 'simple_radio',
              'value' => 'simple',
              'checked' => 'checked'
            ])}
          </div>
          <div class="col-md-10">
            {form_dropdown('report_date_range_simple', $report_date_range_simple, '', 'id="report_date_range_simple"')}
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="row">
          <div class="col-md-2 text-center">
            {form_radio([
              'type' => 'radio',
              'name' => 'report_type',
              'id' => 'complex_radio',
              'value' => 'complex'
            ])}
          </div>
          <div class="col-md-10">
            {form_input([
              'id'=> 'range_date',
              'name'=>'range_date',
              'class'=>'disabled',
              'disabled'=> 'disabled'
            ])}
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        {if isset($discount_input)}
          <div>
            <span>
              {$this->lang->line('reports_discount_prefix')}&nbsp;{form_input([
              'name'=>'selected_discount',
              'id'=>'selected_discount',
              'value'=>'0'])}&nbsp;{$this->lang->line('reports_discount_suffix')}
            </span>
          </div>
        {/if}
        {if $mode == 'sale'}
          {form_label($this->lang->line('reports_sale_type'), 'reports_sale_type_label', ['class'=>'required'])}
          <div id='report_sale_type'>
            {form_dropdown('sale_type', [
                'all' => $this->lang->line('reports_all'), 
                'sales' => $this->lang->line('reports_sales'), 
                'returns' => $this->lang->line('reports_returns')
              ], 
              'all', 'id="input_type"'
            )}
          </div>
        {elseif $mode == 'receiving'}
          {form_label($this->lang->line('reports_receiving_type'), 'reports_receiving_type_label', ['class'=>'required'])}
          <div id='report_receiving_type'>
            {form_dropdown('receiving_type', [
                'all' => $this->lang->line('reports_all'), 
                'receiving' => $this->lang->line('reports_receivings'), 
                'returns' => $this->lang->line('reports_returns'),
                'requisitions' => $this->lang->line('reports_requisitions')
              ], 
              'all', 'id="input_type"'
            )}
          </div>
        {elseif $mode == 'requisition'}
          //Do nothing
        {/if}
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
  var start_date = '{$start_date}';
  var end_date = '{$end_date}';

  {literal}
  $(document).ready(function() {
    $('#simple_radio, #complex_radio').change(function() {
      if ($('#simple_radio').is(':checked')) {
        $('#report_date_range_simple').removeClass('disabled').removeAttr('disabled');
        $('#range_date').addClass('disabled').attr('disabled', 'disabled');
      } else {
        $('#report_date_range_simple').addClass('disabled').attr('disabled', 'disabled');
        $('#range_date').removeClass('disabled').removeAttr('disabled');
      }
    });
    $('#simple_radio, #complex_radio').change();

    $("#generate_report").click(function() {		
      var input_type = $("#input_type").val();
		
      if ($("#simple_radio").attr('checked')) {
        window.location = window.location+'/'+$("#report_date_range_simple option:selected").val() + '/' + input_type;
      } else {
        var start_date = $('#range_date').val().split(' - ')[0];
        var end_date = $('#range_date').val().split(' - ')[1];

        if (input_type == null) {
          window.location = window.location+'/'+moment(start_date).format('Y-MM-DD') + '/'+ moment(end_date).format('Y-MM-DD');
        } else {
          window.location = window.location+'/'+moment(start_date).format('Y-MM-DD') + '/'+ moment(end_date).format('Y-MM-DD')+ '/' + input_type; 
        }
      }
    });
	
    $("#start_month, #start_day, #start_year, #end_month, #end_day, #end_year").click(function() {
      $("#complex_radio").attr('checked', 'checked');
    });
	
    $("#report_date_range_simple").click(function() {
      $("#simple_radio").attr('checked', 'checked');
    });
    
    $('#range_date').daterangepicker({
      "startDate": start_date,
      "endDate": end_date
    }, function(start, end, label) { 
      
    });
  });
{/literal}
</script>