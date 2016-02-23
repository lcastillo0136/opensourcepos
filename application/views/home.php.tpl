{include file='partial/header.php'}
<br />
<h3>{$this->lang->line('common_welcome_message')}</h3>
<div id="home_module_list">
	{foreach from=$allowed_modules->result() item=module}
		{if (sizeof(explode('_', $module->module_id)) == 1)}
			{assign var="moduleName" value=$module->module_id}
			<div class="module_item">
				<a href="{site_url($module->module_id)}">
				<img src="{base_url()}images/menubar/{$module->module_id}.png" border="0" alt="Menubar Image" /></a><br />
				<a href="{site_url($module->module_id)}">
					{$this->lang->line("module_$moduleName")}
				</a>
			 	- {$this->lang->line("module_$moduleName"|cat: "_desc")}
			</div>
		{/if}
	{/foreach}
</div>
{include file='partial/footer.php'}