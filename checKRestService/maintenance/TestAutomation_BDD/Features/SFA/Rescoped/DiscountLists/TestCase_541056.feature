Feature: TestCase_541056

@BDD_541056 @SFA_Nightly
Scenario: WEB_SFA_SF_DISCOUNTLIST_004_CREATION_BY_HIERARCHY_AND_CUSTOMERATTRIBUTES
	Given the user navigates to the 'Discount lists' page
	
	When the user adds a new Discount List where Type:'<Type>', Code: '<Code>', Customer Level: '<CustomerLevel>' ,Customer Code: '<CustomerCode>', Application Type: '<ApplicationType>',  Enable Brackets: '<EnableBrackets>'
	And the user enters '<DiscountDiscList>' in field 'Input By Label Name' with value 'List Description'
	
	And the user clicks on 'Button' with value 'Save'
	Then the user validates that the 'Navigation Error Icon' with value '<ErrorMessage>' is present

	When the user clicks on 'Side Panel Tab' with value 'Customers'
	And the user clicks on 'Top Tab' with value 'Customer Attributes'
	
	And the user clicks on 'Top Tab' with value 'Inclusion Rules (0)'
	And the user clicks on the 'Add Button'

	And the user selects from the 'Sales Area' drop down grid menu the 'DUTY FREE' option
	And the user clicks on 'Popup Button' with value 'OK'

	Then the user validates that the 'Div Text in Grid' with value 'DUTY FREE' is displayed
	And the user validates that the 'Top Tab' with value 'Inclusion Rules (1)' is displayed
	And the user validates that the 'Top Tab' with value 'Exclusion Rules (0)' is displayed

	When the user clicks on 'Side Panel Tab' with value 'Discount Rules'
	And the user clicks on 'Top Tab' with value 'Discount Rules'
	And the user clicks on 'Button Link' with value 'Thresholds'

	And the user clicks on 'Custom Field' with value 'Bracket Type'
	And the user enters 'Net amount' in field 'Custom Field' with value 'Bracket Type'
	And the user moves the focus away from the element

	And the user clicks on 'Custom Field' with value 'Bracket Unit of Measure'
	And the user enters 'EUR - Euro' in field 'Custom Field' with value 'Bracket Unit of Measure'
	And the user moves the focus away from the element

	And the user clicks on 'Custom Field' with value 'Bracktes Counting Mode'
	And the user enters '4.Discount List Trashold' in field 'Custom Field' with value 'Bracktes Counting Mode'
	And the user moves the focus away from the element

	And the user clicks on 'Pop Up Add Button' with value 'Thresholds'
	And the user enters '150' in the filter grid cell with column 'Value' and row text '0.00' in popup 'Thresholds'

	And the user clicks on 'Pop Up Add Button' with value 'Thresholds'
	And the user enters '370' in the filter grid cell with column 'Value' and row text '0.00' in popup 'Thresholds'
	
	And the user clicks on 'Popup Ok Button' with value 'Thresholds'
	
	And the user clicks on the 'Add Button'
	And the user selects from the 'Product line' drop down grid menu the 'WINE' option
	
	And the user enters '15.75000' in field 'Input By Label Name' with value 'Initial Euro/Prices'
	And the user clicks on 'Popup Ok Button' with value 'Add Discount Rules'

	And the user closes the page and saves the work done
	
	Examples: 
	| Code                        | CustomerLevel | CustomerCode | ApplicationType | EnableBrackets | DiscountDiscList                          | ErrorMessage                                                      | Type                                 |
	| WEB_SFA_SF_DISCOUNTLIST_004 | Level 0       | EC7289       | Automatic       | Yes            | DISC LIST FOR WEB_SFA_SF_DISCOUNTLIST_004 | Mandatory threshold values are missing in the discount definition | by hierarchy and customer attributes |