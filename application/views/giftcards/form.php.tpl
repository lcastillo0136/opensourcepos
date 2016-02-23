<div id="required_fields_message">
  {$this->lang->line('common_fields_required_message')}
</div>
<ul id="error_message_box"></ul>
{form_open('giftcards/save/'|cat: $giftcard_info->giftcard_id, ['id'=>'giftcard_form'])}
  <fieldset id="giftcard_basic_info" style="padding: 5px;">
    <br/>
    
    <!-- GARRISON ADDED 4/22/2013 -->
    <div class="row">
      {form_label($this->lang->line('giftcards_person_id')|cat: ':', 'name', ['class'=>'required col-sm-4 control-label'])}
      <div class='col-sm-8'>
        {form_input([
          'name'=>'person_id',
          'id'=>'person_id',
          'value'=>$selected_person]
        )}
      </div>
    </div>
    <!-- END GARRISON ADDED -->
    <br/>
    <div class="row">
      {form_label($this->lang->line('giftcards_giftcard_number')|cat: ':', 'name', ['class'=>'required col-sm-4 control-label'])}
      <div class='col-sm-8'>
        {form_input([
          'name'=>'giftcard_number',
          'id'=>'giftcard_number',
          'value'=>$giftcard_number]
        )}
      </div>
    </div>
    <br/>
    <div class="row">
      {form_label($this->lang->line('giftcards_card_value')|cat: ':', 'name', ['class'=>'required col-sm-4 control-label'])}
      <div class='col-sm-8'>
        {form_input([
          'name'=>'value',
          'id'=>'value',
          'value'=>$giftcard_info->value]
        )}
      </div>
    </div>
    <br/>
    {form_submit([
      'name'=>'submit',
      'id'=>'submit',
      'value'=>$this->lang->line('common_submit'),
      'class'=>'submit_button float_right']
    )}
  </fieldset>
{form_close()}
<script type='text/javascript'>
  var search_url = '{site_url("giftcards/person_search")}';
  var messages = {
    giftcard_number: {
      required:"{$this->lang->line('giftcards_number_required')}",
      number:"{$this->lang->line('giftcards_number')}"
    },
    value: {
      required:"{$this->lang->line('giftcards_value_required')}",
      number:"{$this->lang->line('giftcards_value')}"
    }
  };
  var modal_id = '{$modal_id}';
  
  {literal}
  //validation and submit handling
  $(document).ready(function() {
    var format_item = function(row) {
      var result = [row[0], "|", row[1]].join("");
      // if more than one occurence
      if (row[2] > 1 && row[3] && row[3].toString().trim()) {
        // display zip code
        result += ' - ' + row[3];
      }
      return result;
    };
  
    var autocompleter = $("#person_id").autocomplete(search_url, {
      minChars:0,
      delay:15, 
      max:100,
      cacheLength: 1,
      formatItem: format_item,
      formatResult : format_item
    });

    // declare submitHandler as an object.. will be reused
    var submit_form = function(selected_person) { 
      $(this).ajaxSubmit({
        success:function(response) {
          debugger;
          $(modal_id).modal('toggle');
          post_giftcard_form_submit(response);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          debugger;
          selected_customer && autocompleter.val(selected_person);
          post_giftcard_form_submit({message: errorThrown});
        },
        dataType:'json'
      });
    };
  
    $('#giftcard_form').validate({
      submitHandler:function(form) {
        var selected_person = autocompleter.val();
        var selected_person_id = selected_person.replace(/(\w)\|.*/, "$1");
        selected_person_id && autocompleter.val(selected_person_id);
        submit_form.call(form, selected_person);
      },
      errorLabelContainer: "#error_message_box",
      wrapper: "li",
      rules: {
        giftcard_number: {
          required:true,
          number:true
        },
        value: {
          required:true,
          number:true
        }
      },
      messages: messages
    });
  });
  {/literal}
</script>