package surveyTool

class Course {
	String courseName
	
	static hasMany = [student:Student]
	
    static constraints = {
		courseName(blank:false)
    }
	
	String toString() {
		courseName
	}
}
