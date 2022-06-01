Feature: TestCase_987091

@BDD_987091 @SFA_Smoke
Scenario: Web_Customers_NAV_Edit_Customer_Pop_Up
	#Step 1
	Given the user navigates to the 'Customer Master' page
	
	#Step 2
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Popup' with value 'Customer' is visible
	When the user clicks on 'Radio Button' with value 'New customer'
	Then the user validates that the 'Radio Button' with value 'New customer' is visible
	And the user validates that the 'Radio Button' with value 'Replace an existing' is visible
	And the user validates that the 'Radio Button' with value 'Activate on the current division' is visible

	#Step 3
	When the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to customer' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'VAT Code' is visible
	And the user validates that the 'Input By Label Name' with value 'Nation' is visible

	When the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to, Ship-to and POS' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'VAT Code' is visible
	And the user validates that the 'Input By Label Name' with value 'Nation' is visible

	When the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to and Ship-to' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'VAT Code' is visible
	And the user validates that the 'Input By Label Name' with value 'Nation' is visible

	#Step 4
	When the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Ship-to customer' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'Bill-to' is visible

	#Step 5
	When the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Point of Sales' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'Ship-to' is visible

	#Step 6
	When the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Ship to and point of Sales' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'Bill-to' is visible
	
	#Step 7
	When the user clicks on 'Radio Button' with value 'Replace an existing'

	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to, Ship-to and POS' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Section' with value 'Replacement' is visible
	And the user validates that the 'Section' with value 'VAT section' is visible

	#Step 8
	When the user clicks on 'Radio Button' with value 'New customer'
	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Hierarhical Node' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'Customer Type' is visible

	#Step 9
	When the user clicks on 'Radio Button' with value 'New customer'
	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Delivery Man' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'Customer Type' is visible

	#Step 10
	When the user clicks on 'Radio Button' with value 'New customer'
	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Warehouse' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	Then the user validates that the 'Input By Label Name' with value 'Customer Type' is visible

	#Step 11
	When the user clicks on 'Radio Button' with value 'New customer'
	And the user clicks on 'Input By Label Name' with value 'Customer Type'
	And the user clears the text on the 'Input By Label Name' with value 'Customer Type'
	And the user enters 'Bill-to, Ship-to and POS' in field 'Input By Label Name' with value 'Customer Type'
	And the user press the 'TAB' key on the 'Input By Label Name' with value 'Customer Type'
	And the user clicks on 'Popup Ok Button' with value 'Customer'
	Then the user validates that the 'Button' with value 'Save' is visible

	#Step 12
	When the user closes all pages without saving the work done