Feature: TestCase_572776
	Test Case 572776

@BDD_572776 @SFA_Nightly @FixDateOkButtons
Scenario: TC_572776_WEB_SFA_MD_ASSO_030_CLOSE_HIGHER_ASSORTMENTS
	Given the user navigates to the 'Assortments' page
	When the user creates a new assortment of Type: '<Type1>', Assortment Type: '<AssortmentType>', Customer Level: '<CustomerLevel1>', Customer: '<Customer1>', Description: '<Description1>', Save: 'yes'
	And the user closes all pages without saving the work done where there is no pop up

	And the user creates a new assortment of Type: '<Type1>', Assortment Type: '<AssortmentType>', Customer Level: '<CustomerLevel2>', Customer: '<Customer2>', Description: '<Description2>', Save: 'yes'
	And the user closes all pages without saving the work done where there is no pop up
	
	When the user clicks on the 'Refresh button'
	And the user filters the column by column name 'Assortment Description', Filter Type 'Like', Value '<Description1>'
	
	And the user filters the column by column name 'Status', Filter Type 'Like', Value '<Status>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on 'Checkbox' with value 'Closed'
	And the user clicks on 'Button' with value 'Save'

	Then the user validates that the 'Navigation Error Icon' with value '<ErrorMsg1>' is present
	And the user validates that the 'Navigation Error Icon' with value '<Description2>' is present
	And the user validates that the 'Navigation Error Icon' with value "<ErrorMsg2>" is present
	
	When the user closes all pages without saving the work done
	And the user filters the column by column name 'Assortment Description', Filter Type 'Like', Value '<Description1>'
	And the user filters the column by column name 'Status', Filter Type 'Like', Value '<Status>'

	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	
	And the user changes the assortment status to 'Canceled'
	And the user closes the page and saves the work done
	
	When the user filters the column by column name 'Assortment Description', Filter Type 'Like', Value '<Description2>'
	And the user filters the column by column name 'Status', Filter Type 'Like', Value '<Status>'

	And the user opens the grid item in row '1'
	And the user clicks on 'Button' with value 'Edit'
	
	And the user changes the assortment status to 'Canceled'
	And the user closes the page and saves the work done
	
	Examples: 
	| Type1     | AssortmentType    | CustomerLevel1 | Customer1 | Description1         | CustomerLevel2 | Customer2 | Description2         | ErrorMsg1                               | ErrorMsg2                                       | Status |
	| hierarchy | Order - Execution | Level 1        | EC94036   | WEB_SFA_MD_ASSO_0301 | Level 0        | EC9051    | WEB_SFA_MD_ASSO_0302 | You cannot close the current assortment | active in the current customer's lower levels   | Valid  |