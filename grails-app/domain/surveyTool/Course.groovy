package surveyTool

class Course {
	String courseName
	String term
	String year
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [students:Student, projects:Project, teams:Team]
	
	
    static constraints = {
		courseName(blank:false, unique:['term', 'year'])
		term inList:['Fall', 'Spring', 'Summer 1', 'Summer 2']
		year()
		manager()
    }
	
	String toString() {
		courseName
	}
}
