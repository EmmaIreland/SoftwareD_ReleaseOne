package surveyTool

import grails.test.*

class StudentTests extends GrailsUnitTestCase {
    Course amish101 = new Course(courseName:'Amish 101')
	
	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Student)
    }

    void testStudentCreation() {
		Student student = new Student(name:'AmishMan Johnson', course:amish101)
		assertTrue student.validate()
		assertNull student.errors['name']
    }
	
	void testStudentBlankName() {
		Student student = new Student(name:'', course:amish101)
		assertFalse student.validate()
		assertEquals 'blank', student.errors['name']
	}
	
	void testStudentNotAssignedToACourse() {
		Student student = new Student(name:'AmishMan Johnson')
		assertFalse student.validate()
		assertEquals 'nullable', student.errors['course']
	}
	
	void testToString() {
		Student student = new Student(name:'AmishMan Johnson', course:amish101)
		assertTrue student.validate()
		assertEquals 'AmishMan Johnson', student.toString()
	}

	protected void tearDown() {
		super.tearDown()
	}
}
