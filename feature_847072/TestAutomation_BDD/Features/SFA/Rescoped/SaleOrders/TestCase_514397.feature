Feature: TestCase_514397
	TestCase 514397

@BDD_514397 @SFA_Nightly
Scenario: WEB_SFA_SF_ORDER_004_Validations_are_done_in_popup_for_Delivery_dates
	#Step 1
	Given the user navigates to the 'Sale Orders' page
	
	#Step 2
	When the user adds a new Sale Order where Order Type: '<OrderType>', Customer Type: '<CustType>', Ship-To Customer: '<ShipTo>'
	
	#Step 3
	And the user changes the Sales Order Customer Reponsibility User: 'SFA Automation 1'
	And the user clicks on 'Parent Generic Drop Down Trigger' with value 'Delivery dates'
	
	#Step 4
	Then the user validates that the 'Input By Label Name' with value 'Opt. Delivery Date 1' is visible
	When the user enters the characters 'd+4/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 1'
	And the user enters the characters 'd+5/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 3'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorMessage1>' is displayed
	And the user validates that the 'Popup Button' with value 'OK' is disabled
	
	#Step 5
	When the user enters the characters 'd/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 1'
	And the user clears the text on the 'Input By Label Name' with value 'Opt. Delivery Date 3'
	And the user clicks on 'Input By Label Name' with value 'Opt. Delivery Date 4'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorMessage2>' is displayed
	And the user validates that the 'Popup Button' with value 'OK' is disabled

	#Step 6
	When the user enters the characters 'd+1/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 1'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorMessage2>' is displayed
	And the user validates that the 'Popup Button' with value 'OK' is disabled

	#Step 7
	When the user enters the characters 'd+2/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 1'
	And the user enters the characters 'd+2/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 2'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorMessage3>' is displayed
	And the user validates that the 'Popup Button' with value 'OK' is disabled

	#Step 8
	When the user enters the characters 'd+13/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 2'
	And the user moves the focus away from the element
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorMessage4>' is displayed
	And the user validates that the 'Popup Button' with value 'OK' is disabled

	#Step 9
	When the user enters the characters 'd+4/m/y' in field 'Input By Label Name' with value 'Opt. Delivery Date 2'
	And the user clicks on 'Popup Ok Button' with value 'Delivery dates'
	And the user closes all pages without saving the work done

	Examples: 
	| ErrorMessage1                                                           | ErrorMessage2                                                                      | ErrorMessage3                                                                      | ErrorMessage4                                                           | OrderType           | CustType | ShipTo  |
	| Opt. Delivery Date 2: Empty date not allowed between set delivery dates | Opt. Delivery Date 1: Delivery date is lower than or equal to the previous one set | Opt. Delivery Date 2: Delivery date is lower than or equal to the previous one set | Opt. Delivery Date 2: Invalid difference between the set delivery dates | Multidelivery Order | Customer | EC22160 |
