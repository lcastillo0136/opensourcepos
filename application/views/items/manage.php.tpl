{include file='partial/header.php'}
<script type="text/javascript">
  $(document).ready(function() {
    init_table_sorting();
    enable_select_all();
    enable_checkboxes();
    enable_row_selection();
    enable_search('{site_url("$controller_name/suggest")}','{$this->lang->line("common_confirm_search")}');
    enable_delete('{$this->lang->line($controller_name|cat:"_confirm_delete")}','{$this->lang->line($controller_name|cat:"_none_selected")}');
    enable_bulk_edit('{$this->lang->line($controller_name|cat:"_none_selected")}');

    $('#generate_barcodes').click(function() {
    	var selected = get_selected_values();
    	if (selected.length == 0) {
    		alert('{$this->lang->line('items_must_select_item_for_barcode')}');
    		return false;
    	}

    	//$(this).attr('href','index.php/items/generate_barcodes/'+selected.join(':'));
      $(this).data('url', '{"$controller_name/generate_barcodes/"}'+selected.join('-'));
    });

    $("#is_serialized, #no_description, #search_custom, #is_deleted").click(function() {
    	$('#items_filter_form').submit();
    });
  });

  function init_table_sorting() {
	  //Only init if there is more than one row
    if($('.tablesorter tbody tr').length >1) {
		  $("#sortable_table").tablesorter({
	      sortList: [[1,0]],
		    headers: {
				  0: { sorter: false},
				  8: { sorter: false},
				  9: { sorter: false}
		    }
		  });
    }
  }

  function post_item_form_submit(response) {
    if(!response.success) {
      set_feedback(response.message,'danger',true);
    } else {
      //This is an update, just update one row
		  if(jQuery.inArray(response.item_id,get_visible_checkbox_ids()) != -1) {
	      update_row(response.item_id,'{site_url("$controller_name/get_row")}');
        set_feedback(response.message,'success',false);
		  } else { //refresh entire table
        do_search(true,function() {
				  //highlight new row
				  hightlight_row(response.item_id);
				  set_feedback(response.message,'success',false);
        });
		  }
    }
  }

  function post_bulk_form_submit(response) {
    if(!response.success) {
      set_feedback(response.message,'danger',true);
    } else {
      var selected_item_ids=get_selected_values();
      for(k=0;k<selected_item_ids.length;k++) {
        update_row(selected_item_ids[k],'{site_url("$controller_name/get_row")}');
		  }
		  set_feedback(response.message,'success',false);
    }
  }

  function show_hide_search_filter(search_filter_section, switchImgTag) {
    var ele = document.getElementById(search_filter_section);
    var imageEle = document.getElementById(switchImgTag);
    var elesearchstate = document.getElementById('search_section_state');
    if(ele.style.display == "block") {
      ele.style.display = "none";
			imageEle.innerHTML = '<img src="{base_url()}images/plus.png" style="border:0;outline:none;padding:0px;margin:0px;position:relative;top:-5px;" >';
      elesearchstate.value="none";
    } else {
      ele.style.display = "block";
      imageEle.innerHTML = '<img src="{base_url()}images/minus.png" style="border:0;outline:none;padding:0px;margin:0px;position:relative;top:-5px;" >';
      elesearchstate.value="block";
    }
  }
</script>

<div id="title_bar">
	<div id="title" >
    {$this->lang->line('common_list_of')} {$this->lang->line('module_'|cat:$controller_name)}
  </div>
	<div id="new_button" class="text-right">
    {form_button([
          'class'=>'btn btn-info none',
          'title'=>$this->lang->line($controller_name|cat:'_new'),
          'data-url' => "$controller_name/view/-1/?width:$form_width",
          "data-toggle" => "modal",
          "data-target" => "#myModal",
          "data-title" => $this->lang->line("items_basic_information")
        ], 
        $this->lang->line($controller_name|cat: '_new')
      )
    }
    {form_button([
          'class'=>'btn btn-info',
          'title'=> "Excel Import",
          'data-url' => "$controller_name/excel_import/?width:$form_width",
          "data-toggle" => "modal",
          "data-target" => "#myModal",
          "data-title" => "Import"
        ], 
        "Excel Import"
      )
    }
    {anchor(site_url('items/excel'), "Download Excel", ['class'=>'btn btn-info', 'title'=> "Download Excel"])}
	</div>
</div>

<div id="titleTextImg" style="background-color:#EEEEEE;height:20px;position:relative;">
	<div style="float:left;vertical-align:text-top;">Search Options :</div>
	<a id="imageDivLink" href="javascript:show_hide_search_filter('search_filter_section', 'imageDivLink');" style="outline:none;">
    {assign var="imgSearch" value=base_url()|cat:'images/plus.png'}
    {assign var="divSearch" value="none"}
    {if isset($search_section_state)}
      {if $search_section_state}
        {$imgSearch=base_url()|cat:'images/minus.png'}
        {$divSearch='block'}
      {/if}
    {/if}
  	<img src="{$imgSearch}" style="border:0;outline:none;padding:0px;margin:0px;position:relative;top:-5px;" />
  </a>
</div>

<div id="search_filter_section" style="display: {$divSearch};background-color:#EEEEEE;">
  {assign var="chkSerialized" value="0"}
  {assign var="chkDescription" value="0"}
  {assign var="chkSearch" value="0"}
  {assign var="chkDeleted" value="0"}
  {if isset($is_serialized) }
    {if $is_serialized}
      {$chkSerialized=1}
    {/if}
  {/if}
  {if isset($no_description) }
    {if $no_description}
      {$chkDescription=1}
    {/if}
  {/if}
  {if isset($search_custom) }
    {if $search_custom}
      {$chkSearch=1}
    {/if}
  {/if}
  {if isset($is_deleted) }
    {if $is_deleted}
      {$chkDeleted=1}
    {/if}
  {/if}
	{form_open("$controller_name/refresh", ['id'=>'items_filter_form'])}
    {form_label($this->lang->line('items_serialized_items')|cat:' '|cat:':', 'is_serialized')}
    {form_checkbox(['name'=>'is_serialized','id'=>'is_serialized','value'=>1,'checked'=> $chkSerialized])|cat:' | '}
    {form_label($this->lang->line('items_no_description_items')|cat:' '|cat:':', 'no_description')}
    {form_checkbox(['name'=>'no_description','id'=>'no_description','value'=>1,'checked'=> $chkDescription])|cat:' | '}
    <!--{form_label($this->lang->line('items_search_custom_items')|cat:' '|cat:':', 'search_custom')}-->
    <!--{form_checkbox(['name'=>'search_custom','id'=>'search_custom','value'=>1,'checked'=> $chkSearch])|cat:' | '}-->
    {form_label($this->lang->line('items_is_deleted')|cat:' '|cat:':', 'is_deleted')}
    {form_checkbox(['name'=>'is_deleted','id'=>'is_deleted','value'=>1,'checked'=> $chkDeleted])}
    {form_hidden("search_section_state", ['id' => "search_section_state", 'value'=>$divSearch ])}
	{form_close()}
</div>
{$this->pagination->create_links()}
<div id="table_action_header">
	<ul>
		<li class="pull-left"><span>{anchor("$controller_name/delete",$this->lang->line("common_delete"),['class'=>'btn btn-info disabled','id'=>'delete'])}</span></li>
		<li class="pull-left"><span>{anchor("#",$this->lang->line("items_bulk_edit"),['class'=>'btn btn-info disabled','id'=>'bulk_edit','title'=>$this->lang->line('items_edit_multiple_items'), "data-url"=>"$controller_name/bulk_edit?width:$form_width", "data-toggle"=>"modal", "data-target"=>"#myModal","data-title"=>$this->lang->line("items_bulk_edit")])}</span></li>
		<li class="pull-left"><span>{anchor("#myModal",$this->lang->line("items_generate_barcodes"),['class'=>'btn btn-info disabled','id'=>'generate_barcodes', 'target' =>'_blank','title'=>$this->lang->line('items_generate_barcodes'), "data-url"=>"$controller_name/generate_barcodes", "data-toggle" => "modal", "data-target" => "#myModal", "data-title" => $this->lang->line("items_generate_barcodes")])}</span></li>
		{if count($stock_locations) > 1}
		  <li class="pull-left"><span>
		  {form_open("$controller_name/refresh", ['id'=>'stock_filter_form'])}
		    {form_dropdown('stock_location',$stock_locations,$stock_location,'id="stock_location" onchange="$(\'#stock_filter_form\').submit();"')}
		  {form_close()}
      </span></li>
		{/if}
		<li class="pull-right">
		  <img src='{base_url()}images/spinner_small.gif' alt='spinner' id='spinner' />
		  {form_open("$controller_name/search",['id'=>'search_form'])}
        {form_input([
          "name" => "search",
          "id" => "search"
        ])}
		  {form_close()}
		</li>
	</ul>
  <div style="clear: both;"></div>
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
{include file='partial/footer.php'}