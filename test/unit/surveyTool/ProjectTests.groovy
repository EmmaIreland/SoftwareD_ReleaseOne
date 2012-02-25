package surveyTool

import grails.test.*

class ProjectTests extends GrailsUnitTestCase {
	
	Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
	Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder)
	
    protected void setUp() {
		super.setUp()
		mockForConstraintsTests(Project)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testProjectValidate() {
		Project butterChurning = new Project(name:'Butter Churning', course:amish101)
		assertTrue butterChurning.validate() 
    }
		
	void testProjectNameBlank() {	
		Project cabinetMaking = new Project(name:'', course:amish101)
		assertFalse cabinetMaking.validate()
		assertEquals 'blank', cabinetMaking.errors['name']
    }
	
	void testProjectToString() {
		Project butterChurning = new Project(name:'Butter Churning', course:amish101)
		assertTrue butterChurning.validate()
		assertEquals 'Butter Churning', butterChurning.toString()
	}
}
