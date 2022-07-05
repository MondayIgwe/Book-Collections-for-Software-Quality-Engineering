Feature: TC_408877
	Test Case 408877

@TC_408877 @SFA_Nightly @SFA_Weekly
Scenario: MD_ASSO_W_R_R80V1_0004
	Given the user navigates to the 'Assortments' page
	When the user creates a new assortment of Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate1>', End: '<AfterDate1>', Description: '<AssortmentDescription1>', Status: '<Status1>', Save: 'yes'
	And the user closes all pages without saving the work done where there is no pop up
	
	And the user creates a new assortment of Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate2>', End: '<AfterDate2>', Description: '<AssortmentDescription2>', Status: '<Status2>', Save: 'yes'
	And the user closes all pages without saving the work done where there is no pop up
	
	And the user creates a new assortment of Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate3>', End: '<AfterDate3>', Description: '<AssortmentDescription3>', Status: '<Status3>', Save: 'yes'
	And the user closes all pages without saving the work done where there is no pop up
	
	And the user creates a new assortment Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate3>', End: '<AfterDate3>'
	And the user closes all pages without saving the work done

	And the user creates a new assortment Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate4>', End: '<AfterDate4>'
	And the user closes all pages without saving the work done

	And the user creates a new assortment Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate1>', End: '<AfterDate1>'
	Then the user validates that the 'Warning' is visible
	
	When the user clicks on the 'No Button'
	Then the user validates that the 'OK Button' is visible

	When the user clicks on the 'OK Button'
	Then the user validates that the 'Warning' is visible
	
	When the user clicks on the 'Yes Button'
	
	When the user closes all pages without saving the work done where there is no pop up
	
	And the user creates a new assortment Type: '<AssortmentType>', Customer: '<CustomerCode>', Start: '<BeforeDate1>', End: '<AfterDate1>'
	Then the user validates that the 'Warning' is visible
	
	When the user clicks on the 'No Button'
	Then the user validates that the 'New Assortments Pop Up Menu' is visible

	When the user selects validity period from: '<BeforeDate5>' to: '<AfterDate5>' on the 'New Assortment Validity Period' field
	And the user clicks on the 'OK Button'
	And the user closes all pages without saving the work done


	Examples: 
	| CustomerCode | CustomerLevel | AssortmentDescription1   | Status1 | BeforeDate1 | AfterDate1 | AssortmentDescription2   | Status2 | BeforeDate2 | AfterDate2 | AssortmentDescription3   | Status3  | BeforeDate3 | AfterDate3 | AssortmentType | BeforeDate4 | AfterDate4 | BeforeDate5 | AfterDate5 |
	| EC37065      | Customer      | MD_ASSO_W_R_R80V1_0004_1 | Valid   | d/m-1/y     | d/m+2/y    | MD_ASSO_W_R_R80V1_0004_2 | Pending | d/m+3/y     | d/m+6/y    | MD_ASSO_W_R_R80V1_0004_3 | Canceled | d/m+7/y     | d/m+10/y   | hierarchy      | d/m+4/y     | d/m+5/y    | d/m/y+1     | d/m/y+2    |
