Feature: TestCase_417233
		Test Case 417233

@BDD_417233 @SFA_Nightly @SFA_Weekly
Scenario: WEB_SFA_SF_CNVBOOK_001_Can create a new Canvass book
	#1 Open a Canvass navigator.
	Given the user navigates to the 'Advanced Pricing Books' page
	#2 Press on the 'Add' button.
	When the user clicks on the 'Add Button'
	#3 Check the  Canvass book Code. - > The field has a value (automatically generated)
	Then the user validates that the 'Input By Label Name' with value 'Code' is not empty
	#4 Fill in the following info: Description1= @Des1+ Code
	When the user retrieves text from element 'Input By Label Name' with value 'Code' and saves it as 'bookCode'
	And the user enters '<Des1>#bookCode#' in field 'Input By Label Name' with value 'Description'
	#And the user enters values '<Des1>' plus 'bookCode' in field 'Input By Label Name' with value 'Description
	And the user moves the focus away from 'Input By Label Name' with value 'Description' by pressing tab key
	#5 Check the UI title. -> UI title is Code | Description.
	Then the user validates that 'Home Toolbar Label' text contains '#bookCode# | <Des1>#bookCode#'
	#6 Save the UI.
	When the user clicks on the 'Save Button'
	#7 Change the  Canvass book description into Description2=  @Des2 + Code (and move the focus on other field)
	And the user enters '<Des2>#bookCode#' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from 'Input By Label Name' with value 'Description' by pressing tab key
	#8 Check the UI title.
	Then the user validates that 'Home Toolbar Label' text contains '#bookCode# | <Des2>#bookCode#'
	When the user clicks on the 'Save Button'


	Examples: 
	| Des1                   | Des2                    |
	| WEB_SFA_SF_CNVBOOK_001 | WEB_SFA_SF_CNVBOOK_0011 |