<%@ page import="surveyTool.Course" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="student" action="create"><g:message code="New Student" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="team" action="create"><g:message code="New Team" args="[entityName]" /></g:link></span>
   			<span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Course Details" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.courseName.label" default="Course Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "courseName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.manager.label" default="Manager" /></td>
                            
                            <td valign="top" class="value"><g:link controller="manager" action="show" id="${courseInstance?.manager?.id}">${courseInstance?.manager?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.term.label" default="Term" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "term")}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.year.label" default="Year" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "year")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.students.label" default="Students" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${courseInstance.students}" var="s">
                                    <li><g:link controller="student" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="course.projects.label" default="Projects" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${courseInstance.projects}" var="p">
                                    <li><g:link controller="project" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${courseInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>         
            <div class="buttons">
            	<g:form>
                    <g:hiddenField name="id" value="${courseInstance?.id}" />
					<span class="menuButton"><g:link class="create" controller="project" action="create" ><g:message code="Create Projects" args="[entityName]"/></g:link></span>
					<span class="button"><g:actionSubmit class="save" action="edit" value="${message(code: 'default.button.enrollStudents.label', default: 'Enroll Students')}" /></span>
				</g:form>              
            </div>    
        </div>
    </body>
</html>