package surveyTool

class Student {
	String name
	
	static hasMany = [enrolled:Enrollment,teamAssignments:StudentTeamAssignment]

    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
	
}
