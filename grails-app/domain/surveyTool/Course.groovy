package surveyTool

class Course {
	String courseName
	
    static constraints = {
		courseName(blank:false)
    }
}
