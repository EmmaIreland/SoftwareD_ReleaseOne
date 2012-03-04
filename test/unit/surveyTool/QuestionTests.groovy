package surveyTool

import grails.test.*

class QuestionTests extends GrailsUnitTestCase {
	Manager manager = new Manager(name:'BOB')
	Survey survey = new Survey(name:'survey', manager:manager)
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Question)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testQuestionValidation() {
		Question question = new Question(question:'????', survey:survey)
		assertTrue question.validate()
    }
	
	void testBlankName() {
		Question question = new Question(question:'', survey:survey)
		assertFalse question.validate()
		assertEquals 'blank', question.errors['question']	
	}
	
	void testToString() {
		Question question = new Question(question:'????', survey:survey)
		assertTrue question.validate()
		assertEquals '????', question.toString()
	}
	

}
