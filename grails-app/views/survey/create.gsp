

<%@ page import="surveyTool.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="survey.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${surveyInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateDue"><g:message code="survey.dateDue.label" default="Date Due" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'dateDue', 'errors')}">
                                    <g:datePicker name="dateDue" precision="day" value="${surveyInstance?.dateDue}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="manager"><g:message code="survey.manager.label" default="Manager" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'manager', 'errors')}">
                                    <g:select name="manager.id" from="${surveyTool.Manager.list()}" optionKey="id" value="${surveyInstance?.manager?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.createAndView.label', default: 'Create and View')}" /></span>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit name="create" class="save" action="saveAndAddQuestions" value="${message(code: 'default.button.createAndAddQuestions.label', default: 'Create and Add Questions')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
