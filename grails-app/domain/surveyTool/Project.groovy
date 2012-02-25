package surveyTool

class Project {
	
	String name
	
	static belongsTo = [course:Course]
	
	static hasMany = [teamAssignments:ProjectTeamAssignment]
	
    static constraints = {
		
		name(blank:false)
    }
	
	String toString(){
		name
	}
}
