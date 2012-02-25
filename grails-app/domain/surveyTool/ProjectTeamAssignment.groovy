package surveyTool

class ProjectTeamAssignment {
	
	static belongsTo = [project:Project, team:Team]

    static constraints = {
		project unique:['project', 'team']
		project validator: {project, projectTeamAssignment -> project.course == projectTeamAssignment.team.course}
    }
	
	String toString(){
		team.toString() + ' is assigned to project ' + project.toString()
	}
}
