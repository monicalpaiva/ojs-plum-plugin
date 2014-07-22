{**
 * plugins/generic/plumAnalytics/settingsForm.tpl
 *
 * Copyright (c) 2014 University of Pittsburgh
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Plum Analytics plugin settings
 *
 *}
{strip}
{assign var="pageTitle" value="plugins.generic.plumAnalytics.manager.plumAnalyticsSettings"}
{include file="common/header.tpl"}
{/strip}
<div id="plumAnalyticsSettings">
<div id="description">{translate key="plugins.generic.plumAnalytics.manager.settings.description"}</div>

<div class="separator"></div>

<br />

<form method="post" action="{plugin_url path="settings"}">
{include file="common/formErrors.tpl"}
<script type="text/javascript">
{literal}
function setWidgetTypeOptions () {
{/literal}
	var allInputIds = {$allPlumWidgetSettings|@json_encode};
	var validInputIds ={$validPlumWidgetSettings|@json_encode};
{literal}
	for (x in allInputIds) {
		obj = document.getElementById('plumAnalytics'+allInputIds[x].charAt(0).toUpperCase()+allInputIds[x].slice(1))
		if (obj && allInputIds[x] != 'widgetType') {
			obj.disabled = false;
		}
	}
	if (document.getElementById('plumAnalyticsWidgetType').value != '') {
		for (x in allInputIds) {
			if (validInputIds[document.getElementById('plumAnalyticsWidgetType').value].indexOf(allInputIds[x]) == -1 && validInputIds['_all'].indexOf(allInputIds[x]) == -1) {
				obj = document.getElementById('plumAnalytics'+allInputIds[x].charAt(0).toUpperCase()+allInputIds[x].slice(1))
				if (obj && allInputIds[x] != 'widgetType') {
					obj.disabled = true;
				}
			}
		}
	}
}
$(document).ready(function() {
	setWidgetTypeOptions();
	$('#plumAnalyticsWidgetType').change(function() { setWidgetTypeOptions(); });
});

{/literal}
</script>
<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsWidgetType" required="true" key="plugins.generic.plumAnalytics.manager.settings.widgetType"}</td>
		<td width="80%" class="value">
			<select class="selectMenu" name="widgetType" id="plumAnalyticsWidgetType">
				{html_options_translate options=$widgetTypes selected=$widgetType}
			</select>
			<br />
			<span class="instruct">{translate key="plugins.generic.plumAnalytics.manager.settings.widgetTypeInstructions"}</span>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsHideWhenEmpty" key="plugins.generic.plumAnalytics.manager.settings.hideWhenEmpty"}</td>
		<td width="80%" class="value"><input type="checkbox" name="hideWhenEmpty" id="plumAnalyticsHideWhenEmpty" {if $hideWhenEmpty eq 'true' }checked="checked" {/if}/> </td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsBorder" key="plugins.generic.plumAnalytics.manager.settings.border"}</td>
		<td width="80%" class="value"><input type="checkbox" name="border" id="plumAnalyticsBorder" {if $border eq 'true' }checked="checked" {/if}/> </td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsHidePrint" key="plugins.generic.plumAnalytics.manager.settings.hidePrint"}</td>
		<td width="80%" class="value"><input type="checkbox" name="hidePrint" id="plumAnalyticsHidePrint" {if $hidePrint eq 'true' }checked="checked" {/if}/> </td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsPopup" key="plugins.generic.plumAnalytics.manager.settings.popup"}</td>
		<td width="80%" class="value">
			<select class="selectMenu" name="popup" id="plumAnalyticsPopup">
				{html_options_translate options=$popupTypes selected=$popup}
			</select>
		</td>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsOrientation" key="plugins.generic.plumAnalytics.manager.settings.orientation"}</td>
		<td width="80%" class="value">
			<select class="selectMenu" name="orientation" id="plumAnalyticsOrientation">
				{html_options_translate options=$orientationTypes selected=$orientation}
			</select>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsWidth" key="plugins.generic.plumAnalytics.manager.settings.width"}</td>
		<td width="80%" class="value"><input type="text" name="width" id="plumAnalyticsWidth" value="{$width|escape}" size="5" maxlength="10" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="plumAnalyticsHook" required="true" key="plugins.generic.plumAnalytics.manager.settings.hook"}</td>
		<td width="80%" class="value">
			<select class="selectMenu" name="hook" id="plumAnalyticsHook">
				{html_options_translate options=$hookTypes selected=$hook}
			</select>
		</td>
	</tr>
</table>

<br/>

<input type="submit" name="save" class="button defaultButton" value="{translate key="common.save"}"/><input type="button" class="button" value="{translate key="common.cancel"}" onclick="history.go(-1)"/>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</div>
{include file="common/footer.tpl"}
