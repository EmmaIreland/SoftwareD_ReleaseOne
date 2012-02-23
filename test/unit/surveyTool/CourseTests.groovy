package surveyTool

import grails.test.*

class CourseTests extends GrailsUnitTestCase {
    Student roger = new Student(name:'Roger')
	
	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Course)
    }

    void testCourseCreation() {
		Course course = new Course(courseName:'Amish 101',student:roger)
		assertTrue course.validate()
		assertNull course.errors['courseName']
    }
	
	void testBlankCourse() {
		Course course = new Course(courseName:'',student:roger)
		assertFalse course.validate()
		assertEquals 'blank', course.errors['courseName']
	}
	
	void testCourseWithNoStudent() {
		Course course = new Course(courseName:'Amish 101')
		assertTrue course.validate()
	}
	
	void testToString() {
		Course course = new Course(courseName:'Amish 101',student:roger)
		assertTrue course.validate()
		assertEquals 'Amish 101', course.toString()	
	}
	
	protected void tearDown() {
		super.tearDown()
	}
}
