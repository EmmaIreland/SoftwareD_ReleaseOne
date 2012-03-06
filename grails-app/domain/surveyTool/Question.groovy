package surveyTool

class Question {
	
	String question
	
	static belongsTo = [Survey]
	
	static hasMany = [answers:Answer, surveys:Survey]
	
	String toString() {
		question
	}

    static constraints = {
		question(blank:false)
    }
}
