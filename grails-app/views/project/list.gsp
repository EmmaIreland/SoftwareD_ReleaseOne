
<%@ page import="surveyTool.Project"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'project.label', default: 'Project')}" />
<title><g:message code="default.list.label" args="[entityName]" />
</title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" />
		</a>
		</span> <span class="menuButton"><g:link class="create"
				action="create">
				<g:message code="default.new.label" args="[entityName]" />
			</g:link>
		</span>
	</div>

	<div class="body">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="list">
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="name"
							title="${message(code: 'project.projectName.label', default: 'Project Name')}" />
							
						<g:sortableColumn property="name"
							title="${message(code: 'project.course.label', default: 'Course')}" />

						<th><g:message code="project.team.label"
								default="Teams Assigned To Project" />
						</th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${projectInstanceList}" status="i" var="projectInstance">
								<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

									<td valign="top" style="text-align: left;" class="value">
										
										<g:each in="${projectInstance}" var="project"> 
										<g:link action="show" id="${project.id}">${project?.encodeAsHTML()}</g:link>
										</g:each></td>

									
									<td valign="top" style="text-align: left;" class="value">
										
										<g:each in="${projectInstance.course}" var="projectCourses">
											<g:link controller="course" action="show" id="${projectCourses.id}"> ${projectCourses?.encodeAsHTML()}</g:link>
										</g:each></td>

							<!-- tried using 2 g:eachs here to prevent it from making duplicate teams for projects, logic is wrong?  -->
									<td valign="top" style="text-align: left;" class="value">
										<ul>
										
										
											<g:each in="${projectInstance.teamAssignments.team}" var="projectTeams">
												<li><g:link controller="team" action="show" id="${projectTeams.id}">${projectTeams?.encodeAsHTML()}</g:link></li>
											
										</g:each></ul></td>

								</tr>
							</g:each>
				</tbody>
			</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${projectInstanceTotal}" />
		</div>
	</div>
</body>
</html>
