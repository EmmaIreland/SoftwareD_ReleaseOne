

<%@ page import="surveyTool.Team" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
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
            <g:hasErrors bean="${teamInstance}">
            <div class="errors">
                <g:renderErrors bean="${teamInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="team.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: teamInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${teamInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="course"><g:message code="team.course.label" default="Course" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: teamInstance, field: 'course', 'errors')}">
                                    <g:select name="course.id" from="${surveyTool.Course.list()}" optionKey="id" value="${teamInstance?.course?.id}"  />
                                </td>
                            </tr>
                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comments"><g:message code="team.comments.label" default="Comments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: teamInstance, field: 'comments', 'errors')}">
                                    <g:textField name="comments" value="${teamInstance?.comments}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">         	
                	<span class="button"><g:actionSubmit name="create" class="save" action="saveAndAssignStudent" value="${message(code: 'default.button.createAndAssignStudents.label', default: 'Create and Assign Students')}" /></span>                                	
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit name="create" class="save" action="saveAndAssignProject" value="${message(code: 'default.button.createAndAssignProjects.label', default: 'Create and Assign Projects')}" /></span>                
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.createAndView.label', default: 'Create and View Team')}" /></span>
                </div>
                
            </g:form>
        </div>
    </body>
</html>
