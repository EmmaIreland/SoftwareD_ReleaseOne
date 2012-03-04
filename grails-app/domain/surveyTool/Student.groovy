package surveyTool

class Student {
	String name
	String email
	
	static hasMany = [enrolled:Enrollment,teamAssignments:StudentTeamAssignment,
		 surveyAssignments:StudentSurveyAssignment, answers:Answer]

    static constraints = {
		name(blank:false)
		email(email:true)
    }
	
	String toString() {
		name
	}
	
}
