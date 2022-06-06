Feature: TestCase_481638

@SFA_Nightly @BDD_481638
Scenario: WEB_SFA_SF_CNVACT_058_Can_Edit_a_Benefit_node_in_canvass_action
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '29 - JHN', Application Type: 'Semiautomatic', Valorization Type: 'Amount'

	And the user populates the 'General info' tab where 'Description' input field: 'Canvass for WEB_SFA_SF_CNVACT_058', 'Valorization Attribute' input field: 'Net Amount', 'Measure Unit' input field: 'Euro'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'
	And the user clicks on the 'Add Button'

	And the user selects from the 'Customer Category' drop down grid menu the 'B2B' option
	And the user clicks on 'Popup Button' with value 'OK'

	And the user clicks on 'Side Panel Tab' with value 'Benefits'
	And the user clicks on 'Top Tab' with value 'Benefit brackets'
	And the user clicks on 'Button Link' with value 'Threshold'

	And the user clicks on 'Input By Partial Label Name' with value 'Net Amount'
	And the user enters the characters '15000.00' in field 'Input By Partial Label Name' with value 'Net Amount'

	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'

	And the user clicks on the hierarchical node with the value 'Thresholds - Net Amount 15000 Euro'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	
	And the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters 'Benefit group for WEB_SFA_SF_CNVACT_057' in field 'Input By Label Name' with value 'Description'
	
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'


	And the user clicks on the hierarchical node with the value 'Thresholds - Net Amount 15000 Euro' -> 'Group Benefit group for WEB_SFA_SF_CNVACT_057 - Cost 15000 - Max Number of Times 0'
	And the user clicks on 'Button Link' with value 'Benefit'

	And the user clicks on 'Input By Label Name' with value 'Benefit type'
	And the user enters '3 - % Discount on Order Row' in field 'Input By Label Name' with value 'Benefit type'
	
	And the user moves the focus away from the element
	And the user clicks on 'Input By Label Name' with value 'Benefit'
	
	And the user enters the characters '10.00' in field 'Input By Label Name' with value 'Benefit'
	And the user moves the focus away from the element
	
	And the user clicks on 'Input By Label Name' with value 'Benefit reason'
	And the user enters 'Rule-based pricing Mkt Disc.' in field 'Input By Label Name' with value 'Benefit reason'	
	
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'

	Then the user closes the page and saves the work done
	When the user filters the column by column name 'Code', 'Like', 'AdvancedPricingActionCode'
	
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	And the user clicks on the hierarchical node with the value 'Thresholds - Net Amount 15000 Euro' -> 'Group Benefit group for WEB_SFA_SF_CNVACT_057 - Cost 15000 - Max Number of Times 0' -> '% Discount on Order Row - 10% '

	And the user clicks on the 'Edit Button Link'
	Then the user validates that 'Input By Label Name' with value 'Benefit type' has text '3 - % Discount on Order Row'

	And the user validates that 'Input By Label Name' with value 'Benefit' has text '10.00'
	And the user validates that 'Input By Label Name' with value 'Max. Value' has text '10.000'

	And the user validates that 'Input By Label Name' with value '1° Alarm Max discount' has text '10.000'
	And the user validates that 'Input By Label Name' with value 'Benefit reason' has text 'Rule-based pricing Mkt Disc.'
	And the user validates that 'Input By Label Name' with value 'Benefit sub-reason' has text 'Quantity Disc. on specialized'
	
	When the user clicks on 'Input By Label Name' with value 'Benefit type'
	And the user enters '5 - Amount discount on Order Row' in field 'Input By Label Name' with value 'Benefit type'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit'
	And the user enters '1.00' in field 'Input By Label Name' with value 'Benefit'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit Um.'
	And the user enters 'EUR - Euro' in field 'Input By Label Name' with value 'Benefit Um.'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit reason'
	And the user enters 'Contractual Discount' in field 'Input By Label Name' with value 'Benefit reason'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit sub-reason'
	And the user enters 'Base discount' in field 'Input By Label Name' with value 'Benefit sub-reason'
	
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'

	And the user clicks on the hierarchical node with the value 'Thresholds - Net Amount 15000 Euro' -> 'Group Benefit group for WEB_SFA_SF_CNVACT_057 - Cost 15000 - Max Number of Times 0' -> 'Amount discount on Order Row - 1 Euro '
	And the user clicks on the 'Edit Button Link'

	Then the user validates that 'Input By Label Name' with value 'Benefit Um.' has text 'EUR - Euro'
	When the user clicks on 'Popup Button' with value 'Cancel'

	Then the user validates that the hierarchical node with value 'Thresholds - Net Amount 15000 Euro' -> 'Group Benefit group for WEB_SFA_SF_CNVACT_057 - Cost 15000 - Max Number of Times 0' -> 'Amount discount on Order Row - 1 Euro ' is visible
	And the user closes the page and saves the work done