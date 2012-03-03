package surveyTool

class Survey {
	
	String name
	
	static belongsTo = [manager:Manager]
	
	static hasMany = [questions:Question]
	
	String toString() {
		name
	}
	
    static constraints = {
		name(blank:false)
    }
}
