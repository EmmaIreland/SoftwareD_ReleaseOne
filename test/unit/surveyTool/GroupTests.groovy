package surveyTool

import grails.test.*

class GroupTests extends GrailsUnitTestCase {
	
	Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
	Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder)
	Project butterChurning = new Project(name:'Butter Churning', course:amish101)
	
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Group)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testGroupValidate() {
		Group AwesomeHats = new Group(name:'Awesome Hats', project:butterChurning)
		assertTrue AwesomeHats.validate()
    }
	
	void testGroupBlankName() {
		Group BeardedBandits = new Group(name:'', project:butterChurning)
		assertFalse BeardedBandits.validate()
		assertEquals 'blank', BeardedBandits.errors['name']
	}
	
	void testGroupToString() {
		Group AwesomeHats = new Group(name:'Awesome Hats', project:butterChurning)
		assertTrue AwesomeHats.validate()
		assertEquals 'Awesome Hats', AwesomeHats.toString()
	}
	
}
