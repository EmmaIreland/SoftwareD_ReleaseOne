package surveyTool

import grails.test.*

class ManagerTests extends GrailsUnitTestCase {
    
	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Manager)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testManagerCreation() {
		Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
		assertTrue sheepHerder.validate()
    }
	
	void testManagerBlankName() {
		Manager sheepHerder = new Manager(name:'')
		assertFalse sheepHerder.validate()
		assertEquals 'blank', sheepHerder.errors['name']
	}
	
	void testManagerHasCourse() {
		Course amish101 = new Course(courseName:'Amish 101')
		Manager sheepHerder = new Manager(name:'Sheep Herder Paul', course:amish101)
		assertTrue sheepHerder.validate()
    }
	
	void testManagerToString() {
		Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
		assertTrue sheepHerder.validate()
		assertEquals 'Sheep Herder Paul', sheepHerder.toString()
	}
	
}
