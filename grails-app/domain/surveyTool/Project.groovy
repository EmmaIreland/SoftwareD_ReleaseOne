package surveyTool

class Project {
	
	String name
	
	static belongsTo = [course:Course]
	
//	static hasMany = [groups:Group]
	
    static constraints = {
		
		name(blank:false)
    }
	
	String toString(){
		name
	}
}
