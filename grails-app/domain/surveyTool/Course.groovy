package surveyTool

class Course {
	String courseName
	String term
	String year
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [enrolled:Enrollment, projects:Project]
	
	
    static constraints = {
		courseName(blank:false)
		term inList:['Fall', 'Spring', 'Summer']
		year()
		manager()
		enrolled()
    }
	
	String toString() {
		courseName
	}
}
