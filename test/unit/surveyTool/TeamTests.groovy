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

    void testTeamValidate() {
		Team AwesomeHats = new Team(name:'Awesome Hats', course:amish101, comments:'Pretty awesome hats')
		assertTrue AwesomeHats.validate()
    }
	
	void testTeamBlankName() {
		Team BeardedBandits = new Team(name:'', course:amish101, comments:'Pretty awesome hats')
		assertFalse BeardedBandits.validate()
		assertEquals 'blank', BeardedBandits.errors['name']
	}
	
	void testTeamToString() {
		Team AwesomeHats = new Team(name:'Awesome Hats', course:amish101, comments:'')
		assertTrue AwesomeHats.validate()
		assertEquals 'Awesome Hats', AwesomeHats.toString()
	}
	
}
