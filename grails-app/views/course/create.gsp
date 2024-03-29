<%@ page import="surveyTool.Course" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
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
            <g:hasErrors bean="${courseInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                                    <g:select name="term" from="${courseInstance.constraints.term.inList}" value="${fieldValue(bean: courseInstance, field: 'term')}" valueMessagePrefix="course.term"  />
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
                                  <label for="students"><g:message code="course.students.label" default="Students" /></label>
                                  <br></br>
                                   <g:message code="course.studenthelp.label" default="(Ctrl click to" />
                                   <br></br>
                                   <g:message code="course.studenthelp.label" default=" select multiple)" />
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'students', 'errors')}">
                                    <g:select name="students" from="${surveyTool.Student.list()}" multiple="yes" optionKey="id" size="5" value="${courseInstance?.students*.id}" />
                                    
                                </td>
                            </tr>
                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>