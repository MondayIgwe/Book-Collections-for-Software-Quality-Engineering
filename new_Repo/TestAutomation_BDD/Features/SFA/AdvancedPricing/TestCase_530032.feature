Feature: TestCase_530032
	AND operator is added automatically in the Main/Valorization/Benefit tree

@BDD_530032 @SFA
Scenario: 530032_WEB_SFA_SF_CNVACT_094_AND operator is added automatically in the Main/Valorization/Benefit tree

	#Step 1
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '<CnvBook>', Application Type: '<Coddiscr>', Valorization Type: '<ValTypeValue>'
	Then the user validates that the 'Side Panel Tab' with value 'General info' is displayed

	When the user enters '<CnvDescription>' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	And the user clicks on 'Generic Drop Down Trigger' with value 'Valorization Type'
	And the user select value '<ValorizationAttributeValue>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Measure Unit'
	And the user select value '<MeasureUnitValue>' from dropdown list 'Generic Drop Down Trigger'

	Then the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user validates that the 'Side Panel Tab' with value 'Customers' is displayed
	When the user clicks on the 'Add Button'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Customer Category'
	And the user clicks on 'Dropdown Panel Checkbox' with value '<CustomerCategory>'
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
	When the user enters '<CartonsQuantityValue>' in field 'Input By Label Name' with value 'CARTONS - Quantity'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Node' with value '<ThresholdNode1>' is visible

	#Step 3
	When the user clicks on the hierarchical node with the value '<ThresholdNode1>'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	Then the user validates that the 'Popup Title' with value 'Description' is displayed
	And the user validates that the 'Input By Label Name' with value 'Value of the group' is displayed

	When the user enters '<BenefitGroupDescription1>' in the 'Benefit Group Description'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the 'Node' with value '<BenefitGroupNode1>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' is visible

	#Step 4
	When the user clicks on the hierarchical node with the value '<BenefitGroupNode1>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup Title' with value 'Benefit' is displayed
	When the user moves the focus away from the element
	Then the user validates that the 'Input By Label Name' with value 'Benefit type' is visible
	And the user validates that the 'Input By Label Name' with value 'Benefit' is visible
	When the user clicks on 'Generic Drop Down Trigger' with value 'Benefit type'
	And the user select value '<Benefit5>' from dropdown list 'Generic Drop Down Trigger'
	And the user enters '<BenValue>' in field 'Input By Label Name' with value 'Benefit'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit Um.'
	And the user select value '<BenUmValue>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Benefit sub-reason'
	And the user select value '<BenSubReason>' from dropdown list 'Generic Drop Down Trigger'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible

	#Step 5
	When the user clicks on 'Top Tab' with value 'Benefit'
	And the user clicks on 'Checkbox' with value 'Copy from Valorization Tree'
	Then the user validates that the checkbox container 'Checkbox' with value 'Copy from Valorization Tree' is set to the state: 'Off'

	#Step 6
	When the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	And the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on the hierarchical node with the value 'AND'
	And the user clicks on 'Button Link' with value 'Remove'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Alert Dialog Yes Button'
	Then the user validates that the 'Node' with value 'AND' is not shown

	#Step 7

	When the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the 'Side Panel Tab' with value 'Valorization' is displayed
	And the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on the hierarchical node with the value 'AND'
	And the user clicks on 'Button Link' with value 'Remove'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Alert Dialog Yes Button'
	Then the user validates that the 'Node' with value 'AND' is not shown

	#Step 8

	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	And the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on 'Top Tab' with value 'Benefit'
	And the user clicks on the hierarchical node with the value 'AND'
	And the user clicks on 'Button Link' with value 'Remove'
	Then the user validates that the 'Alert Dialog Message Box' is visible
	When the user clicks on the 'Alert Dialog Yes Button'
	Then the user validates that the 'Node' with value 'AND' is not shown

	#Step 9
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is displayed

	#Step 10
	When the user clicks on 'Side Panel Tab' with value 'Main constraints'
	Then the user validates that the 'Side Panel Tab' with value 'Main constraints' is displayed
	And the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on the hierarchical node with the value 'AND'

	#Step 11
	When the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the 'Side Panel Tab' with value 'Valorization' is displayed
	And the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on the hierarchical node with the value 'AND'

	#Step 12
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	When the user clicks on 'Top Tab' with value 'Benefit'
	Then the user validates that the 'Node' with value 'AND' is visible
	When the user clicks on the hierarchical node with the value 'AND'

	#Step 13
	And the user clicks on the 'Toolbar Close Button'
	Then the user is on the 'Advanced Pricing Actions' page


	Examples:
	| CnvBook  | Coddiscr      | ValTypeValue | CnvDescription                    | ValorizationAttributeValue | MeasureUnitValue | CustomerCategory | CartonsQuantityValue | ThresholdNode1                    | BenefitGroupDescription1          | BenefitGroupNode1                                                          | Benefit5                         | BenValue | BenUmValue | BenSubReason   | BenefitNode1                          |
	| 29 - JHN | Discretionary | Quantity     | Canvass for WEB_SFA_SF_CNVACT_094 | Quantity                   | CARTONS          | B2B              | 120.00               | Thresholds - Quantity 120 CARTONS | Benefit for WEB_SFA_SF_CNVACT_094 | Group Benefit for WEB_SFA_SF_CNVACT_094 - Cost 120 - Max Number of Times 0 | 5 - Amount discount on Order Row | 2.00     | EUR - Euro | Brand Discount | Amount discount on Order Row - 2 Euro |