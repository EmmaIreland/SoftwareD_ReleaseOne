package surveyTool

class ProjectTeamAssignment {
	
	static belongsTo = [project:Project, team:Team]

    static constraints = {
		project unique:['project', 'team']
    }
	
	String toString(){
		team.toString() + ' is assigned to ' + project.toString()
	}
}
