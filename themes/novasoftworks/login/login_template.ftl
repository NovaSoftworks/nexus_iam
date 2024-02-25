<#macro layout>
<!doctype html>
<html <#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

<head>
  <title>${msg("pageTitle")}</title>

  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="noindex, nofollow">
  <#if properties.meta?has_content>
    <#list properties.meta?split(' ') as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>
  </#if>

  <link rel="icon" href="${url.resourcesCommonPath}/img/favicon.ico" />

  <#if properties.stylesCommon?has_content>
    <#list properties.stylesCommon?split(' ') as style>
      <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>
  <#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
      <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>

  <#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
      <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
  </#if>
  <#if authenticationSession??>
    <script type="module">
      import { checkCookiesAndSetTimer } from "${url.resourcesPath}/js/authChecker.js";

      checkCookiesAndSetTimer(
        "${authenticationSession.authSessionId}",
        "${authenticationSession.tabId}",
        "${url.ssoLoginInOtherTabsUrl}"
      );
    </script>
  </#if>
</head>

<body>
  <div class="wrapper">
    <main class="main-content">
        <#nested>
    </main>

    <footer class="main-footer">
      <p class="copyright">&copy; 2024 Nova Softworks. <br />${msg("copyrightMessage")}</p>
    </footer>
  </div>
</body>

</html>

</#macro>