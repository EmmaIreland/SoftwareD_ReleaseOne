package surveyTool

import grails.test.*

class StudentSurveyAssignmentTests extends GrailsUnitTestCase {
	Manager manager = new Manager(name:'BOB')
	Survey survey = new Survey(name:'survey', manager:manager)
	Question question = new Question(question:'????')
	Student student = new Student(name:'Bart', email:'')
	
	protected void setUp() {
        super.setUp()
		mockForConstraintsTests(StudentSurveyAssignment)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testValidStudentSurveyAssignment() {
		StudentSurveyAssignment assignment1 = new StudentSurveyAssignment(student:student, survey:survey)
		mockDomain StudentSurveyAssignment, [assignment1]
		assertTrue assignment1.validate()
    }	
	
	void testToString() {
		StudentSurveyAssignment assignment1 = new StudentSurveyAssignment(student:student, survey:survey)
		mockDomain StudentSurveyAssignment, [assignment1]
		assertEquals 'Bart', assignment1.toString()
	}
}
