package surveyTool

import grails.test.*

class EnrollmentTests extends GrailsUnitTestCase {
    Course amish101 = new Course(courseName:'Amish 101')
	Student roger = new Student(name:'Roger')
	
	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Enrollment)
    }
   
    void testAssignedStudentAndCourse() {
		Enrollment registration = new Enrollment(course:amish101,student:roger)
		mockDomain Enrollment, [registration]
		assertTrue registration.validate()
		assertNull registration.errors['course']
		assertNull registration.errors['student']
    }
	
	void testNoAssignedStudentOrCourse() {
		Enrollment registration = new Enrollment()
		mockDomain Enrollment, [registration]
		assertFalse registration.validate()
		assertEquals 'nullable', registration.errors['course']
		assertEquals 'nullable', registration.errors['student']
	}
	
	protected void tearDown() {
		super.tearDown()
	}

}
