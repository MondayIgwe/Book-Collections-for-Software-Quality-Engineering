Feature: TestCase_535562
	Test Case 535562

@BDD_535562 @SFA_Nightly
Scenario: TC_535562_WEB_SFA_MD_CUST_UI_018_POS_TAB
	#Step 1
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<CustomerType>', Bill-To: '<BillTo>'

	#Step 2
	And the user enters '<CustName>' in field 'Input By Label Name' with value 'Customer Name'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'
	And the user enters '<Country>' in field 'Input By Label Name' with value 'Country'

	#Step 3
	And the user clicks on 'Top Tab' with value 'Point of Sale'

	Then the user validates that the 'Section' with value 'Point of Sale' is visible

	And the user validates that the 'Input By Label Name' with value 'Cluster Nielsen' is visible
    And the user validates that the 'Input By Label Name' with value 'Cluster Nielsen' is enabled
    And the user validates that the 'Mandatory Icon' with value 'Cluster Nielsen' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Internal Cluster' is visible
	And the user validates that the 'Input By Label Name' with value 'Internal Cluster' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Internal Cluster' is not displayed

	And the user validates that the 'Section' with value 'Seasonality' is visible

	And the user validates that the 'Input By Label Name' with value 'Seasonality' is visible
	And the user validates that the 'Input By Label Name' with value 'Seasonality' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Seasonality' is not displayed
	And the user validates that 'Input By Label Name' with value 'Seasonality' has text '<Season>'

	And the user validates that the 'Input By Label Name' with value 'Start Closure Month' is visible
	And the user validates that the 'Input By Label Name' with value 'Start Closure Month' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Start Closure Month' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Start Closure Day' is visible
	And the user validates that the 'Input By Label Name' with value 'Start Closure Day' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Start Closure Day' is not displayed

	And the user validates that the 'Input By Label Name' with value 'End Closure Month' is visible
	And the user validates that the 'Input By Label Name' with value 'End Closure Month' is enabled
	And the user validates that the 'Mandatory Icon' with value 'End Closure Month' is not displayed

	And the user validates that the 'Input By Label Name' with value 'End Closure Day' is visible
	And the user validates that the 'Input By Label Name' with value 'End Closure Day' is enabled
	And the user validates that the 'Mandatory Icon' with value 'End Closure Day' is not displayed

	And the user validates that the 'Section' with value 'Nielsen Information' is visible

	And the user validates that the 'Input By Label Name' with value 'Potential Index' is visible
	And the user validates that the 'Input By Label Name' with value 'Potential Index' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Potential Index' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Nielsen POS Code' is visible
	And the user validates that the 'Input By Label Name' with value 'Nielsen POS Code' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Nielsen POS Code' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Nielsen POS' is visible
	And the user validates that the 'Input By Label Name' with value 'Nielsen POS' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Nielsen POS' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Total Sale Surface' is visible
	And the user validates that the 'Input By Label Name' with value 'Total Sale Surface' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Total Sale Surface' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Total Food Surface' is visible
	And the user validates that the 'Input By Label Name' with value 'Total Food Surface' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Total Food Surface' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Total No Food Surface' is visible
	And the user validates that the 'Input By Label Name' with value 'Total No Food Surface' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Total No Food Surface' is not displayed


	And the user validates that the 'Input By Label Name' with value 'Cash Desks Nr.' is visible
	And the user validates that the 'Input By Label Name' with value 'Cash Desks Nr.' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Cash Desks Nr.' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Equipped Cash Desks Nr.' is visible
	And the user validates that the 'Input By Label Name' with value 'Equipped Cash Desks Nr.' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Equipped Cash Desks Nr.' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Shelf Linear  Meters' is visible
	And the user validates that the 'Input By Label Name' with value 'Employees Total' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Shelf Linear  Meters' is not displayed

	And the user validates that the 'Input By Label Name' with value 'Employees Total' is visible
	And the user validates that the 'Input By Label Name' with value 'Shelf Linear  Meters' is enabled
	And the user validates that the 'Mandatory Icon' with value 'Employees Total' is not displayed

	#Step 4
	When the user clicks on 'Top Tab' with value 'Product Lines'

	Then the user validates that the 'Column' with value 'Category Code' is visible
	And the user validates that the 'Column' with value 'Potential Index' is visible
	And the user validates that the 'Column' with value 'Category role in the POS' is visible
	And the user validates that the 'Column' with value 'Shelf Linear  Meters' is visible
	And the user validates that the 'Column' with value 'Equipped cash desks nr' is visible
	And the user validates that the 'Column' with value 'Retailer cluster' is visible
	
	#Step 5
	When the user clicks on 'Top Tab' with value 'Ship-to Customers'
	
	Then the user validates that the 'Column' with value 'Ship-to code' is visible
	And the user validates that the 'Column' with value 'Ship-to customer' is visible
	And the user validates that the 'Column' with value 'Primary' is visible
	And the user validates that the 'Column' with value 'Cancelled' is visible

	#Step 6
	And the user validates that the 'Ship To Customers Sub Tab Grid' singlegrid contains the span value '<CustName>' in the 'Ship-to customer' column in the row number '1'
	And the user validates that the 'Ship To Customers Sub Tab Grid' singlegrid has the checkbox cell is marked as 'on' in the 'Primary' column in the row number '1'
	
	#Step 7
	When the user clicks on 'Input By Label Name' with value 'Potential Index'
	And the user enters '<PotentialIndex>' in field 'Input By Label Name' with value 'Potential Index'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Nielsen POS Code'
	And the user enters '<POSCode>' in field 'Input By Label Name' with value 'Nielsen POS Code'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Nielsen POS'
	And the user enters '<POSName>' in field 'Input By Label Name' with value 'Nielsen POS'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Total Sale Surface'
	And the user enters '<Total>' in field 'Input By Label Name' with value 'Total Sale Surface'
	And the user moves the focus away from the element
	
	And the user clicks on 'Input By Label Name' with value 'Total Food Surface'
	And the user enters '<TotalFood>' in field 'Input By Label Name' with value 'Total Food Surface'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Total No Food Surface'
	And the user enters '<TotalNoFood>' in field 'Input By Label Name' with value 'Total No Food Surface'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Cash Desks Nr.'
	And the user enters '<Desks>' in field 'Input By Label Name' with value 'Cash Desks Nr.'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Equipped Cash Desks Nr.'
	And the user enters '<DeskEquip>' in field 'Input By Label Name' with value 'Equipped Cash Desks Nr.'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Employees Total'
	And the user enters '<TotalEmpl>' in field 'Input By Label Name' with value 'Employees Total'
	And the user moves the focus away from the element
	
	And the user clicks on 'Input By Label Name' with value 'Shelf Linear  Meters'
	And the user enters '<ShelfMeters>' in field 'Input By Label Name' with value 'Shelf Linear  Meters'
	And the user moves the focus away from the element

	#Step 8
	And the user clicks on the 'Add Button'
	And the user opens the Grid Settings Menu option: 'Columns' in the '<Title>' pop up table
	And the user filters the pop up menu with title: 'Columns Settings' by column name 'Caption' Filter condition: 'Like' Field Value: '<Attribute>'
	And the user clicks on 'Columns Settings' pop up table where 'Caption' column has the value:'<Attribute>' and the checkbox is in column:'Visible' is turned:'on'
	And the user clicks on 'Popup Ok Button' with value 'Columns Settings'
	And the user scrolls to the '<Attribute>' column in the '<Title>' pop-up table

	And the user filters the pop up menu with title: '<Title>' by column name '<Attribute>' for the checkbox state: '<Val>'
	Then the user validates that 'Pop Up Toolbar Grid Record Count' with value '<Title>' has text '0/0'
	
	#Step 9
	When the user opens the Grid Settings Menu option: 'Remove Filter' in the '<Title>' pop up table
	And the user selects row '1' on the '<Title>' pop up table
	And the user selects row '2' on the '<Title>' pop up table
	And the user selects row '3' on the '<Title>' pop up table
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that 'Toolbar Grid Record Count' is populated with '0/4'

	#Step 10
	When the user clicks on 'Button' with value 'Save'
	And the user closes the page and saves the work done
	
		Examples: 
	| CustomerAction1 | CustomerType               | BillTo   | CustName    | Address      | Country | Season         | PotentialIndex | POSCode | POSName   | Total     | TotalFood   | TotalNoFood | Desks     | DeskEquip | TotalEmpl   | ShelfMeters | Title             | Attribute        | Val   |
	| New customer    | Ship to and point of Sales | 10003052 | CUST_UI_018 | Strada Palat | Austria | No seasonality | 88             | E35     | pos niels | 3444      | 2345        | 456         | 56        | 766       | 333         | 212         | Ship-to Customers | Ship-to customer | False |
