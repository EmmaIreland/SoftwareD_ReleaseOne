package surveyTool

class Student {
	String name
	
	static hasMany = [enrolled:Enrollment]

    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
	
}
