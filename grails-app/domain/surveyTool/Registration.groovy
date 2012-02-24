package surveyTool

class Registration {
	
	static belongsTo = [course:Course, student:Student]

    static constraints = {
		
		course unique:['course', 'student']
    }
}
