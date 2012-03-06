

<%@ page import="surveyTool.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${surveyInstance}">
            <div class="errors">
                <g:renderErrors bean="${surveyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${surveyInstance?.id}" />
                <g:hiddenField name="version" value="${surveyInstance?.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="questions"><g:message code="survey.questions.label" default="Questions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'questions', 'errors')}">
                                    <g:select name="questions" from="${surveyTool.Question.list()}" multiple="yes" optionKey="id" size="5" value="${surveyInstance?.questions*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="studentAssignments"><g:message code="survey.studentAssignments.label" default="Student Assignments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: surveyInstance, field: 'studentAssignments', 'errors')}">
                                    
<ul>
<g:each in="${surveyInstance?.studentAssignments?}" var="s">
    <li><g:link controller="studentSurveyAssignment" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="studentSurveyAssignment" action="create" params="['survey.id': surveyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'studentSurveyAssignment.label', default: 'StudentSurveyAssignment')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
