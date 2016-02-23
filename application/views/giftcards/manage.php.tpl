{include file="partial/header.php"}
<script type="text/javascript">
  $(document).ready(function() {
    init_table_sorting();
    enable_select_all();
    enable_checkboxes();
    enable_row_selection();
    enable_search('{site_url("$controller_name/suggest")}','{$this->lang->line("common_confirm_search")}');
    enable_delete('{$this->lang->line($controller_name|cat: "_confirm_delete")}','{$this->lang->line($controller_name|cat: "_none_selected")}');
  });

  function init_table_sorting() {
    //Only init if there is more than one row
    if($('.tablesorter tbody tr').length >1) {
      $("#sortable_table").tablesorter({
        sortList: [[1,0]],
        headers: {
          0: { sorter: false},
          3: { sorter: false}
        }
      });
    }
  }

  function post_giftcard_form_submit(response) {
    if(!response.success) {
      set_feedback(response.message,'danger',true);
    } else {
      //This is an update, just update one row
      if(jQuery.inArray(response.giftcard_id,get_visible_checkbox_ids()) != -1) {
        update_row(response.giftcard_id,'{site_url("$controller_name/get_row")}');
        set_feedback(response.message,'success',false);
      } else {
        //refresh entire table
        do_search(true,function() {
          //highlight new row
          hightlight_row(response.giftcard_id);
          set_feedback(response.message,'success',false);
        });
      }
    }
  }
</script>

<div id="title_bar">
	<div id="title">
    {$this->lang->line('common_list_of')} {$this->lang->line('module_'|cat: $controller_name)}
  </div>
	<div id="new_button" class="text-right">
    {form_button([
        'class'=>'btn btn-info none',
        'title'=>$this->lang->line($controller_name|cat:'_new'),
        'data-url' => "$controller_name/view/-1/?width:$form_width",
        "data-toggle" => "modal",
        "data-target" => "#myModal",
        "data-title" => $this->lang->line("giftcards_basic_information")
      ], 
      $this->lang->line($controller_name|cat: '_new')
    )}
	</div>
</div>
{$this->pagination->create_links()}
<div id="table_action_header">
	<ul>
		<li class="pull-left">
      <span>{anchor("$controller_name/delete",$this->lang->line("common_delete"), ['class'=> 'btn btn-info', 'id'=>'delete'])}</span>
    </li>
		<li class="pull-right">
      <img src='{base_url()}images/spinner_small.gif' alt='spinner' id='spinner' />
      {form_open("$controller_name/search", ['id'=>'search_form'])}
        {form_input([
          'id'=> 'search',
          'name'=>'search'
        ])}
      {form_close()}
		</li>
	</ul>
  <div style="clear: both"></div>
</div>

<div id="table_holder">
  {$manage_table}
</div>
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