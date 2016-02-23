<div class="row">	
	{form_label($this->lang->line('common_first_name')|cat:':', 'first_name', ['class'=>'col-sm-2 control-label required'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'first_name',
			'id'=>'first_name',
			'value'=>$person_info->first_name]
		)}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_last_name')|cat:':', 'last_name',['class'=>'col-sm-2 control-label required'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'last_name',
			'id'=>'last_name',
			'value'=>$person_info->last_name]
		)}
	</div>
</div>
<br>
<div class="row">	
	{form_input_group_addon([
		'name'=>'email',
		'id'=>'email',
		'type' => 'email',
		'value'=>$person_info->email,
		'placeholder'=>$this->lang->line('common_email'),
		'label' => [
			'text' => $this->lang->line('common_email')|cat:':',
			'class' => "col-sm-2 control-label"
		],
		'left_addon' => '<i class="fa fa-envelope"></i>'
	])}
</div>
<br>
<div class="row">	
	{form_input_group_addon([
		'name'=>'phone_number',
		'id'=>'phone_number',
		'type' => 'text',
		'value'=>$person_info->phone_number,
		'placeholder' => $this->lang->line('common_phone_number'),
		'label' => [
			'text' => $this->lang->line('common_phone_number')|cat:':',
			'class' => "col-sm-2 control-label"
		],
		'left_addon' => '<i class="fa fa-phone"></i>'
	])}
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_address_1')|cat:':', 'address_1', ['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'address_1',
			'id'=>'address_1',
			'value'=>$person_info->address_1])}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_address_2')|cat:':', 'address_2', ['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'address_2',
			'id'=>'address_2',
			'value'=>$person_info->address_2])}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_city')|cat:':', 'city', ['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'city',
			'id'=>'city',
			'value'=>$person_info->city])}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_state')|cat:':', 'state', ['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'state',
			'id'=>'state',
			'value'=>$person_info->state])}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_zip')|cat:':', 'zip', ['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'zip',
			'id'=>'zip',
			'value'=>$person_info->zip])}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_country')|cat:':', 'country',['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_input([
			'name'=>'country',
			'id'=>'country',
			'value'=>$person_info->country])}
	</div>
</div>
<br>
<div class="row">	
	{form_label($this->lang->line('common_comments')|cat:':', 'comments', ['class'=>'col-sm-2 control-label'])}
	<div class='col-sm-10'>
		{form_textarea([
			'name'=>'comments',
			'id'=>'comments',
			'value'=>$person_info->comments,
			'rows'=>'5',
			'cols'=>'17']
		)}
	</div>
</div>