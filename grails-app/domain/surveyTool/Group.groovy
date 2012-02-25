package surveyTool

class Group {

	String name
	
	static belongsTo = [project:Project]
	
	static hasMany = [students:Student,studentAssignments:StudentGroupAssignment]

	static constraints = {

		name(blank:false)
	}

	String toString(){
		name
	}
}
