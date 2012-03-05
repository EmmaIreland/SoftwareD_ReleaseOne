package surveyTool

import grails.test.*

class SurveyTests extends GrailsUnitTestCase {
	Manager manager = new Manager(name:'BOB')
	Date date = new Date()
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Survey)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSurveyValidation() {
		Survey survey = new Survey(name:'????', manager:manager, dateDue:date)
		assertTrue survey.validate()
    }
	
	void testBlankName() {
		Survey survey = new Survey(name:'', manager:manager,dateDue:date)
		assertFalse survey.validate()
		assertEquals 'blank', survey.errors['name']
	}
	
	
	
	void testToString() {
		Survey survey = new Survey(name:'????', manager:manager,dateDue:date)
		assertTrue survey.validate()
		assertEquals '????', survey.toString()
	}
}
