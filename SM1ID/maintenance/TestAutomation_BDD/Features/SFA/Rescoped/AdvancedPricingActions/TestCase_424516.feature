Feature: TestCase_424516

@BDD_424516 @SFA_Nightly @SFA_Weekly
Scenario: WEB_SFA_SF_CNVACT_008_General_info_tab_from_Canvas_action_UI_has_the_expected_layout
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column sm1-id 'CODCNVACT', Filter Type 'Like', Value 'WEB_SFA_SF_CNVACT_008'
	And the user opens the grid item in row '1'

	And The user is on the 'Advanced Pricing Actions' page
	And the user clicks on the 'General Info Tab'

	And The user is on the 'Advanced Pricing Actions - General Info Tab' page
	Then the user validates that the 'Main Information Section' is visible
	And the user validates that the 'Valorization Section' is visible
	
	And the user validates that the 'Benefits Section' is visible
	And the user validates that the 'Use Past Orders Section' is visible

	And the user validates that the 'Description Textbox' is visible
	And the user validates that the 'Advanced Pricing Book Textbox' is visible

	And the user validates that the 'Valid Period Start Date Textbox' is visible
	And the user validates that the 'Valid Period End Date Textbox' is visible
	
	And the user validates that the 'Benefit Reason Textbox' is visible
	And the user validates that the 'Benefit Sub-Reason Textbox' is visible

	And the user validates that the 'Notes Textbox' is visible
	And the user validates that the 'Post Application Action Checkbox' is visible

	And the user validates that the 'Valorization Type Textbox' is visible
	And the user validates that the 'Valorization Attribute Textbox' is visible

	And the user validates that the 'Measure Unit Textbox' is visible
	And the user validates that the 'Priority Textbox' is visible

	And the user validates that the 'Convert Different UM Checkbox' is visible
	And the user validates that the 'Consider Manually Modified Rows Checkbox' is visible
	And the user validates that the 'Only Perfect Multiples Checkbox' is visible

	And the user validates that the 'Benefit Priority Textbox' is visible
	And the user validates that the 'Maximum Bracket Only Checkbox' is visible

	When The user is on the '' page
	Then the user validates that the 'Checked Radio Button' with value 'Do not consider Past orders' is displayed
	And the user validates that the 'Radio Button' with value 'Past orders from date' is displayed
	And the user validates that the 'Radio Button' with value 'Past orders from days number' is displayed

	When the user closes all pages without saving the work done where there is no pop up