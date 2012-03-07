

<%@ page import="surveyTool.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="studentTeamAssignment" action="create"><g:message code="New Student Team Assignment" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${studentInstance}">
            <div class="errors">
                <g:renderErrors bean="${studentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${studentInstance?.id}" />
                <g:hiddenField name="version" value="${studentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="student.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${studentInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="student.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${studentInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="answers"><g:message code="student.answers.label" default="Answers" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'answers', 'errors')}">
                                    
<ul>
<g:each in="${studentInstance?.answers?}" var="a">
    <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="answer" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answer.label', default: 'Answer')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="courses"><g:message code="student.courses.label" default="Courses" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'courses', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="surveys"><g:message code="student.surveys.label" default="Surveys" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'surveys', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="teams"><g:message code="student.teams.label" default="Teams" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentInstance, field: 'teams', 'errors')}">
                                    
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
