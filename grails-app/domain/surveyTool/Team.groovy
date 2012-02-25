package surveyTool

class Team {

	String name
	
	static belongsTo = [course:Course]
	
	static hasMany = [studentAssignments:StudentTeamAssignment, projectAssignments:ProjectTeamAssignment]

	static constraints = {

		name(blank:false)
		
	}

	String toString(){
		name
	}
}
