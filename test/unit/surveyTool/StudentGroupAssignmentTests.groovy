package surveyTool

import grails.test.*

class StudentGroupAssignmentTests extends GrailsUnitTestCase {
	
	Student roger = new Student(name:'Roger')
	Manager sheepHerder = new Manager(name:'Sheep Herder Paul')
	Course amish101 = new Course(courseName:'Amish 101', manager:sheepHerder)
	Project butterChurning = new Project(name:'Butter Churning', course:amish101)
	Group awesomeHats = new Group(name:'Awesome Hats', project:butterChurning)
	
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(StudentGroupAssignment)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testStudentGroupAssignmentValidate() {
		StudentGroupAssignment assignment = new StudentGroupAssignment(student:roger, group:awesomeHats)
		mockDomain StudentGroupAssignment, [assignment]
		assertTrue assignment.validate()
    }
	
	void testStudentGroupAssignmentUniqueness() {
		StudentGroupAssignment assignment = new StudentGroupAssignment(student:roger, group:awesomeHats)
		StudentGroupAssignment assignment2 = new StudentGroupAssignment(student:roger, group:awesomeHats)
		mockDomain StudentGroupAssignment, [assignment, assignment2]
		assertFalse assignment.validate()
		assertFalse assignment2.validate()
		assertEquals 'unique', assignment.errors['student']
		assertEquals 'unique', assignment2.errors['student']

	}
}
