

<%@ page import="surveyTool.StudentTeamAssignment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'studentTeamAssignment.label', default: 'Student Team Assignment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" controller="team" action="list"><g:message code="Team List" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${studentTeamAssignmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${studentTeamAssignmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="student"><g:message code="studentTeamAssignment.student.label" default="Student" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentTeamAssignmentInstance, field: 'student', 'errors')}">
                                    <g:select name="student.id" from="${surveyTool.Student.list()}" optionKey="id" value="${studentTeamAssignmentInstance?.student?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="team"><g:message code="studentTeamAssignment.team.label" default="Team" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studentTeamAssignmentInstance, field: 'team', 'errors')}">
                                    <g:select name="team.id" from="${surveyTool.Team.list()}" optionKey="id" value="${studentTeamAssignmentInstance?.team?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.createAndViewTeam.label', default: 'Create and View Team')}" /></span>
                </div>
                
                <div class="buttons">
                    <span class="button"><g:actionSubmit name="create" class="save" action="saveAndCreateAnother" value="${message(code: 'default.button.saveAndAssignAnother.label', default: 'Save and Assign Another')}" /></span>
                </div>
                
            </g:form>
        </div>
    </body>
</html>
