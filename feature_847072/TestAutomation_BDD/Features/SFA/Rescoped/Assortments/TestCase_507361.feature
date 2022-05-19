Feature: TestCase_507361

@BDD_507361 @SFA_Nightly @FixDateOkButtons
Scenario: WEB_SFA_MD_ASSO_020_ASSORTMENT_CURRENT_CONDITIONS
	Given the user navigates to the 'Assortments' page
	When the user creates a new assortment of Type: '<AssortmentType>', Customer Level: '<CustomerLevel>', Customer: '<Customer1>', Start Date: '<StartDate1>', End Date: '<EndDate1>', Description: '<Description1>'
	
	And the user clicks on 'Side Panel Tab' with value 'Products'
	And the user clicks on the 'Add Button'

	And the user filters the pop up menu with title: 'New Products: Selection 1/3' by column name 'Product' Filter condition: 'Like' Field Value: '03'
	And the user clicks on 'Grid CheckBox' with value '035'
	And the user clicks on 'Grid CheckBox' with value '036'
	And the user clicks on 'Grid CheckBox' with value '037'
	And the user clicks on 'Grid CheckBox' with value '038'
	And the user clicks on 'Popup Button' with value 'Next'
	Then the user validates that the 'Popup' with value 'New Products: Assortment Attributes 2/3' is visible

	When the user enters 'LISTED' in field 'Input By Label Name' with value 'Status'
	And the user moves the focus away from the element
	And the user clicks on 'Popup Button' with value 'Next'
	Then the user validates that the 'Popup' with value 'New Products: Preview 3/3' is visible
	And the user validates that the page with 'Div Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is loaded
	And the user validates that the 'Div Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is displayed
	And the user validates that the 'Div Text in Grid' with value 'BACCO LAMBRUSCO 1.5 lt' is displayed
	And the user validates that the 'Div Text in Grid' with value 'BACCO MERLOT 0.75 lt' is displayed
	And the user validates that the 'Div Text in Grid' with value 'BACCO MERLOT 1.5 lt' is displayed

	When the user clicks on 'Popup Button' with value 'Confirm'
	Then the user validates that the page with 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is loaded
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 1.5 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO MERLOT 0.75 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO MERLOT 1.5 lt' is displayed

	When the user clicks on 'Top Tab' with value 'Current Conditions'
	Then the user validates that the page with 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is loaded
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 1.5 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO MERLOT 0.75 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO MERLOT 1.5 lt' is displayed

	When the user clicks on 'Top Tab' with value 'Products'
	And the user clicks on 'Column' with value 'Unit of Minimum Order'
	And the user clicks and enters the date 'd+2/m/y' in the 'Assortment Product' multigrid table in the 'lower' column name: 'Start Date' in row number: '2'
	And the user clicks and enters the date 'd+1/m/y' in the 'Assortment Product' multigrid table in the 'lower' column name: 'End Date' in row number: '3'
	And the user clicks and enters the text 'PENDING' in the 'Assortment Product' multigrid table in the 'lower' column name: 'Status' in row number: '4'
	
	And the user clicks on 'Top Tab' with value 'Current Conditions'
	Then the user validates that the page with 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is loaded
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO MERLOT 0.75 lt' is displayed

	When the user enters the characters 'd+2/m/y' in field 'Input By Label Name' with value 'Reference Date'
	Then the user validates that the page with 'Text in Grid' with value 'BACCO LAMBRUSCO 1.5 lt' is loaded
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 0.75 lt' is displayed
	And the user validates that the 'Text in Grid' with value 'BACCO LAMBRUSCO 1.5 lt' is displayed

	When the user clicks on 'Button' with value 'Save'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on the 'Assortment Status Field'

	And the user enters 'Pending' in the 'Assortment Status Field'
	And the user moves the focus away from the element

	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Toast Message Field' is displayed
	When the user closes the page and saves the work done

	Examples: 
	| AssortmentType | CustomerLevel | Customer1 | StartDate1 | EndDate1   | Description1                |
	| hierarchy      | Customer      | EC8211    | d/m/y      | 01/01/2100 | WEB_SFA_MD_ASSO_020AssoProd |