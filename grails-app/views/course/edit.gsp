

<%@ page import="surveyTool.Course" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
 		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="project" action="create"><g:message code="New Project" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>        
        </div>>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${courseInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${courseInstance?.id}" />
                <g:hiddenField name="version" value="${courseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="courseName"><g:message code="course.courseName.label" default="Course Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'courseName', 'errors')}">
                                    <g:textField name="courseName" value="${courseInstance?.courseName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="term"><g:message code="course.term.label" default="Term" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'term', 'errors')}">
                                    <g:select name="term" from="${courseInstance.constraints.term.inList}" value="${courseInstance?.term}" valueMessagePrefix="course.term"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="year"><g:message code="course.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'year', 'errors')}">
                                    <g:textField name="year" value="${courseInstance?.year}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="manager"><g:message code="course.manager.label" default="Manager" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'manager', 'errors')}">
                                    <g:select name="manager.id" from="${surveyTool.Manager.list()}" optionKey="id" value="${courseInstance?.manager?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="projects"><g:message code="course.projects.label" default="Projects" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'projects', 'errors')}">
                                    
<ul>
<g:each in="${courseInstance?.projects?}" var="p">
    <li><g:link controller="project" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="project" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'project.label', default: 'Project')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="students"><g:message code="course.students.label" default="Students" /></label>  <br></br>
                                                          <g:message code="course.studenthelp.label" default="(Ctrl click to select multiple" />
                                                          <br></br>
                                                          <g:message code="course.studenthelp.label" default="students, must be highlighted to" />
                                                          <br></br>
                                                          <g:message code="course.studenthelp.label" default="remain enrolled)" />
                                  
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'students', 'errors')}">
                <!-- from="${courseInstance.students} gives enrolled list -->
               					
                                    <g:select name="students" from="${surveyTool.Student.list()}" multiple="yes" optionKey="id" size="5" value="${courseInstance?.students*.id}" />                                   
                                </td>
                                
                            </tr>
                        <tr>  
                        <td>
                        </td>
                        </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="teams"><g:message code="course.teams.label" default="Teams" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'teams', 'errors')}">
                                    
<ul>
<g:each in="${courseInstance?.teams?}" var="t">
    <li><g:link controller="team" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="team" action="create" params="['course.id': courseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'team.label', default: 'Team')])}</g:link>

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
