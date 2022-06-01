Feature: TestCase_506646
	Test Case 506646

@BDD_506646 @SFA_Nightly @FixDateOkButtons
Scenario: TC_506646_WEB_SFA_MD_ASSO_018_ASSORTMENT_SIMULATION
	Given the user navigates to the 'Assortments' page
	When the user creates a new assortment of Type: '<Type1>', Assortment Type: '<AssortmentType>', Customer Level: '<CustomerLevel0>', Customer: '<Customer1>', Start Date: 'd/m/y', End Date: 'd/m/y', Description: 'ASSO_TEST_506646'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	Then the user validates that the 'Customer Simulation' is present
	And the user validates that the 'Grid Name' with value 'GridContainer' is present
	When the user clicks on the 'Refresh button'
	Then the user validates that the 'Label Name' with value 'Customer Code' is present
	And the user validates that the 'Label Name' with value 'Hier. level' is present
	And the user validates that the 'Label Name' with value 'Level' is present
	And the user validates that the 'Label Name' with value 'Level' is present
	And the user validates that the customer '<Customer1>' on row '1' is present
	And the user validates that the 'Customer Simulation Grid' with value '<Customer1>' is displayed
	When the user closes all pages without saving the work done
	And the user creates a new assortment of Type: '<Type1>', Assortment Type: '<AssortmentType>', Customer Level: '<CustomerLevel1>', Customer: '<CustomerNode1>', Start Date: 'd/m/y', End Date: 'd/m/y', Description: 'ASSO_TEST_506646'
	And the user clicks on 'Side Panel Tab' with value 'Customers'
	Then the user validates that the 'Customer Simulation' is present
	And the user validates that the 'Grid Name' with value 'GridContainer' is present
	And the user validates that the customer '<Customer1>' on row '1' is present
	When the user closes all pages without saving the work done

	Examples: 
	| Type1                   | AssortmentType    | CustomerLevel0 | CustomerLevel1 | CustomerDescription | Customer1  | Description1	  | CustomerNode1 | CustomerNode2 | Status | StartDate | EndDate    |
	| Assortment by hierarchy | Order - Execution | Level 0        | Level 1        | MEDEA HOTELS S.r.l. | EC10019    | ASSO_TEST_506646 |   EC86550     | EC95039       | Valid  | d/m/y     | 01/01/2050 |