
<%@ page import="surveyTool.Manager" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'manager.label', default: 'Manager')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="course" action="create"><g:message code="New Course" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Manager Details" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="manager.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: managerInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="manager.courses.label" default="Courses" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${managerInstance.courses}" var="c">
                                    <li><g:link controller="course" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${managerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            
             <br></br>
            <h1> Surveys Created </h1>
            <div class="list">
                <table>
                    <thead>
                        <tr> 
                         
                            <g:sortableColumn property="name" title="${message(code: 'manager.surveyName.label', default: 'Surveys Created')}" />
                        
                            <th><g:message code="survey.question.label" default="Survey Questions" /></th>                                                      
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${managerInstance.surveys}" status="i" var="k">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link controller="survey" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link> </td>
                        
                        	<td valign="top" style="text-align: left;" class="value">
                               <ul>
                                <g:each in="${k.questions}" var="s">
                      
                                    <li><g:link controller="question" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                               </ul>
                           </td>                    
                          
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="buttons">
                	<span class="menuButton"><g:link class="create" controller="survey" action="create" ><g:message code="Create New Survey" args="[entityName]"/></g:link></span>
                </div>
            </div>
            
        </div>       
    </body>
</html>
