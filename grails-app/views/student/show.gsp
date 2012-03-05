
<%@ page import="surveyTool.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="Student Details" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="enrollment" action="create"><g:message code="New Enrollment" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="studentTeamAssignment" action="create"><g:message code="New Student Team Assignment" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Student Details" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "name")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: studentInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.enrolled.label" default="Enrolled" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${studentInstance.enrolled.course}" var="e">
                                    <li><g:link controller="course" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="student.teamAssignments.label" default="Team Assignments" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${studentInstance.teamAssignments.team}" var="t">
                                    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${studentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            
            
            
            <br></br>
            <h1> Assigned Surveys </h1>
            <div class="list">
                <table>
                    <thead>
                        <tr> 
                         
                            <g:sortableColumn property="name" title="${message(code: 'student.survey.label', default: 'Assigned Surveys')}" />
                        
                            <th><g:message code="survey.question.label" default="Survey Questions" /></th>
                            
                            <th><g:message code="survey.answer.label" default="Answers" /></th>
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${studentInstance.surveyAssignments.survey}" status="i" var="k">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link controller="survey" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link> </td>
                        
                        	<td valign="top" style="text-align: left;" class="value">
                               <ul>
                                <g:each in="${k.questions}" var="s">
                      
                                    <li><g:link controller="question" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                               </ul>
                           </td>
                           <td valign="top" style="text-align: left;" class="value">
                               <ul>
                                <g:each in="${k.questions}" var="s">
                               	 	<g:each in="${s.answers}" var="p">
                      					<li>${fieldValue(bean: p, field: "answer")}</li>
                               		</g:each>
                               	</g:each>
                               </ul>
                           </td>
                          
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="buttons">
                	<span class="menuButton"><g:link class="create" controller="answer" action="create" ><g:message code="Add Answer" args="[entityName]"/></g:link></span>
                </div>
            </div>
            
        </div>
    </body>
</html>
