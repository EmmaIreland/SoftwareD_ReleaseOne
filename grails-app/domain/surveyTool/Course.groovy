package surveyTool

class Course {
	String courseName
	
	static hasMany = [registrations:Registration]
	
    static constraints = {
		courseName(blank:false)
    }
	
	String toString() {
		courseName
	}
}
