package surveyTool

class Student {
	String name
	String email
	
	static belongsTo = [Course, Survey, Team]
	
	static hasMany = [courses:Course,teams:Team,
		 surveys:Survey, answers:Answer]

    static constraints = {
		name(blank:false)
		email(email:true)
    }
	
	String toString() {
		name
	}
	
}
