Feature: TestCase_534233


@BDD_534233 @SFA_Nightly
Scenario: WEB_SFA_MD_CUST_UI_006_NEW_CUST_BILL_TO_SHIP_TO_POS
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<CustomerType>', Nation: '<Nation>', VAT Code: '<VATCode>'

	Then the user validates that the 'Top Tab' with value 'Main' is visible
	And the user validates that the 'Top Tab' with value 'Delivery' is visible
	And the user validates that the 'Top Tab' with value 'Invoice' is visible
	And the user validates that the 'Top Tab' with value 'Point of Sale' is visible
	And the user validates that the 'Top Tab' with value 'Responsibility' is visible

	When the user clicks on 'Top Tab' with value 'Main'
	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters '<CustomerName>' in field 'Input By Label Name' with value 'Customer Name'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'
	And the user moves the focus away from the element

	And the user clicks on 'Side Panel Tab' with value 'Contact Info'
	Then the user validates that the 'Top Tab' with value 'Map' is visible
	And the user validates that the 'Top Tab' with value 'Calendars' is visible
	And the user validates that the 'Top Tab' with value 'Contacts' is visible

	When the user clicks on 'Side Panel Tab' with value 'Assortments'
	Then the user validates that the 'Top Tab' with value 'Assortments' is visible
	And the user validates that the 'Top Tab' with value 'Product Sort' is visible

	When the user clicks on 'Side Panel Tab' with value 'Linked information'
	Then the user validates that the 'Top Tab' with value 'Assets at Customers' is visible
	And the user validates that the 'Top Tab' with value 'Attachments' is visible

	And the user validates that the 'Top Tab' with value 'Reference Docs' is visible
	And the user validates that the 'Top Tab' with value 'PoS KPIs' is visible
	
	And the user validates that the 'Top Tab' with value 'Sales dashboard' is visible
	And the user validates that the 'Top Tab' with value 'Photos' is visible
	And the user validates that the 'Top Tab' with value 'Survey activities' is visible
	
	And the user validates that the 'Top Tab' with value 'Visits' is visible
	And the user validates that the 'Top Tab' with value 'Sales Rows' is visible
	And the user validates that the 'Top Tab' with value 'Sale Orders' is visible
	
	And the user validates that the 'Top Tab' with value 'Van Documents' is visible
	And the user validates that the 'Top Tab' with value 'Allocation' is visible
	And the user validates that the 'Top Tab' with value 'Valid promo action' is visible
	
	And the user validates that the 'Top Tab' with value 'Claims' is visible
	And the user validates that the 'Top Tab' with value 'Customer contacts' is visible

	When the user clicks on 'Side Panel Tab' with value 'Notes'
	Then the user validates that the 'Column' with value 'Note type' is visible
	And the user validates that the 'Column' with value 'Note' is visible

	When the user clicks on 'Side Panel Tab' with value 'Attachments'
	Then the user validates that the page with 'Top Tab' with value 'Attachments' is loaded
	And the user validates that the 'Top Tab' with value 'Attachments' is visible
	And the user validates that the 'Top Tab' with value 'Inherited Attachments' is visible

	When the user clicks on 'Side Panel Tab' with value 'Linked information'
	And the user clicks on 'Top Tab' with value 'Visits'
	And the user clicks on the 'Refresh Button'
	Then the user validates that the 'Column' with value 'Id Visit' is visible

	When the user clicks on 'Top Tab' with value 'Sale Orders'
	And the user clicks on the 'Refresh Button'
	Then the user validates that the 'Column' with value 'Order Number' is visible

	When the user clicks on 'Top Tab' with value 'Valid promo action'
	And the user clicks on the 'Refresh Button'
	Then the user validates that the 'Column' with value 'Action code' is visible

	When the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is displayed
	When the user closes all pages without saving the work done

	Examples: 
	| CustomerAction1 | CustomerType             | Nation  | VATCode | CustomerName | Address |
	| New customer    | Bill-to, Ship-to and POS | Romania | 125369  | CUST_UI_006  | lasi    |