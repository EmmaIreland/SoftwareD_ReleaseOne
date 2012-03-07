package surveyTool

class Team {

	String name
	String comments
	
	static belongsTo = [course:Course]
	
	static hasMany = [students:Student, projectAssignments:ProjectTeamAssignment]

	static constraints = {
		name(blank:false)
		
	}

	String toString(){
		name
	}
}
