package surveyTool

class StudentTeamAssignment {
	
	static belongsTo = [student:Student, team:Team]

    static constraints = {
		student unique:['student', 'team']
		student validator: {student, studentTeamAssignment -> Enrollment.findByStudentAndCourse(student, studentTeamAssignment.team.course) != null }
    }
	
	String toString() {
		student.toString() + ' is in team ' + team.toString() 
	}
}
