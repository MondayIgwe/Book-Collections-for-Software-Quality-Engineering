Feature: TestCase_574078
	Test Case 574078

@BDD_574078 @SFA_Nightly @SFA_Weekly
Scenario: TC_574078_WEB_SFA_MD_ASSO_036_ASSORTMENT_SIMULTION_FROM_CUSTOMER_UI
	#Step 1
	Given the user navigates to the 'Assortments' page
	
	#Step 2
	When the user creates a new assortment of Type: '<Type1>', Assortment Type: '<AssortmentType>', Customer Level: '<CustomerLevel1>', Customer Description: '<CustomerDescription>', Customer: '<Customer1>', Start Date: '<StartDate>', End Date: '<EndDate>',Description: '<Description1>'
	
	#Step 3
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on the 'Add Button'

	And the user filters the pop up menu with title: 'New Products: Selection 1/3' by column name 'Product' Filter condition: 'Like' Field Value: '03'
	And the user clicks on 'Grid CheckBox' with value '<ProductCode1>'
	And the user clicks on 'Grid CheckBox' with value '<ProductCode2>'
	And the user clicks on 'Popup Button' with value 'Next'
	Then the user validates that the 'Popup' with value 'New Products: Assortment Attributes 2/3' is visible
	
	When the user enters '<Status0>' in field 'Input By Label Name' with value 'Status'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'Next'
	Then the user validates that the 'Popup' with value 'New Products: Preview 3/3' is visible
	And the user validates that the 'Text in Grid' with value '<ProductDescription1>' is displayed
	And the user validates that the 'Text in Grid' with value '<ProductDescription2>' is displayed

	When the user clicks on 'Popup Button' with value 'Confirm'
	Then the user validates that the 'Text in Grid' with value '<ProductDescription1>' is displayed
	And the user validates that the 'Text in Grid' with value '<ProductDescription2>' is displayed
	
	#Step 4
	When the user clicks on 'Button' with value 'Save'
	
	#Step 5
	And the user clicks on 'Trigger Open Dropdown' with value 'Customer Node'
	Then the user validates that the 'Side Panel Tab' with value 'Assortments' is visible
	
	#Step 6
	When the user clicks on 'Side Panel Tab' with value 'Assortments'

	#Step 7
	Then the user validates that 'Toolbar Grid Record Count' is populated with '0/2'
	And the user validates that the 'Text in Grid' with value '<ProductDescription1>' is displayed
	And the user validates that the 'Text in Grid' with value '<ProductDescription2>' is displayed

	#Step 8
	When the user enters the characters 'd-2/m/y' in field 'Input By Label Name' with value 'Reference date'
	Then the user validates that 'Toolbar Grid Record Count' is populated with '0/0'
	And the user validates that the 'Text in Grid' with value '<Description1>' is not shown

	#Step 9
	When the user closes all pages without saving the work done where there is no pop up
	
	#Step 10
	And the user closes all pages without saving the work done where there is no pop up

	Examples:
	| Type1     | AssortmentType    | CustomerLevel1 | CustomerDescription              | Customer1 | StartDate | EndDate    | Description1                | ProductCode1 | ProductCode2 | Status0 | ProductDescription1     | ProductDescription2    |
	| hierarchy | Order - Execution | Customer       | DI.BE.DI TUROLO UMBERTO E C. SAS | EC8211    | d/m/y     | 01/01/2100 | WEB_SFA_MD_ASSO_020AssoProd | 035          | 036          | LISTED  | BACCO LAMBRUSCO 0.75 lt | BACCO LAMBRUSCO 1.5 lt |
