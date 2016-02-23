{include file="partial/header.php"}
<div id="page_title" style="margin-bottom:8px;">{$title}</div>
<div id="page_subtitle" style="margin-bottom:8px;">{$subtitle}</div>
<div style="text-align: center;">
  <script type="text/javascript">
    var swfUrl = "{base_url()}open-flash-chart.swf";
    var data_file = "{$data_file}"
    {literal}
    swfobject.embedSWF(
      swfUrl, "chart",
      "800", "400", "9.0.0", "expressInstall.swf",
      {"data-file": data_file} 
    );
    {/literal}
  </script>
</div>
<div id="chart_wrapper">
	<div id="chart"></div>
</div>
<div id="report_summary">
  {foreach from=$summary_data key=name item=value}
    <div class="summary_row">
      {$this->lang->line('reports_'|cat: $name)}: {to_currency($value)}
    </div>
  {/foreach}
</div>
{include file="partial/footer.php"}