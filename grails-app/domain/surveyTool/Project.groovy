package surveyTool

class Project {
	
	String name
	
	static belongsTo = [course:Course]
	
	static hasMany = [teams:Team]
	
    static constraints = {
		
		name(blank:false)
    }
	
	String toString(){
		name
	}
}
