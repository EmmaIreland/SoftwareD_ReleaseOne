package surveyTool

class Team {

	String name
	
	static belongsTo = [project:Project]
	
	static hasMany = [studentAssignments:StudentTeamAssignment]

	static constraints = {

		name(blank:false)
	}

	String toString(){
		name
	}
}
