Feature: TestCase_760737
	Test Case 760737

@BDD_760737 @SFA_Nightly
Scenario: WEB_SFA_SE_VISIT_015_SUMMARY_TAB_IN_CUSTOMER_VISIT_UI
	Given the user navigates to the 'Visits' page
	When the user filters the column by column name 'Id Visit', 'Like', '000000000000000001620640006245'
	And the user opens the grid item in row '1'

	Then the user validates that the 'Toolbar Page Name' with value 'E CENTER Schäfer - Neuss | NEUSS' is present
	And the user validates that 'Input By Label Name' with value 'Customer' has text 'E CENTER Schäfer - Neuss'
	And the user validates that 'Input By Label Name' with value 'User' has text 'SFA Automation 7'
	And the user validates that 'Input By Label Name' with value 'Start Date' has text '05/10/2021 12:00:00'
	And the user validates that 'Input By Label Name' with value 'End Date' has text '05/10/2021 12:30:00'
	And the user validates that 'Input By Label Name' with value 'Status' has text 'PLANNED'
	And the user validates that 'Input By Label Name' with value 'Priority' has text 'MEDIUM'
	And the user validates that the 'Section' with value 'Main information' is present
	And the user validates that the 'Section' with value 'Product lines' is present
	And the user validates that 'Input By Label Name' with value 'Contact mode' has text 'Visit'
	And the user validates that 'Input By Label Name' with value 'Address' has text 'Hochstadenstraße 17, NEUSS, 41469, NW, DE'
	And the user validates that the 'Column' with value 'Category' is present
	And the user validates that the 'Column' with value 'Retail cluster' is present

	When the user closes all pages without saving the work done where there is no pop up
	And the user filters the column by column name 'Id Visit', 'Like', '000000000000000001620640819467'
	And the user opens the grid item in row '1'

	Then the user validates that the 'Toolbar Page Name' with value 'ENOTECA PROVINO | PIACENZA' is present
	And the user validates that 'Input By Label Name' with value 'Customer' has text 'ENOTECA PROVINO'
	And the user validates that 'Input By Label Name' with value 'User' has text 'SFA Automation 7'
	And the user validates that 'Input By Label Name' with value 'Start Date' has text '05/11/2021 12:30:00'
	And the user validates that 'Input By Label Name' with value 'End Date' has text '05/11/2021 13:00:00'
	And the user validates that 'Input By Label Name' with value 'Status' has text 'PLANNED'
	And the user validates that 'Input By Label Name' with value 'Priority' has text 'MEDIUM'
	And the user validates that 'Input By Label Name' with value 'Contact mode' has text 'Visit'
	And the user validates that 'Input By Label Name' with value 'Address' has text 'VIA CHIAPPONI, 31, PIACENZA, 29100, PC, IT'

	When the user closes all pages without saving the work done where there is no pop up
	And the user filters the column by column name 'Id Visit', 'Like', '000000000000000001620640939502'
	And the user opens the grid item in row '1'

	Then the user validates that the 'Toolbar Page Name' with value 'FAGJ SRL | VERONA' is present
	And the user validates that 'Input By Label Name' with value 'Customer' has text 'FAGJ SRL'
	And the user validates that 'Input By Label Name' with value 'User' has text 'SFA Automation 7'
	And the user validates that 'Input By Label Name' with value 'Start Date' has text '05/12/2021 13:30:00'
	And the user validates that 'Input By Label Name' with value 'End Date' has text '05/12/2021 14:00:00'
	And the user validates that 'Input By Label Name' with value 'Status' has text 'PLANNED'
	And the user validates that 'Input By Label Name' with value 'Priority' has text 'MEDIUM'
	And the user validates that 'Input By Label Name' with value 'Contact mode' has text 'Visit'
	And the user validates that 'Input By Label Name' with value 'Address' has text 'VIC.CIECO S.PIETRO INCARNARIO, VERONA, 37121, VR, IT'

	When the user closes all pages without saving the work done where there is no pop up
	And the user filters the column by column name 'Id Visit', 'Like', '000000000000000001620641485946'
	And the user opens the grid item in row '1'

	Then the user validates that the 'Toolbar Page Name' with value 'E CENTER Kaarst - Kaarst | KAARST' is present
	And the user validates that 'Input By Label Name' with value 'Customer' has text 'E CENTER Kaarst - Kaarst'
	And the user validates that 'Input By Label Name' with value 'User' has text 'SFA Automation 7'
	And the user validates that 'Input By Label Name' with value 'Start Date' has text '05/13/2021 13:00:00'
	And the user validates that 'Input By Label Name' with value 'End Date' has text '05/13/2021 13:30:00'
	And the user validates that 'Input By Label Name' with value 'Status' has text 'PLANNED'
	And the user validates that 'Input By Label Name' with value 'Priority' has text 'MEDIUM'
	And the user validates that 'Input By Label Name' with value 'Contact mode' has text 'Visit'
	And the user validates that 'Input By Label Name' with value 'Address' has text 'Gustav-Heinemann-Straße 7, KAARST, 41564, BE, DE'
	And the user validates that the 'Column' with value 'Category' is present
	And the user validates that the 'Column' with value 'Retail cluster' is present
	And the user closes all pages without saving the work done where there is no pop up
