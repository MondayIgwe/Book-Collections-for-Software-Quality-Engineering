Feature: TC_465360_Template
	Template for Test Case 465360

@TC_465350_ForMapping
Scenario: TC_465350_ForMapping
	Given the user is on the 'Advanced Pricing Actions' page
	#When open the '<AP1>' document in edit  mode
	When the user filters the column by column name 'Code', 'like', '<AP1>'
	And the user opens the grid item in row '1'
	Then the user is on the 'General Info Tab' page
	And the user clicks on the 'Edit Segmented Button'
	#And the user navigates to the 'Benefits' page on the 'Benefit Brackets' section
	When the user clicks on the 'Side Panel Tab;Benefits'
	Then the user is on the 'Benefits Tab' page
	When the user clicks on the 'Sub Tab;Benefit Brackets'
	#And the user selects '<BenefitNode1>' node
	#And the user selects '<BenefitNode>'
	And the user clicks on the 'Node;Thresholds - Quantity 48 CARTONS > Group Benefit1 for WEB_SFA_SF_CNVACT_034 - Cost 48 - Max Number of Times 0'
	#And the user clicks on 'Benefit button'
	Then the user clicks on the 'Benefits Button'
	#Then the 'Benefit' popup opens
	And the 'Benefit pop up menu' is visible
	#When the user selects '<BenType1>' in the 'Benefit type Dropdown'
	When the user clicks on the 'Benefit Type drop down menu'
	And the user clicks on the 'Benefit Type;<BenType1>'
	Then the user validates that the Toolbar Error message is '<ErrorNewCodContext>'
	#When the user set '<BenefitValue>' in the 'Benefit' field
	When the user enters '<BenefitValue>' in the 'Benefit field'
	#And the user set '<MinValue>' in the 'Min. Value' field
	And the user enters '<MinValue>' in the 'Min Value field'
	Then the user validates that the Toolbar Error message is '<ErrorQtyBenMin>'
	#When the user clear the '<MinValue>' from the 'Min. Value' field
	When the user enters '' in the 'Min Value field'
	#And the user set '<MaxValue1>' in the 'Max. Value' field
	And the user enters '<MaxValue1>' in the 'Max Value field'
	Then the user validates that the Toolbar Error message is '<ErrorQtyBenMax>'
	And the user validates that the Toolbar Error message is '<ErrorQtyBenSoftMax>'
	#When the user set the '<MaxValue2>' in  the 'Max. Value' field
	When the user enters '<MaxValue2>' in the 'Max Value field'
    #And the user set '<MaxDiscValue>' in the '1° Alarm Max discount ' field
	And the user enters '<MaxDiscValue>' in the '1° Alarm Max discount field'
	Then the user validates that the Toolbar Error message is '<ErrorQtyBenSoftMax>'
	And the user closes all pages without saving the work done

	Examples:
	| AP1                   | BenefitNode1                                                               | BenType1                    | ErrorNewCodContext           | ErrorQtyBenMin                                | MinValue | MaxValue | BenefitValue | ErrorQtyBenMax                               | ErrorQtyBenSoftMax                                                                  | MaxValue2 | MaxDiscValue |
	| WEB_SFA_SF_CNVACT_034 | Group Benefit1 for WEB_SFA_SF_CNVACT_034 - Cost 48 - Max Number of Times 0 | 3 - % Discount on Order Row | Benefit: Benefit cannot be 0 | Min. Value: Min. Value is higher than Benefit | 11       | 9        | 10           | Max. Value: Max. Value is lower than Benefit | 1° Alarm Max discount: 1° Alarm Max discount must be between Benefit and Max. Value | 12        | 8            |