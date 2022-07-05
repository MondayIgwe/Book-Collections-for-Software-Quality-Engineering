Feature: TestCase_541343
		Test Case 541343

@BDD_541343 @SFA_Nightly @SFA_Weekly
Scenario: TC_541343_WEB_SFA_SF_CNVACT_098_Can copy a canvass Book_BDD
	Given the user navigates to the 'Advanced Pricing Books' page
	Then the user validates the 'Copy Advanced Pricing Books Button' is disabled
	When the user clicks on 'Select Indexed Row' with value '1'
	Then the user validates the 'Copy Advanced Pricing Books Button' is enabled
	When the user clicks on 'Select Indexed Row' with value '1'
	Then the user validates the 'Copy Advanced Pricing Books Button' is disabled
	When the user clicks on 'Select Indexed Row' with value '1'
	And the user clicks on 'Select Indexed Row' with value '2'
	Then the user validates the 'Copy Advanced Pricing Books Button' is disabled
	When the user clicks on 'Select Indexed Row' with value '2'
	Then the user validates the 'Copy Advanced Pricing Books Button' is enabled
	When the user clicks on 'Select Indexed Row' with value '1'
	Then the user validates the 'Copy Advanced Pricing Books Button' is disabled
	When the user clicks on the 'Back Button'