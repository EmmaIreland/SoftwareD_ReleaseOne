package surveyTool

import grails.test.*

class StudentTeamAssignmentTests extends GrailsUnitTestCase {
	
	Student roger = new Student(name:'Roger')
	Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
	Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder)
	Project butterChurning = new Project(name:'Butter Churning', course:amish101)
	Team awesomeHats = new Team(name:'Awesome Hats', project:butterChurning)
	
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(StudentTeamAssignment)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testStudentTeamAssignmentValidate() {
		StudentTeamAssignment assignment = new StudentTeamAssignment(student:roger, team:awesomeHats)
		mockDomain StudentTeamAssignment, [assignment]
		assertTrue assignment.validate()
    }
	
	void testStudentTeamAssignmentUniqueness() {
		StudentTeamAssignment assignment = new StudentTeamAssignment(student:roger, team:awesomeHats)
		StudentTeamAssignment assignment2 = new StudentTeamAssignment(student:roger, team:awesomeHats)
		mockDomain StudentTeamAssignment, [assignment, assignment2]
		assertFalse assignment.validate()
		assertFalse assignment2.validate()
		assertEquals 'unique', assignment.errors['student']
		assertEquals 'unique', assignment2.errors['student']

	}
}
