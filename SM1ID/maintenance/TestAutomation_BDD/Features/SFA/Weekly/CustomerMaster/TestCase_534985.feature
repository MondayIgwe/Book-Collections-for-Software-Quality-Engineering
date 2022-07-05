Feature: Testcase_534985

@BDD_534985 @SFA_Weekly
Scenario: WEB_SFA_MD_CUST_UI_016_DELIVERY_TAB
	# Step 1
	Given the user navigates to the 'Customer Master' page
	When the user adds a new Customer Master where Action: '<CustomerAction1>', Customer Type: '<CustomerType>', Nation: '<Nation>', VAT Code: '<VATCode>'

	# Step 2
	And the user clicks on 'Top Tab' with value 'Main'
	And the user clicks on 'Input By Label Name' with value 'Customer Name'
	And the user enters '<CustomerName>' in field 'Input By Label Name' with value 'Customer Name'

	And the user clicks on 'Input By Label Name' with value 'Address'
	And the user enters '<Address>' in field 'Input By Label Name' with value 'Address'
	And the user clicks on 'Top Tab' with value 'Delivery'
	
	# Step 3
	Then the user validates that the 'Input By Label Name' with value 'Delivery Depot' is displayed
	And the user validates that the 'Input By Label Name' with value 'Carrier' is displayed
	And the user validates that the 'Input By Label Name' with value 'Transport days' is displayed
	
	And the user validates that the 'Input By Label Name' with value 'Way of Delivery' is displayed
	And the user validates that the 'Input By Label Name' with value 'Way of Shipment' is displayed
	And the user validates that the 'Input By Label Name' with value 'Shipping mode' is displayed

	And the user validates that the 'Input By Label Name' with value 'Minimum Order Value' is displayed
	And the user validates that the 'Input By Label Name' with value 'Maximum Order Value' is displayed
	And the user validates that the 'Checkbox' with value 'Accept Back Order' is displayed

	And the user validates that 'Input By Label Name' with value 'Delivery Depot' is editable
	And the user validates that 'Input By Label Name' with value 'Carrier' is editable
	And the user validates that 'Input By Label Name' with value 'Transport days' is editable

	And the user validates that 'Input By Label Name' with value 'Way of Delivery' is editable
	And the user validates that 'Input By Label Name' with value 'Way of Shipment' is editable
	And the user validates that 'Input By Label Name' with value 'Shipping mode' is editable

	And the user validates that 'Input By Label Name' with value 'Minimum Order Value' is editable
	And the user validates that 'Input By Label Name' with value 'Maximum Order Value' is editable
	And the user validates that 'Checkbox' with value 'Accept Back Order' is editable

	And the user validates that the 'Mandatory Icon' with value 'Delivery Depot' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Carrier' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Transport days' is not displayed

	And the user validates that the 'Mandatory Icon' with value 'Way of Delivery' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Way of Shipment' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Shipping mode' is not displayed

	And the user validates that the 'Mandatory Icon' with value 'Minimum Order Value' is not displayed
	And the user validates that the 'Mandatory Icon' with value 'Maximum Order Value' is not displayed

	# Step 4
	When the user clicks on 'Input By Label Name' with value 'Minimum Order Value'
	And the user enters '<MinOrd>' in field 'Input By Label Name' with value 'Minimum Order Value'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Minimum Order Value'
	Then the user validates that the 'Navigation Error Icon' with value '<DesMsg>' is displayed
	
	# Step 5
	When the user clicks on 'Input By Label Name' with value 'Maximum Order Value'
	And the user enters '<MaxOrd>' in field 'Input By Label Name' with value 'Maximum Order Value'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Maximum Order Value'

	# Step 6
	When the user clicks on 'Input By Label Name' with value 'Delivery Depot'
	And the user enters 'ABROAD CASTELDACCIA STOREHOUSE' in field 'Input By Label Name' with value 'Delivery Depot'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Delivery Depot'

	And the user clicks on 'Input By Label Name' with value 'Carrier'
	And the user enters 'CIRINO GIUSEPPE' in field 'Input By Label Name' with value 'Carrier'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Carrier'

	And the user clicks on 'Input By Label Name' with value 'Transport days'
	And the user enters '<NumTranspDays>' in field 'Input By Label Name' with value 'Transport days'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Transport days'

	And the user clicks on 'Input By Label Name' with value 'Way of Delivery'
	And the user enters 'FREE AT DESTINATION' in field 'Input By Label Name' with value 'Way of Delivery'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Way of Delivery'

	And the user clicks on 'Input By Label Name' with value 'Way of Shipment'
	And the user enters 'VIA CARRIER' in field 'Input By Label Name' with value 'Way of Shipment'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Way of Shipment'

	And the user clicks on 'Input By Label Name' with value 'Shipping mode'
	And the user enters 'ONE DELIVERY NOTE PER ORDER' in field 'Input By Label Name' with value 'Shipping mode'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Shipping mode'

	And the user clicks on 'Checkbox' with value 'Accept Back Order'
	And the user closes the page and saves the work done

Examples: 
	| CustomerAction1 | CustomerType             | Nation                   | VATCode | MinOrd | MaxOrd | DesMsg                                                                            | NumTranspDays |
	| New customer    | Bill-to, Ship-to and POS | United States of America | US16    | 50     | 200    | Maximum Order Value: Minimum order value must be smaller than Maximum order value | 44            |