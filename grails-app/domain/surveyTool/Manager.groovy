package surveyTool

class Manager {

	String name
	
	static hasMany = [courses:Course, surveys:Survey]
	
    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
}
