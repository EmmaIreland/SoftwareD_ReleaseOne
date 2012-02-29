package surveyTool

class Team {

	String name
	String comments
	
	static belongsTo = [course:Course]
	
	static hasMany = [studentAssignments:StudentTeamAssignment, projectAssignments:ProjectTeamAssignment]

	static constraints = {
		name(blank:false)
	}

	String toString(){
		name
	}
}
