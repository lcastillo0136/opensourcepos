{form_open('employees/save/'|cat: $person_info->person_id, ['id'=>'employee_form'])}
  <div id="required_fields_message">{$this->lang->line('common_fields_required_message')}</div>
  <ul id="error_message_box"></ul>
  <ul class="nav nav-tabs nav-justified"  role="tablist">
    <li role="presentation" class="active"><a href="#tabinfo" aria-controls="tabinfo" role="tab" data-toggle="tab">Info</a></li>
    <li role="presentation" ><a href="#tablogin" aria-controls="tablogin" role="tab" data-toggle="tab">Login</a></li>
    <li role="presentation" ><a href="#tabpermission" aria-controls="tabpermission" role="tab" data-toggle="tab">Settings</a></li>
  </ul>
  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="tabinfo">
      <fieldset>
        <br/>
        <h2 class="text-center">{$this->lang->line("employees_basic_information")}</h2>
        <br/>
        {include file='people/form_basic_info.php.tpl'}
        <br>
        {form_submit([
          'name'=>'submit',
          'id'=>'submit',
          'value'=>$this->lang->line('common_submit'),
          'class'=>'submit_button float_right'
        ])}
      </fieldset>
    </div>
    <div role="tabpanel" class="tab-pane" id="tablogin">
      <fieldset>
        <br/>
        <h2 class="text-center">{$this->lang->line("employees_login_info")}</h2>
        <br/>
        <div class="row">
          {form_label($this->lang->line('employees_username')|cat: ':', 'username', ['class'=>'required col-sm-3 control-label'])}
          <div class='col-sm-9'>
            {form_input_group_addon([
              'name'=>'username',
              'id'=>'username',
              'value'=>$person_info->username,
              'placeholder'=> $this->lang->line('employees_username'),
              'left_addon' => '<i class="fa fa-user"></i>'
            ])}
          </div>
        </div>
        {assign "password_label_attributes" ['class' => 'control-label col-sm-3'] }
        {if $person_info->person_id == ""}
          {$password_label_attributes= ['class'=>'required control-label col-sm-3']}
        {/if}
        <br/>
        <div class="row"> 
          {form_label($this->lang->line('employees_password')|cat: ':', 'password',$password_label_attributes)}
          <div class='col-sm-9'>
            {form_input_group_addon([
              'name'=>'password',
              'id'=>'password',
              'type'=> 'password',
              'placeholder'=> $this->lang->line('employees_password'),
              'left_addon' => '<i class="fa fa-key"></i>'
            ])}
          </div>
        </div>
        <br/>
        <div class="row"> 
          {form_label($this->lang->line('employees_repeat_password')|cat: ':', 'repeat_password',$password_label_attributes)}
          <div class='col-sm-9'>
            {form_input_group_addon([
              'name'=>'repeat_password',
              'id'=>'repeat_password',
              'type'=> 'password',
              'placeholder'=> $this->lang->line('employees_password'),
              'left_addon' => '<i class="fa fa-key"></i>'
            ])}
          </div>
        </div>
        {form_submit([
          'name'=>'submit',
          'id'=>'submit',
          'value'=>$this->lang->line('common_submit'),
          'class'=>'submit_button float_right'
        ])}
      </fieldset>
    </div>
    <div role="tabpanel" class="tab-pane" id="tabpermission">
      <fieldset>
        <br/>
        <h2 class="text-center">{$this->lang->line("employees_permission_info")}</h2>
        <br/>
        <p>{$this->lang->line("employees_permission_desc")}</p>
        <ul id="permission_list">
          {foreach from=$all_modules->result() item=module}
          <li>
            <div class="checkbox parents-checkbox">
              <label>{form_checkbox("grants[]",$module->module_id,$this->Employee->has_grant($module->module_id,$person_info->person_id))}{$this->lang->line('module_'|cat: $module->module_id)}<p class="help-block">{$this->lang->line('module_'|cat: $module->module_id|cat: '_desc')}</p></label>
              <!---->
            </div>
            <ul>
              <li>
              {foreach from=$all_subpermissions->result() item=permission}
                {assign "exploded_permission" explode('_', $permission->permission_id)}
                {if $permission->module_id == $module->module_id}
                  {assign "lang_line" $this->lang->line('reports_'|cat: $exploded_permission[1])}
                  {if empty($lang_line)}
                    {$lang_line = $exploded_permission[1]}
                  {/if}
                  
                  <div class="checkbox childs-checkbox">
                    <label>{form_checkbox("grants[]",$permission->permission_id,$this->Employee->has_grant($permission->permission_id,$person_info->person_id))}{$lang_line}</label>
                  </div>
                {/if}
              {/foreach}

              </li>
            </ul>
          </li>
          {/foreach}
        </ul>
        {form_submit([
          'name'=>'submit',
          'id'=>'submit',
          'value'=>$this->lang->line('common_submit'),
          'class'=>'submit_button float_right'
        ])}
      </fieldset>
    </div>
  </div>
{form_close()}
<script type='text/javascript'>

  //validation and submit handling
  $(document).ready(function() {
  	$("ul#permission_list > li > input[name='grants[]']").each(function() {
      var $this = $(this);
      $("ul > li > input", $this.parent()).each(function() {
  	    var $that = $(this);
        var updateCheckboxes = function (checked) {
          if (checked) {
            $that.removeAttr("disabled");
          } else {
            $that.attr("disabled", "disabled");
            $that.removeAttr("checked", "");
          }
        }
        $this.change(function() {
          updateCheckboxes($this.is(":checked"));
        });
      });
    });

    $('#employee_form').on('change', '.parents-checkbox', function() {
      var checkbox_ = $(this).find('input');
      var all_childs = $(this).parent().find('.childs-checkbox');
      all_childs.find('input').prop('checked', checkbox_.is(":checked"));
      if (!checkbox_.is(":checked")) {
        all_childs.find('input').removeAttr('checked');
      } else {
        all_childs.find('input').attr('checked', 'checked');
      }
    });

    $('#employee_form').on('change', '.childs-checkbox', function() {
      
      var parent_li = $(this).closest('li').parent().closest('li');
      var all_childs = parent_li.find('.childs-checkbox input');
      var someone_checked = false;
      all_childs.each(function(i, e) {
        if ($(e).is(":checked")) { someone_checked=true; return false;}
      });

      if (!someone_checked) {
        parent_li.find('.parents-checkbox input').removeAttr('checked').prop('checked', false);
      } else {
        parent_li.find('.parents-checkbox input').attr('checked', 'checked').prop('checked', true);
      }
    });
  	
  	$('#employee_form').validate({
  		submitHandler:function(form) {
  			$(form).ajaxSubmit({
          success:function(response) {
            $('{$modal_id}').modal('toggle');
            post_person_form_submit(response);
          },
          dataType:'json'
        });

  		},
  		errorLabelContainer: "#error_message_box",
   		wrapper: "li",
  		rules: {
  			first_name: "required",
  			last_name: "required",
  			username: {
  				required:true,
  				minlength: 5
  			},
  			password: {
  				{if $person_info->person_id == ""}
  				  required:true,
  				{/if}
  				minlength: 8
  			},	
  			repeat_password: {
   				equalTo: "#password"
  			},
  		  email: "email", 
        "grants[]" : {
      		required : function(element) {
  				  var checked = false;
        		$("ul#permission_list > li > input:checkbox").each(function() {
  						if ($(this).is(":checked")) {
  							var has_children = false;
  					    $("ul > li > input:checkbox", $(this).parent()).each(function() {
  						    //has_children = true;
  						    //checked |= $(this).is(":checked");
              		console.log("checking.. "  + $(this).val() + "  required " + checked);
  					    });
  					    if (has_children && !checked) {
  							  return false;
  		          }
  					  }
        		});
        		console.log("returning " + !checked);
  					return !checked; 
      		},
      		minlength: 1
  	    }
   		},
  		messages: {
     		first_name: "{$this->lang->line('common_first_name_required')}",
     		last_name: "{$this->lang->line('common_last_name_required')}",
     		username: {
     			required: "{$this->lang->line('employees_username_required')}",
     			minlength: "{$this->lang->line('employees_username_minlength')}"
     		},	
  			password: {
          {if $person_info->person_id == ""}
  				  required:"{$this->lang->line('employees_password_required')}",
  				{/if}
  				minlength: "{$this->lang->line('employees_password_minlength')}"
  			},
  			repeat_password: {
  				equalTo: "{$this->lang->line('employees_password_must_match')}"
     		},
     		email: "{$this->lang->line('common_email_invalid_format')}",
     		"grants[]": "{$this->lang->line('employees_permission_error_fill')}"
  		}
  	});
  });
</script>