package surveyTool

class Student {
	
	String name
	
	static belongsTo = [course:Course]

    static constraints = {
		name(blank:false)
    }
	
	String toString() {
		name
	}
	
}
