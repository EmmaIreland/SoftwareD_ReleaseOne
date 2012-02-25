package surveyTool

class Course {
	String courseName
	
	static hasMany = [enrolled:Enrollment]
	
    static constraints = {
		courseName(blank:false)
    }
	
	String toString() {
		courseName
	}
}
