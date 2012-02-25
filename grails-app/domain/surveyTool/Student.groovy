package surveyTool

class Student {
	String name
	
	static hasMany = [enrolled:Enrollment,groupAssignments:StudentGroupAssignment]

    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
	
}
