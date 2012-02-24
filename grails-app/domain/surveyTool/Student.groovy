package surveyTool

class Student {
	String name
	
	static hasMany = [registrations:Registration]

    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
	
}
