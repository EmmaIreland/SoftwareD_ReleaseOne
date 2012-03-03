package surveyTool

import grails.test.*

class AnswerTests extends GrailsUnitTestCase {
	Manager manager = new Manager(name:'BOB')
	Survey survey = new Survey(name:'survey', manager:manager)
	Question question = new Question(name:'????', survey:survey)
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Answer)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAnswerValidation() {
		Answer answer = new Answer(name:'weee', question:question)
		assertTrue answer.validate()
    }
	
	void testBlankName() {
		Answer answer = new Answer(name:'', question:question)
		assertFalse answer.validate()
		assertEquals 'blank', answer.errors['name']
	}
	
	void testToString() {
		Answer answer = new Answer(name:'weee', question:question)
		assertTrue answer.validate()
		assertEquals 'weee', answer.toString()
	}
		
}
