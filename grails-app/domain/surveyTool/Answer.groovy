package surveyTool

class Answer {
	
	String name
	
	static belongsTo = [question:Question]
	
	String toString() {
		name
	}
	
    static constraints = {
		name(blank:false)
    }
}
