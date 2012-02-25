package surveyTool

class Manager {

	String name
	
	static hasMany = [courses:Course]
	
    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
}
