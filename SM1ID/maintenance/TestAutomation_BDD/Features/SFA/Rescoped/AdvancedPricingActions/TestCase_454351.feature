Feature: TestCase_454351

@SFA_Nightly @BDD_454351 @SFA_Weekly
Scenario: WEB_SFA_SF_CNVACT_026_Basket_constraint_popup_opens_when_click_on_Add_basket_button
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '<AdvancedPricingBook>', Application Type: '<ApplicationType>', Valorization Type: '<ValorizationType>'
	
	And the user populates the 'General info' tab where 'Description' input field: '<CnvDescription>', 'Measure Unit' input field: '<MeasureUnitValue>'
	And the user clicks on 'Side Panel Tab' with value 'Customers'

	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'

	And the user clicks on the 'Add Button'
	And the user selects from the 'Customer Category' drop down grid menu the '<CustomerCatagory>' option
	And the user clicks on 'Popup Button' with value 'OK'

	And the user clicks on 'Side Panel Tab' with value 'Main constraints'
	And the user clicks on the hierarchical node with the value 'AND'
	And the user clicks on 'Button Link' with value 'Add Basket'

	Then the user validates that the 'Mandatory Icon' with value 'Object' is visible
	And the user validates that the 'Mandatory Icon' with value 'Attribute' is visible
	And the user validates that the 'Mandatory Icon' with value 'Operator' is visible

	And the user validates that the 'Mandatory Icon' with value 'Calculation type' is visible
	And the user validates that the 'Mandatory Icon' with value 'Value' is visible
	And the user validates that the 'Mandatory Icon' with value 'Measure unit' is visible

	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Order Header' in field 'Input By Label Name' with value 'Object'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Input By Label Name' with value 'Object' has no text

	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Order Row' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters 'NETAMOUNT - Net amount' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element

	Then the user validates that 'Input By Label Name' with value 'Operator' has text 'Greater Equal'
	And the user validates that the 'Input By Label Name' with value 'Calculation type' is not empty

	When the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters the characters '100.00' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Measure unit'
	And the user enters 'EUR - Euro' in field 'Input By Label Name' with value 'Measure unit'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Product' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	Then the user validates that the 'Input By Label Name' with value 'Attribute' has no text
	And the user validates that the 'Input By Label Name' with value 'Operator' has no text
	And the user validates that the 'Input By Label Name' with value 'Calculation type' has no text

	And the user validates that 'Input By Label Name' with value 'Value' has text '0.00'
	And the user validates that the 'Input By Label Name' with value 'Measure unit' has no text

	When the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Order Row' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters 'NETAMOUNT - Net amount' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters the characters '100.00' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Measure unit'
	And the user enters 'EUR - Euro' in field 'Input By Label Name' with value 'Measure unit'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'Cancel'
	Then the user validates that the hierarchical node with the value 'AND' is visible

	When the user clicks on 'Button Link' with value 'Add Basket'

	And the user clicks on 'Input By Label Name' with value 'Object'
	And the user enters 'Order Row' in field 'Input By Label Name' with value 'Object'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Attribute'
	And the user enters 'NETAMOUNT - Net amount' in field 'Input By Label Name' with value 'Attribute'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Value'
	And the user enters the characters '100.00' in field 'Input By Label Name' with value 'Value'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Measure unit'
	And the user enters 'EUR - Euro' in field 'Input By Label Name' with value 'Measure unit'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value 'AND' -> 'Sum - Order Row - Net amount >= 100 Euro' is visible
	When the user closes all pages without saving the work done

	Examples: 
	| AdvancedPricingBook | ApplicationType | ValorizationType | CnvDescription        |  MeasureUnitValue | CustomerCatagory |
	| 29 - JHN            | Semiautomatic   | Quantity         | WEB_SFA_SF_CNVACT_026 |  CARTONS          | HOTELS           |