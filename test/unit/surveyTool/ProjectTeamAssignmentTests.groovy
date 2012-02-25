package surveyTool

import grails.test.*

class ProjectTeamAssignmentTests extends GrailsUnitTestCase {
    
	Student roger = new Student(name:'Roger')
	Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
	Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder)
	Project butterChurning = new Project(name:'Butter Churning', course:amish101)
	Team awesomeHats = new Team(name:'Awesome Hats', course:amish101)

	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(ProjectTeamAssignment)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testProjectTeamAssignmentValidate() {
		ProjectTeamAssignment assignment = new ProjectTeamAssignment(project:butterChurning, team:awesomeHats)
		mockDomain ProjectTeamAssignment, [assignment]
		assertTrue assignment.validate()
    }
	
	void testProjectTeamAssignmentUniqueness() {
		ProjectTeamAssignment assignment = new ProjectTeamAssignment(project:butterChurning, team:awesomeHats)
		ProjectTeamAssignment assignment2 = new ProjectTeamAssignment(project:butterChurning, team:awesomeHats)
		mockDomain ProjectTeamAssignment, [assignment, assignment2]
		assertFalse assignment.validate()
		assertFalse assignment2.validate()
		assertEquals 'unique', assignment.errors['project']
		assertEquals 'unique', assignment2.errors['project']

	}
	
	void testToString(){
		ProjectTeamAssignment assignment = new ProjectTeamAssignment(project:butterChurning, team:awesomeHats)
		mockDomain ProjectTeamAssignment, [assignment]
		assertTrue assignment.validate()
		assertEquals 'Awesome Hats is assigned to project Butter Churning', assignment.toString()
	}
}
