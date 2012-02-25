package surveyTool

class Course {
	String courseName
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [enrolled:Enrollment, projects:Project]
	
	
    static constraints = {
		courseName(blank:false)
		manager()
		enrolled()
    }
	
	String toString() {
		courseName
	}
}
