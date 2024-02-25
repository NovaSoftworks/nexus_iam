<#import "login_template.ftl" as template>

<@template.layout>
  <div class="centered-content">
    <a href="/"><div class="ns-logo"></div></a>
    <h2>${msg("signInTitle")}</h2>
    <#if realm.password>
      <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
        <#if !usernameHidden??>
          <div class="input-group">
            <input <#if messagesPerField.existsError('username')>class="warning"</#if> placeholder="${msg("usernameInput")}" tabindex="1" id="username" name="username" value="${(login.username!'')}"  type="text" autocomplete="off">

            <#if messagesPerField.existsError('username')>
              <span class="warning">${msg("invalidUserMessage", msg("username"))}</span>
            </#if>
          </div>
        </#if>

        <div class="input-group">
          <input <#if messagesPerField.existsError('password')>class="warning"</#if> placeholder="${msg("passwordInput")}" tabindex="2" id="password" name="password" type="password" autocomplete="off">
          <#if messagesPerField.existsError('password')>
            <span class="warning">${msg("invalidUserMessage", msg("password"))}</span>
          </#if>
        </div>

        <#if realm.rememberMe && !usernameHidden??>
          <div class="input-group checkbox-group">
            <label for="rememberMe">
              <#if login.rememberMe??>
                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>${msg("rememberMeCheckbox")}
              <#else>
                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">${msg("rememberMeCheckbox")}
              </#if>
            </label>
          </div>
        </#if>

        <button type="submit">${msg("loginButton")}</button>
      </form>
    </#if>


    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <div class="small">${msg("or")} <a tabindex="4" href="${url.registrationUrl}">${msg("newAccountMessage")}</a></div>
    </#if>

    <#if realm.password && realm.resetPasswordAllowed>
      <div class="small"><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("cantConnectMessage")}</a></div>
    </#if>
  </div>
</@template.layout>