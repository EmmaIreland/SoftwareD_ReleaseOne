package surveyTool

import grails.test.*

class CourseTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Course)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCourseCreation() {
		Course course = new Course(courseName:"Amish 101")
		assertTrue course.validate()
		assertNull course.errors["courseName"]
    }
	
	void testBlankCourse() {
		Course course = new Course(courseName:"")
		assertFalse course.validate()
		assertEquals "blank", course.errors["courseName"]
	}
}
