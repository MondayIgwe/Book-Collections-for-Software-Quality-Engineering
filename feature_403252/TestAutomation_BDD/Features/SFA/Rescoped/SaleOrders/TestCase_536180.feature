Feature: TestCase_536180
	Test Case 536180
@BDD_536180 @SFA_Nightly
Scenario: WEB_SFA_SF_ORDER_027_Order_Delivery_dates_in_Multidelivery_by_Rows
	#Step 1
	Given the user navigates to the 'Sale Orders' page
	
	#Step 2
	When the user adds a new Sale Order where Order Type: '<OrderType>', Customer Type: '<CustType>', Ship-To Customer: '<ShipTo>'

	#Step 3
	And the user changes the Sales Order Customer Reponsibility User: 'SFA Automation 1'
	And the user clicks on 'Parent Generic Drop Down Trigger' with value 'Delivery dates'

	#Step 4
	When the user enters the characters 'd+2/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 1'
	And the user enters the characters 'd+3/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 2'
	And the user enters the characters 'd+4/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 3'
	And the user enters the characters 'd+5/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 4'
	And the user clicks on 'Popup Ok Button' with value 'Delivery dates'
	Then the user validates that the 'Side Panel Tab' with value 'Products' is present
	
	#Step 5 and Step 6
	When the user clicks on 'Side Panel Tab' with value 'Products'
	Then the user validates that the 'Grid Filter' with date value 'd+2/m/y' is visible
	And the user validates that the 'Grid Filter' with date value 'd+3/m/y' is visible
	And the user validates that the 'Grid Filter' with date value 'd+4/m/y' is visible
	And the user validates that the 'Grid Filter' with date value 'd+5/m/y' is visible

	#Step 7
	When the user clicks on the 'Expand Panel'
	And the user clicks on 'Top Tab' with value 'Details'
	Then the user validates that the 'Input By Label Name' with value 'Delivery date' is not shown
	And the user closes all pages without saving the work done
	
	Examples: 
	| OrderType           | CustType | ShipTo  |
	| Multidelivery Order | Customer | EC22160 |