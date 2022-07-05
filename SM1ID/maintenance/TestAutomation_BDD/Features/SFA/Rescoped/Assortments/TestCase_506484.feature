Feature: TestCase_506484

@BDD_506484 @SFA_Nightly @SFA_Weekly
Scenario: TC_506484_WEB_SFA_MD_ASSO_015_OVERLAPPING_ASSORTMENTS_UI_VALIDATIONS
	Given the user navigates to the 'Assortments' page
	
	When the user creates a new assortment of Type: '<AssortmentType>', Customer Level: '<CustomerLevel>', Customer: '<Customer1>', Start Date: '<StartDate1>', End Date: '<EndDate1>', Description: '<Description1>'
	And the user closes the page and saves the work done
	
	And the user creates a new assortment of Type: '<AssortmentType>', Customer Level: '<CustomerLevel>', Customer: '<Customer1>', Start Date: '<StartDate2>', End Date: '<EndDate2>', Description: '<Description2>'
	And the user selects validity period from: '<StartDate1>' to: '<EndDate2>' on the 'Generic Drop Down Trigger' element with value 'Validity Period'
	And the user clicks on 'Button' with value 'Save'

	Then the user validates that the 'Navigation Error Icon' with value '<ErrorMsg1>' is present
	And the user validates that the 'Navigation Error Icon' with value '<StartDate1>' is present
	And the user validates that the 'Navigation Error Icon' with value '<EndDate1>' is present
	When the user closes all pages without saving the work done

	And the user filters the column by column name 'Assortment Description', Filter Type 'Like', Value '<Description1>'
	And the user opens the grid item in row '1'
	And the user clicks on 'Side Panel Tab' with value 'General Info'
	And the user clicks on 'Button' with value 'Edit'
	
	And the user enters '<Status1>' in the 'Assortment Status Field'
	And the user moves the focus away from the element
	And the user clicks on 'Button' with value 'Save'
	And the user closes all pages without saving the work done where there is no pop up

Examples: 
| AssortmentType | CustomerLevel | Customer1 | StartDate1 | EndDate1 | Description1                   | StartDate2 | EndDate2 | Description2                           | ErrorMsg1                                                                                        |
| hierarchy      | Level 0       | EC5679    | d-1/m/y    | d-1/m/y  | WEB_SFA_MD_ASSO_015_ASSORTMENT | d/m/y      | d/m/y    | WEB_SFA_MD_ASSO_015_Similar_assortment | There is already an assortment defined for the assortment type and customer you selected between |