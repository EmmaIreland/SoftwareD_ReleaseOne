package surveyTool

class Question {
	
	String name
	
	static belongsTo = [survey:Survey]
	
	static hasMany = [answers:Answer]
	
	String toString() {
		name
	}

    static constraints = {
		name(blank:false)
    }
}
