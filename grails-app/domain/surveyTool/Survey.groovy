package surveyTool

class Survey {
	
	String name
	Date dateDue
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [questions:Question, studentAssignments:StudentSurveyAssignment]
	
    static constraints = {
		name(blank:false)
		dateDue(validator: {dateDue -> dateDue.after(new Date())})
    }
	
	String toString() {
		name
	}
}
