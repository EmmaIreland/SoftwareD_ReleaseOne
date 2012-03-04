package surveyTool

import grails.test.*

class AnswerTests extends GrailsUnitTestCase {
	Manager manager = new Manager(name:'BOB')
	Survey survey = new Survey(name:'survey', manager:manager)
	Question question = new Question(question:'????', survey:survey)
	Student student = new Student(name:'Phill')
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Answer)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAnswerValidation() {
		Answer answer = new Answer(answer:'weee', question:question, student:student)
		assertTrue answer.validate()
    }
	
	void testBlankName() {
		Answer answer = new Answer(answer:'', question:question, student:student)
		assertFalse answer.validate()
		assertEquals 'blank', answer.errors['answer']
	}
	
	void testToString() {
		Answer answer = new Answer(answer:'weee', question:question, student:student)
		assertTrue answer.validate()
		assertEquals 'weee', answer.toString()
	}
		
}
