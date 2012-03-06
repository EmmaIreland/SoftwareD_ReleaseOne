package surveyTool

class IntegerScaleQuestion extends Question {
	
	Integer lowerBound
	Integer upperBound

    static constraints = {
		lowerBound(validator: {lower, question -> lower <= question.upperBound})
		upperBound(validator: {upper, question -> question.lowerBound <= upper})
    }
}
