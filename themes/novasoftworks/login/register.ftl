<#import "login_template.ftl" as template>
<#import "register-commons.ftl" as registerCommons>

<@template.layout>
  <div class="centered-content">
    <a href="/"><div class="ns-logo"></div></a>
    <h2>${msg("registerTitle")}</h2>

    <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
    <!--
      <div class="input-group">
        <input <#if messagesPerField.existsError('firstName')>class="warning"</#if> placeholder="${msg("firstNameInput")}" type="text" id="firstName" name="firstName" value="${(register.formData.firstName!'')}">

        <#if messagesPerField.existsError('firstName')>
            <span class="warning">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span>
        </#if>
      </div>

      <div class="input-group">
        <input <#if messagesPerField.existsError('lastName')>class="warning"</#if> placeholder="${msg("lastNameInput")}" type="text" id="lastName" name="lastName" value="${(register.formData.lastName!'')}">

        <#if messagesPerField.existsError('lastName')>
            <span class="warning">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span>
        </#if>
      </div>
    -->

      <div class="input-group">
        <input <#if messagesPerField.existsError('email')>class="warning"</#if> placeholder="${msg("emailInput")}" type="text" id="email" name="email" value="${(register.formData.email!'')}">

        <#if messagesPerField.existsError('email')>
            <span class="warning">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
        </#if>
      </div>

      <#if passwordRequired??>
        <div class="input-group">
          <input <#if messagesPerField.existsError('password')>class="warning"</#if> placeholder="${msg("passwordInput")}" type="password" id="password" name="password">

          <#if messagesPerField.existsError('password')>
              <span class="warning">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
          </#if>
        </div>

        <div class="input-group">
          <input <#if messagesPerField.existsError('password-confirm')>class="warning"</#if> placeholder="${msg("passwordConfirmInput")}" type="password" id="password-confirm" name="password-confirm">

          <#if messagesPerField.existsError('password-confirm')>
              <span class="warning">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
          </#if>
        </div>
      </#if>
      
      <@registerCommons.termsAcceptance/>

      <button type="submit">${msg("registerButton")}</button>
    </form>

    <div class="small">${msg("alreadyAccountMessage")} <a href="${url.loginUrl}">${msg("loginMessage")}</a></div>

</@template.layout>