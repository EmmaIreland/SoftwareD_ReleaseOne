package surveyTool

import grails.test.*

class RegistrationTests extends GrailsUnitTestCase {
    Course amish101 = new Course(courseName:'Amish 101')
	Student roger = new Student(name:'Roger')
	
	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Registration)
    }
   
    void testAssignedStudentAndCourse() {
		Registration registration = new Registration(course:amish101,student:roger)
		mockDomain Registration, [registration]
		assertTrue registration.validate()
		assertNull registration.errors['course']
		assertNull registration.errors['student']
    }
	
	void testNoAssignedStudentOrCourse() {
		Registration registration = new Registration()
		mockDomain Registration, [registration]
		assertFalse registration.validate()
		assertEquals 'nullable', registration.errors['course']
		assertEquals 'nullable', registration.errors['student']
	}
	
	protected void tearDown() {
		super.tearDown()
	}

}
