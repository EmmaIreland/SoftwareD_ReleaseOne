package surveyTool

class StudentSurveyAssignment {
	
	static belongsTo = [student:Student, survey:Survey]

    static constraints = {
    }
	
	String toString() {
		student.toString()
	}
}
