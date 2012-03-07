package surveyTool

class Survey {
	
	String name
	Date dateDue 
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [questions:Question, students:Student]
	
    static constraints = {
		name(blank:false)
		dateDue(validator: {dateDue -> dateDue.after(new Date().previous()) })
    }
	
	String toString() {
		name
	}
}
