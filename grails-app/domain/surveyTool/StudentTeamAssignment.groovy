package surveyTool

class StudentTeamAssignment {
	
	static belongsTo = [student:Student, team:Team]

    static constraints = {
		student unique:['student', 'team']

    }
	
	String toString(){
		student.toString() + ' is in team ' + team.toString() 
	}
}
