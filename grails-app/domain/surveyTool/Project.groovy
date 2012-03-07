package surveyTool

class Project {
	
	String name
	String description
	
	static belongsTo = [course:Course]
	
	
	static hasMany = [teamAssignments:ProjectTeamAssignment]
	
    static constraints = {
		name(blank:false, unique:['course'])
		description()
    }
	
	String toString(){
		name
	}
}
