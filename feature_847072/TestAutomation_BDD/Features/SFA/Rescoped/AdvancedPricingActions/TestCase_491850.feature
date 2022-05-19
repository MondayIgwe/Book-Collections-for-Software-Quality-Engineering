Feature: TestCase_491850

@BDD_491850 @SFA_Nightly
Scenario: TC_491850_WEB_SFA_SF_CNVACT_064_Can_add_Products_in_the_Free_goods_list_grids
	Given the user navigates to the 'Advanced Pricing Actions' page
	When the user adds a new Advanced Pricing Action with Advanced Pricing Book: '<AdvancedPricingBook>', Application Type: '<ApplicationType>', Valorization Type: '<ValorizationType>'
	
	And the user populates the 'General info' tab where 'Description' input field: '<CnvDescription>', 'Measure Unit' input field: '<MeasureUnitValue>'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'
	And the user clicks on the 'Add Button'
	And the user selects from the 'Customer Category' drop down grid menu the '<CustomerCatagory>' option
	
	And the user clicks on 'Popup Button' with value 'OK'
	And the user clicks on 'Side Panel Tab' with value 'Benefits'
	And the user clicks on 'Top Tab' with value 'Benefit brackets'
	
	And the user clicks on 'Button Link' with value 'Threshold'
	
	And the user clicks on 'Input By Label Name' with value 'CARTONS - Quantity'
	And the user enters the characters '<Threshold1>' in field 'Input By Label Name' with value 'CARTONS - Quantity'
	And the user moves the focus away from the element
	
	And the user clicks on 'Popup Button' with value 'OK'

	And the user clicks on the hierarchical node with the value '<ThresholdNode>'
	And the user clicks on 'Button Link' with value 'Benefit Group'
	
	And the user clicks on 'Input By Label Name' with value 'Description'
	And the user enters '<Description1>' in field 'Input By Label Name' with value 'Description'
	And the user moves the focus away from the element
	
	And the user clicks on 'Popup Button' with value 'OK'

	And the user clicks on the hierarchical node with the value '<ThresholdNode>' -> '<Group>'
	And the user clicks on 'Button Link' with value 'Benefit'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit type'
	And the user enters '<BenefitType>' in field 'Input By Label Name' with value 'Benefit type'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit'
	And the user enters '<BenefitValue>' in field 'Input By Label Name' with value 'Benefit'
	And the user moves the focus away from the element

	And the user clicks on 'Input By Label Name' with value 'Benefit sub-reason'
	And the user enters '<BenefitSubReason>' in field 'Input By Label Name' with value 'Benefit sub-reason'
	And the user moves the focus away from the element

	And the user clicks on 'Popup Button' with value 'OK'
	
	Then the user validates that the hierarchical node with value '<ThresholdNode>' -> '<Group>' -> '<BenNode>' is visible
	When the user clicks on 'Top Tab' with value 'Free Goods List'
	
	And the user clicks on 'Section Add Button' with value 'Free Goods List'
	And the user clicks on the 'Free Goods List' section grid and enters the text '<List1>' in the row

	And the user clicks on 'Section Add Button' with value 'Products'
	And the user selects row '2' on the 'Products' pop up table
	And the user selects row '3' on the 'Products' pop up table
	And the user selects row '4' on the 'Products' pop up table

	And the user clicks on 'Popup Button' with value 'OK'
	Then the user validates that 'Section Grid Number of Rows Label' with value 'Products' has text '0/3'
	
	And the user validates that the number of 'Section Grid Number of Rows' with value 'Products' is '3' 
	When the user clicks on 'Button' with value 'Save'
	And the user closes all pages without saving the work done where there is no pop up

	Examples: 
	| AdvancedPricingBook | ApplicationType | ValorizationType | CnvDescription                    | ValorizationAttributeValue | MeasureUnitValue | CustomerCatagory | Threshold1 | ThresholdNode                   | Group                                       | BenNode                      | BenefitType                 | BenefitValue | BenefitReason    | BenefitSubReason | List1 | Description1 |
	| 29 - JHN            | Discretionary   | Quantity         | Canvass for WEB_SFA_SF_CNVACT_061 | Quantity                   | CARTONS          | B2B              | 5          | Thresholds - Quantity 5 CARTONS | Group Ben1 - Cost 5 - Max Number of Times 0 | % Discount on Order Row - 3% | 3 - % Discount on Order Row | 3            | Channel Discount | By Formats       | List1 | Ben1         |