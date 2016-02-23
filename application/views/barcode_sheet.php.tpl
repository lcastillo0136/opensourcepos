<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>{$this->lang->line('items_generate_barcodes')}</title>
	</head>
	<body>
		<div class="row">
			{foreach from=$items item=$item}
				{assign var="barcode" value=$item['id']}
				{assign var="text" value=$item['name']}
				{if $item@index % 2 ==0 and $item@index != 0}
	        </div><div class="row">
        {/if}
        {if $item@total > 1}
				<div class="col-sm-6">
				{else}
				<div class="col-sm-12 text-center">
				{/if}
					<img class="" src='{site_url()}barcode?barcode={$barcode}&text={$text}&width=256' />
				</div>
			{/foreach}
		</div>
	</body>
</html>
