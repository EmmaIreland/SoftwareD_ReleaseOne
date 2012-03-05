
<%@ page import="surveyTool.Survey" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Survey Details" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: surveyInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.dateDue.label" default="Date Due" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${surveyInstance?.dateDue}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.manager.label" default="Manager" /></td>
                            
                            <td valign="top" class="value"><g:link controller="manager" action="show" id="${surveyInstance?.manager?.id}">${surveyInstance?.manager?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="survey.questions.label" default="Questions" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${surveyInstance.questions}" var="q">
                                    <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${surveyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            
             <br></br>
            <h1> Assigned Students </h1>
            <div class="list">
                <table>
                    <thead>
                        <tr> 
                         
                            <g:sortableColumn property="name" title="${message(code: 'student.name.label', default: 'Students')}" />
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surveyInstance.studentAssignments.student}" status="i" var="k">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link controller="student" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link> </td>
                        
                          
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="buttons">
                	<span class="menuButton"><g:link class="create" controller="studentSurveyAssignment" action="create" ><g:message code="Assign Students" args="[entityName]"/></g:link></span>
                </div>
            </div>
            
        </div>
    </body>
</html>
