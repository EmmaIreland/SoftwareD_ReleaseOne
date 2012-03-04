package surveyTool

class Answer {
	
	String answer
	
	static belongsTo = [question:Question, student:Student]
	
	String toString() {
		answer
	}
	
    static constraints = {
		answer(blank:false)
		
		student validator: {student, answer -> Answer.findByStudentAndQuestion(student, answer.question) == null }
		
		
    }
}
