<#import "/library/utils.ftl" as u />

<#-- Agrego ejemplos -->
<#macro examples>
<#if m.examples?has_content>
	<div>
		<div id="examples" class="toggle-parent">
		    <h2>- Examples</h2>
		</div>
		<div class="toggle-child" >
		    <ul>
		    	${render_examples(m.examples)}
		</div>
	</div>
</#if>
</#macro>

<#-- Imprime los ejemplos, prepara el codigo para llenar la consola -->
<#function render_examples egs>
	<#local ret = ''>
	<#list egs as e>
		<#local count = 1>
		<#local exampleId = 'example' + count?string>
		<#local ret = ret + "<div id=${exampleId} class='example'>" >
		<#local ret = ret + '<h3> ${exampleId} </h3>' />
		<#list e?keys as k>
			<#local ret = ret + '<li><b>' + k + '</b>'>
			<#local ret = ret + ' &ndash; ' + e[k]>
			<#local ret = ret + '</li>'>
		 </#list>
		<#-- Muy fea la construcción de parametros, buscar alternativa -->
		<#local parameters = u.toJSString(e)>
		<#local ret = ret + "<input type='button' value='Use Example' onclick='useExample(${parameters})' />" >
		<#local ret = ret + "</div>" >
		<#local count = count + 1>
	</#list>
	<#return ret>
</#function>