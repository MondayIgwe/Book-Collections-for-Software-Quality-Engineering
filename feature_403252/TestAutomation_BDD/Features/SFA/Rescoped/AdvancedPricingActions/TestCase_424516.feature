Feature: TestCase_424516

@BDD_424516 @SFA_Nightly
Scenario: WEB_SFA_SF_CNVACT_008_General_info_tab_from_Canvas_action_UI_has_the_expected_layout
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user filters the column by column name 'Code', 'Like', 'WEB_SFA_SF_CNVACT_008'
	And the user opens the grid item in row '1'

	And the user clicks on 'Side Panel Tab' with value 'General info'
	Then the user validates that the 'Section' with value 'Main information' is displayed
	And the user validates that the 'Section' with value 'Valorization' is displayed
	
	And the user validates that the 'Section' with value 'Benefits' is displayed
	And the user validates that the 'Section' with value 'Use past orders' is displayed

	And the user validates that the 'Input By Label Name' with value 'Description' is displayed
	And the user validates that the 'Input By Label Name' with value 'Advanced Pricing Book' is displayed

	And the user validates that the 'Input By Label Name' with value 'Valid Period' is displayed
	And the user validates that the 'Input By Label Name' with value 'Benefit reason' is displayed

	And the user validates that the 'Input By Label Name' with value 'Benefit Sub-reason' is displayed
	And the user validates that the 'Input By Label Name' with value 'Notes' is displayed
	And the user validates that the 'Checkbox By Label' with value 'Post application action' is displayed

	And the user validates that the 'Input By Label Name' with value 'Valorization Type' is displayed
	And the user validates that the 'Input By Label Name' with value 'Valorization Attribute' is displayed
	
	And the user validates that the 'Input By Label Name' with value 'Measure Unit' is displayed
	And the user validates that the 'Input By Label Name' with value 'Priority' is displayed

	And the user validates that the 'Checkbox By Label' with value 'Convert different UM' is displayed
	And the user validates that the 'Checkbox By Label' with value 'Consider Manually modified Rows' is displayed
	And the user validates that the 'Checkbox By Label' with value 'Only perfect multiples' is displayed

	And the user validates that the 'Input By Label Name' with value 'Benefit Priority' is displayed
	And the user validates that the 'Checkbox By Label' with value 'Maximum Bracket Only' is displayed

	And the user validates that the 'Checked Radio Button' with value 'Do not consider Past orders' is displayed
	And the user validates that the 'Radio Button' with value 'Past orders from date' is displayed
	And the user validates that the 'Radio Button' with value 'Past orders from days number' is displayed

	And the user closes all pages without saving the work done where there is no pop up