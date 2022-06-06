Feature: TestCase_530051
	Automatic validations when set Target discount True

@BDD_530051 @SFA_Weekly
Scenario: 530051_WEB_SFA_SF_CNVACT_095_Automatic_validations_when_set_Target_discount_true
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '29 - JHN', Application Type: 'Discretionary', Valorization Type: 'Quantity'
	Then the user validates that the 'Side Panel Tab' with value 'General info' is displayed

	When the user enters 'Canvass for WEB_SFA_SF_CNVACT_095' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	And the user clicks on 'Generic Drop Down Trigger' with value 'Valorization Type'
	And the user select value 'Quantity' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Measure Unit'
	And the user select value 'CARTONS' from dropdown list 'Generic Drop Down Trigger'

	Then the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user validates that the 'Side Panel Tab' with value 'Customers' is displayed
	When the user clicks on the 'Add Button'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Customer Category'
	And the user clicks on 'Dropdown Panel Checkbox' with value 'B2B'
	And the user clicks on 'Dropdown Panel Button' with value 'OK'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Side Panel Tab' with value 'Customers' is displayed
	And the user clicks on 'Top Tab' with value 'Customer Simulation'

	#Step 2
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	When the user clicks on 'Top Tab' with value 'Benefit brackets'
	And the user clicks on 'Button Link' with value 'Threshold'
	Then the user validates that the 'Input By Label Name' with value 'CARTONS - Quantity' is displayed
	When the user enters '120.00' in field 'Input By Label Name' with value 'CARTONS - Quantity'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Node' with value '<ThresholdNode1>' is visible

	#Step 3
	When the user clicks on the hierarchical node with the value '<ThresholdNode1>'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	Then the user validates that the 'Popup Title' with value 'Description' is displayed
	And the user validates that the 'Input By Label Name' with value 'Value of the group' is displayed

	When the user enters 'Benefit for WEB_SFA_SF_CNVACT_095' in the 'Benefit Group Description'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Node' with value '<BenefitGroupNode1>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' is visible

	#Step 4 - Add benefit 1
	When the user clicks on the hierarchical node with the value '<BenefitGroupNode1>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup Title' with value 'Benefit' is displayed
	When the user moves the focus away from the element
	Then the user validates that the 'Input By Label Name' with value 'Benefit type' is visible
	And the user validates that the 'Input By Label Name' with value 'Benefit' is visible
	When the user clicks on 'Generic Drop Down Trigger' with value 'Benefit type'
	And the user select value '11 - Row TAX' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '10.00' in field 'Input By Label Name' with value 'Benefit'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit Um.'
	And the user select value '<BenUmValue>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit sub-reason'
	And the user select value '<BenSubReason>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible

	#Step 4 - Add benefit 2

	When the user clicks on the hierarchical node with the value '<BenefitGroupNode1>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup Title' with value 'Benefit' is displayed
	When the user moves the focus away from the element
	Then the user validates that the 'Input By Label Name' with value 'Benefit type' is visible
	And the user validates that the 'Input By Label Name' with value 'Benefit' is visible
	When the user clicks on 'Generic Drop Down Trigger' with value 'Benefit type'
	And the user select value '4 - Amount discount on Order Head' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '7.00' in field 'Input By Label Name' with value 'Benefit'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit Um.'
	And the user select value '<BenUmValue>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit sub-reason'
	And the user select value '<BenSubReason>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode2>' is visible

	#Step 5
	When the user clicks on 'Checkbox' with value 'Target discount'	
	Then the user validates that the 'Alert Dialog Message Box' is visible
	And the user validates that the 'Warning' is visible
	And the user validates that 'Alert Dialog Message Box' text contains 'Setting this flag true all benefits will be removed. Continue?'

	#Step 6
	When the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that the checkbox container 'Checkbox' with value 'Target discount' is set to the state: 'On'
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' is visible
	And the user validates that the 'Node' with value 'ThresholdNode1 => <BenefitGroupNode1> => <BenefitNode1>' is not shown
	And the user validates that the 'Node' with value 'ThresholdNode1 => <BenefitGroupNode1> => <BenefitNode2>' is not shown

	#Step 7
	When the user clicks on 'Checkbox' with value 'Target discount'
	Then the user validates that the checkbox container 'Checkbox' with value 'Target discount' is set to the state: 'Off'

	#Step 8
	When the user clicks on 'Checkbox' with value 'Target discount'
	Then the user validates that the checkbox container 'Checkbox' with value 'Target discount' is set to the state: 'On'
	And the user validates that the 'Alert Dialog Message Box' is not present

	#Step 9
	When the user clicks on 'Checkbox' with value 'Target discount'
	Then the user validates that the checkbox container 'Checkbox' with value 'Target discount' is set to the state: 'Off'
	
	#Step 10
	When the user clicks on the hierarchical node with the value '<BenefitGroupNode1>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup Title' with value 'Benefit' is displayed
	When the user moves the focus away from the element
	Then the user validates that the 'Input By Label Name' with value 'Benefit type' is visible
	And the user validates that the 'Input By Label Name' with value 'Benefit' is visible
	When the user clicks on 'Generic Drop Down Trigger' with value 'Benefit type'
	And the user select value '13 - Euro for Invoice unit' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '15.00' in field 'Input By Label Name' with value 'Benefit'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit Um.'
	And the user select value '<BenUmValue>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit sub-reason'
	And the user select value '<BenSubReason>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> 'Euro for Invoice unit - 15 Euro' is visible
	
	#Step 11
	When the user clicks on the 'Save Button'
	Then the user validates that the 'Success Toast Message' is displayed
	And the user closes the page and saves the work done

	Examples:
	| ThresholdNode1                    | BenefitGroupNode1                                                          | BenUmValue | BenSubReason   | BenefitNode1      | BenefitNode2                           |
	| Thresholds - Quantity 120 CARTONS | Group Benefit for WEB_SFA_SF_CNVACT_095 - Cost 120 - Max Number of Times 0 | EUR - Euro | Brand Discount | Row TAX - 10 Euro | Amount discount on Order Head - 7 Euro |