Feature: TestCase_534985
	Test Case 534985

@BDD_534985 @SFA_Nightly
Scenario: WEB_SFA_MD_CUST_UI_016_DELIVERY_TAB
	#Step 1
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<CustomerType>', Nation: '<Nation>', VAT Code: '<VATCode>'
	
	#Step 2
	And the user clicks on 'Top Tab' with value 'Main'
	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters '<CustomerName>' in field 'Input By Label Name' with value 'Customer Name'
	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'

	#Step 3

	# Mandatory Icon Validations
	And the user clicks on 'Top Tab' with value 'Delivery'
	Then the user validates that the 'Mandatory Icon' with value 'Delivery Depot' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Carrier' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Transport days' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Way of Delivery' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Way of Shipment' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Shipping mode' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Minimum Order Value' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Maximum Order Value' is not displayed
	
	# Fields must be Editable
	And the user validates that the 'Input By Label Name' with value 'Delivery Depot' is enabled
	And the user validates that the 'Input By Label Name' with value 'Carrier' is enabled
	And the user validates that the 'Input By Label Name' with value 'Transport days' is enabled
	And the user validates that the 'Input By Label Name' with value 'Way of Delivery' is enabled
	And the user validates that the 'Input By Label Name' with value 'Way of Shipment' is enabled
	And the user validates that the 'Input By Label Name' with value 'Shipping mode' is enabled
	And the user validates that the 'Input By Label Name' with value 'Minimum Order Value' is enabled
	And the user validates that the 'Input By Label Name' with value 'Maximum Order Value' is enabled

	#Fields must be visible
	And the user validates that the 'Input By Label Name' with value 'Delivery Depot' is displayed
	And the user validates that the 'Input By Label Name' with value 'Carrier' is displayed
	And the user validates that the 'Input By Label Name' with value 'Transport days' is displayed
	And the user validates that the 'Input By Label Name' with value 'Way of Delivery' is displayed
	And the user validates that the 'Input By Label Name' with value 'Way of Shipment' is displayed
	And the user validates that the 'Input By Label Name' with value 'Shipping mode' is displayed
	And the user validates that the 'Input By Label Name' with value 'Minimum Order Value' is displayed
	And the user validates that the 'Input By Label Name' with value 'Maximum Order Value' is displayed

	#Step 4
	When the user enters '<MinOrder>' in field 'Input By Label Name' with value 'Minimum Order Value'
	And the user moves the focus away from the element
	Then the user validates that the 'Navigation Error Icon' with value '<ErrorMessage>' is present

	# Step 5
	When the user enters '<MaxOrder>' in field 'Input By Label Name' with value 'Maximum Order Value'
	And the user moves the focus away from the element
	Then the user validates that the 'Navigation Error Icon' with value '<ErrorMessage>' is not present

	# Step 6
	When the user enters '<NumberOfTransportDays>' in field 'Input By Label Name' with value 'Transport days'
	And the user moves the focus away from the element
	And the user clicks on 'Checkbox' with value 'Accept Back Order'
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is displayed
	And the user closes all pages without saving the work done where there is no pop up

	Examples: 
	| CustomerAction1 | CustomerType             | Nation                   | VATCode | CustomerName | Address      | MinOrder | ErrorMessage                                                                      | MaxOrder | NumberOfTransportDays |
	| New customer    | Bill-to, Ship-to and POS | United States of America | US16    | CUST_UI_016  | Strada Palat | 50       | Maximum Order Value: Minimum order value must be smaller than Maximum order value | 200      | 44                    |