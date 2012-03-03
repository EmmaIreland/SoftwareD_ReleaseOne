
<%@ page import="surveyTool.Team" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="studentTeamAssignment" action="create"><g:message code="Add Students to Team" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                         
                            <g:sortableColumn property="name" title="${message(code: 'team.name.label', default: 'Name')}" />
                        
                            <th><g:message code="team.course.label" default="Course" /></th>
                            
                            <g:sortableColumn property="comments" title="${message(code: 'team.comments.label', default: 'Comments')}" />
                            
                            <th><g:message code="team.students.label" default="Team Members" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamInstanceList}" status="i" var="teamInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${teamInstance.id}">${fieldValue(bean: teamInstance, field: "name")}</g:link></td>
                        
                        
                            <td><g:link controller="course" action="show" id="${teamInstance.course.id}">${fieldValue(bean: teamInstance, field: "course")}</g:link></td>
                            <td>${fieldValue(bean: teamInstance, field: "comments")}</td>
                            
                    <td valign="top" style="text-align: left;" class="value">
                    <ul>
                    <g:each in="${teamInstance.studentAssignments.student}" var="studentTeams">          
                            <li><g:link controller="student" action="show" id="${studentTeams.id}">${fieldValue(bean: studentTeams, field: "name")}</g:link></li>
                    </g:each>
                    </ul></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${teamInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
