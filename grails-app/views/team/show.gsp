
<%@ page import="surveyTool.Team" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="projectTeamAssignment" action="create"><g:message code="New Project Team Assignment" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="studentTeamAssignment" action="create"><g:message code="New Student Team Assignment" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="team.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: teamInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="team.course.label" default="Course" /></td>
                            
                            <td valign="top" class="value"><g:link controller="course" action="show" id="${teamInstance?.course?.id}">${teamInstance?.course?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="comments"><g:message code="team.comments.label" default="Comments" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: teamInstance, field: "comments")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="team.projectAssignments.label" default="Project Assignments" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${teamInstance.projectAssignments.project}" var="p">
                                    <li><g:link controller="project" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="team.studentAssignments.label" default="Student Assignments" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${teamInstance.studentAssignments.student}" var="s">
                                    <li><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${teamInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
