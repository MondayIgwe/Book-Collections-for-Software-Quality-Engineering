Feature: TestCase_523670
	Create a new Advanced pricing action using the specified data

@mytag
Scenario: 523670_WEB_SFA_SF_CNVACT_080_Messages are cleared when Leaf/ Benefit node are inserted in the trees
	#Step 1
	Given the user is on the 'Advanced Pricing Actions' page
	#Step 1.1 Open Popup 
	When the user clicks on the 'Add Button'
	Then the user validates that the 'Advanced Pricing Action Pop Up Menu' is displayed
	When the user clicks on the 'Advanced Pricing Action Generate Code Button'
	And the user clicks on the 'Advanced Pricing Book Drop Down'
	And the user selects '<CnvBook>' in the 'Advanced Pricing Book Option'
	And the user clicks on the 'Application Type Drop Down'
	And the user selects '<Coddiscr>' in the 'Application Type Option'
	And the user clicks on the 'Valorization Type Drop Down'
	And the user selects '<ValTypeValue>' in the 'Valorization Type Option'
	And the user clicks OK button in the 'New Advanced Pricing Action' popup
	#populate the mandatory fields of general info tab
	Then the user is on the 'General Info Tab' page
	When the user enters '<CnvDescription>' in the 'Description Text Area'
	And the user moves the focus away from the element

	When the user clicks on the 'Side Panel Tab;Customers'
	Then the user is on the 'Customers Tab' page
	And the user clicks on the 'Customers Add Button'
	And the user clicks on the 'Add Customer Rules Drop Down Menu;CUSTOMER CATEGORY'
	And the user clicks on the 'Add Customer Rules Drop Down Menu Option;<CustomerCategory>' 
	And the user clicks on the 'Drop Down Menu OK Button'
	And the user clicks OK button in the 'Add Customer Rules' popup
	When the user clicks on the 'Sub Tab;Customer Simulation'

	#Step 2 Main Constraints
	When the user clicks on the 'Side Panel Tab;Main constraints'
	Then the user is on the 'Main Constraints Tab' page
	And the user clicks on the 'Node;<And1>'
	Then the user clicks on the 'Add Basket'
	When the 'Basket Contraint Pop Up Menu' is visible
	And the user clicks on the 'Object Field'
	And the user selects '<Object1>' in the 'Select Object'
	And the user clicks on the 'Attribute Field'
	And the user selects '<Attribute1>' in the 'Select Attribute'
	And the user enters '<Value1>' in the 'Value Field'
	And the user clicks on the 'Measure Unit Type Field'
	And the user selects '<UM1>' in the 'Select Measure Unit Type'
	#Then the user clicks on Ok button on the popup '(.*)'
	Then the user clicks on the 'Ok Button'


	#Step 3 Valorization
	When the user clicks on the 'Side Panel Tab;Valorization'
	Then the user is on the 'Valorization Tab' page
	And the user clicks on the 'Node;<Multiple>'
	Then the user clicks on the 'Add Basket'
	When the 'Basket Contraint Pop Up Menu' is visible
	And the user clicks on the 'Object Field'
	And the user selects '<Object3>' in the 'Select Object'
	And the user clicks on the 'Attribute Field'
	And the user selects '<Attribute3>' in the 'Select Attribute'
	And the user enters '<Value3>' in the 'Value Field'
	#Then the user clicks on Ok button on the popup '(.*)'
	Then the user clicks on the 'Ok Button'

	#Step 4 General Info tab
	When the user clicks on the 'Side Panel Tab;General info'
	Then the user is on the 'General Info Tab' page

	#Step 5 Save document
	When the user clicks on the 'Toolbar Save Button'
	Then the user is on the 'Main Constraints Tab' page
	And the user validates that the Toolbar Error message '<ErrMsg1>' is 'visible'
	And the user validates that the Toolbar Error message '<ErrMsg2>' is 'visible'
	And the user validates that the Toolbar Error message '<ErrMsg3>' is 'visible'


	


	#Step 6
	When the user clicks on the 'Side Panel Tab;Benefits'
	Then the user is on the 'Benefits Tab' page
	When the user clicks on the 'Sub Tab;Benefit brackets'
	When the user clicks on the 'Benefits Brackets Threshold Button'
	And the user enters '<Threshold1>' in the 'Number of times Field'
	And the user moves the focus away from the element
	#Then the user clicks on Ok button on the popup '(.*)'
	Then the user clicks on the 'Ok Button'

	When the user clicks on the 'Node;<ThresholdNode>'
	Then the user clicks on the 'Benefits Brackets Benefit Group Button'
	And the user enters '<Description1>' in the 'New Benefit Group Description Text Area' 
	And the user moves the focus away from the element
	#Then the user clicks on Ok button on the popup '(.*)'
	Then the user clicks on the 'Ok Button'


	When the user clicks on the 'Node;<groupNode>'
	Then the user clicks on the 'Benefits Button'
	Then the 'Benefit pop up menu' is visible 

	When the user clicks on the 'Benefit Type drop down menu'
	And the user clicks on the 'Benefit Type;<BenefitType>'
	When the user enters '<BenefitValue>' in the 'Benefit field'
	When the user clicks on the 'Benefit Reason Down Menu'
	And the user clicks on the 'Benefit Reason;<BenefitReaseon>'
	When the user clicks on the 'Benefit Sub Reason Down Menu'
	And the user clicks on the 'Benefit Sub Reason;<BenefitSubReason>'
	#Then the user clicks on Ok button on the popup '(.*)'
	Then the user clicks on the 'Ok Button'

	And the user validates that the Toolbar Error message '<ErrMsg1>' is 'visible'
	And the user validates that the Toolbar Error message '<ErrMsg2>' is 'visible'
	And the user validates that the Toolbar Error message '<ErrMsg3>' is 'cleared'
	
	#step 7
	When the user clicks on the 'Side Panel Tab;Main constraints'
	Then the user is on the 'Main Constraints Tab' page
	And the user clicks on the 'Node;<And1> -> <Basket1>'
	And the user clicks on the 'AND Toolbar Button'
	And the user clicks on the 'Node;<And1> -> <Basket1> -> <And2>'
	And the user clicks on the 'Add Leaf'
	Then the 'Leaf Contraint Pop Up Menu' is visible
	And the user clicks on the 'Object Field'
	And the user selects '<Object2>' in the 'Select Object'
	And the user clicks on the 'Attribute Field'
	And the user selects '<Attribute2>' in the 'Select Attribute'
	And the user enters '<Value2>' in the 'Value Field'
	#Then the user clicks on Ok button on the popup '(.*)'
	Then the user clicks on the 'Ok Button'

	#Step 8
	And the user validates that the Toolbar Error message '<ErrMsg2>' is 'visible'
	And the user validates that the Toolbar Error message '<ErrMsg1>' is 'cleared'

	#step 9
	When the user clicks on the 'Side Panel Tab;Valorization'
	Then the user is on the 'Valorization Tab' page
	And the user clicks on the 'Node;<Multiple> -> <Basket3>'
	Then the user clicks on the 'Remove Toolbar Button'
	Then the user clicks on the 'Warning popup Yes Button'
	And the user validates that the Toolbar Error message '<ErrMsg2>' is 'cleared'
	Then the user clicks on the 'Toolbar Save Button'

	Examples:
	| CnvBook  | Coddiscr      | ValTypeValue    | CnvDescription                    | CustomerCategory | And1 | Object1   | Attribute1        | Value1 | UM1          | Multiple | Object3 | Attribute3       | Value3 | ErrMsg1                                                          | ErrMsg2                                                      | ErrMsg3                                | Threshold1 | ThresholdNode                   | Description1 | groupNode                                    | BenefitType                 | BenefitValue | BenefitReaseon   | BenefitSubReason | Basket1                                  | And2 | Object2   | Attribute2                 | Value2 | Basket3                              |
	| 29 - JHN | Discretionary | Number of times | Canvass for WEB_SFA_SF_CNVACT_080 | B2B              | AND  | Order Row | QTYORD - Quantity | 10.00  | CT - CARTONS | MULTIPLE | Product | CODBRAND - Brand | 2.00   | Cannot save because there is an empty basket in Main constraints | Cannot save because there is an empty basket in Valorization | Cannot save because benefit is missing | 50.00      | Thresholds - Number of times 50 | Ben1         | Group Ben1 - Cost 50 - Max Number of Times 0 | 3 - % Discount on Order Row | 10.00        | Channel Discount | By Formats       | Sum - Order Row - Quantity >= 10 CARTONS | AND  | Order Row | GROSSAMOUNT - Gross Amount | 100.00 | Count Distinct - Product - Brand = 2 |