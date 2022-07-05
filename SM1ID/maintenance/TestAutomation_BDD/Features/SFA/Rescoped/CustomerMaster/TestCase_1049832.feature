Feature: TestCase_1049832

@BDD_1049832 @SFA_Nightly @SFA_Weekly
Scenario: TC_1049832_WEB_SFA_MD_CUST_UI_018_1_POS_TAB_SHIPTO_TAB
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<POSType>', Ship-To: '<POS>' and extract selectted Customer Code

	And the user enters '<CustName>' in field 'Input By Label Name' with value 'Customer Name'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'
	And the user enters '<Country>' in field 'Input By Label Name' with value 'Country'

	And the user clicks on 'Top Tab' with value 'Point of Sale'
	And the user clicks on 'Top Tab' with value 'Ship-to Customers'
	Then the user validates that the 'Ship To Customers Sub Tab Grid' singlegrid contains the retrieved value in the 'Ship-to code' column in the row number '1'
	And the user validates that the 'Ship To Customers Sub Tab Grid' singlegrid has the checkbox cell is marked as 'on' in the 'Primary' column in the row number '1'

	When the user clicks on the 'Add Button'
	And the user filters the pop up menu with title: '<Title>' by column name 'Customer Code' field name: 'Like' and retieved value
	Then the user validates that 'Pop Up Toolbar Grid Record Count' with value '<Title>' has text '0/0'

	When the user opens the Grid Settings Menu option: 'Remove Filter' in the '<Title>' pop up table
	And the user selects row '1' on the '<Title>' pop up table
	And the user selects row '2' on the '<Title>' pop up table
	And the user selects row '3' on the '<Title>' pop up table
	And the user selects row '4' on the '<Title>' pop up table
	And the user selects row '5' on the '<Title>' pop up table
	And the user selects row '6' on the '<Title>' pop up table
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that 'Toolbar Grid Record Count' is populated with '0/7'

	When the user clicks on 'Button' with value 'Save'
	And the user closes all pages without saving the work done where there is no pop up
	
	Examples: 
	| CustomerAction1 | CustName    | Address      | Country | Title             | POSType        | POS  |
	| New customer    | CUST_UI_018 | Strada Palat | Austria | Ship-to Customers | Point of Sales | 1233 |