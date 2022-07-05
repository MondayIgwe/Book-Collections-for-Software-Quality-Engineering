Feature: TC_465360_Template
	Template for Test Case 465360

@TC_465350_ForMapping
Scenario: TC_465350_ForMapping
	Given the user navigates to the 'Advanced Pricing Actions' page

	#When open the '<AP1>' document in edit  mode
	When the user filters the column by column name 'Code', Filter Type 'Like', Value '<AP1>'
	And the user opens the grid item in row '1'
	Then the user validates that the 'Segmented Button' with value 'Edit' is displayed
	When the user clicks on 'Segmented Button' with value 'Edit'
	
	#And the user navigates to the 'Benefits' page on the 'Benefit Brackets' section
	And the user clicks on 'Side Panel Tab' with value 'Benefits'
	Then the user validates that the 'Sub Tab' with value 'Benefit Brackets' is displayed
	When the user clicks on 'Sub Tab' with value 'Benefit Brackets'
	
	#And the user selects '<BenefitNode1>' node
	#And the user selects '<BenefitNode>'
	And the user clicks on the hierarchical node with the value 'Thresholds - Quantity 48 CARTONS' -> 'Group Benefit1 for WEB_SFA_SF_CNVACT_034 - Cost 48 - Max Number of Times 0'

	#And the user clicks on 'Benefit button'
	And the user clicks on 'Benefits Tab ToolBar' with value 'Benefit'
	
	#Then the 'Benefit' popup opens
	Then the user validates that the 'Popup' with value 'Benefit' is displayed
	
	#When the user selects '<BenType1>' in the 'Benefit type Dropdown'
	When the user clicks on the 'Benefit Type drop down menu'
	And the user clicks on 'Input By Label Name' with value 'Benefit type'
	And the user enters '<BenType1>' in field 'Input By Label Name' with value 'Benefit type'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Benefit type'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorNewCodContext>' is displayed
	
	#When the user set '<BenefitValue>' in the 'Benefit' field
	When the user clicks on 'Input By Label Name' with value 'Benefit'
	And the user enters the characters '<BenefitValue>' in field 'Input By Label Name' with value 'Benefit'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Benefit'

	#And the user set '<MinValue>' in the 'Min. Value' field
	When the user clicks on 'Input By Label Name' with value 'Min. Value'
	And the user enters the characters '<MinValue>' in field 'Input By Label Name' with value 'Min. Value'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Min. Value'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorQtyBenMin>' is displayed
	
	#When the user clear the '<MinValue>' from the 'Min. Value' field
	When the user clicks on 'Input By Label Name' with value 'Min. Value'
	And the user enters the characters '' in field 'Input By Label Name' with value 'Min. Value'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Min. Value'
	
	#And the user set '<MaxValue1>' in the 'Max. Value' field
	And the user clicks on 'Input By Label Name' with value 'Max. Value'
	And the user enters the characters '<MaxValue1>' in field 'Input By Label Name' with value 'Max. Value'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Max. Value'
	Then the user validates that the 'Pop Up Error Message' with value '<ErrorQtyBenMax>' is displayed
	And the user validates that the 'Pop Up Error Message' with value '<ErrorQtyBenSoftMax>' is displayed
	
	#When the user set the '<MaxValue2>' in  the 'Max. Value' field
	When the user clicks on 'Input By Label Name' with value 'Max. Value'
	And the user enters the characters '<MaxValue2>' in field 'Input By Label Name' with value 'Max. Value'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value 'Max. Value'

    #And the user set '<MaxDiscValue>' in the '1° Alarm Max discount ' field
	When the user clicks on 'Input By Label Name' with value '1° Alarm Max discount'
	And the user enters the characters '<MaxDiscValue>' in field 'Input By Label Name' with value '1° Alarm Max discount'
	And the user press the 'ENTER' key on the 'Input By Label Name' with value '1° Alarm Max discount'

	Then the user validates that the 'Pop Up Error Message' with value '<ErrorQtyBenSoftMax>' is displayed
	When the user closes all pages without saving the work done
	
	Examples:
	| AP1                   | BenefitNode1                                                               | BenType1                    | ErrorNewCodContext           | ErrorQtyBenMin                                | MinValue | MaxValue | BenefitValue | ErrorQtyBenMax                               | ErrorQtyBenSoftMax                                                                  | MaxValue2 | MaxDiscValue |
	| WEB_SFA_SF_CNVACT_034 | Group Benefit1 for WEB_SFA_SF_CNVACT_034 - Cost 48 - Max Number of Times 0 | 3 - % Discount on Order Row | Benefit: Benefit cannot be 0 | Min. Value: Min. Value is higher than Benefit | 11       | 9        | 10           | Max. Value: Max. Value is lower than Benefit | 1° Alarm Max discount: 1° Alarm Max discount must be between Benefit and Max. Value | 12        | 8            |