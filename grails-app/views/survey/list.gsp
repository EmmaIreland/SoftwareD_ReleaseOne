<%@ page import="surveyTool.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="name" title="${message(code: 'survey.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="dateDue" title="${message(code: 'survey.dateDue.label', default: 'Date Due')}" />
                        
                            <th><g:message code="survey.manager.label" default="Manager" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInstanceList}" status="i" var="surveyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${surveyInstance.id}">${fieldValue(bean: surveyInstance, field: "name")}</g:link></td>
                                                
                            <td><g:formatDate date="${surveyInstance.dateDue}" /></td>
                        
                            <td>${fieldValue(bean: surveyInstance, field: "manager")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${surveyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>