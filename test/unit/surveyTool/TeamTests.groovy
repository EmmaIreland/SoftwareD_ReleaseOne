package surveyTool

import grails.test.*

class TeamTests extends GrailsUnitTestCase {
	
	Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
	Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder)
	Project butterChurning = new Project(name:'Butter Churning', course:amish101)
	
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Team)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testGroupValidate() {
		Team AwesomeHats = new Team(name:'Awesome Hats', project:butterChurning)
		assertTrue AwesomeHats.validate()
    }
	
	void testGroupBlankName() {
		Team BeardedBandits = new Team(name:'', project:butterChurning)
		assertFalse BeardedBandits.validate()
		assertEquals 'blank', BeardedBandits.errors['name']
	}
	
	void testGroupToString() {
		Team AwesomeHats = new Team(name:'Awesome Hats', project:butterChurning)
		assertTrue AwesomeHats.validate()
		assertEquals 'Awesome Hats', AwesomeHats.toString()
	}
	
}
