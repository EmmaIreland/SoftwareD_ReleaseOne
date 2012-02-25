package surveyTool

class StudentGroupAssignment {
	
	static belongsTo = [student:Student, group:Group]

    static constraints = {
		student unique:['student', 'group']
    }
	
	String toString(){
		student.toString() + ' is in ' + group.toString() 
	}
}
