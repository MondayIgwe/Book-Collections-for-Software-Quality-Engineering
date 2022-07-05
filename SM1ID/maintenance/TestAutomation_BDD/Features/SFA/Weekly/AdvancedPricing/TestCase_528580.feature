Feature: TestCase_528580

	WEB_SFA_SF_CNVACT_090_Automatic validations when change Valorization type to Number of times and Amount discount on Order Row (BETYP=5) benefit is not in the tree

@BDD_528580 @SFA_Weekly
Scenario: 528580_WEB_SFA_SF_CNVACT_090
	#Step 1
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '29 - JHN', Application Type: 'Discretionary', Valorization Type: 'Quantity'
	
	And the user populates the 'General info' tab where 'Description' input field: 'Canvass for WEB_SFA_SF_CNVACT_090', 'Measure Unit' input field: 'CARTONS'
	And the user clicks on 'Side Panel Tab' with value 'Customers'

	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'

	And the user clicks on the 'Add Button'
	And the user selects from the 'Customer Category' drop down grid menu the 'B2B' option
	And the user clicks on 'Popup Button' with value 'OK'

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

	#Step 3 - Benefit group 1
	When the user clicks on the hierarchical node with the value '<ThresholdNode1>'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	And the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters 'Benefit for WEB_SFA_SF_CNVACT_090_01' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' is visible

	#Step 3 - Benefit group 2
	When the user clicks on the hierarchical node with the value '<ThresholdNode1>'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	And the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters 'Benefit for WEB_SFA_SF_CNVACT_090_02' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode2>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' is visible

	# Step 4 - Benefit for node 1
	When the user clicks on the hierarchical node with the value '<BenefitGroupNode1>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup' with value 'Benefit' is displayed
	When the user populates the Advanced Pricing Action Benefits Tab where Benefit Type: '12 - Head Increase', Benefit: '2.00', Benefit UM: '<BenUmValue>', Benefit Sub-Reason: '<BenSubReason>'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible

	# Step 4 - Benefit for node 2
	When the user clicks on the hierarchical node with the value '<BenefitGroupNode2>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup' with value 'Benefit' is displayed
	When the user populates the Advanced Pricing Action Benefits Tab where Benefit Type: '8 - Special Price', Benefit: '3.50', Benefit UM: '<BenUmValue>', Benefit Sub-Reason: '<BenSubReason>'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode2>' -> '<BenefitNode2>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible

	# Step 5
	When the user clicks on the hierarchical node with the value '<BenefitGroupNode2>'
	And the user clicks on 'Button Link' with value 'Benefit'
	Then the user validates that the 'Popup' with value 'Benefit' is displayed
	When the user populates the Advanced Pricing Action Benefits Tab where Benefit Type: '2 - % Discount on Order Head', Benefit: '6.00', Benefit Sub-Reason: '<BenSubReason>'
	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode2>' -> '<BenefitNode3>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode2>' -> '<BenefitNode2>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode1>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible

	# Step 6
	When the user clicks on 'Side Panel Tab' with value 'General info'
	And the user clicks on 'Generic Drop Down Trigger' with value 'Valorization Type'
	And the user select value '<NumberOfTimes>' from dropdown list 'Generic Drop Down Trigger'
	Then the user validates that 'Alert Dialog Message Box' text contains 'Setting this option the valorization tree will be removed. Continue?'
	And the user validates that the 'Alert Dialog Message Box' is visible
	And the user validates that the 'Warning' is visible
	
	# Step 7
	When the user clicks on the 'Alert Dialog Cancel Button'
	Then the user validates that the 'Alert Dialog Message Box' is not present
	And the user validates that 'Input By Label Name' with value 'Valorization Type' has text 'Quantity'
	And the user validates that 'Input By Label Name' with value 'Valorization Attribute' has text 'Quantity'
	And the user validates that 'Input By Label Name' with value 'Measure Unit' has text 'CARTONS'

	# Step 8
	When the user clicks on 'Generic Drop Down Trigger' with value 'Valorization Type'
	And the user select value '<NumberOfTimes>' from dropdown list 'Generic Drop Down Trigger'
	Then the user validates that 'Alert Dialog Message Box' text contains 'Setting this option the valorization tree will be removed. Continue?'
	And the user validates that the 'Alert Dialog Message Box' is visible
	And the user validates that the 'Warning' is visible
	
	When the user clicks on the 'Alert Dialog Ok Button'
	Then the user validates that 'Main Toolbar Error Message Field' is populated with 'Thresholds updated with the new valorization values.'
	When the user clicks on 'Side Panel Tab' with value 'Valorization'
	Then the user validates that the hierarchical node with the value 'MULTIPLE' is visible

	#Step 9
	When the user clicks on 'Side Panel Tab' with value 'General info'
	Then the user validates that 'Input By Label Name' with value 'Valorization Attribute' has text '<NumberOfTimes>'
	And the user validates that 'Input By Label Name' with value 'Valorization Attribute' is read-only
	And the user validates that 'Input By Label Name' with value 'Measure Unit' is read-only

	#Step 10
	When the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Side Panel Tab' with value 'Benefits' is displayed
	When the user clicks on 'Top Tab' with value 'Benefit brackets'
	Then the user validates that the 'Top Tab' with value 'Benefit brackets' is displayed
	Then the user validates that the hierarchical node with value '<ThresholdNode2>' -> '<BenefitGroupNode2>' -> '<BenefitNode3>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode2>' -> '<BenefitGroupNode2>' -> '<BenefitNode2>' is visible
	And the user validates that the hierarchical node with value '<ThresholdNode2>' -> '<BenefitGroupNode1>' -> '<BenefitNode1>' is visible

	#Step 11
	When the user closes the page and saves the work done

	Examples:
	| ThresholdNode1                    | ThresholdNode2                   | BenefitGroupNode1                                                             | BenefitGroupNode2                                                             | BenUmValue | BenSubReason   | BenefitNode1           | BenefitNode2             | BenefitNode3                  | NumberOfTimes   |
	| Thresholds - Quantity 120 CARTONS | Thresholds - Number of times 120 | Group Benefit for WEB_SFA_SF_CNVACT_090_01 - Cost 120 - Max Number of Times 0 | Group Benefit for WEB_SFA_SF_CNVACT_090_02 - Cost 120 - Max Number of Times 0 | EUR - Euro | Brand Discount | Head Increase - 2 Euro | Special Price - 3.5 Euro | % Discount on Order Head - 6% | Number of times |