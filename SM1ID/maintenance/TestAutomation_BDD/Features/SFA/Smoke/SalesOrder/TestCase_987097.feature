Feature: TestCase_987097

@BDD_987097 @SFA_Smoke
Scenario: Web_Edit_An_Existing_Order
	Given the user navigates to the 'Sale Orders' page
	
	When the user filters the column by column sm1-id 'DESSTATUS', Filter Type 'Like', Value 'DRAFT'
	And the user opens the grid item in row '1'
	Then the user validates that the 'Segmented Button' with value 'Edit' is visible

	When the user clicks on 'Segmented Button' with value 'Edit'
	And the user clicks on 'Input By Label Name' with value 'Customer Order Number'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Order Number'
	And the user enters '5' in field 'Input By Label Name' with value 'Customer Order Number'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'Save'
	And the user closes all pages without saving the work done

	And the user opens the Grid Settings Menu option: 'Remove Filter'
	And the user filters the column by column sm1-id 'DESSTATUS', Filter Type 'Like', Value 'CANCELLED'
	And the user opens the grid item in row '1'
	Then the user validates that the 'Button' with value 'Print' is visible
	And the user validates that the 'Segmented Parent Button' is not displayed
	When the user closes all pages without saving the work done where there is no pop up