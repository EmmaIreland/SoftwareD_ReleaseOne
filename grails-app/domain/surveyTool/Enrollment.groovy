package surveyTool

class Enrollment {
	
	static belongsTo = [course:Course, student:Student]

    static constraints = {
		
		course unique:['course', 'student']
    }
	
	String toString() {
		student.toString()
	}
	
	
}
