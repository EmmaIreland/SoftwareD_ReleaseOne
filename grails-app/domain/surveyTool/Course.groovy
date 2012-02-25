package surveyTool

class Course {
	String courseName
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [enrolled:Enrollment]
	
    static constraints = {
		courseName(blank:false)
		manager()
		enrolled()
    }
	
	String toString() {
		courseName
	}
}
