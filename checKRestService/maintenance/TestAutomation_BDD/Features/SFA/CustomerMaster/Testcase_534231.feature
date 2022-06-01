Feature: TestCase_534231
	Testcase_534231

@BDD_534231 @SFA_Weekly
Scenario: WEB_SFA_MD_CUST_UI_005_VALIDATE_VAT
	#Step 1
	Given the user navigates to the '<navigator>' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<BILL_TO>', Nation: '<NATION>', VAT Code: '<VATCODE_CHECK>'
	Then the user validates that the 'Pop Up Error Message' with value '<MSG_CHECK_ERR>' is displayed
	And the user validates that the 'Popup' with value 'Customer' is displayed

	#Step 2
	When the user enters the characters '<VATCODE_DUPLICATE>' in field 'Input By Label Name' with value 'VAT Code'
	And the user moves the focus away from the element
	Then the user validates that the 'Pop Up Error Message' with value '<MSG_CHECK_ERR>' is not shown

	#Step 3
	When the user clicks on 'Button' with value 'OK'
	Then the user validates that the 'Input By Label Name' with value 'Customer Type' is displayed
	And the user validates that the 'Popup' with value 'Customer' is displayed
	And the user validates that the 'Pop Up Error Message' with value '<MSG_DUPLICATE_ERROR>' is displayed

	#Step 4
	When  the user clicks on 'Generic Drop Down Trigger' with value 'Customer Type'
	And the user select value '<BILL_TO_SHIP_TO>' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '<NATION>' in field 'Input By Label Name' with value 'Nation'
	And the user enters the characters '<VATCODE_CHECK>' in field 'Input By Label Name' with value 'VAT Code'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'OK'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	And the user validates that 'Alert Dialog Message Box' text contains '<MSG_CHECK_WARN_1>'
	And the user validates that 'Alert Dialog Message Box' text contains '<MSG_CHECK_WARN_2>'

	#Step 5
	When the user clicks on the 'Alert Dialog No Button'
	Then the user validates that the 'Popup' with value 'Customer' is displayed
	When the user enters the characters '<VATCODE_DUPLICATE>' in field 'Input By Label Name' with value 'VAT Code'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'OK'
	Then the user validates that the 'Pop Up Error Message' with value '<MSG_DUPLICATE_ERROR>' is displayed

	#Step 6
	When  the user clicks on 'Generic Drop Down Trigger' with value 'Customer Type'
	And the user select value '<BILL_TO_SHIP_TO_POS>' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '<NATION>' in field 'Input By Label Name' with value 'Nation'
	And the user enters the characters '<VATCODE_CHECK>' in field 'Input By Label Name' with value 'VAT Code'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'OK'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	And the user validates that 'Alert Dialog Message Box' text contains '<MSG_CHECK_WARN_1>'
	And the user validates that 'Alert Dialog Message Box' text contains '<MSG_CHECK_WARN_2>'
	
	#Step 7
	When the user clicks on the 'Yes Button'
	Then the user validates that the 'Side Panel Tab' with value 'Main Information' is displayed
	
	#Step 8
	When the user clicks on the 'Toolbar Close Button'
	And the user clicks on the 'No Button'
	Then the user validates that the user is on the '<navigator>' page

	When the user adds a new Customer and does not close the popup where Action: '<REPLACE_CUST>', Customer Type: '<BILL_TO>', Customer Position: 3
	And the user enters '<NATION>' in field 'Input By Label Name' with value 'Nation'
	And the user enters the characters '<VATCODE_CHECK>' in field 'Input By Label Name' with value 'VAT Code'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'OK'
	Then the user validates that the 'Pop Up Error Message' with value '<MSG_CHECK_ERR>' is displayed
	And the user validates that the 'Popup' with value 'Customer' is displayed
	
	#Step9
	When the user enters the characters '<VATCODE_DUPLICATE >' in field 'Input By Label Name' with value 'VAT Code'
	And the user moves the focus away from the element
	When the user clicks on 'Button' with value 'OK'
	Then the user validates that the 'Pop Up Error Message' with value '<MSG_DUPLICATE_ERROR>' is displayed
	And the user validates that the 'Popup' with value 'Customer' is displayed
	When the user clicks on 'Button' with value 'Cancel'
	#Step10
	And the user adds a new Customer where Action: '<ACTIVATE_CUST>', Customer Type: '<BILL_TO_SHIP_TO>', Nation: '<NATION>', VAT Code: '<VATCODE_OTHERDIV>', Customer Position: 1
	Then the user validates that the 'Side Panel Tab' with value 'Main Information' is displayed
	


	Examples: 
	| navigator       | CustomerAction1 | BILL_TO          | NATION | VATCODE_CHECK | MSG_CHECK_ERR  | VATCODE_DUPLICATE | MSG_DUPLICATE_ERROR          | BILL_TO_SHIP_TO     | MSG_CHECK_WARN_1 | BILL_TO_SHIP_TO_POS      | REPLACE_CUST        | ACTIVATE_CUST                    | VATCODE_OTHERDIV | MSG_CHECK_WARN_2 |
	| Customer Master | New customer    | Bill-to customer | ITALY  | 1566          | Error VAT CODE | 01299511210       | VAT/TAX code already exists. | Bill-to and Ship-to | Error VAT CODE   | Bill-to, Ship-to and POS | Replace an existing | Activate on the current division | 00067920389      | Continue?        |