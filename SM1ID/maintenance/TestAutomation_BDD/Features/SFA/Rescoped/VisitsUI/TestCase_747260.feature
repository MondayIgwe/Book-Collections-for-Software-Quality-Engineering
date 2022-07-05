Feature: TestCase_747260
	Test case 747260

@BDD_747260 @SFA_Nightly
Scenario: WEB_SFA_SE_VISIT_007_VISIT_INFO_TAB_FOR_CUSTOMERS_AND_POS_BDD
	Given the user navigates to the 'Visits' page
	
	When the user filters the column by column name 'Id Visit', Filter Type 'Like', Value '<FilterValue1>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'Visit info'
	
	Then the user validates that the 'Top Tab' with value 'Account' is present
	And the user validates that the 'Top Tab' with value 'Attachments' is present
	And the user validates that the 'Top Tab' with value 'Customer Master' is present
	And the user validates that the 'Top Tab' with value 'Doctors' is present
	And the user validates that the 'Top Tab' with value 'Point of Sales' is present
	And the user validates that the 'Top Tab' with value 'Pharmacy' is present
	And the user validates that the 'Top Tab' with value 'Survey activities' is present
	And the user validates that the 'Top Tab' with value 'StoreCheck Recap' is present
	And the user validates that the 'Top Tab' with value 'Working Day Log' is present

	When the user clicks on 'Top Tab' with value 'Account'
	Then the user validates that the 'Account' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Control Account' column is sorted in '<AscendingOrder>' order

	When the user clicks on 'Top Tab' with value 'Attachments'
	Then the user validates that the 'Source' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Subject' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Customer name' column is sorted in '<AscendingOrder>' order

	When the user clicks on 'Top Tab' with value 'Customer Master'
	And the user clicks on 'Top Tab' with value 'Doctors'
	And the user clicks on 'Top Tab' with value 'Point of Sales'
	And the user clicks on 'Top Tab' with value 'Pharmacy'
	And the user clicks on 'Top Tab' with value 'Survey activities'
	And the user clicks on 'Top Tab' with value 'StoreCheck Recap'
	And the user clicks on 'Top Tab' with value 'Working Day Log'

	Then the user validates that the 'User Name' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Day' column is sorted in '<DescendingOrder>' order

	When the user clicks on 'Top Tab' with value 'Customer Master'
	Then the user validates that the 'Text in Grid' with value 'EC47378' is displayed

	When the user clicks on 'Top Tab' with value 'Survey activities'
	Then the user validates that the 'Text in Grid' with value 'Attachments' is displayed
	And the user validates that the 'Text in Grid' with value 'Customer visit' is displayed
	And the user validates that the 'Text in Grid' with value 'Contact' is displayed
	And the user validates that the 'Text in Grid' with value 'Price Check' is displayed
	And the user validates that the 'Text in Grid' with value 'Store check' is displayed

	When the user closes all pages without saving the work done where there is no pop up
	And the user filters the column by column name 'Id Visit', Filter Type 'Like', Value '<FilterValue2>'

	And the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'Visit info'

	Then the user validates that the 'Top Tab' with value 'Account' is present
	And the user validates that the 'Top Tab' with value 'Attachments' is present
	And the user validates that the 'Top Tab' with value 'Customer Master' is present
	And the user validates that the 'Top Tab' with value 'Doctors' is present
	And the user validates that the 'Top Tab' with value 'Point of Sales' is present
	And the user validates that the 'Top Tab' with value 'Pharmacy' is present
	And the user validates that the 'Top Tab' with value 'Survey activities' is present
	And the user validates that the 'Top Tab' with value 'StoreCheck Recap' is present
	And the user validates that the 'Top Tab' with value 'Working Day Log' is present

	When the user clicks on 'Top Tab' with value 'Account'
	Then the user validates that the 'Account' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Control Account' column is sorted in '<AscendingOrder>' order

	When the user clicks on 'Top Tab' with value 'Attachments'
	Then the user validates that the 'Source' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Subject' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Customer name' column is sorted in '<AscendingOrder>' order

	When the user clicks on 'Top Tab' with value 'Customer Master'
	And the user clicks on 'Top Tab' with value 'Doctors'
	And the user clicks on 'Top Tab' with value 'Point of Sales'
	And the user clicks on 'Top Tab' with value 'Pharmacy'
	And the user clicks on 'Top Tab' with value 'Survey activities'
	And the user clicks on 'Top Tab' with value 'StoreCheck Recap'
	And the user clicks on 'Top Tab' with value 'Working Day Log'
	
	Then the user validates that the 'User Name' column is sorted in '<AscendingOrder>' order
	And the user validates that the 'Day' column is sorted in '<DescendingOrder>' order
	
	When the user clicks on 'Top Tab' with value 'Customer Master'
	Then the user validates that the 'Text in Grid' with value '40003041' is displayed

	When the user clicks on 'Top Tab' with value 'Point of Sales'
	Then the user validates that the 'Text in Grid' with value '40003041' is displayed
	When the user closes all pages without saving the work done where there is no pop up

	Examples:
	| FilterValue1                   | FilterValue2                   | AscendingOrder | DescendingOrder |
	| 000000000000000001617026241246 | 000000000000000001619705745610 | ASC            | DESC            |