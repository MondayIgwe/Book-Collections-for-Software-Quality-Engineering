Feature: Not Displayed and Not Present steps

@Disableddate
Scenario: Validate not displayed 
	Given the user navigates to the 'Reference Docs' page
	When the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'Field Examples'
	Then the user validates that the 'Summary Current Status Textfield' is not displayed

	When the user clicks on 'Side Panel Tab' with value 'Summary'
	Then the user validates that the 'Summary Current Status Textfield' is displayed

	When the user clicks on 'Side Panel Tab' with value 'Summary'
	And the user clicks on 'Section Collapse Icon' with value 'Menu'
	Then the user validates that the 'Input By Label Name' with value 'Num 1' is not present

	When the user clicks on 'Section Expand Icon' with value 'Menu'
	Then the user validates that the 'Input By Label Name' with value 'Num 1' is present
